Return-Path: <linux-arm-msm+bounces-1479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901037F4363
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FCB81C208C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4E321372;
	Wed, 22 Nov 2023 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8fcXzdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988CA110
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:15:55 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5b383b4184fso71886207b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700648155; x=1701252955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PgkvyLwfQR26thZuHZr5M17A0Ohem0nIDMb8RLB6UYs=;
        b=r8fcXzdJhk4j5jldofapXyE3N/Tyl09fpEUY+m5NqEXEjROz50uKEaTBwMusJufdLa
         HPR762mdbn5gC3CaTUvaJjPozz5ONmi+GkkFy5Kks8j2ArMz1Qc9vmbaShdMd2B/YlRK
         Bl7ABymoZKM784c5lGNTBvmajRutsSk0eemoQirByj7Vw7muZWfvnOUgTsMz9jgA+6Z8
         +gvoThWi4mzO7FHXzjpacUS3Rvg0H2QMbBw5NSiQ0+EWPk8lNTVmmHvmxMlvbaTI2eoB
         Srd1EctnV1os/5+z0cyGqeK+ZfDTmI8llUyCfoZlwpmCr9lIzxJ0wA35A+ZM/H+Mvtu7
         i5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648155; x=1701252955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgkvyLwfQR26thZuHZr5M17A0Ohem0nIDMb8RLB6UYs=;
        b=WQw9dNlYpIW6ThercRWxVeQXAW1NN7KRnZZyOPpudFlquE9sk6NbtJ64WqXWoNbvC3
         Ey8TsSlHQJoQ6PDiDU5EYU88fPVRfg075iKL2vEU1tAtd2v5zZLgUC+OEnA5fgIMUHAC
         U66MWgdy2eQ6z2fE4k3QQMrgXeD0mOgPfiF+nP4gvKODIpluG6rbRQWAkVdZ8HoYe5+i
         mNp0Bd0mpbjUXP7oFTk4ZPaNkOvDos2IiYTD3BilNm8tVsE3wqeOYKw/fxyElop2YAQd
         QVZBX2Da6DgHguEdjhBNFJ8m+7fwXNWn51S4F3pLYbkYcE50Sb5ivoE5iSeJlnrhHRfV
         c7qQ==
X-Gm-Message-State: AOJu0Yy5RnSm6YNb53PacCDQECcafgbRdaAMbpn71d5YU0iNVTEdKIlX
	Ey3NxCVOZ/8t1xu4k0vyodd/zsfb5MH891EW+zUFqorHkzeI+bCW
X-Google-Smtp-Source: AGHT+IEkdUG9+zaFUBVAnoJGDXIM87u6PIrFmQ+T/ZMjVtONGnL/iE3hI7EqXnjaRE+awRnTSMD0+xsOQ6T0bnb+1T4=
X-Received: by 2002:a81:4746:0:b0:5a7:baac:7b34 with SMTP id
 u67-20020a814746000000b005a7baac7b34mr1621814ywa.28.1700648154790; Wed, 22
 Nov 2023 02:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-3-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-3-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:15:43 +0200
Message-ID: <CAA8EJpq5NdZKaDSjKnJhFBCD+pwb3jaHgsSXAu6ODmSPU+g_ww@mail.gmail.com>
Subject: Re: [PATCH 3/7] phy: qcom-qmp: pcs: Add v7 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The X1E80100 platform bumps the HW version of QMP phy to v7 for USB,
> and PCIe. Add the new PCS offsets in a dedicated header file.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h | 28 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h        |  2 ++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h
> new file mode 100644
> index 000000000000..520f28d802f6
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef QCOM_PHY_QMP_PCS_V7_H_
> +#define QCOM_PHY_QMP_PCS_V7_H_
> +
> +/* Only for QMP V6 PHY - USB/PCIe PCS registers */

V7

> +
> +#define QPHY_V7_PCS_LOCK_DETECT_CONFIG1                        0xc4
> +#define QPHY_V7_PCS_LOCK_DETECT_CONFIG2                        0xc8
> +#define QPHY_V7_PCS_LOCK_DETECT_CONFIG3                        0xcc
> +#define QPHY_V7_PCS_LOCK_DETECT_CONFIG6                        0xd8
> +#define QPHY_V7_PCS_REFGEN_REQ_CONFIG1                 0xdc
> +#define QPHY_V7_PCS_RX_SIGDET_LVL                      0x188
> +#define QPHY_V7_PCS_RCVR_DTCT_DLY_P1U2_L               0x190
> +#define QPHY_V7_PCS_RCVR_DTCT_DLY_P1U2_H               0x194
> +#define QPHY_V7_PCS_RATE_SLEW_CNTRL1                   0x198
> +#define QPHY_V7_PCS_RX_CONFIG                          0x1b0
> +#define QPHY_V7_PCS_ALIGN_DETECT_CONFIG1               0x1c0
> +#define QPHY_V7_PCS_ALIGN_DETECT_CONFIG2               0x1c4
> +#define QPHY_V7_PCS_PCS_TX_RX_CONFIG                   0x1d0
> +#define QPHY_V7_PCS_EQ_CONFIG1                         0x1dc
> +#define QPHY_V7_PCS_EQ_CONFIG2                         0x1e0
> +#define QPHY_V7_PCS_EQ_CONFIG5                         0x1ec
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 71f063f4a56e..21f6a56e7ae3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -44,6 +44,8 @@
>
>  #include "phy-qcom-qmp-pcs-v6_20.h"
>
> +#include "phy-qcom-qmp-pcs-v7.h"
> +
>  /* Only for QMP V3 & V4 PHY - DP COM registers */
>  #define QPHY_V3_DP_COM_PHY_MODE_CTRL                   0x00
>  #define QPHY_V3_DP_COM_SW_RESET                                0x04
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

