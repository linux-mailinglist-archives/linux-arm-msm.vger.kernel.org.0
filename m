Return-Path: <linux-arm-msm+bounces-6988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730F82A4ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 00:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 954DEB22119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 23:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0054F898;
	Wed, 10 Jan 2024 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="saJu6Dke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CB4F895
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f68af028afso41251597b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 15:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704928976; x=1705533776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IP0kPmjJQz5xdnO9Zw1vVvFueYTNz/6OxEEXA7YZ1Dg=;
        b=saJu6DkenM0ZJoqYC/Q74oz9oZNEHhReX1lvm6Da4KwSU0uVL0Try+anM/085hwOMn
         9ea6qWFKhkW940eutF0T/y+pQYaGMSbtjJhS45q6xYjrbb2D3hXEN8nFO68odFd/iMUH
         lKZB7haaQzFZAtNvzHz8sWs3Gv2OqE1deJxti6TF1SxOl+3OyoJRNCQOZq74vUa/A46N
         8NlTMgJVkVjaGKRV+apq+CaLVtAlatT/h9VY7+fNB1Xh7eJsRGrcuECvjapVRJzU5o2m
         6Yhxxa1cNvXfTlibVuYb7QUmS+jJuMePraPsYvZV+XG/KRom+tWGSIaI8u4wYknQBWtA
         q8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928976; x=1705533776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IP0kPmjJQz5xdnO9Zw1vVvFueYTNz/6OxEEXA7YZ1Dg=;
        b=YQHiFIQioeftovrpEQfJ3a0p+0m33+p7VUzMdugaqE+BTjaVo3wwCgSm3ofI3Zc8q2
         /W3AVhX+U5s7/sWhpX/Yi4BhdFNIG1yFs+LOAkQqjN3ZHVAQXwrYfj7iJG30IepajRIG
         CP5B1V+MDTRAqHlaVm8zGRvHOClnVnLTKYleDhh2CGw1FUHHetWjiy+gX+RiPTmO8BqE
         TBlNWw2N4bKSAkFqCEB+cCABKhoqUHKb5VoLouR2Rw2x+zVAKJp651Ie47YKXctJLE6b
         fdwikIXQMI4ZLkt6Kok54fgNsgAHT2xz0JDfmA314VKdjXRa7RYUobXJSJpmtClUA77z
         F1pQ==
X-Gm-Message-State: AOJu0YwJHEFV5RCY7iysgr9/KQyWtVkYz7u1I0UBDl9RaAr5uYUqaold
	l0Ogwj7zi9NPn/JIE9zCDRRMe2zRpocRodWC4ITOrNThmBANSA==
X-Google-Smtp-Source: AGHT+IFqBQqIGJ/G1jHMlkSuLZ9HFAiFLALAjQuy4Zj7oSL4IC41zFAAgk0OSkkJdHgkbDhmybdpD7SWug2Rj/DJZhQ=
X-Received: by 2002:a81:a1d6:0:b0:5eb:9192:114 with SMTP id
 y205-20020a81a1d6000000b005eb91920114mr396803ywg.72.1704928976306; Wed, 10
 Jan 2024 15:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
 <20231009205727.2781802-6-dmitry.baryshkov@linaro.org> <d11ffecb-010d-769a-2d3c-9634a046a453@quicinc.com>
In-Reply-To: <d11ffecb-010d-769a-2d3c-9634a046a453@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 01:22:45 +0200
Message-ID: <CAA8EJpqBgLxd6kRsi2zgnah55fPHJE5_9_xv9PHR6ec40Dk-0w@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/mdp5: drop split display support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jan 2024 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/9/2023 1:57 PM, Dmitry Baryshkov wrote:
> > The MSM DSI driver has dropped support for calling
> > mdp_kms_funcs::set_split_display() callback. Drop corresponding callback
> > from the mdp5 driver together with the rest of the infrastructure.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 -------------------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 -------------------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 -------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ----
> >   drivers/gpu/drm/msm/msm_kms.h                 |  4 --
> >   5 files changed, 111 deletions(-)
> >
>
> The programming inside the set_split_display() looks right from what i
> see, so whenever (if at all) bonded_dsi is implemented for mdp5, this
> will remain intact. Its just that there are no consumers left for
> set_split_display anymore so its dead code. If someone wants to add that
> support, I guess they have to start by reverting this commit first. If
> thats the plan and agreement,

Either by reverting this commit or by introducing a wrapper like the
one present in dpu_encoder_virt.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry

