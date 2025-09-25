Return-Path: <linux-arm-msm+bounces-74852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC7B9D03B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA6D3822BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCC02D8DDA;
	Thu, 25 Sep 2025 01:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtUpD4aH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2228CF66
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763762; cv=none; b=TmJASc013FI2BkMM1G1nFFW7EV3eVqkRfPXFYsAQ474/l0Hys0WUIbT6KO2UNgppeeSFvAWnF1WTbiR8/5av9tCeDc8iCzWhH1DpIpzIBAFmTa3w/Orr76NeYAD+K1C0g6C6wQ3DgscUn8IT8v/5I1jZ2HYiW728+jRaNy+oj3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763762; c=relaxed/simple;
	bh=sD0sv3TBC0KMw1V9eMLpdNGEKhtdWpJ8BsqL0n7Zz5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgQZGBUEOr5Jo4vQGbmsoBtcnbN4nSR/w6pmM/UbDlTwBW4aJhqeqidl0mH+0j1uzEdU+13mSt9p4c3YXhyJ67wSrBzRSub72REczi0RszgRKvnCrljm8AYsOYgpyPOE1pf8D2GLtWV0omjSH/I2sbzzEBjK12Dhmp4pdYPziTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtUpD4aH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONq6vA021486
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nuNK7T5DMoCfeLehWypj1GbI
	p838IekSq4r6kPWaJsw=; b=HtUpD4aHVrML9VGB5a4rv4i8ZcW+b6IyZ+IJoRZ7
	IGi/4uDN9wJoQ+BSsjF1iFvLWPVPvVZAgRBOpDNrHRphXviBI9eB9XlfBNpyIAnH
	WA5cDwkBTU9JoS5dFHGOmtpTuUOUII1Q4tWHwwp7b/pJBKUPjrKmigO6+LsE10iA
	V3vZfaQvEnl50ZNpECdrkoOVXuMFCaKS3FCM0zbpShCk1jhLZTIkeZajV1n2i1we
	wrU78ckyvcJiVdlxA3ymKSSex4lnTUEyP7MHPhZVygJj6TfJW4FpAkew25+pgo0X
	soqnrZ0/bQJmwxYWZUkarslyU1hjJjFTNuJ6y7KHH5kmmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaduma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:29:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4bf85835856so13941331cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758763759; x=1759368559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuNK7T5DMoCfeLehWypj1GbIp838IekSq4r6kPWaJsw=;
        b=m+lNTr5AwBmCCBfvsJVA0KwRVsTEoCW6RaEGi36xCTObUZcWL3IEmbTlf4Fuy5kUGL
         OItmVON9kdfHrOOKLxFjHyz5AuCneS+1iF4qrM+2ozwYWHVt/+F/5gNzJIH6tabe63oN
         p9iMRQ3biqTTSReTkHpjZyjvpEPH+tVsHdCmk9ybZE1mOS2Bnm8aPJPlWcts0+Aa7ZGO
         9edAcAC2daAzaxXRgUAHlS+w4Az2SJReNLymFFSztXK418Ls8eRIuOC8ZePLUNHNGqQJ
         4ESb1A3CCj0D8hlUjaPGGFzbFi+dN7OhlSwIfkVaQiCwPwLE2JlsSG0CpXg0D8l6WKL7
         rcfA==
X-Forwarded-Encrypted: i=1; AJvYcCXHUJZ/XV/o70MxEnsal18HSQw1S2hSDgdrDsNMC+F9cNRSCYvAb3qRLmvD55t5+YREJKt3MzwWx9EbxAhy@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8yt8dA5ZQ9V3Mx5tn5hLEr39aGrnV0EkDkjt82tA2z9W7860
	sIMeu3yf/YmRcZUSIOwiDVc3wui4/lZL2FW3hWTZfD1qOcc/An3a3SkQpNhwPHa1BbWSQuRbfmn
	pRmVcoNSSLG029HaBHhN9MmRuBKWPiEI+zS+ENeklrIIWCtB22A+9ltDzgU3GrEgjwOoz
X-Gm-Gg: ASbGncuvZHsadAtEdSNiRA6D9G+UCwvV+Mcxw1VlmCIum9pwFsScK9qsBThcFbMRyu9
	2RSzgPXd/BuRK5Nap0rKT6xQTtKmnP3Td0db/ZUcGgY/bpc8gbo4b8DzzwXxe1OX+ad0AP+aWuH
	Lrz17CNjDk0+nfvkxggL6CiMS/Uq27nwSD8/wx4DASnVJxtu6F9/dN1dSFOXgmlwqdqgi2atE8j
	yctZ8e/QnwEUFr1Ofo1EFOMIQnCrjIJ4YGB+pPy4U+z6zeikig6SwM3UjEtCUPOt/x7P3onWY2+
	MLRB01IMuNrhXcSSZV2V6x/HBdW/5IBpIkSbjdNDBzQ2raz37f4+xbpbL6BHR4bqoLqWmhTuyx4
	lTW5Kxi0BB+9EiR4Fzovc1cgcJus2OSFl3uwnVe7EWy5z9ky+MhGZ
X-Received: by 2002:ac8:5e4f:0:b0:4b6:3d70:8810 with SMTP id d75a77b69052e-4dacd244d25mr11227231cf.22.1758763758887;
        Wed, 24 Sep 2025 18:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbXt6dQDxjOzbNg9IrWf3qsSEdLVIcZtX7vGPsgYxRkHkV+RizhrTs9YlBAGqCYeg/uaivtA==
X-Received: by 2002:ac8:5e4f:0:b0:4b6:3d70:8810 with SMTP id d75a77b69052e-4dacd244d25mr11226981cf.22.1758763758390;
        Wed, 24 Sep 2025 18:29:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe8750sm1814621fa.66.2025.09.24.18.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:29:16 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: Re: [PATCH v2 06/10] phy: qualcomm: Update the QMP clamp register
 for V6
Message-ID: <v42k6kmpzcq6aa2c3bgaga3xf47ucg6q4qduwg7w6v6672s2eb@hfpwd73pv6gq>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-7-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-7-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: o7vqP1poX2ve4m8J0xRt_3ooUOnSW7yZ
X-Proofpoint-ORIG-GUID: o7vqP1poX2ve4m8J0xRt_3ooUOnSW7yZ
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d49aef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=IuB_klkJ-YW1I7EZuIgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXw1oyBEUHeMiu
 vWxZM5trAZdR8woE+vCOSJuafl+M1w4e2Qrib7eBNG3dg8GCE4ID1HpDrEJNWmE6PLawfe+heC8
 2n22Ab5y6pP6jkw78kBUizmuki0RMEaMyiCPc5E+j6M7jDO7Res9zRcZQQ3HYT+khiqVGl//O4m
 jsWwMSIlakBr8OAvHwZ8Ln6mj1SrvCmyxh+ke/CojNrcCy9MmNRiUTxvAwUGUq6iN7QvIGmmfPU
 RjVyanVvuVV0OHLfeIFMeqtyVXr79FQh+LuynsK4Pu4pJOqGn7ctdyIvzsLcUvqx8Z67rdqv5/f
 O35u/kjHrBfxPsV0hoM/3I4QlNDAYcL4gPIpfDoUX4ctr+Lz++Zo+MaS+/+Dw6yHdHYcZyE9/75
 atmPJXN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On Wed, Sep 24, 2025 at 05:52:24PM -0700, Wesley Cheng wrote:
> QMP combo phy V6 and above use the clamp register from the PCS always on
> (AON) address space.  Update the driver accordingly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 38 ++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 7b5af30f1d02..1caa1fb6a8c7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -29,7 +29,10 @@
>  #include "phy-qcom-qmp-common.h"
>  
>  #include "phy-qcom-qmp.h"
> +#include "phy-qcom-qmp-pcs-aon-v6.h"
>  #include "phy-qcom-qmp-pcs-misc-v3.h"
> +#include "phy-qcom-qmp-pcs-misc-v4.h"
> +#include "phy-qcom-qmp-pcs-misc-v5.h"
>  #include "phy-qcom-qmp-pcs-usb-v4.h"
>  #include "phy-qcom-qmp-pcs-usb-v5.h"
>  #include "phy-qcom-qmp-pcs-usb-v6.h"
> @@ -78,6 +81,7 @@ enum qphy_reg_layout {
>  	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
>  	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  	QPHY_PCS_POWER_DOWN_CONTROL,
> +	QPHY_PCS_CLAMP_ENABLE,
>  
>  	QPHY_COM_RESETSM_CNTRL,
>  	QPHY_COM_C_READY_STATUS,
> @@ -105,6 +109,8 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
> @@ -130,6 +136,8 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
> @@ -155,6 +163,8 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V5_PCS_MISC_CLAMP_ENABLE,

Not defined

> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V5_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V5_COM_CMN_STATUS,
> @@ -180,6 +190,8 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,

Not defined

> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
> @@ -205,6 +217,8 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,
> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
> @@ -1755,6 +1769,7 @@ struct qmp_combo_offsets {
>  	u16 usb3_serdes;
>  	u16 usb3_pcs_misc;
>  	u16 usb3_pcs;
> +	u16 usb3_pcs_aon;
>  	u16 usb3_pcs_usb;
>  	u16 dp_serdes;
>  	u16 dp_txa;
> @@ -1836,6 +1851,7 @@ struct qmp_combo {
>  	void __iomem *tx2;
>  	void __iomem *rx2;
>  	void __iomem *pcs_misc;
> +	void __iomem *pcs_aon;
>  	void __iomem *pcs_usb;
>  
>  	void __iomem *dp_serdes;
> @@ -1960,6 +1976,7 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
>  	.usb3_serdes	= 0x1000,
>  	.usb3_pcs_misc	= 0x1c00,
>  	.usb3_pcs	= 0x1e00,
> +	.usb3_pcs_aon	= 0x2000,
>  	.usb3_pcs_usb	= 0x2100,
>  	.dp_serdes	= 0x3000,
>  	.dp_txa		= 0x3400,
> @@ -3345,6 +3362,7 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
>  	void __iomem *pcs_misc = qmp->pcs_misc;
> +	void __iomem *pcs_aon = qmp->pcs_aon;
>  	u32 intr_mask;
>  
>  	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
> @@ -3364,9 +3382,14 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
>  	/* Enable required PHY autonomous mode interrupts */
>  	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
>  
> -	/* Enable i/o clamp_n for autonomous mode */
> -	if (pcs_misc)
> -		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
> +	/*
> +	 * Enable i/o clamp_n for autonomous mode
> +	 * V6 and later versions use pcs aon clamp register
> +	 */
> +	if (pcs_aon)
> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
> +	else if (pcs_misc)
> +		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
>  }
>  
>  static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
> @@ -3374,10 +3397,13 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
>  	void __iomem *pcs_misc = qmp->pcs_misc;
> +	void __iomem *pcs_aon = qmp->pcs_aon;
>  
>  	/* Disable i/o clamp_n on resume for normal mode */
> -	if (pcs_misc)
> -		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
> +	if (pcs_aon)
> +		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
> +	else if (pcs_misc)
> +		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
>  
>  	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
>  		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
> @@ -4075,6 +4101,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
>  	qmp->serdes = base + offs->usb3_serdes;
>  	qmp->pcs_misc = base + offs->usb3_pcs_misc;
>  	qmp->pcs = base + offs->usb3_pcs;
> +	if (offs->usb3_pcs_aon)
> +		qmp->pcs_aon = base + offs->usb3_pcs_aon;
>  	qmp->pcs_usb = base + offs->usb3_pcs_usb;
>  
>  	qmp->dp_serdes = base + offs->dp_serdes;
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

