Return-Path: <linux-arm-msm+bounces-72700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E4B4A549
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B351BC337F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7665323AB8A;
	Tue,  9 Sep 2025 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXecIJdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608D1F8677
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406698; cv=none; b=eRl+eWyMMJhA0u23B7rS6SiDI6HD93rlCSRAY0n6xAPILUgcSNLxeb8sPXVw9yic7G2WBmaakWS+49xNtKckue5xHwckn5kwEnYiP5bBn/+MzqT3bjz4Ji53kGpZaGHEb3WxsS/ES4AQC9X0iyNP3wBc3T/yvWIIhMx+afgmmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406698; c=relaxed/simple;
	bh=Q3tkmiFsZJm37YxiC2B+AnN9v8rzwEJsKzvyIscck8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFzJ5U+A57URhwIMOC68lAmW4eVUQST5fCXIGNpXQ/rU1N6BZl/STO/S6S95dfkzFi6xcctMkjenQLU7rJDGij0e+ZXfUmYXfhfm0eZJ8Ty0NTF3B8S5Kvs+eE/yEMzoSwDBFW/KsHVV7hkkU+4VFkzlF0q2Cnj24NfT7K7N4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXecIJdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SjS5027748
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7eITHZjo81f81b5RbKzWZ5Utg4ySiLXReDKdi+aAZk=; b=OXecIJdmhLNXRsX9
	97HOkojdeBBfs3VJ8ArdF+MybavsBOIkKvscuENImJT7T+FZSbF/0TXkjYx7VFt4
	dioYLMck09m/UDp4g28tVVbJumDGos3g+pXUzp0kVH+D4FGlnkJ577PfLhOj+/V9
	v0/sDc87Oj6sts8jVd1rAg8y3fgeYgP9RdxXWvD+tfjWhloqA1i+lvECBcy2H/sc
	6YlLOU/2eq94Df3j3mcUN6vFtuMeVTWde6d0ByVDZ8OQ4O9CYbFQAUPJ+YrI9eup
	L87igay6e842zCEYR1d/X/Xlaj4qVD8PvLL5wcHPv3nFi9AlyxJO5rOR/skCWb+6
	oWT3tw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j7m7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:31:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso26442371cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757406695; x=1758011495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7eITHZjo81f81b5RbKzWZ5Utg4ySiLXReDKdi+aAZk=;
        b=lt3zBIAUbjwNE+7atpLNMus/JNjkuhUX50fFDu4XruNTja3SD9nLElfNZBULKq5s5P
         I+u1XV7FMxlB/zjhUWx50kuqVAu9SjvAeiRcyLOF0LYKrGs2LBnVMN+6YkEt6/BBfImH
         qj4XT7uLgoZ5lSPu7LezMOZcg21EjAXWEDsY+BOooCWDi4NzJX2ehzFKjATRYwTltpQ7
         ry4WofVwDPIit8HSyhEx9xAUoRMXu1ApLbSt8gA4/ynVBCGgBlhjdQ2cn/ShLcQZfBjS
         u8IKoHcCFwyE4klSbJ0bqXdp3kD6mTh1GjM8fbH4jyvtCu4ZzXBWmaNdiCsgeBW4y6wa
         fUWQ==
X-Gm-Message-State: AOJu0Yzn8wnpmSMk2wGJxJlLBrYx00M5MxUuTc+LKJfE7KuBHRskKbGu
	QV9ArCfB9JANwB91NAEOUgxNoS+ro8KgQcG79VV7pRb9leDWC3p7i8B1Az1X8qeiZc6BoRESd7q
	iX5kyEzbTz45/T6T1mC5xKjquecKC74SkuCN2tgzC3zU0qg9fQp+FLtOT0qMEvZ3KES5u
X-Gm-Gg: ASbGncszDb8W5EV5DQjZXExjkGDmSxxBpTgcQ0uXsLklJG/72AOop0IP2m2bdDqc7HY
	gerY3qltVIQqxHMje3tDUshtPzuQ4gjCPhm5ijTHksBH2VXRwDqjDnQanRnAa/ZHecHpRv7Qdxy
	800nO/28cim+mqC72YddNHfU1jtWI4TXNLByKJVt8N5GVeHnICmwkajoFsyH2GyhW1JBcfxe7SA
	8p2+2lnW+baUV8YTCVx/Q29LdhS1IYsk14qVJCn6vhzUiaaSL6Yej3AcXw67lupnulGyPO+MpU5
	MqvfGncWdq9XoCdf4ppYniD/9IKJuAMTDKpEJaokrrXsAAf82jV+XwjaiZLrBfdZq6S7yYLvV7j
	1mpMT8mIT6TyMEqVKHj49uw==
X-Received: by 2002:a05:622a:409:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5f824786cmr71643981cf.0.1757406694457;
        Tue, 09 Sep 2025 01:31:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw4k1HxsrxxCB989pCSBZXp1N3A5thT3d8CW6byohkVI2BrFWDomLFgQWaPLslSwKMDUaaAw==
X-Received: by 2002:a05:622a:409:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5f824786cmr71643811cf.0.1757406693919;
        Tue, 09 Sep 2025 01:31:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046eb335f5sm1400382866b.28.2025.09.09.01.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:31:33 -0700 (PDT)
Message-ID: <c1dff274-4b71-4d18-be2d-eb5959111243@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
 <20250909-hamoa_initial-v10-4-ec10057ffcd2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-hamoa_initial-v10-4-ec10057ffcd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX/x37h96iLWke
 2KHE5nlEdQ4Z3ghtwcybdI9dfPJx9UoBvYnw2apWYmyshpCCj+W5A8q+SgnPxI6V/0oUAVE73SR
 F/bSAdSIgtxlceArHJ/ROB71TRCyeRdSj4kegPlL+2cEyrXdu3JWjSDYxUrFAfwnWNKDJVhIi9g
 AOJ1J3cJMuPSuiHqGf7QWq8i5ZeoEhHILSEMIgu59tUWDEnucNyTraP5BPpuFiW6+DEsaqca93Z
 TNp0a001SR+8cXnl4kGe9SIrmFn4VyZi1Q3d97e4bKPKtv1EBVgkzpJoxc9wziQdc5WvqWCnTaP
 cpOLiBesOmBK4nKRMAgXQIeFz6v354zk+k5DyxHNkqCI0hIjhCk0KmBeDxlr09S2qr+GO2IR6Uj
 YABd+DNh
X-Proofpoint-ORIG-GUID: kC7pHz4Juh5k1w8GhyhKFJ0za62lyTza
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bfe5e7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Kyid7Z_SZgMD8xIH7KUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kC7pHz4Juh5k1w8GhyhKFJ0za62lyTza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/9/25 5:56 AM, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - WLAN
> - Audio
> 
> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-EVK";
> +		audio-routing = "WooferLeft IN",
> +				"WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN",
> +				"WSA WSA_SPK2 OUT",
> +				"WooferRight IN",
> +				"WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN",
> +				"WSA2 WSA_SPK2 OUT",
> +				"IN1_HPHL",
> +				"HPHL_OUT",
> +				"IN2_HPHR",
> +				"HPHR_OUT",
> +				"AMIC2",
> +				"MIC BIAS2",
> +				"VA DMIC0",
> +				"MIC BIAS3",
> +				"VA DMIC1",
> +				"MIC BIAS3",
> +				"VA DMIC2",
> +				"MIC BIAS1",
> +				"VA DMIC3",
> +				"MIC BIAS1",
> +				"VA DMIC0",
> +				"VA MIC BIAS3",
> +				"VA DMIC1",
> +				"VA MIC BIAS3",
> +				"VA DMIC2",
> +				"VA MIC BIAS1",
> +				"VA DMIC3",
> +				"VA MIC BIAS1",
> +				"TX SWR_INPUT1",
> +				"ADC2_OUTPUT";

It's good to write these entries in pairs, as that's what they
correspond to.

Please also take a look at this commit:
b49e37de8e70 ("arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies")

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";

A '\n' before status is customary

[...]

> +&usb_mp_hsphy0 {
> +	phys = <&eusb6_repeater>;
> +};
> +
> +&usb_mp_hsphy1 {
> +	phys = <&eusb3_repeater>;
> +};

See:

https://lore.kernel.org/linux-arm-msm/20250819-x1e80100-fix-usb-mp-repeaters-v1-4-0f8c186458d3@linaro.org/

Konrad

