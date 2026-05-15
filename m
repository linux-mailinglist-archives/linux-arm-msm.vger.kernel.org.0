Return-Path: <linux-arm-msm+bounces-107908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGpLI9MUB2rgrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:42:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4C54FCB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 419923036E69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB0E47F2C4;
	Fri, 15 May 2026 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3eJKL/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RW1cyp7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9F047ECD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848758; cv=none; b=jixGMSqhUuRo7JgkBzw7hrj6UukgJ36hzL2vf8/MM2Lk2ZeCgieoHdxh3yqB6nt4tufdAhBoTc8wrcDbSnhGk7T1XUz47koPutglt6bm83I6acqUNyahZQ8lvSer9QGV5IS7irt78CG4EZT92Zi8oc0Q/1TaRu/2mBH7RMfSzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848758; c=relaxed/simple;
	bh=22fyjFgJ+C1v+V1xAOqUC0UsBP5Luq3yO1l3Ff3jUwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsRrKP9rVazDq5DSq44SevVdsRPhMR45a7uoItuJanys/LFCA0UyA+N0v5iBCjwA5RupPIX+28r6aODcZBdvHCcmDpaTzsU8Ogo/LhAa6Rs01an5oH9c2ibTQxQupCesuStbonxqrIYpeI3/86YeESOGDFc0R7g6NTc67hJKm+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3eJKL/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RW1cyp7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBdkFf1847945
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rn7Imlm01EFKGNinkVWhVrB/
	5WJJcifljrfBA44NDlg=; b=X3eJKL/1rIOyUwoH3EijiDxyjUKXLVm39GavDGv1
	8HPlq/JC3gqcw6FwvUwep1y0GzxmN4dbBaF//rZ8fxRPf7gSmuGT9fHqpdbHXw2j
	txA2VyYMa4Y5MJBvMh6cl6FFXaHlfvt53Mbl5Hs5y/QRXEiU4Az/svAd5vW0+zc0
	gwf871XJKa/8qthR+Sq0kQ4+vsCsT0DGFJE137HbWyIuOsln+poWjUPJK6e2QbLp
	wWYGbi7Y9jFXyuZdk5Hr0mHT+GW7fXO6gzLO2xs4QtSyLuHIFrw6mFn7lGzOyo8S
	JwYMGbYPeqRumNP35v9kwckCkONmgwBzdyuOlwF5/ysNpg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t374r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:39:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc8572552so626610241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848753; x=1779453553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7Imlm01EFKGNinkVWhVrB/5WJJcifljrfBA44NDlg=;
        b=RW1cyp7M6eL4vtUotNRJe+drXkpE7259mYtNAz4k1yBT8vXRBZV/RLQloCd0Ynlgcz
         N9IGVGog1Ksh3NRwRoZdTN0V2IXKhUkfCECwpPIpU8RdBuMMYZsXoAFK+I4jzzA5F2YD
         BLIHqbmaQBWtcuBQ7EL8F8kQXMi78d8B495CeJHg1kpmyxj+oOlDqdVSlDVe/FVFuKVe
         gnjHwa20jtBu8kIfY2oMltczMupICKmwjZe6XyegyvSxgjl98eJnEJt+tLl3vIFQL33X
         SHLStOXC2WeZgppZQnlNb0VWHv8EWLSIVBSdmohCLkx5/CQCj/QpV+j3w2vNIYsOvW3k
         m6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848753; x=1779453553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn7Imlm01EFKGNinkVWhVrB/5WJJcifljrfBA44NDlg=;
        b=OZl5Y7in5s7ZSxD3m4L+2Kj9/8U8Gv/cwC+OaoS65f2D+SOkRKlVDadrmb5VS0FAFY
         F92mUS7GBr7R77etP/W47Ktr1z52crTTwwPo58KaAaI1GLiDm+jXvIfJFY6sgtJEtScX
         Bin7Zpcq7aLQEU1FMstcYKp2gqlgUENC4TEIDzIwE4amFT1pp099m+p5q6U8q9nf+/hx
         v6y49JUa1lkYkvPyNK61mFkUf/cHB3shpzIRA7qYGItT6xzmwr+sCBfct6Te5XKvBSiy
         H14NOwWi1509qzjnbO682yRtTqDc6t/gIWx1+Wfh5vXtqHJKS9Q2IUTos7mWfKdodGVU
         3uHg==
X-Forwarded-Encrypted: i=1; AFNElJ95OrqlPbUJCy6CQ/3H5TRs6Z9R5WufLfDsRo40QljZT3nQQdrJOdG9I0liXvw9eqE85aD0/xd2PSUZKhml@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vO40Q4fQD7l1J0fzktEML627DvAHPJBv4LeCQbquYFzCNNV/
	97tsUSfghLhfqNXgeQdI4QXyWpxdTecGi5qxKzKRMsH/mpbOfANwpEwzUsXVoo6j5p89nutE0mD
	YqG171WCmUxhjKjtfYWZ21H8bP/O5broCEPOPJlS6lMcRYMbLPysKFQvCDPyz8e2MuaBX
X-Gm-Gg: Acq92OEv/vbYVGaK3L20i17rqWCAeSh8GXxVleLdz31c57AiMVSFR6z6Az48v1xzhK7
	qzCS0uQOMPfgzAF8Y/qqNhQg8WHICxM9dIxaB+yRtpsXOC0cfTaX+xYS0pYIiPQ6TAcUkNmrQ1E
	9C003y2/sseIba9XbpR84M/absP1L0K3ecFDrGzqZ9FACmaj8URl+/2OY0Fc2yPRgknP22zt4q7
	KbHBWgdCaqwUnsEHyyE/oeCv0sv4sEAJmTTsvQK96TkeTZPi9feH9DygFbR7ZzZ67N31ka2qt/Z
	HofVfRyL5JlDgBBz/JbtlQ99XKLrkneMDmWGgbt/E/qNVi1zdKpet7o50f18Aw2ConEUIIgpnT9
	FZdYjnO6YHdyQTz9lHR+PUr26LZVESFYh9ao=
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id ada2fe7eead31-63a39a5f9e4mr2097460137.0.1778848752817;
        Fri, 15 May 2026 05:39:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id ada2fe7eead31-63a39a5f9e4mr2097443137.0.1778848752233;
        Fri, 15 May 2026 05:39:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm58719065e9.1.2026.05.15.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:39:11 -0700 (PDT)
Date: Fri, 15 May 2026 15:39:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
Message-ID: <gzsmvuwe2tfgvkqz3k6h5f44xflaozcruvenn4vjhdmawgceof@bd7osrj2n7bo>
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
 <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-2-05814d24f4cf@oss.qualcomm.com>
 <934d6876-3c83-43de-b155-d435af4c3547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <934d6876-3c83-43de-b155-d435af4c3547@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a0713f1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MO9N5NShzSEYB1CzB2IA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOCBTYWx0ZWRfX4MgYlkkmLPLt
 Im546c13ahGxAf8yoXyE6HxYs53SubtLIT/VegncHoT8kYeNt7VcHrulVoMebiZOQNBs5vQIkv/
 /1tFzSxWElOscPiUTBtkr1tUoi/oIlq7BKJUQ/mUDuYmxBCPg00b4I43xqtKwgXjyQB4LjJrnqL
 jeazwaCF7xEwuDdipOhhbTIszfNr/wDPIGCj32CSA74WlkcrcbedjgfIb36vWJFnB99SS5xf/Hm
 TqxTu9cBGQ6J9nexhuVbawDB4YbzqBkXAVJgKVqJTFpzQfnqsqsvs9VKR+2svN0LiZcd5U8+tt0
 rECr7UQZ3XajcX8p37Zkxu99xXD79Z+1pwNIRGB78ERlpD3D5c0DViHUBNBiGXPtznKYBIIccx3
 XAZtq0sISSjVdtak5nlXbETG6KpfAjx2XpHLsGTSU/7BnvplIpoHgU1ITUaWTTCnpq9+Jdr7wwk
 d6ZiQ8KIdql/U0SEHEg==
X-Proofpoint-ORIG-GUID: t9S2BSUHgpVmEaytZKq4s-riT3B0Wjkm
X-Proofpoint-GUID: t9S2BSUHgpVmEaytZKq4s-riT3B0Wjkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150128
X-Rspamd-Queue-Id: 78B4C54FCB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107908-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-15 11:10:28, Konrad Dybcio wrote:
> On 5/13/26 2:33 PM, Abel Vesa wrote:
> > Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> > engines, add the matching GPI DMA controllers, the SDHCI controllers and
> > the LLCC system cache controller.
> > 
> > Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> > SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		gpi_dma1: dma-controller@a00000 {
> > +			compatible = "qcom,eliza-gpi-dma", "qcom,sm6350-gpi-dma";
> > +			reg = <0x0 0x00a00000 0x0 0x60000>;
> > +
> > +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			dma-channels = <12>;
> > +			dma-channel-mask = <0x3f>;
> > +			#dma-cells = <3>;
> > +
> > +			iommus = <&apps_smmu 0xb6 0x0>;
> > +			dma-coherent;
> > +
> > +			status = "disabled";
> 
> Let's keep the GPIs enabled

Will do.

> 
> [...]
> 
> > +		sdhc_1: mmc@f44000 {
> > +			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x00f44000 0x0 0x1000>,
> > +			      <0x0 0x00f45000 0x0 0x1000>,
> > +			      <0x0 0x00f48000 0x0 0x8000>;
> > +			reg-names = "hc",
> > +				    "cqhci",
> > +				    "ice";
> 
> This should be a separate node

Will drop for now. Will be added later as a separate node.

> 
> > +
> > +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq",
> > +					  "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > +				 <&gcc GCC_SDCC1_APPS_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "iface",
> > +				      "core",
> > +				      "xo";
> > +
> > +			interconnects = <&aggre2_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> > +			interconnect-names = "sdhc-ddr",
> > +					     "cpu-sdhc";
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			operating-points-v2 = <&sdhc1_opp_table>;
> > +
> > +			qcom,dll-config = <0x000f44ec>;
> > +			qcom,ddr-config = <0x80040868>;
> > +
> > +			iommus = <&apps_smmu 0x520 0x0>;
> > +			dma-coherent;
> > +
> > +			bus-width = <4>;
> 
> That's definitely 8

Yes.

> 
> > +			max-sd-hs-hz = <37500000>;
> 
> This should be fixed in Eliza

Will drop.

> 
> [...]
> 
> > +			max-sd-hs-hz = <37500000>;
> 
> ditto for sdcc2

Will drop.

> 
> > +
> > +			resets = <&gcc GCC_SDCC2_BCR>;
> > +
> > +			status = "disabled";
> > +
> > +			sdhc2_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> 
> The clock plan says 100, but the SDC doc says 50. What does
> downstream set here?

Downstream says 100 and 384 for sdhc1, and then 100 and 202 for sdhc2.

Thanks for reviewing!

