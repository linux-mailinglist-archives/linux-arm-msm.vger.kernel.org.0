Return-Path: <linux-arm-msm+bounces-72738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D23B4ABA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 921BD3B03C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7731D3164CE;
	Tue,  9 Sep 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbPRU7G8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153231D72A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416796; cv=none; b=Sy3Ak0OoRvDk620wg7xSUgkwYYRsEbEwo7uUEDBA3hQLXu44Z5BcZOJRwtUdisS+3JuSWkBHhL2XX0Ac14OX9c2tn2Mm7f3w45Jvm86du3BLVHs0Ik9GKl/Iw4vhAf+TMK6i1t+f6AId6YiQyHnBJvvGTe0ppEx+/KSo/EM06Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416796; c=relaxed/simple;
	bh=4M1YgHT3LV6yyXXTA5Eblvj1pupiIOclR+QrmGk+Z64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gATQHvY/wLSV50YgdOzGnSkVPtUQ1gJqTPBrjbsZ42XGU3/cb20nfl03jwbU5P+KL9bq7U2WplZYbMOo9vKgkbvbocRtCyHoAQg2DcnDn8jN1A+nGeLFgp4KaZZa2AXmPVeqpzq60VR5Yf2NX6q/6MjVtM8tCNK2GxhaAmpC8Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbPRU7G8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQQY009065
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 11:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q14H0KT1COSDYSRp0kk+HYET
	w3KiV71BJr5ELJZUOaU=; b=YbPRU7G8kgcfMyBcs0cpK74fK0Wq27pJqrjPwAFL
	jHn8H3TOyLZPmrsuPh+3o+j6OQcNODjqRxN6lqnXslf3vMLS0gRmxJMDQ0A/B0M0
	5D8Qx/tfKtQVCL40gEz2RxqKcxpIQITm45dw0WePWTwMWUoaMuTMLFFKJ9RT6fj2
	uHFAcrxteguq7WRx40QQgskdEK4rHplvrEWUDuXbeokAa8saflNdZJdr0xCAadav
	79Eng+5gPuqcGBfNAd8LOcNK4W8QkGlYKws9B5lB3TPwBSlAnC0XDIKVejEHdGxR
	QfQZMSbnk2Rd9ePNWJt3wve73zn7fKLCIaswm2NjV+xy8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdvtdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 11:19:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7224cb09e84so119968076d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 04:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416792; x=1758021592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q14H0KT1COSDYSRp0kk+HYETw3KiV71BJr5ELJZUOaU=;
        b=JgAyKNICwrqiBfmIfytzUWo2rQ+0iIuFdXvDAEe9MaydKPQSWv6JND+YEVSE+lRpC3
         hBg3q++7KI1TX/aBzwG6GMMjTmsn7A43i/ODebx7qGY4D1yRMc/puP4RBYx+1ATy4GaO
         HQa3oZsCIn7MFXg3d/TzH6Q2Ca0GUD9fd7oKCyzUZOb/cXKvRNku5Q+JtFBrg3TlbgxR
         N+gpsXG1mUnFW9bReqWfg/qGeHxc6okGeCTEA/YdYJDwgJIYpcJb8/BYnYOaNwdq9jyF
         pJVIAp5QK8zAf30+O3JkS6VTzvVFI97Si5Ix3GtBMseZhWQxnmnzrQ4pELg+HE35gofE
         ZPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrjoq1sRp7jNNiZNc874rmt7NyFdxa8Vr8lgeg1IpRwGYZc1yXhLra/Ay1TnsJtbf+i6Whqp9j++WeXdr1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LjcDSGnxNU1yNnbVL6OxVqYF068qRkCDX8rUv+tKhseVs2Zr
	wggtQmpcy2N7vXMDJz2nbCUsaKkzEi5rl+PXsoB0qr+tzrXWwA/7VV64ExUWHLE1EB84r8kRnFP
	SyiPLh4jhm6Obw+cG0lttx/iQPcPFB4wplnMP6ri2ZyCwICsCUuCbnFsW2l6I/5lLFLlv
X-Gm-Gg: ASbGncsj04d3I/IQFM8xL7X2jV3aEF5RLTCZoVojH9Fww2u2UWflbW6Io/1ggWX/U4+
	vqZJAx7+haFFiivrHoLwah63ZAPs1muon9Nr/p4ne6U5yDllGk9+uaO684e16cc1TdexPFjgkug
	3iiq7iqlJJ5tv0K8Z4/Z6Z68LYCJp4U/L8uspfV5qE4hzr8JQEaTRai5kkJBhc+2H98/qx4XRHv
	kYu4mveyl3uxh79P6Mb/RM9YwMNn56/HPtBTifv44tFIQvBxLI7w3HHM+zYrVlbWG8+V9J1GxFr
	7chqvTq6aHgCz3YZis9dn1LGhMJ6OJ/nprRGVOKPJ1NU8I1L/aa1EWO2K3FiHAL5CBONSxnJq2Q
	kUwcD6fCR1PipRxJDKoPTFPeeuaKynPK/21LIetTN5NdeESJDbuw8
X-Received: by 2002:a05:6214:224b:b0:715:538a:2fee with SMTP id 6a1803df08f44-72bc3373bb1mr136679866d6.20.1757416792237;
        Tue, 09 Sep 2025 04:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz8PDFRuBVWB09FnFcdYcVbjIUOegYWwGsl9hFOnuToizyvXk+fLn95vq1GBCcAt1nIqfWag==
X-Received: by 2002:a05:6214:224b:b0:715:538a:2fee with SMTP id 6a1803df08f44-72bc3373bb1mr136679576d6.20.1757416791580;
        Tue, 09 Sep 2025 04:19:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce9f3csm458968e87.52.2025.09.09.04.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:19:50 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:19:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom-qmp: qserdes-com: Add v8 DP-specific
 qserdes register offsets
Message-ID: <3xw54kzk36u7zrfhgva4p577nzle3ctzi3lyhcxapczv2bhceo@23zcaylkqoff>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-2-02553381e47d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-phy-qcom-edp-add-glymur-support-v2-2-02553381e47d@linaro.org>
X-Proofpoint-GUID: TEFe2D2-mXNOvwmiVvgnbVLn-km8D6yD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXwF9Wv22pex66
 z+e3BX8bUCy3tnkXgM9SKnw+QWEbbEC0wp5EMp4ZaFd7JfqaBKvN20OKD1ZKVWJjkf+EqmsWEtu
 LTOyW8WqDlW4ciqZzXejQNjqYFCTjA2b+71BnzTr96BYUHR67eZp7Io2ghWg6uhH0+Deng6NS6i
 yHmt1lkrSG5k2RGg505HxNs1+LzL3TVV7neC9MXLyDDWg9cycBMx8WWp7JVBuANEEK5WRjEqJU7
 lk1lX9OhQlXZY+eHb+0G2WjxJajuV2HL1Pq/naEiHoCyYoRZo13oUc8IprjebWUttZWRPe3RWwe
 ktOMbmmSyTK3DtOXI+0aQgiVQvu/d4RhzHlTRjm4Mt6bXCLtnSXxHtkEcBpgnWA/QP80D8BswC0
 EovDmTDT
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c00d59 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=Et_T-Xu_rDMQo3vlGccA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TEFe2D2-mXNOvwmiVvgnbVLn-km8D6yD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On Tue, Sep 09, 2025 at 01:07:27PM +0300, Abel Vesa wrote:
> Starting with Glymur, the PCIe and DP PHYs qserdes register offsets differ
> for the same version number. So in order to be able to differentiate
> between them, add these ones with DP prefix.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2bef1eecdc56a75e954ebdbcd168ab7306be1302
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +
> +#ifndef QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
> +#define QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
> +
> +/* Only for DP QMP V8 PHY - QSERDES COM registers */
> +#define DP_QSERDES_V8_COM_HSCLK_SEL_1			0x03c
> +#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
> +#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
> +#define DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0		0x060
> +#define DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0		0x064
> +#define DP_QSERDES_V8_COM_CP_CTRL_MODE0			0x070
> +#define DP_QSERDES_V8_COM_PLL_RCTRL_MODE0		0x074
> +#define DP_QSERDES_V8_COM_PLL_CCTRL_MODE0		0x078
> +#define DP_QSERDES_V8_COM_CORECLK_DIV_MODE0		0x07c
> +#define DP_QSERDES_V8_COM_LOCK_CMP1_MODE0		0x080
> +#define DP_QSERDES_V8_COM_LOCK_CMP2_MODE0		0x084
> +#define DP_QSERDES_V8_COM_DEC_START_MODE0		0x088
> +#define DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
> +#define DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
> +#define DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
> +#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
> +#define DP_QSERDES_V8_COM_VCO_TUNE1_MODE0		0x0a8
> +#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
> +#define DP_QSERDES_V8_COM_VCO_TUNE2_MODE0		0x0ac
> +#define DP_QSERDES_V8_COM_BG_TIMER			0x0bc
> +#define DP_QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
> +#define DP_QSERDES_V8_COM_SSC_ADJ_PER1			0x0c4
> +#define DP_QSERDES_V8_COM_SSC_PER1			0x0cc
> +#define DP_QSERDES_V8_COM_SSC_PER2			0x0d0
> +#define DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
> +#define DP_QSERDES_V8_COM_CLK_ENABLE1			0x0e0
> +#define DP_QSERDES_V8_COM_SYS_CLK_CTRL			0x0e4
> +#define DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
> +#define DP_QSERDES_V8_COM_PLL_IVCO			0x0f4
> +#define DP_QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
> +#define DP_QSERDES_V8_COM_RESETSM_CNTRL			0x118
> +#define DP_QSERDES_V8_COM_LOCK_CMP_EN			0x120
> +#define DP_QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
> +#define DP_QSERDES_V8_COM_VCO_TUNE_MAP			0x140
> +#define DP_QSERDES_V8_COM_CLK_SELECT			0x164
> +#define DP_QSERDES_V8_COM_CORE_CLK_EN			0x170
> +#define DP_QSERDES_V8_COM_CMN_CONFIG_1			0x174

The registers are the same at least up to this point. Would it make
sense to keep common part in the same header and define only those bits
that actually differ between DP and PCIe parts? (Is it really about PCIe
or is it eDP vs everything else?)

> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL		0x180
> +#define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
> +#define DP_QSERDES_V8_COM_CMN_STATUS			0x314
> +#define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
> +
> +#endif
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

