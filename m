Return-Path: <linux-arm-msm+bounces-84692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C8CADBDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 17:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4D3330146FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 16:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562592E6CB2;
	Mon,  8 Dec 2025 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYMwSlSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDlj00aN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA12E62D1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211094; cv=none; b=HPRjAICjsoHfgHflobctiqSwYhkAPysJaP7jYRiirRwfDY2NSCej7jyjRP9we2biT3H3UB5fuzEu1mK74dA1xaMkTtW47vro7anyh/wXfosifyLrb23Sc8zzOEI4EsyZ78MtuX2yywuN3UNymOxD/ef1f1g1DiGCodktlbV88RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211094; c=relaxed/simple;
	bh=almgfAY++tea3WTPIuZ78NuKU2RKEvsh2E4CuzT2GHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idsZlo5/gKwPT7EmkdD/flK8X+dnJ9k02JDHBdlrDHynr0lkkxr1uLxyhaHDcq/BFZXIPPL6VTVVbu2uUCfUBzWYBgMDSqE2JKvi1zVe2Gam2cXcO6QwkjHf54OcXp76ellvrgKXkW/l6hswwSfpX1HzG59HhKsjfoQgVXwHQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYMwSlSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDlj00aN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8FIljD3468228
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7me2leQ1cqtlufVuQIlX7w3FStqrPKixPDbfg56tl1w=; b=BYMwSlSJ6vEcqFZP
	0z0QJT+dS9H6zDBJfMLzsUu6KUuEImKnsnlDJon9AWj1DCpxAJv5phYwTUNsqBeN
	gkvUnx1Glyn2pM+Ooi0z9uMuWt5X2PKyOWfYRqxIfxHgn3/u2D7Pysq5Yqx3xu8N
	vNpvlRL8n+3p5m8LnhzoMQ7B7/G4VtkaFUzlz+wJSz7htulI5GSVbnbAatnmuu6U
	qUW02JttBnQV/rE2ErGNeuC5PVVEWv8H7EiS1Tkspi3CfUyTwSRAbSt5mMjQ+vel
	bz9ojLVK1+9FQ+gm5NCKqtOHxCqhW+wJ4kA9kp5RDwhoWzK7sp9WkH0iUcF399Gd
	kL7vIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awthp9k3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 16:24:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f030d18ed6so7090231cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765211091; x=1765815891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7me2leQ1cqtlufVuQIlX7w3FStqrPKixPDbfg56tl1w=;
        b=BDlj00aNpNQrtY0IzHO5PxsiT/KIzD8O0CAOpt7kCRWCxP9j6W1tR79Gur9vv9xx4h
         FgSDm1E/vXqBBcaZaAZWel9nBr9pv0Wo1qZs3Yb1aOiRYDKtmd947X6CFBeL3XjntVN/
         W6JRcX/uyRwfqo0k/QcJ8sYI6qibnKmHpy/oNxBwYnycLz4q1YsvrFREmFmBep5W2Idd
         fbsa5qIXOWuBd3CpJ+9a1lPI/VnZAF6gFcVs7MxWEVvyEBGy/yVBf94WWuG8T38eTkPD
         e8WZcpNMc3r/SUYhCgkbehLvyampZqXEi6diyBwPp1tkGiZln9MGQaKi6DFtEiRdcL7a
         UIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211091; x=1765815891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7me2leQ1cqtlufVuQIlX7w3FStqrPKixPDbfg56tl1w=;
        b=CtilQrjnoC8+l7kgsPZI8gFG01TRRF3K+Ya9GvgGi5ivZgErR+DvcPBRONxxedlg/L
         LQufJoR7Jy8UFXfmCuku8Vr15hfKcnREpIPsf9jDqaO4VpTK4Nmw1If4C/LHbE6ClvPm
         QGw5ufLWS4LeveAnUR3GctLzY/pjP6YhWYaUZOxhxAS79JM3k0FXgU5BbLLAjcoJMkOd
         ilTEiHCmglARLPRWkL6cC/1UqeuHypK/ZWXcF1VpQTeooF5ht6O68yvDeo+30r3yjTBa
         YkFkgkgN/XO4M09/B+Z6DLfSnHGdqe+sZk3pVCNhdci+4lSHKjzuTGBqPSJHEYPRzcHF
         6EZg==
X-Gm-Message-State: AOJu0YyKsZJIUKDrrR3eyRvMShthlY+WBSbdPi10NzJ0YEFUCaCnooaU
	bbaRd19Pj0PUEDHT10/2EL1zz5ztXBrGCsfmgngP3i0rZcP/VPzS0igju0iL0IxXMTqJJePCacU
	BW9e1DiH9InJq4E8sAe2ZOEPa2vjsWvu71EHOutTQggo2eI1MtLWXI2raIChfOIz5NHsi
X-Gm-Gg: ASbGncsH4VkwEgOWkMRCIKCDOJze0dVTWgEGjEXsodl3wKEPC/bVpHumSDE7pSzPmx5
	1Q2j+yTzp3mX4bXWc7qwhGYEcZkZskrFU3caknhiqHweoLl52rqH64PeNyYxjaXOpdQVH88KCrW
	Zy+G6r48Vnsoi9zKDlvh4n/vk6+f5x459RFd0odQcqEXAm6dbwWhs9pWxvbDffVKG4x1/y0lYYD
	4TizMOMa3YrmH8jLxKL1vJ5opoPz8cc04KX7Omuwt8jPRCrlzViNj8nAatsNPiIz6WKKyy9bJj7
	reKHmubohAiXNzeO1FcA95lh3aGwfR91uLSLWnrB1YbcDCYgxqk2R6PkGOOgPQNOjTlqQInhmOg
	A0iCw+8Yb1vWtILTeqkw1LhS69ViN+acp05+0Ryfa9vhP5A0AKfLftWml4NzjfFfcpw==
X-Received: by 2002:ac8:5814:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f03ff3581dmr92195761cf.10.1765211091009;
        Mon, 08 Dec 2025 08:24:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgmC2oeuPYfalxCUSKuki/0UvEgq0yLs1HEyCF05lanDFt86++4ts0bd8gCkFoyfFEDK9FFg==
X-Received: by 2002:ac8:5814:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f03ff3581dmr92195551cf.10.1765211090527;
        Mon, 08 Dec 2025 08:24:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368dc2asm10880707a12.20.2025.12.08.08.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:24:49 -0800 (PST)
Message-ID: <99a2f644-072f-4a81-9f22-73677637edff@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 17:24:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEzOCBTYWx0ZWRfXwMhaCxaT/o00
 l97xow6CUi2OPNoFKj0yrNvN/fYlcKqIH1IumKBsCGITISWdv6uXpr/VVaTvIGZhIsY5dUFEp13
 rfRtMe1jSNq8tJUv2pVEXBnKJbZ4Ai5q/LZqIRoM2xu4iU4MUdgLnC0qrZWNv4kp7k14emYEJfU
 DG1L3SapMU5gOzcEO8Ys6KAnehssfhz8xO8RAVjQcAl4Hc7dkv8CZsGmKE4Pb7ullnz5rwOqBgM
 ItStXKS0Y+eVRTR1cp1jWtvXM1RdWb2pSUqlmiuUTZJ1IQZpWSMverGUeYdF/I0+5CobKrqbDRF
 RJN3yEcDWFI1tPVYMh0EnmqmPoqfWB6dP/HOrF5KgH/MTC0ogBqZyi/sqyCJFY0UZk9ipbD58z6
 XPeiMhwAzLD0cxZ2qbmRm++bh3l2hg==
X-Proofpoint-GUID: JuxYIBjyAftMq6si43UTgvQacfhQaV_K
X-Authority-Analysis: v=2.4 cv=AL1K5/Xh c=1 sm=1 tr=0 ts=6936fbd4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SUmdLp-Ceo5kIVeehooA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JuxYIBjyAftMq6si43UTgvQacfhQaV_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080138

On 12/8/25 9:51 AM, Krishna Kurapati wrote:
> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
> regulator, controlled from PMIC GPIOs.
> 
> Add the necessary regulators and GPIO configuration to power these.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b..665983ed6714 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "hamoa-iot-som.dtsi"
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
> @@ -167,6 +168,26 @@ pmic_glink_ss2_con_sbu_in: endpoint {
>  		};
>  	};
>  
> +	regulator-usb3-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB3_VBUS";
> +		gpio = <&pm8550ve_9_gpios 4 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb3_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	regulator-usb6-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB6_VBUS";
> +		gpio = <&pm8550ve_9_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb6_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
>  	vreg_edp_3p3: regulator-edp-3p3 {

I just noticed - 'regulator-e'dp-3p3 < 'regulator-u'sbX-vbus..

Could you please resend and retain my rb?

Konrad

