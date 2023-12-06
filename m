Return-Path: <linux-arm-msm+bounces-3518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91EB806AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BCB12819CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46265288D5;
	Wed,  6 Dec 2023 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYhIoaaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9DB1BF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 01:11:56 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-daf7ed42ea6so4915063276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701853915; x=1702458715; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YqJKf6k3LqdMOajnfjgr4qlTOkc+4XpnvbfWlmqLEqw=;
        b=yYhIoaaFP2pDyV/7WCE+SVYkzAmn9WDSKN3A1MgJg2wsDBBB6Nhhr/hScFBA4xnm9c
         iEkEXQvLfqpEy6KSHUo/V4p1bHCiYjL2VYJj+gKnQBVSiVwTAAz7SMk+g+2babMZHUzb
         Dwwex06NZt3mrLQbsB2aLVek2QRPCMDubiLODaxQ0UqmKsdrFBndfE+4FdcNT1O2678K
         xZ+9hKEsNvatBy68E7EK5W4aTVUjmT+N9JGWLKCBlpKaZf/ycy3/KCpwGbv1URbx6uWv
         QQgCu0nmd4D3AraOOascALi9dIxjms4JAjPnT1EQaF5qd2nO0TSc+qpFEOdecq+Sj5IB
         27rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853915; x=1702458715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqJKf6k3LqdMOajnfjgr4qlTOkc+4XpnvbfWlmqLEqw=;
        b=U0aV43N8qxyb+Lu7Lq88Vv1ZGGknJAMuPnS79JgCDvBAyXsMuivB9aFuLemj+AMjVm
         ZqMrZ0JKcascS4ciEiZ421Za4lCSQENSKzEbIDqJVzllN7j03mqWdtRToT8r63VT+ri5
         DeuarFCpcRud0uCiMyHwRXD6XlDMYeED5tUqlZy24NgkPYlayN/0XT0XxPHvyaN2fhfN
         5ZE0lcx5OmdFMwaR7/GhOIEfGxQqYv3IsG71RA5EmWD5sZRfnMFHXQUGwMi65AgSBTYN
         7cVRNAB3Mr3vdNr1H7T9oTgOGMXlfPwSSyhL9/zElU9fCbETSnbMKX0WDVbnWQ37Llae
         z16w==
X-Gm-Message-State: AOJu0YzRzukPXvySgPrw4Ew1uDdokgem+2CD7SXUSimGUasE2B7hZpS/
	lC82OkHjnPlPRSWB6NrDGu4WTBTtgth8przypmmFMw==
X-Google-Smtp-Source: AGHT+IEa3a5UoBcKWU2a9NslT+MOBgjSAC1zjicINvB9Ra2bERFvGcDVtQBsO6xLpYDOkNYNwp2dm8OphFFSIX5tAN0=
X-Received: by 2002:a25:3497:0:b0:db7:dacf:622a with SMTP id
 b145-20020a253497000000b00db7dacf622amr375926yba.124.1701853915593; Wed, 06
 Dec 2023 01:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com> <20231205220526.417719-3-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:11:44 +0200
Message-ID: <CAA8EJppNjBCx2NDe4zS_41hEUBiiXcuG63frJ7E67A5M9-FSzg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/adreno: Split catalog into separate files
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Dec 2023 at 00:06, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/Makefile               |   5 +
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |  53 ++
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  75 +++
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |  51 ++
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  | 145 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 285 +++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 570 +--------------------
>  7 files changed, 620 insertions(+), 564 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 49671364fdcf..32f2fd980452 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -7,12 +7,17 @@ ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
>  msm-y := \
>         adreno/adreno_device.o \
>         adreno/adreno_gpu.o \
> +       adreno/a2xx_catalog.o \
>         adreno/a2xx_gpu.o \
> +       adreno/a3xx_catalog.o \
>         adreno/a3xx_gpu.o \
> +       adreno/a4xx_catalog.o \
>         adreno/a4xx_gpu.o \
> +       adreno/a5xx_catalog.o \
>         adreno/a5xx_gpu.o \
>         adreno/a5xx_power.o \
>         adreno/a5xx_preempt.o \
> +       adreno/a6xx_catalog.o \
>         adreno/a6xx_gpu.o \
>         adreno/a6xx_gmu.o \
>         adreno/a6xx_hfi.o \
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> new file mode 100644
> index 000000000000..1a4d182279fc
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013-2014 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + *
> + * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> + */
> +
> +#include "adreno_gpu.h"
> +
> +const struct adreno_info a2xx_gpus[] = {
> +       {
> +               .chip_ids = ADRENO_CHIP_IDS(0x02000000),
> +               .family = ADRENO_2XX_GEN1,
> +               .revn  = 200,
> +               .fw = {
> +                       [ADRENO_FW_PM4] = "yamato_pm4.fw",
> +                       [ADRENO_FW_PFP] = "yamato_pfp.fw",
> +               },
> +               .gmem  = SZ_256K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init  = a2xx_gpu_init,
> +       }, { /* a200 on i.mx51 has only 128kib gmem */
> +               .chip_ids = ADRENO_CHIP_IDS(0x02000001),
> +               .family = ADRENO_2XX_GEN1,
> +               .revn  = 201,
> +               .fw = {
> +                       [ADRENO_FW_PM4] = "yamato_pm4.fw",
> +                       [ADRENO_FW_PFP] = "yamato_pfp.fw",
> +               },
> +               .gmem  = SZ_128K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init  = a2xx_gpu_init,
> +       }, {
> +               .chip_ids = ADRENO_CHIP_IDS(0x02020000),
> +               .family = ADRENO_2XX_GEN2,
> +               .revn  = 220,
> +               .fw = {
> +                       [ADRENO_FW_PM4] = "leia_pm4_470.fw",
> +                       [ADRENO_FW_PFP] = "leia_pfp_470.fw",
> +               },
> +               .gmem  = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init  = a2xx_gpu_init,
> +       }, {
> +               /* sentinal */
> +       }
> +};
> +
> +MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> +MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> +MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> \ No newline at end of file

Nit: you might want to fix newlines (here and in other catalog files).



-- 
With best wishes
Dmitry

