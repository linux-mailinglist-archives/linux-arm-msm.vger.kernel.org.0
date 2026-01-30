Return-Path: <linux-arm-msm+bounces-91279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIa9C9WNfGkBNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:54:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF846B99F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 003533024193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C327374199;
	Fri, 30 Jan 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRYv+qJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib8QKYb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909EB36AB5E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770397; cv=none; b=KY8OSZAAiHCuEp0fOjNiKNINI3BkkO0H2CQf2MR2i9sS/5Ol3iWUyleTcuLmPmAuiWmBKBAjdehHP2ioiLkLXO1CQZ2f8r7NMyLtsjYWfzstdHCp2tBbtMdluSjZJcj85w4SEPwxVhVzEoG8hTuvhU27EUBmf9/ld+427iv+Hrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770397; c=relaxed/simple;
	bh=cOXTKoNWUgye4LyeYc31QCfkRcoUwN8GOnZOTv5rysQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbTeLiKoB86EiCz0eHH8TBGEXH1o+fl67HIxD+vZPiK7KddmUz3aEcCXSoweP99yt1rJkAtZBiLTsYi17GB6/hEOcspr612tuBiVji9HE1qUat+ybd6jjB8CwFDCr/OZqXIgZMUc35OQeYGHFT/+sGezissXGSKsRMpN30gS3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRYv+qJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib8QKYb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4bno31826307
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C1HP+PUS0XqDz8A8z7e/OWGq4Syxb0euN59n+MLEdIg=; b=YRYv+qJ0TAY0dXv/
	SO4sBYGrsDNUMlVL3WdOz//QVPfIXevc4MYNGOOQxnzCG2w5H0B1EMsS8JFXEZSU
	WOYcXte3iE5WFOXWnmZA9BhiqtOxUFKkk11D7WB2n50lKXykR/v8tYYwK2ER7iyw
	R9E/7LUQKEKWLPi0QwlvN2A+J8qoGH2Ye8DXxzUUM2CBM42FJX6KL6nTgPlLZ2k0
	7Bgz0MRESog4E9tYquMnKrJH2yqeaDnLEXY+xR84wl5b44nEQBPUpcIuofAllaNL
	9lEonA9x4rzaWPtsFgGAKX1eYb/D4EFEPLs1CbaUZ4FQ2i5aqBZTWWex3pPKqcag
	XOcQbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsms2gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:53:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6d6b0f193so10103785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770393; x=1770375193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1HP+PUS0XqDz8A8z7e/OWGq4Syxb0euN59n+MLEdIg=;
        b=Ib8QKYb1tdUPOPr5YgQPlb+D8xcWpna102bUKaVxAmBhK76nZIHiOM4pKc1iBGeZDW
         LdhDWAuZ6723cvNdTsJHR7+fcvUVOQe8F5Ta8s/ThsQa1RpF9+v95AGSeNau1rAgxOM2
         ee+C2QCzJqdBgqZfLfYSvY7RcR78dUxEumgvzq7e7KmXgLlLDdq0z4Q6jzliHBGMOzAU
         eeWM+GpWo+47BCs6SgDV6Vv9sG0HsnDY2A3kUAkuHTQbAQOOZFoUIa4KSA1jF0MGZ0Xh
         rQk54obOh33UuUVX2m3S9QVLItqZzvCFFlKNLVcSrG+CpC1SuaZX8i0eEWH2gYhki1MU
         oUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770393; x=1770375193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1HP+PUS0XqDz8A8z7e/OWGq4Syxb0euN59n+MLEdIg=;
        b=wdKdLl3TkOcc2s1IN3L5qEaaAfTmRRKYiUWz+5hwmz7IMefiINWlgxneGigDtIOTdM
         27EavMhFsRrB+f4jtk6L+KxrBY3FKhfHx1TgGblOUGt9fOJcsm7AsZOhJTJnkA66/41c
         f0L73vQDxe/whiLSrp6QMjWOq0/Ha8Xidx4uXFGfEtPZeEKxBfT34IV2WrZoTBxWtuQ4
         YFEsnnqT3UEwZyDMaxPaWvyV85Rw3ZgwaKkQet44XY+8kBN6c+Vh5QQno8GEXo+3p/9A
         AaVV/rzhjvTA4Kg7jHfoaFrHiG/KKu1TssaxdaNUz5do8xB409hKnU2Kx9sguSsNyniE
         t68g==
X-Gm-Message-State: AOJu0YxTx9yRjlUxy3NF2A/osMZkmUq9CZQjbMfeH9+Pxg+Z3aPRkLzN
	rp2/mzzn3XHzfkIlpIwVzDgegh0/GGdYCq4Y2PWXs5wMXJ0TOlK8xECKEwTbk3gr4MSEMKYQvez
	T3TLIZwSg49kg3oEXoD63ch4rHSLJ9e3aPGenU0QniDLnFIPKWqYbJOUqAI5MFdMHlGOv
X-Gm-Gg: AZuq6aL7jh+A25cHXx7Klxq5OBNNwp0ogkxMi1g3eDkxr3RUK3G0PiFS13L4FgIyg5N
	beuR8BLoz3sNxTmox3drRLWo+VMdBmTh8JGiWkklPAY1yHIcFHUuiBPcUcGcE6OFjWP0IhFtDv7
	iirkSidNoF+ZO0ZPgPReWfi6mhoctAOHfMXXuP0doWN1dCM2Tezxgvyns/YqriPXNyV+YnxD93w
	DhFpeXs7XjI5sPDs5xa0+0xAnAPa4vtvyB1lzFJBGIbsVfVkKpFqOwWsql52myIJiQkKyd6YezF
	pkNDaIg9IZPwVc9OelOOFDiX5KYcHl+1ZMDNDVD1+ocqGgpnXjq1O6eaYE4iqIGzjJe9L8ELNIO
	RA33f2bC/Ktmvi2o8ktMlUrLxAR64bFqy58R9zXWWr3mfUkKz8EsuFdVwEvursMuNt3I=
X-Received: by 2002:a05:620a:17a8:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c9eb265cedmr268608185a.1.1769770393574;
        Fri, 30 Jan 2026 02:53:13 -0800 (PST)
X-Received: by 2002:a05:620a:17a8:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c9eb265cedmr268606085a.1.1769770393046;
        Fri, 30 Jan 2026 02:53:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c0213sm406769266b.48.2026.01.30.02.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:53:11 -0800 (PST)
Message-ID: <8ec07e5b-b83c-4e76-a49a-933420ab55d5@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:53:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
 <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4OCBTYWx0ZWRfX5Rh6JwqdDp5C
 lMwduW1SXU/oaLyGzpOgXjSJLHs9AM/ALiUtmGpqMBdF7Mhh3hZbOH6VADY0/kc8sdUNJ89E5lU
 FyVf6G+DxCBTXE9fd/ZgYMgz/iG7aCEo6aafwmAHUsUUuc1d82rfKM5o1fJfBAUB+E5XeDLBBad
 gixCUCDUu1NMOE5yno1MGO9ZKHGS0W30+YdhJrSn9xTpXl/AjPfW/R0eQRLrnLXjbvw0p3aIiQl
 ls3IlTbYA4qUU/y9a44JDsi2vQ7FAPFvibYlBwp//48vxHTMKbWv2sJ4ZN4ILCsve2cpxkgcVD+
 FBlFL61gIZArRL0mo6nVWVycCx8Gp7kmV+yxf+MQVWGd6485DsQO7x5bALxgdC8frWBgl15Aki6
 Z/qbcH0hUNiBsxVIiX78oCtSoBBzxhlafZ1IXW7UTWl2U+Qzzl6t76laj1KikVOU03IhO5BPjPb
 LVCWgPTJn8omTppDXng==
X-Proofpoint-GUID: sDztJ_POnxBvZYJehFMlaitysbOcUM49
X-Proofpoint-ORIG-GUID: sDztJ_POnxBvZYJehFMlaitysbOcUM49
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697c8d9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2ybyCHOLog1-fLgjBY0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91279-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,lunn.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.2:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.18:email,0.0.0.52:email,0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF846B99F3
X-Rspamd-Action: no action

On 1/29/26 6:28 PM, Umang Chheda wrote:
> The Mezzanine is an hardware expansion add-on board designed
> to be stacked on top of Lemans EVK.

[...]

> +&ethernet1 {
> +	phy-handle = <&hsgmii_phy1>;
> +	phy-mode = "2500base-x";

+Andrew could you please take a look at the eth setup?

Konrad

> +
> +	pinctrl-0 = <&ethernet1_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup1>;
> +	snps,mtl-tx-config = <&mtl_tx_setup1>;
> +
> +	nvmem-cells = <&mac_addr1>;
> +	nvmem-cell-names = "mac-address";
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hsgmii_phy1: ethernet-phy@18 {
> +			compatible = "ethernet-phy-id004d.d101";
> +			reg = <0x18>;
> +			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +	};
> +
> +	mtl_rx_setup1: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup1: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
> +&i2c18 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	eeprom@52 {
> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> +		reg = <0x52>;
> +		pagesize = <64>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_addr1: mac-addr@0 {
> +				reg = <0x0 0x6>;
> +			};
> +		};
> +	};
> +};
> +
> +&pcie0 {
> +	iommu-map = <0x0 &pcie_smmu 0x0 0x1>,
> +		    <0x100 &pcie_smmu 0x1 0x1>,
> +		    <0x208 &pcie_smmu 0x2 0x1>,
> +		    <0x210 &pcie_smmu 0x3 0x1>,
> +		    <0x218 &pcie_smmu 0x4 0x1>,
> +		    <0x300 &pcie_smmu 0x5 0x1>,
> +		    <0x400 &pcie_smmu 0x6 0x1>,
> +		    <0x500 &pcie_smmu 0x7 0x1>,
> +		    <0x501 &pcie_smmu 0x8 0x1>;
> +};
> +
> +&pcieport0 {
> +	#address-cells = <3>;
> +	#size-cells = <2>;
> +
> +	pcie@0,0 {
> +		compatible = "pci1179,0623";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		device_type = "pci";
> +		ranges;
> +		bus-range = <0x2 0xff>;
> +
> +		vddc-supply = <&vreg_0p9>;
> +		vdd18-supply = <&vreg_1p8>;
> +		vdd09-supply = <&vreg_0p9>;
> +		vddio1-supply = <&vreg_1p8>;
> +		vddio2-supply = <&vreg_1p8>;
> +		vddio18-supply = <&vreg_1p8>;
> +
> +		i2c-parent = <&i2c18 0x77>;
> +
> +		resx-gpios = <&tlmm 140 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&tc9563_resx_n>;
> +		pinctrl-names = "default";
> +
> +		pcie@1,0 {
> +			reg = <0x20800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x3 0xff>;
> +		};
> +
> +		pcie@2,0 {
> +			reg = <0x21000 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x4 0xff>;
> +		};
> +
> +		pcie@3,0 {
> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x5 0xff>;
> +
> +			pci@0,0 {
> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +
> +			pci@0,1 {
> +				reg = <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +		};
> +	};
> +};
> +
> +&serdes1 {
> +	phy-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	ethernet1_default: ethernet1-default-state {
> +		ethernet1_mdc: ethernet1-mdc-pins {
> +			pins = "gpio20";
> +			function = "emac1_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet1_mdio: ethernet1-mdio-pins {
> +			pins = "gpio21";
> +			function = "emac1_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	tc9563_resx_n: tc9563-resx-state {
> +		pins = "gpio140";
> +		function = "gpio";
> +
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> --
> 2.34.1
> 
> 

