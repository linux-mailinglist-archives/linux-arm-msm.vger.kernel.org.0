Return-Path: <linux-arm-msm+bounces-4475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119AB80F992
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 22:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438F21C20DED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 21:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E933864153;
	Tue, 12 Dec 2023 21:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWtC57Eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997F3AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 13:38:02 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d7346442d4so60899487b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 13:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702417082; x=1703021882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzxdy4DAqYYy/QedSXGsAE7/tNvWAE0PzW8vKkT/Z+Q=;
        b=mWtC57EgH17ygeRM7FPM1w6jTUZW6gJhR3YJ98ARpUQLJkLUifHY6VCPXF50frkD35
         tKLLPJUGDaF7rdfR81lcLUfl9J6QpLInjT4s8qeAQx+W/60tCZoq/OpCMxokbWRDdALM
         agkNrk6k1D/4gvfq3MKCTR3RhmnCgQQSek1NOhdJR6M2Cb8ARZe2IZ7JghwPJ4cBpFbG
         oawKFBMje7mxt1jVlSc3qckYS4b9sKDDdsboeFSyS6sLPwpJ/iXKCzAgsTVoU/Wi0tMn
         7eJe7VHJDAk5CuPrPgz/GQ10aRVb+6ePJ+qll5JYRTfmonU6SV+k/dy+G+BP+kFI4EKd
         Oa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702417082; x=1703021882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hzxdy4DAqYYy/QedSXGsAE7/tNvWAE0PzW8vKkT/Z+Q=;
        b=Q3L5aOgJr966ynP4m5rbkXNLQxgKJ/izSjjLjfw9nuLoCykfBwlkuqIiYCdAjIG2ii
         aZ0OYGw0COQwJum3kVbscfDFecFmNQBpAyuttWYT3v/3GfLQdO3hJUR7fcYHN8lbIsZJ
         Uk0NnQB5D5u5i5hEjiYFfAqwdFTn0n2Szz0zRq3L8prtHoL6HtvjWdS25cjBWDyFggtt
         B996ic6udTDcyrSALE0NeHzhXl8XSd6SeMeHDJTKpsnDVudxdFQiB29PC5uT8Q+s6st4
         O0P+gZm/RyL7So6By60j2TnOAJNLtsjWBfyfddyVEVt6s963K7ZBdKmiBKawf/3n0kme
         1eUw==
X-Gm-Message-State: AOJu0YykfltbMW5Jt9ztFFW3Y62gC+JusE/BOHzYZWce6hRjX/l8+Zxa
	IuY19SdA30V4oP6Lp7sO2s/MUsKxanVpVaY/90NR5A==
X-Google-Smtp-Source: AGHT+IHOaQxAO03DA1eRwI9KuaEK/YYi+78fp45l1XIByFOvK8wRRxPSjLqjbcQfM3q4ZBmUdltsfAN58G975GhgKo0=
X-Received: by 2002:a05:690c:4705:b0:5e1:80b6:a731 with SMTP id
 gz5-20020a05690c470500b005e180b6a731mr2364533ywb.60.1702417081817; Tue, 12
 Dec 2023 13:38:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com> <20231212205254.12422-8-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212205254.12422-8-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:37:51 +0200
Message-ID: <CAA8EJprBF35zAhNjTrQ85yDOQwu3rssr3+xstSBVBLZyD0gfKQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> CDM block comes with its own set of registers and operations
> which can be done. In-line with other hardware blocks, this
> change adds the dpu_hw_cdm abstraction for the CDM block.
>
> changes in v4:
>         - used FIELD_PREP() for dpu_hw_cdm_setup_cdwn() operations
>         - change to lowercase hex in dpu_hw_cdm_bind_pingpong_blk()
>         - move disable assignment inside else in dpu_hw_cdm_bind_pingpong_blk()
>
> changes in v3:
>         - fix commit text from sub-blk to blk for CDM
>         - fix kbot issue for missing static for dpu_hw_cdm_enable()
>         - fix kbot issue for incorrect documentation style
>         - add more documentation for enums and struct in dpu_hw_cdm.h
>         - drop "enable" parameter from bind_pingpong_blk() as we can
>           just use PINGPONG_NONE for disable cases
>         - drop unnecessary bit operation for zero value of cdm_cfg
>
> changes in v2:
>         - replace bit magic with relevant defines
>         - use drmm_kzalloc instead of kzalloc/free
>         - some formatting fixes
>         - inline _setup_cdm_ops()
>         - protect bind_pingpong_blk with core_rev check
>         - drop setup_csc_data() and setup_cdwn() ops as they
>           are merged into enable()
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312101815.B3ZH7Pfy-lkp@intel.com/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c  | 245 ++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h  | 142 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |   1 +
>  4 files changed, 389 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

