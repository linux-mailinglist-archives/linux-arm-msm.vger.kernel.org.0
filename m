Return-Path: <linux-arm-msm+bounces-85672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E7CCB6AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67FD4305C1CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1331A3321D1;
	Thu, 18 Dec 2025 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T89R5jNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzXrscO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472D2E8DEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054045; cv=none; b=A5Lw8alqG+E0tYLofjZXczs798gDKFdrgDav2AMTNAbgQT487m4pyzBgPBrnkcS1RhQziUE4Gt+4ZQ2Q0ucSYRy8/4HsQ0cyimPv7s2nep7K5ASSPPZ4HVcdY/SlHNk8qfubOHS38y3u3RHhUdSnPsegVW3xmxW8E6yst/tjKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054045; c=relaxed/simple;
	bh=NG52QDiKOY7Smsj4HhBcZZqJhOf/QkOSZJtBhjXNm34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pavmarjtSV0pxIVML6odz2oyCVT0B+3ydAiNfkbwdPmXsJ8phUaLvaOgKGJvRgJRznxcuMJaOwFDsuvmwaADUSqBr1mSLFW28PQeX/TfhvyJaPaOxuH8lwhRwuS7Tlmj9XHdnr4lS3FQ+PRWqn1WoMITCqgFjLavE2nlOsVrFII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T89R5jNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzXrscO/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI946QI237698
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9bDaeSuiKHsc9nRSd3ulKaYx
	8HYrMwIBi3v41S+sGr0=; b=T89R5jNMQdt5mvmSFiLZjWqc6no5j0zxbFfSN89t
	gf5kZYcg7xPGmHnI041kKccEJQQGhDvmYSWtrUmWFWwR8jEf01gRgvedFkKfJ0r8
	O91U3ovj7AKm7/35kb9/a3M6d8SMed7aIVJPNTcFejYwOjSrIJyi0CHQwN716OIG
	0JlbdpAQVsMYsYF7QlwusiJcMFZUC6tnH+fYnSoxBu7I/G98RVSPGvvpd8bfy7Zm
	x/ctCvAIW8p4be8+I7z8CPlUgPpFqQAaSJx7ljDQK/mqW1BuleU9thg5YTbfwn7P
	SfMYg/QRgqq+drjQ9mbqeFZOeDaNkZPXrwUso+ZgJT9FoQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3j1xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 10:33:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so725702a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 02:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766054039; x=1766658839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bDaeSuiKHsc9nRSd3ulKaYx8HYrMwIBi3v41S+sGr0=;
        b=MzXrscO/LIpfCsGFa4diJo7ZOPx/XK/Vr+Av2ng98zw0whTqXSFekRCTrqQEhgRtPb
         KIVSXl0gfanaDLX6yhFE7hNuQlN2VcvteobDEGjx2tiqLlT13W4mHxCR9wHNl7e6xTbc
         cK9NKO2gMXBzy/iUGpu25ZVmlHZ2dff/IgUHYmVGKzpGhbmK+YfM6IQAL//lwQadQfzo
         bixkM1dpjGgQ0AFabveqo8dloz+WlO8lwlFtIVXiqVFC075CM6fIaL0tx+Znq1G9peEH
         mEv1Gv8m8Dg9egqXd1uEsdLa40wEy9X1CqTLpI1maYoK9XZiQQZFUKs0Ff6lEewrjSSg
         eD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054039; x=1766658839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bDaeSuiKHsc9nRSd3ulKaYx8HYrMwIBi3v41S+sGr0=;
        b=gc+50Iumd1kZhxSwl1+daq/+RMKs9r5jiijWUh+lOmivVSXWmPIzK9U+usjdATgz0/
         8P+zTF+IEG/nroZJtYH6wqBdbMrWPxXnqjtza8wsdDCfvGpTSqXCw1pj4uQkfl36fJm9
         gimJZuJ4FlRzTjUbqVl2PlN11krmN3Cezb7Mm6YHUbNCX+uP5gN1GP5fNYqtEPzrqnRE
         nbLEp/s//8XaSDCJrM5A8WUfo40w/3A4oiYzbFBpJ7Qf0JZyKpc2+K4yWZAgkIzX3Fya
         NUDJbpUuCzTorXjfFKAmr6BgN7qxzyjT8eKgCbL1gxfV+tWDPTs0leV5I8RS6FI1sVVn
         CKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWobI4pnrodp66W96dgW7xdj+t48vE1vYzDq4tWMyxf2l3z0kKdH9b5Bx0Q/eUwHlU1unIozj6h4UxN8lbk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wm+gxC32gIu0jZLXoDS630LaA4WEBgAMdLemfRvL/rK04ruu
	6w4Wtg9Q++AhCua8aPKblF5EWFQ+mWGAFceXB/7mqmKqDOnv0ll97iHLtSXfHi9dNQrmfKIaRtx
	mbOxHrvaF2Ug88K/58nQtqyt5xIuGbTaGSrD9m9vZ84N2hVcnzcnIJgZZqYoRLHuNSC8f
X-Gm-Gg: AY/fxX64tnPNRkvm8YH2XgU15qEZI/sHdxs6pnhjfUJm3X0yqyjQjjE75s35ba1qh+j
	Pi4rxCjDG7U/Evtv0r88jf7ZaEg1jpCosSNGUaMjAyv6U4zJVC/XHeU7QYxqRWtNvoiPVqeSLrL
	SkxPoIE7v3bGLUchooZcVFYxwNeoQQgmkNSZTorfltLUFQOwi096fTq3JnnlhjGJzkYBILOSeJS
	ToqGpuY95Gd9qa2rffxY+rHF7DVbPfnjRRzALhOoNrRKEb1psX+LsoEsQ2qFiivCYtUCXF/oaeu
	iEPwCZ69iAkUnG7zRnynks11iDtp3xKR15sSO5/aqk982jEAFsamq55RsLU7/5smYSPAGQDgSF/
	hAmKAtwddcXSUeac0ZJw1X5U36SEXzvIqH/uMXbIDqxYlgY4fnWaG0scC
X-Received: by 2002:a05:7023:d09:b0:11a:4016:4491 with SMTP id a92af1059eb24-11f34bfaf47mr17938630c88.24.1766054038470;
        Thu, 18 Dec 2025 02:33:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtsmC+8Y6kIRD08PExMuJsGHMbCc85avH3aagTws/HgVBWOYEiS919t5nlwwIBWvwodtelSQ==
X-Received: by 2002:a05:7023:d09:b0:11a:4016:4491 with SMTP id a92af1059eb24-11f34bfaf47mr17938593c88.24.1766054037883;
        Thu, 18 Dec 2025 02:33:57 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f473acsm6200226c88.3.2025.12.18.02.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:33:57 -0800 (PST)
Date: Thu, 18 Dec 2025 02:33:55 -0800
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
Message-ID: <aUPYk6VuFUFrtUDI@hu-qianyu-lv.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
 <20251124-kaanapali-pcie-phy-v4-5-d04ee9cca83b@oss.qualcomm.com>
 <mudq7gmqs62osuarvflmemt2a2gnuloywabtr4w5oyyddp4b7v@eynaurtfrnyt>
 <aUDywpWf+gpEH4Uw@hu-qianyu-lv.qualcomm.com>
 <ulsst7k4meqq5psv577pqapnsrehvvpk3oijp5usxtxdwoxunb@6mxjmpigkwk7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ulsst7k4meqq5psv577pqapnsrehvvpk3oijp5usxtxdwoxunb@6mxjmpigkwk7>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4NiBTYWx0ZWRfX3AzrNRYuBQ9s
 6rpzf54wH39JjB4fozeY6iV1RI9M8//3GnkPzevBEZT1ug3zwwxwpAu++6xumtuFMs63Ks/jEiy
 75m9xGcCkOmvw9mk/LBPxq/1QtjYPcJW9DK9zZwnVXqog1rI/5+IYki5ROHGdKcT201JFdSHmtD
 vSjlo6CimXk3LN+9viQOJBMLk39Iaab+d0PEadshDQayUoOfbpj2mO+lEDJbyHKtyuw14929vJm
 iXRQta4UMM0owwDSYdBhGKz99VL+8KI69gAsKET4a0wGkcv49z6I1a2zEOua+oQRI5c/co6qztO
 mB8eXuXYMrL11LUDKusLYh+9jBchIu2Chr2rqBvsgeGJkmkrw7HfPbbO+td7OvYfxyElRSV3qll
 TlRIp52v3pVBaIyayrxvF6iP3ot0MQ==
X-Proofpoint-GUID: 4rK0TCqqJHr80gXLJGMRI_rN5QS7MOq5
X-Proofpoint-ORIG-GUID: 4rK0TCqqJHr80gXLJGMRI_rN5QS7MOq5
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943d897 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CTyzjmmZ7-0hRA9u8pQA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180086

On Thu, Dec 18, 2025 at 03:26:26AM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 09:48:50PM -0800, Qiang Yu wrote:
> > On Wed, Dec 10, 2025 at 03:51:15AM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Nov 24, 2025 at 02:24:38AM -0800, Qiang Yu wrote:
> > > > Add QMP PCIe PHY support for the Kaanapali platform.
> > > > 
> > > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
> > > >  1 file changed, 194 insertions(+)
> > > > 
> > > > @@ -3363,6 +3516,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
> > > >  	.ln_shrd	= 0x8000,
> > > >  };
> > > >  
> > > > +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_0 = {
> > > 
> > > Is it really 8.0 or 8.20?
> > 
> > I double confirmed the version, it is really 8.0.
> 
> This is really strange. The SERDES offset not equal to 0, te
> PHYSTATUS_4_20 bit instead of PHYSTATUS -- all of that has always been a
> characteristic of N.20 PHYs.

Yeah, seems your theroy is correct on previous target such as sm8550 and
sm8450. But for kaanapali, the fact is the version is 8.0, SERDES offset
is 0x1000 and the status bit is bit 7.

We can also cross check the status bit with downstream devicetree:
93 		qcom,phy-status-bit = <7>;

- Qiang Yu
> 
> > 
> > - Qiang Yu
> > > 
> > > > +	.serdes		= 0x1000,
> > > > +	.pcs		= 0x1400,
> > > > +	.pcs_misc	= 0x1800,
> > > > +	.tx		= 0x0000,
> > > > +	.rx		= 0x0200,
> > > > +	.tx2		= 0x0800,
> > > > +	.rx2		= 0x0a00,
> > > > +};
> > > > +
> > > >  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
> > > >  	.serdes     = 0x8000,
> > > >  	.pcs        = 0x9000,
> > > > @@ -4425,6 +4588,34 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
> > > >  	.phy_status             = PHYSTATUS_4_20,
> > > >  };
> > > >  
> > > > +static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
> > > > +	.lanes = 2,
> > > > +
> > > > +	.offsets		= &qmp_pcie_offsets_v8_0,
> > > > +
> > > > +	.tbls = {
> > > > +		.serdes			= kaanapali_qmp_gen3x2_pcie_serdes_tbl,
> > > > +		.serdes_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_serdes_tbl),
> > > > +		.tx			= kaanapali_qmp_gen3x2_pcie_tx_tbl,
> > > > +		.tx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_tx_tbl),
> > > > +		.rx			= kaanapali_qmp_gen3x2_pcie_rx_tbl,
> > > > +		.rx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_rx_tbl),
> > > > +		.pcs			= kaanapali_qmp_gen3x2_pcie_pcs_tbl,
> > > > +		.pcs_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_tbl),
> > > > +		.pcs_misc		= kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl,
> > > > +		.pcs_misc_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl),
> > > > +	},
> > > > +
> > > > +	.reset_list		= sdm845_pciephy_reset_l,
> > > > +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> > > > +	.vreg_list		= qmp_phy_vreg_l,
> > > > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > > > +	.regs			= pciephy_v8_regs_layout,
> > > > +
> > > > +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> > > > +	.phy_status		= PHYSTATUS_4_20,
> > > > +};
> > > > +
> > > >  static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
> > > >  	.lanes = 4,
> > > >  
> > > > @@ -5209,6 +5400,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> > > >  	}, {
> > > >  		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
> > > >  		.data = &ipq9574_gen3x2_pciephy_cfg,
> > > > +	}, {
> > > > +		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
> > > > +		.data = &qmp_v8_gen3x2_pciephy_cfg,
> > > >  	}, {
> > > >  		.compatible = "qcom,msm8998-qmp-pcie-phy",
> > > >  		.data = &msm8998_pciephy_cfg,
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > > > -- 
> > > > linux-phy mailing list
> > > > linux-phy@lists.infradead.org
> > > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Dmitry

