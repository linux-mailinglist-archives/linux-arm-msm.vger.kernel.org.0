Return-Path: <linux-arm-msm+bounces-1483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB597F4395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC685B209CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F895102B;
	Wed, 22 Nov 2023 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9Y2IElL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E64091
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:20:49 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5cc62cca0efso5339327b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700648449; x=1701253249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uF9oMwpOZMO8JSYm34njbxYk24Euivs6aKJ2cKa20XA=;
        b=D9Y2IElLoCfNYIGcGl2KqqMSCPrBRuXVn4j8IcOqQLO5VMDHQe8MgPEt/FI6mJxn+D
         rAUFbJoDQUBC/cQbgPPXB5jNMOzkG9TrSKCjBQ/nBg33YPYxwpYkfiW/qW7A875vf8QK
         Pb1cfWZvMr4oIG0yWygylqNTUYFcoMpm/fwU9OOUyPvC712lXl4i3Oy1ZuWUQXx5Sz8E
         ahlOsY9+vdYXFOOg12EXvWu9fjtfh5tmRBiZv3b3Sso9jLHXl2KW70POPSUL6Dl1aN3m
         Wp5eP6O38xk0bOB72CzdAswgF2DULIFp0BZtjiFa7AYrUMO1cinCx7MW9eV8LNsvKugn
         EPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648449; x=1701253249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uF9oMwpOZMO8JSYm34njbxYk24Euivs6aKJ2cKa20XA=;
        b=VfuoTqmzkoxAYO/Rkeh1WSTAic4uAsSi02s9Bkbw7zIe5klETXz0JR3Zl6pca/CNdX
         +YBumkbDH45rAlKiuAodxkbTVNRQb4pIub1Fi7d+MC8ssdAvYvZUih9LpTBxy3YpGm1+
         nMtKlHtBVnHRjEIVKm71oB9rxBwRIv/rQC9W0lUMWOcnJsDWm94pJ6PxEiEQzRH31r7u
         0/IUaJQQsxgsnhP039Qwoegjw375mAwV2NAqwhIKq8FkeSLejMWCQUCxiBN/WQBHX6QA
         ZlL38Oy9sJch7jBwslS7umxgxXlKmwhqk5tG0p+UiXVnR5K9EVbsqENujikF9BqWkyV6
         Cdcg==
X-Gm-Message-State: AOJu0Yz1pPM7vvVCYV2cePJJDhcxHH0pncYIqck2liIyNbo/6WQ/bDM+
	S2yxAPMOoaUzjsaPlSxAf3D4A8C1sb3UROOgM/hdzA==
X-Google-Smtp-Source: AGHT+IEMi8icN8SpSyHZTcvnhOb2qfvNVMAQ7Gp0Dd7EsU5yN7FiBYiFkC6BXP5T0R0GRydEerDRH2SDFkuF1QL9FR4=
X-Received: by 2002:a0d:cacd:0:b0:5ca:3508:95c0 with SMTP id
 m196-20020a0dcacd000000b005ca350895c0mr1486172ywd.7.1700648448840; Wed, 22
 Nov 2023 02:20:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-7-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-7-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:20:37 +0200
Message-ID: <CAA8EJpq0ZFEYSy4_kabR7+Cor=go8qm04e93gtZrUNXWm-e91w@mail.gmail.com>
Subject: Re: [PATCH 7/7] phy: qcom-qmp: qserdes-txrx: Add v7 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The X1E80100 platform bumps the HW version of QMP phy to v7 for USB and PCIE.
> Add the new qserdes TX RX offsets in a dedicated header file.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 ++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  2 files changed, 79 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> new file mode 100644
> index 000000000000..14023f47a95c
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_USB_V7_H_
> +#define QCOM_PHY_QMP_QSERDES_TXRX_USB_V7_H_

s/_USB//

> +
> +#define QSERDES_V7_TX_CLKBUF_ENABLE                            0x08
> +#define QSERDES_V7_TX_RESET_TSYNC_EN                           0x1c
> +#define QSERDES_V7_TX_PRE_STALL_LDO_BOOST_EN                   0x20
> +#define QSERDES_V7_TX_TX_BAND                                  0x24
> +#define QSERDES_V7_TX_INTERFACE_SELECT                         0x2c
> +#define QSERDES_V7_TX_RES_CODE_LANE_TX                         0x34
> +#define QSERDES_V7_TX_RES_CODE_LANE_RX                         0x38
> +#define QSERDES_V7_TX_RES_CODE_LANE_OFFSET_TX                  0x3c
> +#define QSERDES_V7_TX_RES_CODE_LANE_OFFSET_RX                  0x40
> +#define QSERDES_V7_TX_PARRATE_REC_DETECT_IDLE_EN               0x60
> +#define QSERDES_V7_TX_BIST_PATTERN7                            0x7c
> +#define QSERDES_V7_TX_LANE_MODE_1                              0x84
> +#define QSERDES_V7_TX_LANE_MODE_2                              0x88
> +#define QSERDES_V7_TX_LANE_MODE_3                              0x8c
> +#define QSERDES_V7_TX_LANE_MODE_4                              0x90
> +#define QSERDES_V7_TX_LANE_MODE_5                              0x94
> +#define QSERDES_V7_TX_RCV_DETECT_LVL_2                         0xa4
> +#define QSERDES_V7_TX_TRAN_DRVR_EMP_EN                         0xc0
> +#define QSERDES_V7_TX_TX_INTERFACE_MODE                                0xc4
> +#define QSERDES_V7_TX_VMODE_CTRL1                              0xc8
> +#define QSERDES_V7_TX_PI_QEC_CTRL                              0xe4
> +
> +#define QSERDES_V7_RX_UCDR_FO_GAIN                             0x08
> +#define QSERDES_V7_RX_UCDR_SO_GAIN                             0x14
> +#define QSERDES_V7_RX_UCDR_FASTLOCK_FO_GAIN                    0x30
> +#define QSERDES_V7_RX_UCDR_SO_SATURATION_AND_ENABLE            0x34
> +#define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW                  0x3c
> +#define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH                 0x40
> +#define QSERDES_V7_RX_UCDR_PI_CONTROLS                         0x44
> +#define QSERDES_V7_RX_UCDR_SB2_THRESH1                         0x4c
> +#define QSERDES_V7_RX_UCDR_SB2_THRESH2                         0x50
> +#define QSERDES_V7_RX_UCDR_SB2_GAIN1                           0x54
> +#define QSERDES_V7_RX_UCDR_SB2_GAIN2                           0x58
> +#define QSERDES_V7_RX_AUX_DATA_TCOARSE_TFINE                   0x60
> +#define QSERDES_V7_RX_TX_ADAPT_POST_THRESH                     0xcc
> +#define QSERDES_V7_RX_VGA_CAL_CNTRL1                           0xd4
> +#define QSERDES_V7_RX_VGA_CAL_CNTRL2                           0xd8
> +#define QSERDES_V7_RX_GM_CAL                                   0xdc
> +#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2                    0xec
> +#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3                    0xf0
> +#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4                    0xf4
> +#define QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW                      0xf8
> +#define QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH                     0xfc
> +#define QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1              0x110
> +#define QSERDES_V7_RX_SIDGET_ENABLES                           0x118
> +#define QSERDES_V7_RX_SIGDET_CNTRL                             0x11c
> +#define QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL                    0x124
> +#define QSERDES_V7_RX_RX_MODE_00_LOW                           0x15c
> +#define QSERDES_V7_RX_RX_MODE_00_HIGH                          0x160
> +#define QSERDES_V7_RX_RX_MODE_00_HIGH2                         0x164
> +#define QSERDES_V7_RX_RX_MODE_00_HIGH3                         0x168
> +#define QSERDES_V7_RX_RX_MODE_00_HIGH4                         0x16c
> +#define QSERDES_V7_RX_RX_MODE_01_LOW                           0x170
> +#define QSERDES_V7_RX_RX_MODE_01_HIGH                          0x174
> +#define QSERDES_V7_RX_RX_MODE_01_HIGH2                         0x178
> +#define QSERDES_V7_RX_RX_MODE_01_HIGH3                         0x17c
> +#define QSERDES_V7_RX_RX_MODE_01_HIGH4                         0x180
> +#define QSERDES_V7_RX_RX_MODE_10_LOW                           0x184
> +#define QSERDES_V7_RX_RX_MODE_10_HIGH                          0x188
> +#define QSERDES_V7_RX_RX_MODE_10_HIGH2                         0x18c
> +#define QSERDES_V7_RX_RX_MODE_10_HIGH3                         0x190
> +#define QSERDES_V7_RX_RX_MODE_10_HIGH4                         0x194
> +#define QSERDES_V7_RX_DFE_EN_TIMER                             0x1a0
> +#define QSERDES_V7_RX_DFE_CTLE_POST_CAL_OFFSET                 0x1a4
> +#define QSERDES_V7_RX_DCC_CTRL1                                        0x1a8
> +#define QSERDES_V7_RX_VTH_CODE                                 0x1b0
> +#define QSERDES_V7_RX_SIGDET_CAL_CTRL1                         0x1e4
> +#define QSERDES_V7_RX_SIGDET_CAL_TRIM                          0x1f8
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 63b3cbfcb50f..6923496cbfee 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -28,6 +28,7 @@
>  #include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
>
>  #include "phy-qcom-qmp-qserdes-com-v7.h"
> +#include "phy-qcom-qmp-qserdes-txrx-v7.h"
>
>  #include "phy-qcom-qmp-qserdes-pll.h"
>
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

