Return-Path: <linux-arm-msm+bounces-73290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5FB54916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294473A4BC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2052EC56D;
	Fri, 12 Sep 2025 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luaYgYh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687492EC550
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671986; cv=none; b=pSReIzuVzCobP7QTBQ2rVx9B66KQkuCxWQnndhpeXdcfC94EqBAjJp2eB3B+IHWf17PPIK1wmJGujzWR6YwsqRK0kULUYMEPCKQf7Que/tdcYYa9A4MWzNorthHnGlHYmAGQ4dn17VrAzX6E/Zc/CZl25OhnKR9pKwPCVKzeu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671986; c=relaxed/simple;
	bh=MzFFTsiIxi9vlGbkhvTgnsZ54Dc+zxUWofCHysOUjh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD7r5FFbYxmqCQQvGWb62k9/wVsGGrBHR1FuHDaKk/qIgUEbv3ug5/11uK3b+cJvDxXfKyewW9TNNmq4kqf4nD2UuQn5aBkIQDqCnGpjVAul2bV0HohJA8XE2IW6Jf1M2KMkSPG14veSTaliVGYIrieoARlcFtXyLepytqm218E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luaYgYh3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fEjk001295
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kzdgJd2b55rTyRioSKAWB5pd
	PujDg59niQbpGU1S8ro=; b=luaYgYh3uK34XTUXmCZbepDVtB5vMp+tJK+jhD7C
	KiuE0FuytV4hkOUj6v1NSkmWwqsYgPpLMhxK6mm7v0zY1x/xePA8WdOmQafzNAoV
	nyvZfWfcaHBvZd512V6E6TRWo0oxQeQsCEFLs1gicPtD+PRQ+Kp8jJpGlVBIR6aF
	iddw8xmH94pO2Dw/XlR/qMuouXXbp171rWQB+XqnQ1LWNim1DAd2/ekmIlAeEnQR
	qVxAKcbkydvUyoejufcs0TY/kwcfhJFhBvQMwdNnYLdsAN3rdcPR5l2ZCSoK/Ifk
	XgZ6o5LlYszSVwSzpoFR5vTI2wUvuEVErLfG7U09wEta8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h6544-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:13:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b49715fdfbso59463391cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671981; x=1758276781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzdgJd2b55rTyRioSKAWB5pdPujDg59niQbpGU1S8ro=;
        b=IYhWM7MpQFTpmBHdy4RwR9LKt/iGESYGHYwub6E50oID8BLVuo1VJc78eVEfvFitSy
         AAAq5faeXa1MS48T+JhoSXLkDuoiYjLzQ/CInV6MTDxzHUcbfAiJfunLY8EumGoNdaSg
         5Q19Suo8JIWcKnyTf96nJZSPjrZd3LFXwPw3UGk6zoqWg/flSr6Mn13zPcmVElcDxWS6
         3Y7HoYOpmVWV48ckW5CX8P4rJuCL4JsTAs4WrwUJnr2Wp1R37mIOmSRsYQMb2yBa0yfG
         2U8ZRxIhaxSbKFjkMuNnaONceedEc8QRyx2cLR3gW0yaEX12lZ2Ls3H3/4Wh4d3AzZW1
         dhTg==
X-Forwarded-Encrypted: i=1; AJvYcCVhkPmeVuAZx8HNkjT3Zyo3T8Ep1Qc1J6GjYsadeCbE4ZJGdY/xi9b1DDDn68asN+GcK9GRAr1hCjLPmXtr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5tiUnpM1xBBmUizynR88Kws6BRJU3KgsYBNA7UoTO5B6thWGc
	SyJd8TjY9AUnAMSkL0SAosC+AtT6pgxp7DQtGrGfOQOtHWEhVJV9v8OWDCDEmflpdg9np2HSRUP
	7xswSF8rExHAs9a+5xrADuR6nGvCOhXYTbZEBHJjPA5JXlR3Iwy/ZCSaAff9DC9/1quw8
X-Gm-Gg: ASbGnctLXANv5VQZ5PJqO0RvCnL1W4qtZgJLWruXxWhfoOPoZAAGip/g+zF9AWxeyMI
	oY47RwNfkxL2TFZjPUoBLes24CZtxb7sH/rAlQ9eeJv1GuGlFkYhSpqB6AQNtIK2hLfMgh9baOw
	FuDUs2fIXsj6SLc+/tL/n3zOVb3/G9Zm8MPyioFX46k2+fZtDtnT9NKi2Iz+SnPdTr1o5nUM+HW
	TOWJQk8dAGh7IT7d+BL6cQmm8bdfMEDnJlseigHrdBlE/A+jWUUOEG1cLzpBzxpUtvkUv7+ngQq
	w8+kSsC6g0cRAYDK1tXxjn/RKbnUOvgzTWxn+N6Of7CPfdui0tkB9gWtWtOThuy2mkrMCJv3Evu
	mUQvIjcyaFZPzTUfS3DVMMexeOJcElPoyxabXkSztcVKuehGzt5Fb
X-Received: by 2002:a05:622a:10:b0:4b5:d5fc:8c87 with SMTP id d75a77b69052e-4b77d0427ffmr22256601cf.26.1757671980949;
        Fri, 12 Sep 2025 03:13:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoJukqMxUtcrDD1bS99KAwsD+FA7UYyzb5QtFfnxCg2OfyWX9XReIqdCFCIcthvMKAFFNBuQ==
X-Received: by 2002:a05:622a:10:b0:4b5:d5fc:8c87 with SMTP id d75a77b69052e-4b77d0427ffmr22256011cf.26.1757671980281;
        Fri, 12 Sep 2025 03:13:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a0fd0825sm108277e87.125.2025.09.12.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:59 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 07/13] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <sy4kyh3kd6s4nr75unt5r6gxnyeqq6bfjj4tizwiw2fvbw4ala@i3theqmwiv3d>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xfVdVs2LAQQBAhB-QvcHtYTP-spn0J0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX+ABUONbe9fLb
 zCWqvpXRfED4mZAhuUtgrynztQPkeI9ZZct7iBbHeWFXGJs7Mr89m7qssU/x5v5vfbjw1+tcTDs
 /s3t3R/p4o8TL4FNkZcTY0z+eG5JI0fzMvVKWPYJ1NcbJVk1TRiEkrTNIy0+jL7e9UCP2xcSNii
 szUZYXLvy+tLWSvQeaqnWqtj2Mh/BhTquuMhqvUDfnj3/OH50Zwjd80K1SItl2VGTn4HPUa/Jn5
 sUrbJfiwZmU1mZdEst0d2SixD21M4TPlYI+GmmPTsCRTqYA1GfAEeDQs/4/LJlBfQyADVHsfeZB
 dRpSd7a9yspLmiIMNEH14U8ECw0YfdtniCpwjELsH8oGjU2z9qLKW9iYA01Ly1cv7wmBhgpF5o3
 MYV6AuUe
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3f22e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MUPAedP9neNk1PPBOv8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xfVdVs2LAQQBAhB-QvcHtYTP-spn0J0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

On Thu, Sep 11, 2025 at 10:55:04PM +0800, Xiangxu Yin wrote:
> Introduce DisplayPort PHY configuration routines for QCS615, including
> aux channel setup, lane control, voltage swing tuning, clock config and
> calibration. These callbacks are registered via qmp_phy_cfg to enable DP
> mode on USB/DP switchable Type-C PHYs.
> 
> Add register define for QMP_DP_PHY_V2 series.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h |  21 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 251 ++++++++++++++++++++++++++
>  2 files changed, 272 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8b9572d3cdebb70a0f3811f129a40aa78e184638
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2017, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_DP_PHY_V2_H_
> +#define QCOM_PHY_QMP_DP_PHY_V2_H_
> +
> +// /* Only for QMP V2 PHY - DP PHY registers */
> +#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK		0x048
> +#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
> +#define QSERDES_V2_DP_PHY_AUX_BIST_CFG			0x050
> +
> +#define QSERDES_V2_DP_PHY_VCO_DIV			0x068
> +#define QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL		0x06c
> +#define QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL		0x088
> +
> +#define QSERDES_V2_DP_PHY_SPARE0			0x0ac
> +#define QSERDES_V2_DP_PHY_STATUS			0x0c0
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 663024b8c09124f2991b8e0537a9feb60baaa686..7b2b47320cbb2d16e4f316b0f52fdc1bd09fe656 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -28,6 +28,9 @@
>  #include "phy-qcom-qmp.h"
>  #include "phy-qcom-qmp-pcs-misc-v3.h"
>  
> +#include "phy-qcom-qmp-dp-phy.h"
> +#include "phy-qcom-qmp-dp-phy-v2.h"
> +
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>  
>  /* set of registers with offsets different per-PHY */
> @@ -619,6 +622,11 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>  
> +static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
> +static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp);
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);
> +
>  static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
>  	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
>  
> @@ -666,6 +674,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>  
> +	.dp_aux_init		= qcs615_qmp_dp_aux_init,
> +	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
> +	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
> +	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
> +
>  	.reset_list		= usb3dpphy_reset_l,
>  	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
>  	.vreg_list		= qmp_phy_qcs615_vreg_l,
> @@ -736,6 +749,244 @@ static int qmp_usbc_com_exit(struct phy *phy)
>  	return 0;
>  }
>  
> +static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)

Please rename the functions according to their intention. Are they
common to all USBC PHYs, are they specific to v2 (or v3) PHYs or are
they specific to QCS615? At least this is the approach that has been
used inside combo and eDP PHY drivers.

> +{
> +	writel(DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN,
> +	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN,
> +	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
> +	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
> +	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
> +	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
> +	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
> +	writel(0xbb, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
> +	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
> +	qmp->dp_aux_cfg = 0;
> +
> +	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> +	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> +	       PHY_AUX_REQ_ERR_MASK,
> +	       qmp->dp_dp_phy + QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK);
> +}
> +
> +static int qcs615_qmp_configure_dp_swing(struct qmp_usbc *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	void __iomem *tx = qmp->dp_tx;
> +	void __iomem *tx2 = qmp->dp_tx2;
> +	unsigned int v_level = 0, p_level = 0;
> +	u8 voltage_swing_cfg, pre_emphasis_cfg;
> +	int i;
> +
> +	if (dp_opts->lanes > 4) {
> +		dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < dp_opts->lanes; i++) {
> +		v_level = max(v_level, dp_opts->voltage[i]);
> +		p_level = max(p_level, dp_opts->pre[i]);
> +	}
> +
> +	if (v_level > 4 || p_level > 4) {
> +		dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
> +			v_level, p_level);
> +		return -EINVAL;
> +	}
> +
> +	voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
> +	pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
> +
> +	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +
> +	if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
> +		return -EINVAL;
> +
> +	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);

If QCS615 is a V2 PHY, why are you using V3 registers here?

> +
> +	return 0;
> +}
> +
> +static void qmp_usbc_configure_dp_mode(struct qmp_usbc *qmp)
> +{
> +	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
> +	u32 val;
> +
> +	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN;
> +
> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	if (reverse)
> +		writel(0xc9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> +	else
> +		writel(0xd9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> +}
> +
> +static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	u32 phy_vco_div;
> +	unsigned long pixel_freq;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 1620000000UL / 2;
> +		break;
> +	case 2700:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 2700000000UL / 2;
> +		break;
> +	case 5400:
> +		phy_vco_div = 0x2;
> +		pixel_freq = 5400000000UL / 4;
> +		break;
> +	default:
> +		dev_err(qmp->dev, "link rate:%d not supported\n", dp_opts->link_rate);
> +		return -EINVAL;
> +	}
> +	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_VCO_DIV);
> +
> +	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
> +	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
> +
> +	return 0;
> +}
> +
> +static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp)
> +{
> +	void __iomem *tx = qmp->dp_tx;
> +	void __iomem *tx2 = qmp->dp_tx2;
> +
> +	/* program default setting first */
> +	writel(0x2a, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(0x2a, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);

Same question here.

> +
> +	qcs615_qmp_configure_dp_swing(qmp);
> +}
> +
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
> +{
> +	u32 status;
> +	int ret;
> +
> +	qmp_usbc_configure_dp_mode(qmp);
> +
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	ret = qmp_usbc_configure_dp_clocks(qmp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qmp->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_C_READY_STATUS,
> +			       status,
> +			       ((status & BIT(0)) > 0),
> +			       500,
> +			       10000)) {
> +		dev_err(qmp->dev, "C_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
> +			       status,
> +			       ((status & BIT(0)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "FREQ_DONE not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(0)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(0x3f, qmp->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx + QSERDES_V3_TX_TX_POL_INV);
> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);

And here

> +
> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
> +{
> +	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};

Are these the actual values or is it a C&P from the combo PHY?

> +	u8 val;
> +
> +	qmp->dp_aux_cfg++;
> +	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
> +	val = cfg1_settings[qmp->dp_aux_cfg];
> +
> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +
> +	return 0;
> +}
> +
>  static int qmp_usbc_usb_power_on(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

