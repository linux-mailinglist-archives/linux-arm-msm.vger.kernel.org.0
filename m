Return-Path: <linux-arm-msm+bounces-1480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA787F4381
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D732815E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C274A9BA;
	Wed, 22 Nov 2023 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYpeWtKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B7C83
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:18:59 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-db057de2b77so6031167276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700648338; x=1701253138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9c11pFvupFPnQhEf8NQ0gBbEB8fE0d+93nnxiRUqcLg=;
        b=BYpeWtKG4FPPf+N/7yMjOQrL26G6lczdxEJyDrRdJaKy2sMRVyk9ra2Zb0Ir8UraU1
         zRkbX2AVsBzH7voibXe+CtveWstVDh8vU40FpDnpYZOAB4wHJu6nSfBqQ6PurNk5J9mf
         cQInJWQtuJ/Ds5EkF0Ese2ZfAdOwKSNKum7fYTRtww4llKmIx8CHN0px6j4N+HhbDdtW
         K+OYJZAvCt6UM1T6eKow//PgRpJDVrvIOKsS21rfHgkb+O83vUukVO0AO2aZ1y1bE/r+
         NRvwjMoR8gMh69sv0YLICwm+UMmPVUBqN2LLbE2XqurJ9sCQgD8Rf1VbCf3abEIBwF3q
         3/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648338; x=1701253138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9c11pFvupFPnQhEf8NQ0gBbEB8fE0d+93nnxiRUqcLg=;
        b=GE+HuMAhmFanGND5FoRBiHFV67fhRB0cqen6gzdJARkIa55o0/ZHvzSubRItaPBXoa
         Y3wb1MmftdkfutforjE6dqJ1g/l5EciXWJJuGeXO/kKAomtbCdL1xMyp6W0k3U73beZT
         vLjJ/3gJFY7UxXIjFHX2UudBuahp/ziXvz+xyQv5cVeNnJChh33pPHuIOBBh/BYakqoV
         d4VPTkv7BuMCPO+xqfTjAOozV6SgDXmlu5CMBAnWKhJdnwDBsqAeGbvMI2Ta51WhaPkK
         znu1yfOm/mSwBgabNEwQtxQoBMdSFbnpY6V0x2nYZhVeSzsFeYbE/K3DT3jOHd88wkW1
         UBZg==
X-Gm-Message-State: AOJu0YxLPXoS4QHXC6Rs0qo2yGgdBGnnVgzyWFsRY0bXT73fwiEA1oOV
	jDUkCqeV8lYZADfXtUoMehtHoFWS07lUMXTG5Ho0/Q==
X-Google-Smtp-Source: AGHT+IHbEev2I5tUtnx8XY+aYZY4ijq+jp+sr4M76Qn2LzFRDutzsRzlkmQ4g5DWOee0/SQLVPpI4jwELA55NaoeLVE=
X-Received: by 2002:a5b:4d1:0:b0:da0:622b:5539 with SMTP id
 u17-20020a5b04d1000000b00da0622b5539mr1470086ybp.58.1700648338139; Wed, 22
 Nov 2023 02:18:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-4-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-4-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:18:47 +0200
Message-ID: <CAA8EJpouPmst-ZcJSZ-qMPB2regi1saTyjczQnN5E=zE57C-Fg@mail.gmail.com>
Subject: Re: [PATCH 4/7] phy: qcom-qmp: pcs-usb: Add v7 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The X1E80100 platform bumps the HW version of QMP phy to v7 for USB.
> Add the new PCS USB specific offsets in a dedicated header file.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h
> new file mode 100644
> index 000000000000..dbb75964cef7
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef QCOM_PHY_QMP_PCS_USB_V7_H_
> +#define QCOM_PHY_QMP_PCS_USB_V7_H_
> +
> +/* Only for QMP V6 PHY - USB3 have different offsets than V5 */

V7

> +#define QPHY_USB_V7_PCS_LOCK_DETECT_CONFIG1            0xc4
> +#define QPHY_USB_V7_PCS_LOCK_DETECT_CONFIG2            0xc8
> +#define QPHY_USB_V7_PCS_LOCK_DETECT_CONFIG3            0xcc
> +#define QPHY_USB_V7_PCS_LOCK_DETECT_CONFIG6            0xd8
> +#define QPHY_USB_V7_PCS_REFGEN_REQ_CONFIG1             0xdc
> +#define QPHY_USB_V7_PCS_USB3_POWER_STATE_CONFIG1       0x90
> +#define QPHY_USB_V7_PCS_RX_SIGDET_LVL                  0x188
> +#define QPHY_USB_V7_PCS_RCVR_DTCT_DLY_P1U2_L           0x190
> +#define QPHY_USB_V7_PCS_RCVR_DTCT_DLY_P1U2_H           0x194
> +#define QPHY_USB_V7_PCS_CDR_RESET_TIME                 0x1b0
> +#define QPHY_USB_V7_PCS_ALIGN_DETECT_CONFIG1           0x1c0
> +#define QPHY_USB_V7_PCS_ALIGN_DETECT_CONFIG2           0x1c4
> +#define QPHY_USB_V7_PCS_PCS_TX_RX_CONFIG               0x1d0
> +#define QPHY_USB_V7_PCS_EQ_CONFIG1                     0x1dc
> +#define QPHY_USB_V7_PCS_EQ_CONFIG5                     0x1ec

Some (most) of these registers do not belong here, they are the same
as the generic PCS register names. Please drop them.

> +
> +#define QPHY_USB_V7_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL   0x18
> +#define QPHY_USB_V7_PCS_USB3_RXEQTRAINING_DFE_TIME_S2  0x3c
> +#define QPHY_USB_V7_PCS_USB3_RCVR_DTCT_DLY_U3_L                0x40
> +#define QPHY_USB_V7_PCS_USB3_RCVR_DTCT_DLY_U3_H                0x44

Drop the _USB_ part, please, there is already PCS_USB3 prefix.

> +
> +#endif
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

