Return-Path: <linux-arm-msm+bounces-85297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 641E0CC107E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 06:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C043028D9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 05:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCF5335547;
	Tue, 16 Dec 2025 05:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BY6I75pm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ih1wh7Mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C70B2D0600
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864151; cv=none; b=Ky+POBVFTy1SG0ZrySs30gSfUTBfQHlNqmbBsmFupc4b+hTp5mnUmCncVe87Aq4j9IK8pdL4Y2zTYQVOml6eFAK70uFYcgbxnkzqaPS3w817yRUD7+Wm7UTRlip/jZlSheWpvFZ8qL3N0EPa7KddRSSPGI8QoCyIAieNfl1BlLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864151; c=relaxed/simple;
	bh=XwB3dSxbms0k4/8+l6RwZujvC/RDiD+dpwA00bkg+Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUhrnVDWHolhzGvY+cWGy2oSFcRrj/ZbFYneUcKYS1FXlg+EGDGEEsy8Uz0RmTv28sUUlwp7TN1qacvpW0H3fjvq6PGHq3p3eWd1MGBVq9ZNDAIl10cX0G7KslMX4RoWav6opPWGI0BGjsYwKn2/VmVLlunqLtOOO5YkvxC0da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BY6I75pm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ih1wh7Mu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5kKa94174137
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VWOU4era1E560oliF48CHv2g
	GuOkdWC28bCjZYxjsko=; b=BY6I75pmxUwzVTxfz+3t9At6hGkfasnOMIm8b7Cw
	IJ1C8cqVUcx1J/zSeSxKABX2WsGkuXLhskHbex6DeEXAPzpd93GyRkh3eXIaIRLe
	bqyQ58w1hKxZjao8kDVORS0UtICPES+DWzz8/BkVqgOabNXWl66b1HPzELqXMlYa
	DOWtg31ufhZiGabevvHZfVnn2EoFGXmb07YUOiOAP+ymPnK33lJAZAQO+eHOYnSh
	fXhBXQvavkPNEpw4xTFyhw9T5mP9Zh5fVKzzZYkZqcsFX7tTplQJU/sX3fGhYXDQ
	+sTexuJoYWsoLWgW2u3I7/qhBXF5ItEiJt5qqWw1ygyu8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks02vdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:48:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso40082285ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 21:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765864133; x=1766468933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWOU4era1E560oliF48CHv2gGuOkdWC28bCjZYxjsko=;
        b=ih1wh7MuWL0FVOf6EQTRO5hYiSBzZsPISPBH1oWnySAZMYXgxoIK2bZ7FMBAPmwXGi
         5SS3C0/a6EiUdAae0b4On5ytq9N2+gFyqs8oADsLQbB74publ9zCxmEV2uRz0JFz1iu6
         wdfdVa0XS4Biwi8N14cnR0W+xJanwNIidczI4P38MzuQA6g2Q0OGZDiui3kbX9GRyhic
         nPsKiGIStqYfVRdm6H8aEcs7WDjvcdoztAY+2OeKOZDiaPeawbJGj4TH+xU3+Hz14Sp9
         ba8Y2HRiop9FupjplaNTx0bUDnHaT4w4bEz/hrp+lW0TfBcmPH4fWhaomm3Pu6Il/ykU
         FdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765864133; x=1766468933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWOU4era1E560oliF48CHv2gGuOkdWC28bCjZYxjsko=;
        b=GgO3stCtXmYJwTbc7FOaELEnxUm2ZS0mrBq5Qrqcx5grWbhHvnNSBtSdFRO9thPB/2
         0WemvCEt8ujUHUlmBWVcvlSTYae7XDRnSt3NNrvTVQZo1M75XXd4iQCoAKVuFmnK2XP0
         d4D2edzELvnhN8VwaTHNatSOIoeYntLXsR0IbhTt74pCPrtX2t75DFvgq44ELTldV4c+
         o+S+0QNTGJ2KwgMPyF1iKfDM1ZbswQfgm0pr4IkA6nlHdn1i/cd8zykwVprV/5Q2MVjh
         emmEJpDjeCVbDZkrZWyX0s1g/JW0I2JibSVw+1JXtBzklc27XLGX8LACz4xD/0qMASIn
         zGww==
X-Forwarded-Encrypted: i=1; AJvYcCVp7EbZSbKBa0rrfSBm2MWuLjE+hWFVhGFAcmT/WQEH0NonC6s7gZwlaBrvyF4EQnUJWfOhi3Xf/Mgl5L12@vger.kernel.org
X-Gm-Message-State: AOJu0Yyadgdq227fR4I5TqWGnKgbZe0CukIwlQUz36lDdcQCFwGjToFk
	uV3BIHCAL8I0p7CQtosMXj1xgpvHQIitsafhiPmOm9ebd4les5EoDQgPZLIVsKGfjJT1v+4aVKh
	AbSf9OXC6iTpWlF8aLn+f9ysDdEcqcOXYmdUcMJMsXpYHbRYRN5ONGROQ4Xq8cA5Je3/E
X-Gm-Gg: AY/fxX75aS7dNisepWCXmFyCEd2KMm0S+idbuBcAljwvgDIc8rLGo5PeOUiwDkdm/gc
	dMv+DWmtyxoXO/ZYaIleincfpeSHgMtjpPjJ4lCgdX4Twybfh5/yMzsR0jLuL6uBfXRgAP+VYsX
	/fAI9wzVfPDTyP0lKDNyeF4qSkze2A10ifBjknliikNHivoV8KH0Fk6/y7KY36mMJp6aP5YYRYE
	3PDYE4HS+16kpfM10/uLsZpftNuu9Q44NYQZt/XTq7JebTJHypmBDpQyZN80ejqG3ABf4cuMJfO
	7MOcgcgozMJGsyLTzun53/2brGTs49IqQUQHjWQPbqIU4B6YoZ/Y/MsIvzLGBEulSvjDJqenJse
	FrsIDH4jxZ/JQzB7P/9Q21DJ8xUfdbKbpaP5PjzOaLZFZgnLaP/YtdB+z
X-Received: by 2002:a05:7023:883:b0:11a:4ffb:9825 with SMTP id a92af1059eb24-11f349a4c01mr10034790c88.6.1765864132984;
        Mon, 15 Dec 2025 21:48:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE62Tqqg7zqnX6ifA17EA/dYL7e+sDgj98dRJ4k0xMQnYUccpdxvWUiYdR4elYfDqrDXwuwKA==
X-Received: by 2002:a05:7023:883:b0:11a:4ffb:9825 with SMTP id a92af1059eb24-11f349a4c01mr10034762c88.6.1765864132426;
        Mon, 15 Dec 2025 21:48:52 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm33410371c88.7.2025.12.15.21.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 21:48:52 -0800 (PST)
Date: Mon, 15 Dec 2025 21:48:50 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aUDywpWf+gpEH4Uw@hu-qianyu-lv.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
 <20251124-kaanapali-pcie-phy-v4-5-d04ee9cca83b@oss.qualcomm.com>
 <mudq7gmqs62osuarvflmemt2a2gnuloywabtr4w5oyyddp4b7v@eynaurtfrnyt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mudq7gmqs62osuarvflmemt2a2gnuloywabtr4w5oyyddp4b7v@eynaurtfrnyt>
X-Proofpoint-ORIG-GUID: Qotfx-CgoFiCKuD2rajG-fWNxhUdS71J
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=6940f2c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0vdsDn7c9FGMMjA8I6oA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Qotfx-CgoFiCKuD2rajG-fWNxhUdS71J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA0NSBTYWx0ZWRfX64FcLWR2Bjaq
 g++n/bnUqs9BkYIbgWxBemZLiwrzPfQ3IoKTVaqK9HzkxGSgJdmLC1+OzTahF6F8bsBrR8XEytL
 8l4JNXEVuheuvvgaKlHhulIGpweenITDsXgP876+4wYEiPruXqT44nXru/amuY3uBvSt5XhlWrA
 47HKWmjb3pGGV6f8Lz+WNpFnwAHul4nwILMH6gVNK6jiZPTeGc4mc0IJTQD3vVeEqU2C/lkWlt5
 ZN4K3VkyUzsR30Llj/GCfdWJAUBfVCOn6nMSqovWUrzHqnkoHuSoIBIorp6iaJntd8/Ur0n8mwo
 K/HsIe0+Wy9bcYz7XoQO+zOFWM5PCdqHQp4drpCOM9bGsNWc3UzGS99ovJXFiIZWOFPQiOvfh4I
 7w9WoXa0wJZEKmZAUF9lKatDWtBa3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160045

On Wed, Dec 10, 2025 at 03:51:15AM +0200, Dmitry Baryshkov wrote:
> On Mon, Nov 24, 2025 at 02:24:38AM -0800, Qiang Yu wrote:
> > Add QMP PCIe PHY support for the Kaanapali platform.
> > 
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
> >  1 file changed, 194 insertions(+)
> > 
> > @@ -3363,6 +3516,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
> >  	.ln_shrd	= 0x8000,
> >  };
> >  
> > +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_0 = {
> 
> Is it really 8.0 or 8.20?

I double confirmed the version, it is really 8.0.

- Qiang Yu
> 
> > +	.serdes		= 0x1000,
> > +	.pcs		= 0x1400,
> > +	.pcs_misc	= 0x1800,
> > +	.tx		= 0x0000,
> > +	.rx		= 0x0200,
> > +	.tx2		= 0x0800,
> > +	.rx2		= 0x0a00,
> > +};
> > +
> >  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
> >  	.serdes     = 0x8000,
> >  	.pcs        = 0x9000,
> > @@ -4425,6 +4588,34 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
> >  	.phy_status             = PHYSTATUS_4_20,
> >  };
> >  
> > +static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
> > +	.lanes = 2,
> > +
> > +	.offsets		= &qmp_pcie_offsets_v8_0,
> > +
> > +	.tbls = {
> > +		.serdes			= kaanapali_qmp_gen3x2_pcie_serdes_tbl,
> > +		.serdes_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_serdes_tbl),
> > +		.tx			= kaanapali_qmp_gen3x2_pcie_tx_tbl,
> > +		.tx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_tx_tbl),
> > +		.rx			= kaanapali_qmp_gen3x2_pcie_rx_tbl,
> > +		.rx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_rx_tbl),
> > +		.pcs			= kaanapali_qmp_gen3x2_pcie_pcs_tbl,
> > +		.pcs_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_tbl),
> > +		.pcs_misc		= kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl,
> > +		.pcs_misc_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl),
> > +	},
> > +
> > +	.reset_list		= sdm845_pciephy_reset_l,
> > +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> > +	.vreg_list		= qmp_phy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +	.regs			= pciephy_v8_regs_layout,
> > +
> > +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> > +	.phy_status		= PHYSTATUS_4_20,
> > +};
> > +
> >  static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
> >  	.lanes = 4,
> >  
> > @@ -5209,6 +5400,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> >  	}, {
> >  		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
> >  		.data = &ipq9574_gen3x2_pciephy_cfg,
> > +	}, {
> > +		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
> > +		.data = &qmp_v8_gen3x2_pciephy_cfg,
> >  	}, {
> >  		.compatible = "qcom,msm8998-qmp-pcie-phy",
> >  		.data = &msm8998_pciephy_cfg,
> > 
> > -- 
> > 2.34.1
> > 
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Dmitry

