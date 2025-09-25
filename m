Return-Path: <linux-arm-msm+bounces-75075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE6B9EE97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1F219C73A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681FA2F9D9A;
	Thu, 25 Sep 2025 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7g30dQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E52F9D97
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758799931; cv=none; b=uXpqgbpqT4EABggZQFj3SPofHy/2KBMSLBUs6lACqpmu/XB+OXMFAYh+imaMcEtLLoUnkKgbznKWWRUfs4NpFax9BdV2hxu9taJhgmCy0dUFgkJVOaf2jqxa60joWaYctv/NLHKgOBDQ61jEYBTwo3CPf/TEzTl8Z5Z0TT+oa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758799931; c=relaxed/simple;
	bh=Z0bgXJgybcfI7M3Ov78lPDLbxmhlYHwHEUYqCSr9tts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RozFTk35j9+TSMH0woKovqu4gfLL3Idu2IsZyTY6Wn7CogoRLCqn+2eGmSihKKTy+D2wnljFDd5JWZgryzoWqs8nKBuhAwoN9ahpyWtJervv+zrObRG5vt3CoCH/qVfsBTgDF4IbISaAjCV4JhGDaysELZZOjt2vb7a4lro+Cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7g30dQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9xfDS029565
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1FrH9vXfDsAbwod1kWwn0oGRkVboYjE2nZxCWJX+P8=; b=C7g30dQOpHuSXuUJ
	uiQ0uecc23yRVvY2lozAi6EI4j7xbveWRIA79z4g7Wfl1lv9j1q3NLNkJ1KQd56j
	D1mAwgQkt7DadH3OCz8NWTKkPo/WP4M5Dc8z6H0ggxj4GDQxrHKkXgfWob1c01Q2
	JiYbjJCpu/Ul9bxcU7U+uTXiJzijCxEyI6U2Z0fFYFBaEszFcrcxAXrVvImDt9s+
	i3SQTNN/SUWEZIuFJ3ZMeY6wmVrYfCp3+VfNeRR/j6o6Tx+xVlIg3ByIEYZ0tGC/
	58/W8hXNlsqiU38MwDKnCe8TZI+zXHQVcee02IEaDwZv1sIDxHqqVCqZdYqcIBHH
	33Fa4A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqshc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:32:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-798925d8e2eso1486746d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758799928; x=1759404728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1FrH9vXfDsAbwod1kWwn0oGRkVboYjE2nZxCWJX+P8=;
        b=oW7emuN0wGkwICZX41sJM/b5KppqUQX21gOzl/O3HVdBxqrXENoxLKhfjlQ2vUhqqF
         i8zWKd9Dc/Ub8Ef2Ji5PuUxRubu97bMPrTFh5lRCqfbtVUYJ8Q9AqMW02g9tyuKsIVgk
         /WHBkP2tzSAgQJZ13gGV/KrRvBfWg/stYCZ9ZO4aPo8YvQvLZ38FbN0Uv/BDmg5m/KSq
         +HuQDEHM6xL2G/RXGIsexwdoNC2Ml4qalUY9EFRKyzdoU/HZgz+EPdQsX/qWA950eNZd
         OaE0b/8P4FOSH9c4ubuiwyBfqcZtWIsRF6DOlsxaRu/yacf4kdKcS5u4fut7IJUZj8/T
         ek+A==
X-Gm-Message-State: AOJu0YwwzRES8hpgXIEPaLQzHku5AdKuN0RcD9koVeeMJc4iywZgf5pn
	7fhaLsoGEXk9Cj7DidyRa0W71Zqncgdg83jVaVxVqycGvblV72TwcVJmH8Ut+eVVaRsPEDh0n8V
	P/8t9RE4uSVzhwLT57N36kxet25+hVlIxtEIowPQAlj2SwksP49LNjZC88k2Mj1zf3FTV
X-Gm-Gg: ASbGncvRBhtdepk1rv8Zufm4qn/UYzKZH1SR5vZelVH2zRqlo5bqVO5yB0yF27z6KmU
	Xs5bpYC0a4hdnl5/GaZmsmeO40eSPqm7mF6JN9kbHuwnKryRgwnd3cwLAT8Uklv5YxzNZEPy0ea
	16v1JiFCOJ35NN5W5ynM/c39+pC+SANTl2bnnjId6qN50WJzHUbnGIZiClhWpJgUsIA2MdlZUOC
	Dm8NpC8VvT2QHfQAC2FgGGF81mKYTTu366AORh06nH1OmpqC4uuND2MQQ7qGQK4xDruzOfGNUKi
	/dmyiYC+qx76g56qYSTm3pd5RU462STtON6ul9uQp5OTIkwWpBzhnFv1M0+bHHe7H1qcfEL2F76
	1YmYK9m2ID4Ef3LDVrHYhJg==
X-Received: by 2002:ac8:5a16:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4da41e1141emr26321311cf.0.1758799927500;
        Thu, 25 Sep 2025 04:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9lkEFEcx88iooA5ISTI+1vX2CSLXnbMlf3Z6B8INfnvKcWZfvN4dkZPHmHoqsUXNmvfrO8w==
X-Received: by 2002:ac8:5a16:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4da41e1141emr26321051cf.0.1758799927001;
        Thu, 25 Sep 2025 04:32:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d155asm156475666b.6.2025.09.25.04.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:32:06 -0700 (PDT)
Message-ID: <75d8cdc7-60c1-44a8-bf6c-0fb1ef38dd70@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prudhvi Yarlagadda
 <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lFNUkioY5mB0_2u8G9B7_5i8rHiLIo8v
X-Proofpoint-GUID: lFNUkioY5mB0_2u8G9B7_5i8rHiLIo8v
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d52839 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zO9y4h5Up0VuW54j_sAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX8LCvosbIQLuf
 Fe1DSMfN8zCPoD3Yr1BvEyWhJwTRv8OCX3N98WNJIolNxEbJiZV0cr1t8TRXTrXl3A4hyW4Y7Iw
 GuIOquZZsKrvw3mfkRt4kVzMgyWlZUllAucCE6Cwjhpak+8liLoPuJd1JLLnlucQ10i8zmnB/uJ
 AgEtvBJ/aSkvhViVVQ/wMfcei/Pr9VFg2rdiMpuNC52ykp/jvHPlt2XpBWH/owOmsdYMrpdVDk8
 WCY2D4wIv50NHigyEMIvgPc991y3ZjyKv1rYhxhwCFFtAQbi2Q5T1sBEqwrS1PEPK6eDyfdRchM
 j0k8m/f3pNus2Bf7lq2hzjetDzPoF4f+hUeqncc9skGUB7Brn+vKbkoLH345uZ+hzsOuLeOgIro
 99pnaTKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> 
> Describe PCIe5 controller and PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe5.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +		pcie5: pci@1b40000 {
> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01b40000 0x0 0x3000>,
> +			      <0x7 0xa0000000 0x0 0xf20>,
> +			      <0x7 0xa0000f40 0x0 0xa8>,
> +			      <0x7 0xb0000000 0x0 0x4000>,
> +			      <0x7 0xa0100000 0x0 0x100000>,
> +			      <0x0 0x01b43000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x02000000 0 0x7a000000 0 0x7a000000 0 0x4000000>;

No I/O space? We can also add the (presumably prefetchable) 64-bit range 


> +			pcie5port0: pcie@0 {

pcie5_port0:

> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +				phys = <&pcie5_phy>;

same comment as on the other patch

Konrad

