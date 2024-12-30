Return-Path: <linux-arm-msm+bounces-43659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F99FE798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E78F3A0389
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A3B156C79;
	Mon, 30 Dec 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9jxXuX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7D142905
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572781; cv=none; b=P9H3HbvQ7kRUD10pGUXEJRLPue1qnnzOEzAt+eArwefEv4BUvFGZhBpE8uoz8cL42K6wKGMyLoSfACZiq60/JyPv68P4KOOj3JfZKrkt8JBuq8JiqA1SiT0KvQhPgJDyiBn+VMogKKRE2c+U1MKQJFyoctrKxXne4WchtQLouaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572781; c=relaxed/simple;
	bh=E4wHsBXtJ06cbfmcpBQgNeizbzbAwP9vO2YfZfFfy2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hv6NIsO5sx1G5hVTg7nl3w/fw6ooWH8Gcm3hXc20YdQx3uE/397IJ7D5jqXT4marqsxoTi18k0n8SJ7VH5cu2r13WIifVgIwLxW/gelnITYgzizm3pMgm337lu5VVLLY9nMucNOoBToJnB0JTqMPhBTMIox1AV+1VYMQpD1gkIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9jxXuX7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9Ke7s024389
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPbqhEE4AOc0vA7qlalfLbal10Qq8JZdjtwbkkJDc+8=; b=N9jxXuX7r0UXbq3f
	tCuFLkSa8wP/srgwGgyz0NBUy3phAGW3/OPidC9yUke5XCQTj6kIiYnJuXzpyrzJ
	U7D/swSJL6IZJmV7BAqfQ8irc4PSsxbLPzGzpv1LCtgW1o8uB0Zjn51l6s3vvwYh
	5wMwJs6n+vGjIzTT1jRxLTQBk9RqeD+ZeH2RMZaslO2qF3nmYzQTdWJCUaB5ENFL
	uWQ8ZONVczuB/+VBQT6tyw7VRHB207N98FXXBzQWceoY/ctl/TJYslwTZUIdFBbj
	SdPAiWjC9nIp692yHqHwPOZ2lRhVoH93UvqiEB2cz22fNZKsgMEM3RTTeeEPoN8I
	QeT8qQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88rkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:32:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88fe63f21so21758406d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735572772; x=1736177572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPbqhEE4AOc0vA7qlalfLbal10Qq8JZdjtwbkkJDc+8=;
        b=sCTyiks+4sENRBPDJoQsVOJQfgecQJUFAeRQwoRJopkz/OmmTmRNXPwxTZd6kbzyDT
         zVfxH6dfXn0oMf5S0rj43WQpQcD2GSFpZqlPho1n5I/voDssWnaTgdT+0yfGqhWgmtC0
         /lh/Jys1Do6xGJlNU0+4vprOiYr9kdmGylT8eUI15pmfarSw9VF83IIss0V/Sa6XdL1r
         7EVJTw3iQ5D+04HJsYeRsuiIOr4+yb5x6mMVbmwVrlncAct/qBFDMnkFqfZG+ka8CYRu
         /7WpqvTRfRHMizymsyqhZVS3eeRSyjp/vuSEeq6pPsbSh12JGEXZ3gaqzWGdPE1UY/+C
         glpg==
X-Gm-Message-State: AOJu0Yxk3NwOuV9BGD7U9dlAAJIPUfjXqU5GzhJmdSQgjzJceZKQE7br
	HMZDfPjAszplcNvc16WB50sGMezW2k+D4ZMfYuzOIofR12VMNRlpPmo/291n8s/8dBwxtbg3GC9
	TFoJyAvQT4ksRqlpWVSeEM4+69h3JI5EFHsoJ9hcQcpbZuuYbqsBRdfvRzducprYU
X-Gm-Gg: ASbGnctD+/v9BM+CoXR9vicC7z4GTU9kfhO6gDkgFqPt+Cx4zwMeAn3DsnjyA8lua5M
	LR+t9RMGMeLZuAL6vBkx51++2G8GFRcpe3tZ5wylzQL9eLBqQzRoo1xO4thksL2hModlUfC7EZa
	5bjcmM1gt1WyHKFjCRWbF2PJHBumK/NnHpuDnfIwDtOTkZmrJgt7nNafSpli+/XPfpl8G8oCSx0
	3k83+idp0ULC3WVdzIVTaWSS6MFV3/w8x21Dazdu9WFKNIeR+bobpIJO6xVVJFLDxJHvdRmOTHV
	E4DavHL64TxBwmTPT8lS+iHW4s4ZP7HhVr8=
X-Received: by 2002:a05:620a:4409:b0:7b6:668a:597 with SMTP id af79cd13be357-7b9ba822dc6mr1993296085a.16.1735572771807;
        Mon, 30 Dec 2024 07:32:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGvIxC2G9VvSz534A2RDEca/4dFCwfR7M5JSVU6gqYkGGkJV/fePu+HYg1B32fa7tch/iW4w==
X-Received: by 2002:a05:620a:4409:b0:7b6:668a:597 with SMTP id af79cd13be357-7b9ba822dc6mr1993294685a.16.1735572771395;
        Mon, 30 Dec 2024 07:32:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f138sm1477964966b.17.2024.12.30.07.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 07:32:50 -0800 (PST)
Message-ID: <7de40e71-e2e5-49fd-93a3-245afdef8188@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 16:32:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241229152332.3068172-6-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J7vUeuvLiKsBwB9wU4neKf8ECAbuWB3J
X-Proofpoint-ORIG-GUID: J7vUeuvLiKsBwB9wU4neKf8ECAbuWB3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300135

On 29.12.2024 4:23 PM, Wasim Nazir wrote:
> Add device tree support for QCS9075 Ride & Ride-r3 boards.
> 
> QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> subsystem which is available in QCS9100, and it affects thermal
> management.
> 
> Also, between ride and ride-r3 ethernet phy is different.
> Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

+ Andrew

IIUC we have a similar case to

https://lore.kernel.org/linux-arm-msm/cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch/

here in the first file changed, please see below and let me know if
the rest makes sense for the networking part

Konrad

>  arch/arm64/boot/dts/qcom/Makefile            |  2 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
>  3 files changed, 94 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 78613a1bd34a..41cb2bbd3472 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> new file mode 100644
> index 000000000000..d9a8956d3a76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> +};
> +
> +&ethernet0 {
> +	phy-mode = "2500base-x";
> +};
> +
> +&ethernet1 {
> +	phy-mode = "2500base-x";
> +};
> +
> +&mdio {
> +	compatible = "snps,dwmac-mdio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: phy@8 {
> +		compatible = "ethernet-phy-id31c3.1c33";
> +		reg = <0x8>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +
> +	sgmii_phy1: phy@0 {
> +		compatible = "ethernet-phy-id31c3.1c33";
> +		reg = <0x0>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> new file mode 100644
> index 000000000000..3b524359a72d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> +};
> +
> +&ethernet0 {
> +	phy-mode = "sgmii";
> +};
> +
> +&ethernet1 {
> +	phy-mode = "sgmii";
> +};
> +
> +&mdio {
> +	compatible = "snps,dwmac-mdio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: phy@8 {
> +		compatible = "ethernet-phy-id0141.0dd4";
> +		reg = <0x8>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +
> +	sgmii_phy1: phy@a {
> +		compatible = "ethernet-phy-id0141.0dd4";
> +		reg = <0xa>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +};
> --
> 2.47.0
> 

