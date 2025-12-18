Return-Path: <linux-arm-msm+bounces-85617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D0ACC9FA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 02:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA36130021C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD3422A4F8;
	Thu, 18 Dec 2025 01:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2NJexC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZhZKBEI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654691F237A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766021193; cv=none; b=EHjwxqRrvO9MxF1Oz/PIEkzb+jaih4IeHaWTWNj4jt7UV4XHir07PNq+W05pxRAUx12Aqa2g8hI3H+T2ni5NHIhLh/8nBWx4HFhjlF62TnFnqm77AfGREcffMOPehfw+DTOEliARawRowSWBs/gMv4rdpTp7Ju2AYmW7u/7imcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766021193; c=relaxed/simple;
	bh=lVsxsdWvZ5REx43OwYQq4EiNfof1psVdbEFOQ5eMDEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p26ZTcU6GW0zCdiNPWITDWk/pm/CyKaaMusUaMSfc7A8aKutMhhtjzwgUP/0gtGAC3Lm3ePbfXW9vdciOEtnkUC0ChAa8Ldwd9YkCThOxPEQxPK18oa1CRdizRZIdzyLRaNR7g1/LgasOyGoMrdb0gB1+oW4G3jSe/7hlNg66Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2NJexC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZhZKBEI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHM05c93988479
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnXa84jTt2Zg4U507u+SENlE
	SdZTxBSMOulLGsCR7Gk=; b=n2NJexC6IPsh5tY4Fi38Bf61cPtRWBGA/3vQM/YB
	vq2Qe+Am7eSJGIAzPWgF+88jc/FEY9oXiWUsfpOKE8r42EL69ZmUJTYX+arV9/xE
	hcToXiwbxQ1plLo8ZLTKSLWgxnXTDOrt/y7GHYYPy89oTW1TjA2EP3mgSqZSpela
	/8ZiS3F/6R5mxfdwNxdk3BBLCyKGQQTDlH7dH0eNBE7aF2tefCD6BjDz+UBaFQ2B
	dpr0K6SyYqimAwRGABz8wPnS/pxruZhz67spZpiwjJJjKGfuaIb7HxdtUiS+7GJF
	r1tJt0X1pvKRI0CLlE0YW4kzAAWZ6YF60NgtQd8MX9Nm+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3ge2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:26:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so2544491cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766021190; x=1766625990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnXa84jTt2Zg4U507u+SENlESdZTxBSMOulLGsCR7Gk=;
        b=ZhZKBEI3r5OVCnSytpOlEFjR//mjFOq8FaLY5Zrtulj+G5QqA2/OZkYQv4xXnDajmp
         VR1ieao3J6Y+SNqGufeTaM/Qxex5soI66jp5TE4YAKAxylNsGdRxRrPPNS3eF9szc9OO
         uQdJMBReOb4QyKo6vgSKE2hRrjBeLGTLNj94SDgYu8+ROsCYrGrGXoUAeFmpwLSGdVZn
         jmHFNxANeN7DmstWO4lUMjj6h0jqZpl6VIDnlnm+ry9tCJ5pVSaFZ4h2TS2wyZR5v52k
         KKcKRiZdvlgavGqiF/3WFJUx5cRr35XD/wdh9shUXl02NBjkky2Um2N+HU6vy/sEwI0C
         7IsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766021190; x=1766625990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnXa84jTt2Zg4U507u+SENlESdZTxBSMOulLGsCR7Gk=;
        b=cmAp7MpqqnFIXXMUIzWdLPc8LbKvJbq/h5gEpgBR99TcLAMQeIk8rMNA1lzDo9/GM5
         ZL/a5pljKApHebvyz+ihrUHC+7dundVh4hU+VKYip3qyHz3md4Na/s5ZehBkdvYeqFvV
         QYMkYh2rQgJ9pRUUM8vYOEKslbaxWLttsY+jAINSOt0LNoAborYKvuJMt5u7mFpV8XCf
         ogVYpPT9l6a27geybHRAxyPcCeEaX78BjrjRHBeSkL33jPcsHP4ldMRGEelWzo3JbZRU
         G0S+zi234QOf0GJXS233zHkLimERfTIb7VzHtLXKgRX+/I/7SFlJC7z7NMuGncztPCwy
         x+WA==
X-Forwarded-Encrypted: i=1; AJvYcCW9O6jzJ/WVjsWuOisR9MSwOJ9wYNmeXGVkvIfLEQ4pUjDxddaecto5GWKz/cXrr7u44Rv1X0sqmBts+Sok@vger.kernel.org
X-Gm-Message-State: AOJu0Yycqp7oARFxpp96lDepH473dN4roy27mdKYETwdMm1XvY33X1Hy
	LiOMsiDGJtY19iIqYuZcg8TlVzVizGentr87OwAamcs/P+iKZE7uySbB+lzsvv51g+ZJKCD63Yl
	IN+2Am8cA0Da5Hm4/ZM9Af2T4iteilNCsiqrDW9P8HnKnWjsJevxUFPvb66bn/rwf3X2t
X-Gm-Gg: AY/fxX46IsfJUn2qAGsuRRxpHz1AppoZtf2OEobwZaPPTVx8B1aYqU9SSqYc122nDOw
	OSxVEErOne2gJBD8gY1nbRzGwIcuTAX7pGi3VMbiSMa/4NmXWq21kNqzQqv0ak8abQJkp/iW4M7
	9/xyc+rizQ/3mdrd/Xe0uGcZXkS95evQ6xl0HX5GqOEDT89+ZoX4tKUys5YRo7h9a+SWX6VJ0ct
	PjeucTC3Ho51kZiIwxBbZOV7K+qmiMjiA5qNzxhTsYJ+2T2v18bpwUQYLlfZCV35ac6A9ZJyWwA
	mvnurukc7Ry08G6QaF1DDzBKeTY49nm3T9VcGJfHAsHILcWQ2g8YVinp32WsrJ7B5gty3fy5PB7
	zFr0DT+7SvIJlZAqXk3UJvIyZFhdGJ25RMLPpy6bpGoOKlGJXqjJImgag+QgN6sMK25EaTuyjbN
	8U3+hGr0728VZjZwqq6volq7Y=
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f35f4839ccmr20746821cf.41.1766021190506;
        Wed, 17 Dec 2025 17:26:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCW3H21K5I0JCBEg3yBCe/TeLTCfyD5Am91GbeWs8gM8XH+pix9Q9Xl9OBdooY8DJasWeZGw==
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f35f4839ccmr20746581cf.41.1766021190044;
        Wed, 17 Dec 2025 17:26:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132d3d41sm416477e87.30.2025.12.17.17.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:26:29 -0800 (PST)
Date: Thu, 18 Dec 2025 03:26:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Message-ID: <ulsst7k4meqq5psv577pqapnsrehvvpk3oijp5usxtxdwoxunb@6mxjmpigkwk7>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
 <20251124-kaanapali-pcie-phy-v4-5-d04ee9cca83b@oss.qualcomm.com>
 <mudq7gmqs62osuarvflmemt2a2gnuloywabtr4w5oyyddp4b7v@eynaurtfrnyt>
 <aUDywpWf+gpEH4Uw@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUDywpWf+gpEH4Uw@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwOSBTYWx0ZWRfXxOCw0TiwoBxf
 Hgog9YdDQJOG4mC5ZXYshcmKNpuQgDvk7tRovav3rMXRAWcUDB+2YoVKKTGGZwJBZYg67JRvRt8
 /MKGu5g8Istxyn4UlJ3w+vwW4bgBHfFI2RV1ZtUwbNxN3MV6ffZQ7wgyijbPlt7eB5930CJoc7Q
 vqZ+AEaDCGRLUulpBcKtGxWE8VnGtUlo/57omuHqmRYiSzjKPXFXQ8OEuwWFap0povHunseUVWE
 SoMLuKL0Y+DQ7Y5dAwiT1izWYJ03bct6DfWdpoHepGi6HAw5vyj/bgKhVWYzesxX3S2b6t6Z2Sx
 nh9/ZW9KVqwIc5Xy1DaE32YvwUU+5umwDPdTbANVkRVVv+hWkzehRgyrFwU1SV2TpOoINJr5Xtw
 g8PTatQQ0Uwgay6CaBbQcYZ3h2wFtw==
X-Proofpoint-GUID: BjRVr2LyNeL-xNqjuKa7XotHso9ovH4k
X-Proofpoint-ORIG-GUID: BjRVr2LyNeL-xNqjuKa7XotHso9ovH4k
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=69435847 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kO2wSEi4wa1dqs6BIsEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180009

On Mon, Dec 15, 2025 at 09:48:50PM -0800, Qiang Yu wrote:
> On Wed, Dec 10, 2025 at 03:51:15AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Nov 24, 2025 at 02:24:38AM -0800, Qiang Yu wrote:
> > > Add QMP PCIe PHY support for the Kaanapali platform.
> > > 
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
> > >  1 file changed, 194 insertions(+)
> > > 
> > > @@ -3363,6 +3516,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
> > >  	.ln_shrd	= 0x8000,
> > >  };
> > >  
> > > +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_0 = {
> > 
> > Is it really 8.0 or 8.20?
> 
> I double confirmed the version, it is really 8.0.

This is really strange. The SERDES offset not equal to 0, te
PHYSTATUS_4_20 bit instead of PHYSTATUS -- all of that has always been a
characteristic of N.20 PHYs.

> 
> - Qiang Yu
> > 
> > > +	.serdes		= 0x1000,
> > > +	.pcs		= 0x1400,
> > > +	.pcs_misc	= 0x1800,
> > > +	.tx		= 0x0000,
> > > +	.rx		= 0x0200,
> > > +	.tx2		= 0x0800,
> > > +	.rx2		= 0x0a00,
> > > +};
> > > +
> > >  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
> > >  	.serdes     = 0x8000,
> > >  	.pcs        = 0x9000,
> > > @@ -4425,6 +4588,34 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
> > >  	.phy_status             = PHYSTATUS_4_20,
> > >  };
> > >  
> > > +static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
> > > +	.lanes = 2,
> > > +
> > > +	.offsets		= &qmp_pcie_offsets_v8_0,
> > > +
> > > +	.tbls = {
> > > +		.serdes			= kaanapali_qmp_gen3x2_pcie_serdes_tbl,
> > > +		.serdes_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_serdes_tbl),
> > > +		.tx			= kaanapali_qmp_gen3x2_pcie_tx_tbl,
> > > +		.tx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_tx_tbl),
> > > +		.rx			= kaanapali_qmp_gen3x2_pcie_rx_tbl,
> > > +		.rx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_rx_tbl),
> > > +		.pcs			= kaanapali_qmp_gen3x2_pcie_pcs_tbl,
> > > +		.pcs_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_tbl),
> > > +		.pcs_misc		= kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl,
> > > +		.pcs_misc_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl),
> > > +	},
> > > +
> > > +	.reset_list		= sdm845_pciephy_reset_l,
> > > +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> > > +	.vreg_list		= qmp_phy_vreg_l,
> > > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > > +	.regs			= pciephy_v8_regs_layout,
> > > +
> > > +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> > > +	.phy_status		= PHYSTATUS_4_20,
> > > +};
> > > +
> > >  static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
> > >  	.lanes = 4,
> > >  
> > > @@ -5209,6 +5400,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> > >  	}, {
> > >  		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
> > >  		.data = &ipq9574_gen3x2_pciephy_cfg,
> > > +	}, {
> > > +		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
> > > +		.data = &qmp_v8_gen3x2_pciephy_cfg,
> > >  	}, {
> > >  		.compatible = "qcom,msm8998-qmp-pcie-phy",
> > >  		.data = &msm8998_pciephy_cfg,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

