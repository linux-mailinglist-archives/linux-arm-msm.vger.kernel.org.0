Return-Path: <linux-arm-msm+bounces-73629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33825B58CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 06:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0CB8320411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C95E221FC8;
	Tue, 16 Sep 2025 04:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LASI0Gdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA678212568
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757996388; cv=none; b=ai+TDbpfUv2fZJ+0BxGhMJpd+5ilOhDRnpwEjCqNQcS20k0CQkC7Ggk5/XtIrswzg+jBiqsKjZ3B2ZnIZeoqA803qreZ4qJURrIglXIfgj7GQ9pomorpI0KFP1/W3J/POlK/ZXr+hbtG95kh0BmesT72Gy0iwmfZgvCA3oixPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757996388; c=relaxed/simple;
	bh=ZkhiQNS/ERWY+DeFuB3R+OOmnmRfw0gdxl5NPoVNeNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e84uxJvQ+7HhkBukboJvwR5VEmXZTzsxTIOQfP6WNrCVW8H8V59EXrvgCMn3neTML7n2pP2VTguOn4+yVKJe5NzYeHawsf8FasPj4Uhq7cVkBWcoORFeDEPPdYzscKs/7VlsQTXyY09BsM2kyBplUg1XYYN33H+meqMWInxkdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LASI0Gdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3piMh012549
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MNr2Oj/tB1HY5U5Py6BYHrc+/3H8dyW7TLhuRk0Sr0=; b=LASI0GdmddYWyaqP
	MD5f4hJd1DZI0gfl9JtKVuYM+H6vUYnls353z7XCon6HfO/zH06O4knR8k01X8hC
	C/I17RSEKQxDGePj3yW+FEFd+bF3ZH5DIb3+uULEybgLyH78tfDiuYLDRmgjB0JP
	SnpUboorfJ9G/ADfMeYshnskZG1DoVAkBN9okNBG/xA6EB9EKySXnxSur7+AUKWC
	GQegr6Jcc1AB9xZPt/Cf0avrcPdHhj+C5W265sgXaq1szBHR+e48Q/qO6eU/RLz6
	oeJUk5J05twNyQRgRyVYGFONPXeLCSjEuMzJ519zyQ69MA6p8AvJvNl8ZVWS3xtO
	vaP2kA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072qbt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:19:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b521995d498so3664554a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996384; x=1758601184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MNr2Oj/tB1HY5U5Py6BYHrc+/3H8dyW7TLhuRk0Sr0=;
        b=M/QSc0ucm38dmLpxhqt/zbbPgjVT//lJTMPGzvt21Hh9XOmjIdMzeF/N7VeOkegRVo
         5ecLTRzXVgSknshC6PL1hDxaQfXKezhQZhCMa2OhiJ/cPztFrL1x0SmEwOxdSnk47jRM
         +kuqrOnbdp9y5ykJG0bsoNY0Yz2YF0UcTOGjxcS+qXPB+bE+mUr6bekSRNzU54SQjozk
         27PqAKqcCqZYnAI7GeSq7ycVzeKId2OoFQBE8NehWe+3+rPuLSkEKijnMQt5geKHSFPd
         MtqInIhEmoXxwFNr9CFasl9R94eWzp646Ke21YlVVW6t0HHqYRj52no81h0v/5yxe7xL
         qD6A==
X-Forwarded-Encrypted: i=1; AJvYcCUu67fso4feYKt9Y1I4QFDnm4ThkMDzQyK2dp+9EDehk7eJgpsdFNuaejnHQvm6FxIJa3UYjhQeD3i9+jmm@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6WnpUoijno5FkC+PYhO7YCW39JC+/eqCyIdhUYLe7e6SAu7N
	RpGaRJzPC/hYLMYO7BOSalvgEczx52trgpPoDJCTCTWBoXmEBoBF0NI0xBhIqlloqG/WFcCT0yU
	AR+rfe8adt5zv2ee2tpzYuE+Czy+ftKaRTB9/PDdZLckS2XNw2hBzQbHHUy1fxaXiMp2U
X-Gm-Gg: ASbGncuSXxn3iklVu08hx93ztJBX3/rehwgmTmSBFsFWRABGKkYTlrEwRknYXIpplSa
	hmiZpVNLLQDTTwtb/8QAyDVkcbH7k8JSf48Frl7z81K9RXV3rY2zLHvV/DQ1fUKaBdzB1J1SDcS
	6m73cwY+Py3mZkHva8Tr0WB0bqAKHmjH7Ma8kmxOy2DGGiqwth4ACQciUPfvhGi4D9AY4kPF+jL
	+8I41hYPzL+mO4WqFEJug6wa3H45wy2GB8EqPejO4LUfdwNxuZewCpEbYseNaQpxfj/xhZy5ls/
	hB89FRrSMyWjWCG/RdtGW4SprA4nTCO+TNXxSyuKqGWRQYyC9hBJ2aQ1ECdlPicnWqes/HImKs6
	7PzBncUuHbMZZGH5i/Hhy3wDkEVBG1r5jww==
X-Received: by 2002:a17:903:22c9:b0:246:76ed:e25d with SMTP id d9443c01a7336-25d26a59647mr179877595ad.50.1757996384185;
        Mon, 15 Sep 2025 21:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV2LGxyMNtHNxIrsEsX9rK5fGWOmHILbA5HtUYr+apFXMFMtF4naZaW43tFzS64M44vPJAxg==
X-Received: by 2002:a17:903:22c9:b0:246:76ed:e25d with SMTP id d9443c01a7336-25d26a59647mr179877275ad.50.1757996383660;
        Mon, 15 Sep 2025 21:19:43 -0700 (PDT)
Received: from [10.133.33.244] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25e2fb546f9sm111530415ad.127.2025.09.15.21.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 21:19:43 -0700 (PDT)
Message-ID: <254d7d75-fa02-4bca-accf-4567b9dbf673@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 12:19:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <aMPhEm8PuhEofHP7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfXyYMRfe0SDYFu
 cc0o6vVxS5cqkPQfLcMopgamsHgHkAxvEE1ZHWJdv5vtMubkZV/kHhYPRv2AQeaWp+7s58HUby3
 xyjxICOmRhIUsIxJsG0K+gfzXCQsDJfK7MJNBfwkszrB1fPxmU/rpa4AKKhp8E+e5fnIHbj1WBw
 yTjsFxAIHKOKgIgDEFG8k4dVFlGVgaOAIQbTsd/2P1ILcReZBb6p4GlcDYFwXK8GIVMX00HqUD4
 d7U3yYUR+brH9I1CuJV58OgA1purxB0wuaux1uEStzzHYSjLjdUkyzWQYaiVJ73WPWbmEZtuV2p
 4x0FwDpZSLvRSQPOfP3kznGYvJBan7mcUkTc5C+GbI5tY9trVRdzkuDbE6sRExNqyOHA9EgVUvS
 MrdM8wEy
X-Proofpoint-GUID: tsyPh15b5dH098rJ7RiANWeTqXHmm70k
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c8e561 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=BKfv3jXuzfWu8byZeJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tsyPh15b5dH098rJ7RiANWeTqXHmm70k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025



On 2025-09-12 17:00, Stephan Gerhold wrote:
> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> Make the following peripherals on the carrier board enabled:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - WLAN
>> - Audio
>>
>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
> 
> This looks like you should have Co-developed-by: tags together with
> their Signed-off-by: tags.

Same with 3/4.

> 
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
>>   2 files changed, 1222 insertions(+)
>>
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> new file mode 100644
>> index 000000000000..6eedad7e858a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -0,0 +1,1221 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "hamoa-iot-som.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
>> +	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
>> +	chassis-type = "embedded";
>> +
>> [...]
>> +	/*
>> +	 * TODO: These two regulators are actually part of the removable M.2
>> +	 * card and not the CRD mainboard. Need to describe this differently.
> 
> This is not a CRD, I think?

I will update.

> 
>> +	 * Functionally it works correctly, because all we need to do is to
>> +	 * turn on the actual 3.3V supply above.
>> +	 */
>> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_0P95";
>> +		regulator-min-microvolt = <950000>;
>> +		regulator-max-microvolt = <950000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_1p9: regulator-wcn-1p9 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_1P9";
>> +		regulator-min-microvolt = <1900000>;
>> +		regulator-max-microvolt = <1900000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&wcn_sw_en>;
>> +		pinctrl-names = "default";
>> +
> 
> regulator-boot-on?
> 
>> +		regulator-always-on;
>> +	};
>> +
>> [...]
>> +};
>> +
>> [...]
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <0 1>;
> 
> This is unneeded unless you really want to limit this to just 2 lanes.
> x1e80100.dtsi specifies 4 lanes by default.

Great reminder! I’ll rebase on top of the latest code.

> 
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp1 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp1_out {
>> +	data-lanes = <0 1>;
> 
> Same here.
> 
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp2 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp2_out {
>> +	data-lanes = <0 1>;
> 
> And here.
> 
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp3 {
>> +	/delete-property/ #sound-dai-cells;
> 
> You need to define pinctrl for the HPD pin here.

Will do.

> 
> Thanks,
> Stephan

-- 
Best Regards,
Yijie


