Return-Path: <linux-arm-msm+bounces-75058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE7B9EA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52EF2A1F81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2BB2EA74B;
	Thu, 25 Sep 2025 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaVnSH9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0B86359
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796270; cv=none; b=oRmRpfveCUTggliHpdiY/Oku/5EPhvVqWsk0t6uhV3bL4K+s/RWKwlVY6qLJRW95GabP8XOuXAhakOryzAPYEhHmRWaV2056zv/lB+ABNxANUZszYrX2EK7+/Ibf7gSfTAzMcdWWieFETDx8N7rYq0zHKmdz2WUzKvLCmVXLe0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796270; c=relaxed/simple;
	bh=wisyOsT1C1Ryv/jHBjcqfX3RaZbeaqQn0I1N4fwU0kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKvVSn/rrh5nnATpf0f9hUYQed6Kl9HPfHZa2x05KsRq0dBwED3jCicoqcZl4BwT4mnpqMTC4iXH/jyyj0PAhDCyE4r4wqjCQZmPovsCbkY4HJEIZDZ191Fj9NrqaJ3K80OQe8JQG+HFXyJ8V5yfLNb3mqLm8S4SJf2yNoI2chI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaVnSH9T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9In1d021486
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9va7HlxAnrOb0SWBv/l/eGsyAXzytQ6OTnJXw6Kj/CY=; b=jaVnSH9TL+MauIXV
	ZdEuaaEKl/EaHg+c5k1FktyhOXnSiJA0uyQ/66lSPjIrXw3LVTJiC6l28RHPbgMR
	k9UlMih3XkiqH2Z3lw/+UAYFi3lKaXuAgJE0eNckpBRRbmf+QiQxzEEcO6Q7urEt
	bAJjYcthxJmeidWyZt5gkL8pnz8A83Jp3cuzpC7E02hI+J0PROhScuV5oPkVgc0n
	cC73cS2oaGsGZ4LZDMunMo1SPywKR4rEQfo3LJO35Ew4Z6IjO3bEwYSw5pbthYRF
	Y3XA6xodR4UhOK6YOO8vjnMkOVRr6YVIzZVPjRCV4HfsVF8sKmGGqmcI9JLp52OK
	81wChQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafatv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:31:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85a8ff42553so24514885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796267; x=1759401067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9va7HlxAnrOb0SWBv/l/eGsyAXzytQ6OTnJXw6Kj/CY=;
        b=TH3nNIUaRf6jsyeUhMmWo9rMO9Zb76/iF20ixaCfaJZzaSh9uWYAEUKW9Kpd+hNmQD
         rc6oK9aHnQoQEifnXRYtXFTX/jUh5kdHyR/HG05PYISQv2jblC1tD+1RfF3V3Fk0PKye
         tBN1RdAN37wQgXtw3j+Fh1n2wbbbdPnrpRvEDX3JYsb1hWm5GxLWcQ+6ek9kVu/mxCbl
         OmAnycWMjl0tKZWtHDRMu5spdzmTYrQJCn9LkGGF7OustgwWHZ8C4zBL4XJ/klgzMRAu
         3r2PPyK8Fy4I85HkSvjXggd/ZeK5IyWfhmHIG6l41oloohQhLlqr6oBSJQlHK2Tq/cxX
         lBcw==
X-Gm-Message-State: AOJu0Yy4LSxS6/osHdrZTQ5OGphHi9e978SjIBaPnpEdGTRB/7fioE+a
	LQzDZkyR/kgN/4qB2yLHEW3ngohd/Kbv7LKmIvdZgEzYzMNbIaqIhSoHUfhwCuQoOgs4ZifH8Om
	Q5XFWR/sQxDlM/qMLk3yWv0h2OR7X58/S4JXIF+zarXOjNECJ7v2CLh01pq4r02mwxpOR
X-Gm-Gg: ASbGnct0AuK1lUS7EpyyOTfgsLAHNdVC1tRow4kxrTrU9Jkk7n+rC8eFdYHac+E9AXA
	gLFnHwngj5xHpYAP5hiJnul0LMiGA/eKentIZRmkuFUTUYHi7kSrg52JSu5hxVKQzK2n5BbFPYA
	EUATLQ8XxfFCm/nyfy5IvSh+w8Uif3MA8ml+SVeCc7klZTJzD+lacQTI2ksze9sqrx3kKClNaeo
	qt0unpeVDSJ88X5H0NtyMm5gDNeUIL2iTvGot4gtcZlbSQTx57sp9uQAVF9wsQNejVqfUPEtrZT
	SHvAQJhqGPyFnbW3cRsLJso2JeE6/GasQyCbh5Jpbqs51vn6cxujMLjt25+DtVr15b/BgyDBUGC
	mpnah0Tv5yni+LQ5jZwKg2g==
X-Received: by 2002:ac8:5fca:0:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4da473524bcmr32387221cf.3.1758796266717;
        Thu, 25 Sep 2025 03:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCw5K8UPnmPioSAh+xplsbtqWhDI7k96Pzm8sTdNmD7qW/cWHlOH1L3fL1u8UsI42cuBtHQ==
X-Received: by 2002:ac8:5fca:0:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4da473524bcmr32386991cf.3.1758796266217;
        Thu, 25 Sep 2025 03:31:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b367b79d1b2sm38869366b.10.2025.09.25.03.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:31:05 -0700 (PDT)
Message-ID: <333dc302-aee1-41a6-8cc7-f0315f3b2169@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:31:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] arm64: dts: qcom: glymur: Add SPMI PMIC arbiter
 device
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-10-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-10-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0wgLHx6SdnKZOgGu5fdQ2P-2wCRlKAtF
X-Proofpoint-ORIG-GUID: 0wgLHx6SdnKZOgGu5fdQ2P-2wCRlKAtF
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d519eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uVuLLN3hS0IF7mqGKV8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXxCQdXvF/0EBi
 0bIHekhOlsj6l/zXIB4an5I2pZUQCHed4JXFkxpTLxS9cmoxMW9TmlWlnYft7eyJYLg6n1qZpX7
 Yiol+dKluIDDcVN/kpVxndKES5JZ09bByMUYyIRgEEgsYS/IY2uFJzBwPTTzCgjfauLPrGDyOcN
 /gfzkz4uO3AptGbrXZiGT9mFCizbQKSPICPuVQ0/euvyJKogy6fcaFDjr+VxbNTQzFo/eZblS7D
 4slmLJuhzuh0RQ/UCYQdnhmA2PbLyH98fHHsPRBBZ9CEMDe5zmv/PS7WlNowelOBy92GJ15JcpN
 Pe0xfqZmTYy89+yaG+pIHM4wtgsYGwzdH0CnVswRqZgRBuN93O5ovswdVe9R0NPppmN/XMZgW49
 Zx2l3kUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add spmi-pmic-arb device for the SPMI PMIC arbiter found on
> Glymur. It has three subnodes corresponding to the SPMI0,
> SPMI1 & SPMI2 bus controllers.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 62 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 2632ef381687c2392f8fad0294901e33887ac4d3..e6e001485747785fd29c606773cba7793bbd2a5c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2600,6 +2600,68 @@ sram@c30f000 {
>  			reg = <0x0 0x0c30f000 0x0 0x400>;
>  		};
>  
> +		pmic_arbiter: arbiter@c400000 {

Is this label going to be used?

> +			compatible = "qcom,glymur-spmi-pmic-arb";
> +			reg = <0x0 0x0c400000 0x0 0x00003000>,
> +			      <0x0 0x0c900000 0x0 0x00400000>,
> +			      <0x0 0x0c4c0000 0x0 0x00400000>,
> +			      <0x0 0x0c403000 0x0 0x00008000>;

Drop the padding from the size fields, please

Konrad

> +			reg-names = "core",
> +				    "chnls",
> +				    "obsrvr",
> +				    "chnl_map";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			qcom,channel = <0>;
> +			qcom,ee = <0>;
> +
> +			spmi_bus0: spmi@c426000 {
> +				reg = <0x0 0x0c426000 0x0 0x00004000>,
> +				      <0x0 0x0c8c0000 0x0 0x00010000>,
> +				      <0x0 0x0c42a000 0x0 0x00008000>;
> +				reg-names = "cnfg",
> +					    "intr",
> +					    "chnl_owner";
> +				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "periph_irq";
> +				interrupt-controller;
> +				#interrupt-cells = <4>;
> +				#address-cells = <2>;
> +				#size-cells = <0>;
> +			};
> +
> +			spmi_bus1: spmi@c437000 {
> +				reg = <0x0 0x0c437000 0x0 0x00004000>,
> +				      <0x0 0x0c8d0000 0x0 0x00010000>,
> +				      <0x0 0x0c43b000 0x0 0x00008000>;
> +				reg-names = "cnfg",
> +					    "intr",
> +					    "chnl_owner";
> +				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "periph_irq";
> +				interrupt-controller;
> +				#interrupt-cells = <4>;
> +				#address-cells = <2>;
> +				#size-cells = <0>;
> +			};
> +
> +			spmi_bus2: spmi@c48000 {
> +				reg = <0x0 0x0c448000 0x0 0x00004000>,
> +				      <0x0 0x0c8e0000 0x0 0x00010000>,
> +				      <0x0 0x0c44c000 0x0 0x00008000>;
> +				reg-names = "cnfg",
> +					    "intr",
> +					    "chnl_owner";
> +				interrupts-extended = <&pdc 72 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "periph_irq";
> +				interrupt-controller;
> +				#interrupt-cells = <4>;
> +				#address-cells = <2>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		tlmm: pinctrl@f100000 {
>  			compatible = "qcom,glymur-tlmm";
>  			reg = <0x0 0x0f100000 0x0 0xf00000>;
> 

