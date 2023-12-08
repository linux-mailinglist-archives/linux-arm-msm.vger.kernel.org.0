Return-Path: <linux-arm-msm+bounces-3928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E4C80A1ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FC7A1F214E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DAC1A5A9;
	Fri,  8 Dec 2023 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HrS+LEaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D52E0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:13:29 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5cfc3a48ab2so17167657b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702034008; x=1702638808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt7VH34vIXt25vrgUruA60BaGXHVidQ+RAFVzJPEkF8=;
        b=HrS+LEaTPmWq+dwQ1SAV/2wwDdbPRyp+zf+D9Gb7JwjRXbZ125v9N4VjuiR8jVjXJC
         U1wE3R2YDaEGch5PRNn6GD3SKcXMV6BaSUOIiIip0ZmLq4PR7B4Xk5pG/NP2ioNQ7XFw
         d78W5EkTfwJXEuBHIAVzlUmHkF+DkjWC+Aizy905pA9W0MInsBOVyQamB5kU63Yo3PXw
         A+gZoPLVQKuOPDtEaJrReFaSX04ccrkJ2y28gz4KXPzZpAx7ug8lEPBPKQS2pv9AS7vv
         91/Ng9g6rtJMgxmotM5hGYES6wYjHKLAKV+/1yNg3PSlEO9qlb6Gklm0w3CMxj72nPKA
         kOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702034008; x=1702638808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yt7VH34vIXt25vrgUruA60BaGXHVidQ+RAFVzJPEkF8=;
        b=ttsY3VEQQ4eFnm/PYkqs5qXAI1/pUa8F62T8sk1+E837uH3LybMI5SUnZlflzMS+0/
         k1/L0NrXhguyUGkh0gFg29zudVLVfOqjBQIdAVOl7J3OqL5si8pJTxc6wUZfXysojFNQ
         PZiJ9HLK6jzhxkparbIYb6FOsF7M8aoFLDNWIrOS6JWahLLEMmniqgzw0fup9mGqotKg
         OoebCMtXCtPrd6kFRj9rGyaUg0qlA+lKah6QxoNgJc/Il/Xn/RbCya4iZ208D/uNIo/4
         DW/ZtyTwFaNWUG7MyZvMJBJyEQLHpCaIMODCV3qVl2+gLXacaNPqfF2p3Z7fOulWCNMw
         EoFg==
X-Gm-Message-State: AOJu0Yxq4zEHVLSF9kU7UzQJ9YXu1FAHrMzB4D54w8EwKBUB/NBPIaUg
	Q94vz0Mkty8zdm8XqVDfdC+tERhFSRekU0OOl9lzvQ==
X-Google-Smtp-Source: AGHT+IEgLxut2LZKFwy8YPZiuTpL0zQRaZYu54PpvxGKqsQUheHzwcxxpJkcW4s18OsvT+SKUHlcC/jSfnNlgNEOLcg=
X-Received: by 2002:a81:aa0d:0:b0:5d3:d439:aabe with SMTP id
 i13-20020a81aa0d000000b005d3d439aabemr3762797ywh.26.1702034008459; Fri, 08
 Dec 2023 03:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-6-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-6-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:13:17 +0200
Message-ID: <CAA8EJpqpWxO=GjSp-CKRD2Vy89FxBPmDWNhPstfF=_y-xHvV_A@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> changes in v2:
>         - remove explicit zero assignment for features
>         - move sc7280_cdm to dpu_hw_catalog from the sc7280
>           catalog file as its definition can be re-used
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>  4 files changed, 29 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

