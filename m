Return-Path: <linux-arm-msm+bounces-58190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F1AB99A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8309E2376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 10:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3521823099C;
	Fri, 16 May 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKX+u9di"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1D2AE8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389826; cv=none; b=e5EM19wC6KeBDuQSaJayzFk5AYgtX0R8N20uQoQQH805yr7ty3uUKvIqAZ6jYsWeBC+Cz7asH+Qs2ySMzBj2x3Ip16ozOW8cD9W1tdNRjY2VQYVAcVirH6PXExPj0RHUaP+9ZjbZsfBns3b+JN/O5JSQm4kJukeMIwgALwE/iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389826; c=relaxed/simple;
	bh=lrexQhvrSA4eIFS/2VzVR5zjJAl/8AXo6hFi8KANLc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXyrBGTVt/fmJtSCUq4oKEeXGh46bc5EnCUzz3goJwXYoHmlbIoTAZnCEUtXqFOSRFUb58Mizvor2C1lse1U2GTyoqSN0WVAKn1UW3+3iZE/gDBQgaQyrKuVftc9izxHJ7n9eJPgreIS0xYCSZXCiK7RAZv89wH+swHZRKEJSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKX+u9di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G6N9CJ028294
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TaqrocneNA5gHeHz1uqPfsZCpYggCy4KBggZedF+E8=; b=bKX+u9diBlt/bTm0
	DMiuM4/aS4bEWDLoReBGhfix4+3ifA6T8qqudzXS4PMbeHDfYbQFYmJOVae0BgNO
	gYCKFTDZ2hpGC1ugwc9Cyxq79AM9I8uZspGuGzxvPbK4qVfu/695sM5axwCl1l/7
	v26Yxvl/tfKa7BV5sShvkGjigIxN/bgudB4uOq7RWpYBE1bGNorBOWaJ3/U7Gvd8
	DYd4s7dEakZdY326ciZuZ+uxz+l8TiVyqu6c0ksAJhbmgcyuJ3SPy/6oP45vpuVv
	+lZCFHpXJIAcPXyuXjdvXOPaS9tFihQdKBcHvQ/mMvW29BX/RA1nw2ERGXtiMiXq
	9fC6sw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n0kv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:03:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c547ab8273so38999585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 03:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389822; x=1747994622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TaqrocneNA5gHeHz1uqPfsZCpYggCy4KBggZedF+E8=;
        b=OOlj8nNlPW03ZWmNIWEawF06HmssIrwW4oGyPDdJDG2eoWdd0o06wUfrhJXNzYlEMi
         39eBDarThzEDEQgcV4w31sCX3Sl0/duKuW8NLSSAL27X9WvzywDuELDCEnJL9a32AgVW
         PGrCl1O9suo7jTicdUD5suB+5gxgdmDOPyw5CAHvjZp7/jFrAsh3SCR84zpdhTLkaxzZ
         BH2R09vJ2TtGh8Psud2nwii4IuYXZoqlxi6lF4vj/hEFzYzf/iEnUR1ybSy65fJp+Vl2
         ecLGNTIu8GIv4Zdy84qsyQ8xxCEFazAtqgBteuXK9lSzOUtELx9Tx7ferM1au+9VcAm5
         Q3Qg==
X-Gm-Message-State: AOJu0Yxuj6C8fKCAQ8LD5Fml3u8cGtSFddYB2QY/qIlQqVCR/BlfmiHg
	zD6CYekQwJOJC5+IvZAjhQiQsYNx+fPgtfpeDQ0d9ElLPChl4zPGaLe2VIui7mJKITg/vrOHXlk
	tfF/q8sd+NqYkBg87Z4AhvkRJ3Lb4VuebeI15K6jYr6SDyzgZ2A4xpZ1b1MD1PrxNsInz
X-Gm-Gg: ASbGnctOL5oif1YpmMkpWKzZ1r6qTunz7/MeiDqjHT3TCf2R1tdJhIiGJeAGsRq8PLd
	5umM8MSIqiM7a/gFjdMS3e92SMwI7mqCbLx+pYb6risGoyjDF9JrlXTaM8p8+KchzZovfi9JFkj
	Qw0RSyGqfmQIsHeYSjej5lXaPSWJ81kilMOV2nHyxPM3BktXxZAPr7M1T1REuz8iliC2en+mYFJ
	TemCGIeQQguTWsdzLlDp9FpWErWOgCIX/gJCRuLvhdSK+NwNgqtN4NR9oqMM+ruF02/L3SQ4sMZ
	JXfnSoBzcpWLLfD/QL+hNIaEn25glsePrnaoWF3rM9juj1PdwTZmTcn5M0fbrcbEVQ==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr18880796d6.1.1747389822306;
        Fri, 16 May 2025 03:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu4NBQ3Up5uG6/MJvur9vd8EnZx0WKlMAcJY8MkzmIHbw9TDd6bcUnooWcu1VHN8Nyj5f92w==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr18880586d6.1.1747389821846;
        Fri, 16 May 2025 03:03:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac35e33sm1148539a12.60.2025.05.16.03.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 03:03:41 -0700 (PDT)
Message-ID: <b9cc6e1f-9a20-4091-9071-4d6673a44fac@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
 <20250516-tb16-dt-v2-4-7c4996d58ed6@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-tb16-dt-v2-4-7c4996d58ed6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=68270d7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=umWwXBIl-rVG75nBen4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5NSBTYWx0ZWRfX5c9iEgH8ZzHF
 BJkRhEflngi16YmLlz1hB+iIOUMsFNY+MU04A/76DBClkswhvVUHYV/VQII26QEc3ZP1lH4Il0J
 Y9zmvOJusg7faVrvG6y9qMbw09/igTmEySzZ/tbCvcKRoRt1xkZX6+3BtyAWgEJjDRBQMrj+TL7
 zD55+gxyx1Jma0RYAvsTPZ/z9xAMBD+47ITS93PczpP7JRoM9a7UFVjXPkq6qwbx0zQS1TDUpkp
 9sYggpZBTLaYolrBVfuA2qUigQ2qLQy8551+iL4DE9X0pn9GSHb1K+HWkjWjEbbkd8SpnRpIfS+
 56weuWJItdYKViy1FM/MXylZc5fCFVArbaR29ox5UJOzRXjYNtVCr431Nfj7/Ti9pljXuUwZfuS
 JG/wF+xcMvmlAbM7TDFaKJLXkv6abafy/wb9MIYbP3SXJUxAWKoSMe9M9Wwp28i8VOBfNSyc
X-Proofpoint-ORIG-GUID: NlLsbqma6lXwztrvOBFjqvZpCVK97T57
X-Proofpoint-GUID: NlLsbqma6lXwztrvOBFjqvZpCVK97T57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160095

On 5/16/25 8:43 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Lenovo Thinkbook 16 G7 QOY

[...]

> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not the faster ones.

Please list which kinds work and which don't, maybe we can work it out

> (X1-45, apparently A730).

No.

> The SoC has 2 instead of 3 thermal sensor banks. I have disabled all sensors on
> the 3rd bank to get rid of dmesg errors. Many of these sensor nodes have a place
> on the remaining 2 banks, but I don't know which. So the thermal management is
> clearly incomplete, but the firmware monitoring the chip does a power off before
> overheating (not experienced yet). For the Thinkbook, it has a pretty decent fan
> that can develop some air flow, so maybe this has prevented the emergency cutoff.
> As a result of these unknowns, I had to modify x1e80100.dtsi and x1p42100.dtsi to
> delete the non-existend nodes.

Please remove these changes, the sensors are reassigned on the SoC, I'll send a
patch to fix that.

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +							<&tlmm 123 GPIO_ACTIVE_HIGH>;

broken indentation, please make sure you tab width is 8

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-LENOVO-ThinkBook-16";

I believe this one only comes in the P flavor

> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};
'co'dec < 'cp'u

[...]

> +	vreg_cam_5p0: regulator-cam-5p0 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_CAM_5P0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 44 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +		regulator-always-on;

always-on for camera.. spooky..

[...]

> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsuc8380.mbn";

This file won't work

[...]

> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +
> +	pinctrl-0 = <&qup_i2c2_data_clk>, <&tpad_default>, <&kybd_default>;

Please assign the pins to their specific users

[...]

> +&sdhc_2 {
> +	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l6b_1p8>;
> +//	bus-width = <4>;
> +//	no-sdio;
> +//	no-mmc;

bus width is set in the SoC dt, please either uncomment or drop the
other ones

Konrad

