Return-Path: <linux-arm-msm+bounces-2827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1918004DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFC328164F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDAE14AAA;
	Fri,  1 Dec 2023 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kTvWObQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C6C1712
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:41:41 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d2c6c1ab66so19795157b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416501; x=1702021301; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i0XSc3CmqydMornUaDDfp0sHFoeCR+iaudYxBuXUebQ=;
        b=kTvWObQxcXL63k5YYysxinEj1/3adzlcM/e44kNShfu6sIVnuA0tFuGloBfhQvJ1x7
         02xcsrM+KHckylu7M+8O9u60OR6Z9U8UqSWp5Re0v3OmuCdGNOmGTHqb8GBH/5cmpZdK
         mydPW4k0MpkapiItYsOIlIJyPJpYOewSul/yr5mn+7DcFZhRFJgpr9JhfknCizKbJG8F
         GVIVSMVm1L4DCXWT2zPKFcVdGp/JENEZW4x9yQBgKVIJJGZRaX8ZsFkyLv64PoclteLI
         IAvXJWzplVzh83JZu1C2umkXHnraWZHBZ1YGUuNjpIv35W320y6jbDOkpUxBrk9B3c5p
         H2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416501; x=1702021301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0XSc3CmqydMornUaDDfp0sHFoeCR+iaudYxBuXUebQ=;
        b=cKk22eIt1RUt7OnxLVt/KIO1yXh87wbiT0PdPN3fI7LvFQiOLRnhJDtqITckNkuMlp
         gz/RwkhuiryABxSckQuAcjuAJF2x2pJvIwyE1vFeoaczoW6wnllTaUqkhEaaMiRseeLC
         ufuhpd8QU7LuV/X7yTKuNz7AiAcNfrdVfsf9w1GL+qZi7//RcAGEs2ruM5KIKQpaGfFX
         7MaVkHRkZ9wqzhdbUF1lZMxZ7OHPS7t15inweBYD57ry6QvXznxW7rMN/lPukybJSBFX
         eRJtiogOywsnF9ZRRvjh8WtzsYulcAE5Gmjm2eBftmlqyEmyLPHFEnh0uFiJHvCpjMqS
         mAFQ==
X-Gm-Message-State: AOJu0YwnLhYS1N2UefisN4aLyCGXmCmkYwUpZI3zbZOO4sO3M+Yq91/i
	NtsRcv09llhUoacUFf4mufOE+bxq3mQswv69I+fswA==
X-Google-Smtp-Source: AGHT+IHdkwEvjszcJvfywc8Jpimsn1KEvtMQIBx9T044fmlSpJfllVrTTdQUFvJqGwQtnx6zsdDOuMBQYw8GmjCE0wU=
X-Received: by 2002:a81:7808:0:b0:5d3:c23c:d6a with SMTP id
 t8-20020a817808000000b005d3c23c0d6amr2594670ywc.18.1701416500809; Thu, 30 Nov
 2023 23:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
In-Reply-To: <20231201014101.15802-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:41:29 +0200
Message-ID: <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Stabilize use of vblank_refcount
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, steev@kali.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> There is currently a race condition occuring when accessing
> vblank_refcount. Therefore, vblank irq timeouts may occur.
>
> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
>
> Changes from prior versions:
>    v2: - Slightly changed wording of patch #2 commit message
>    v3: - Mistakenly did not change wording of patch #2 in last version.
>          It is done now.

Usually sending a series once a day is enough. If you have any pending
changes, it might be better to reply to your patch stating that you
want to do this and that, while still allowing reviewers to respond
(and thus you can incorporate their review in the next iteration).

>
> Paloma Arellano (2):
>   drm/msm/dpu: Modify vblank_refcount if error in callback
>   drm/msm/dpu: Add mutex lock in control vblank irq
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
>  4 files changed, 30 insertions(+), 4 deletions(-)
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry

