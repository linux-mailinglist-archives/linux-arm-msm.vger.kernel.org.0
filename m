Return-Path: <linux-arm-msm+bounces-88282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7A5D0A3E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4A5E300E431
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 13:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C29B35BDBC;
	Fri,  9 Jan 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgoWrSH1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cj0C6FLD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D628C874
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964238; cv=none; b=qHQi6AHGnDTMjOjyyTqnWea7NIjyLZIJrJC8Y1GgZF12ZBtsxm6D7F3xxO7QUbA9vH98PDQMCXZCY9BkHAZd5e6agBZzz4g+ym0cUl+584PSGSjtJKvMhMuuRlDfrbfbXYMxVyAX08LrPEADnRH3vbzPRAeZES1FIu7fJ3By1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964238; c=relaxed/simple;
	bh=niAPPiQQQPX1D5kNh+Jjyf6MXYDSDaZSYDRJGQC5eJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWLmm7mKX8Mt9arg0sh5pBnkDuYbPmUf56+Nq5bb5ch7mqqGfZI+07pv0rHHdN3H5ybMeP3Oznf3HJa7+9vll7P9859JHFwQSlBTnyOFRWIvAExkGhU1Z43G3ewEUq4j4aQbm294Lu1o/lDN9H2i2YPwFeGGmdAyYD8Yb6OkvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgoWrSH1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cj0C6FLD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099Xgtb1048208
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 13:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jl3U4fYvP7BjbY7tR3WG+iIwGmMIyHgCmvFUBV6UyrQ=; b=KgoWrSH15VfHWdKm
	clYQA0cALEbOxYBeTqOR3dmLQ4zIp7enOHYYtADswN1lgMCVfO4fxxixLsTgeqKN
	fPVBu3u6XxrbRuDicmrsiyV/MfjyEWLgZEBtrrDKSAG6nLeaJtzu0vTpQGYurSUt
	27qPVjr6WtecXVNYTdr7VJN4ze7hba023oDUPDNfAiBNm7ho3hTWvZNcBO83Smnx
	BCz67MPqHebdQyGEjWdf6kI1SCkfYlbfsMUiCWORnFIrJl73R54bzOpJKMlh+2qF
	FYZ2IkdYRf9Swy+RcniHw7r1ky1hXcw8vk0CvjkyZYiqhyPHqNtLYUAPFtkoIRI2
	Dn3/nA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b8jgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 13:10:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso60309045ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767964234; x=1768569034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jl3U4fYvP7BjbY7tR3WG+iIwGmMIyHgCmvFUBV6UyrQ=;
        b=cj0C6FLD4NOuxEIX6tPDJcbH+lnpn9LNKOX687RGUQdrP6+R7J+eJP44ctVp9lLQGI
         pQHzRcTcGd6PXJNAFbpm0NTrL9CHOZBCGbinRx5RiHWqsHQhXrB7thAslU9dAc1SSJnT
         asMWeETUMnZgsLX+aagQrhvzQOiY1RKldGGanoTcAPGOSK8Aux4cdX91aqBmcohqqCMZ
         tl6NLgiFKVHh4y1Ro5w5uwAjwtpA9ybNdCSsitd/Oyzj2Oz1Y25gjzfNYFu4KRtv8CiP
         AAbqYQn2gqYiqEUzem0zOjXJnzRqy2dZ5zGcf580DQC1ZgfoHALrR35pPviKkwJmxu6p
         FJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964234; x=1768569034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl3U4fYvP7BjbY7tR3WG+iIwGmMIyHgCmvFUBV6UyrQ=;
        b=lHN1P2y5YH7UUvWSOTwUbHVHec8bLIj9A2XNv641QPBTDkKpFd26KCeYJ0ha/tUJ+i
         kWmmvz0kUuJmEWpiCxEhXVdS6ag+N0el/atAFPNCQxk6KjQpYVyCNhrKM/9N4REGQJ70
         V8dBZJMzL1pSKa3xCvzzkg3x3XQt4YiolCsVU8LabbL90bL38Gm4NaZYZe6fhUu/kqVL
         U3Yq6Qvo3DKMY33bWFyr3erH1pKe0m1fVDLZjLoeQbN+t0dcE0Ej5VeX4VtfadHSrTeA
         U/eJJBTsVNjt/HT4yK+rlKSK7Aw/XAXwXujq7tsCX9KUb5LOY14gQ2CIQKPySUeFPTEO
         +V2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3EcE0iqgHfGhs+rClxC7IjiZaaXVisu/lvfhhOzMcPNLSW52O9mTTcCrJ0K53U+aGMLQeL2/JJxb6zst@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMsmg7KJP+TZ+9SKM4fAnesQ/nJaKq2tBVPM5Q+oZzD2o+Jkb
	5QPHoJS+GZpP0cezXFZYRJ3LMoNF7zyUnqfs535LlmOtDwBYjiI3lXhdewd8CW8RkZZ0DeTLNrd
	MRdcZRtEyn0YdK3vxZHu42ntrM6RODYhVyTn1bWUiztwOsli1o1nwIARJorJQbHiXo6Y3
X-Gm-Gg: AY/fxX7FZ7zdD6eq1/gU4ka6/N7cvB3bzfBWv8ImMPin0Dm4M4CSXvuGsFIkw08x90Z
	EReMaWoHktvi81NHENLW/T8ZbLdGvbgFPNOSzhdBYXjFgf7kzItKL+LfFIneJIgGVmgXWjQa8OS
	7+jJY+fdVUG0oH0cCI9/fgPrfwZZFC3OXeG4CuCfukCU71GcC00P2w+T+v2STAu3OiesKNDtesB
	oNDw5/j4l+cF0HIZvqLP3+mVu6TCHSnvefCJwKfvWw19r2z86staE2/usfT0pv2gKhLX/0XoMbw
	7ydEmaT2HfDRKmi586Vfs8THOhfcS8fJ/I00m7b1Fs1Goj9ywCYh7s3h43feno7qtVeMtOo0Pmx
	CSzWvanQFCi+iWu/3w9GMkN8Bm3x8dCihc2V18aShwQ==
X-Received: by 2002:a17:902:daca:b0:2a0:da38:96d8 with SMTP id d9443c01a7336-2a3ee443bf0mr100105235ad.25.1767964234117;
        Fri, 09 Jan 2026 05:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrtGRjsnFeOWIo+8GBd5wdKaNe0W+5SXLW8YyqmBR006Uahe80W9Y7w4vCN+q28MK4q8OVgA==
X-Received: by 2002:a17:902:daca:b0:2a0:da38:96d8 with SMTP id d9443c01a7336-2a3ee443bf0mr100104825ad.25.1767964233610;
        Fri, 09 Jan 2026 05:10:33 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2b4dsm108346675ad.54.2026.01.09.05.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 05:10:32 -0800 (PST)
Message-ID: <6ebf45af-2236-4335-a2b4-6c75142bbd5e@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 18:40:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <20260109-agile-bear-of-fascination-cc4680-mkl@pengutronix.de>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260109-agile-bear-of-fascination-cc4680-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u-WEthfDHGzbJd8ZXazJZD_N6Xnt08oj
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=6960fe4b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2KV3BzIYt2orMVJPxDMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5OCBTYWx0ZWRfX3orDlPbNMzkz
 SadcKj1nOvADI1TvIwhF0GkZDcwKmoyyQyB19TIA8O72Jdt4+6rEBR+SIpR/W8YtfphFOtxPsbJ
 cTiO19Tso1NS/hCOSSgHb6J7ZTVxvYRaFpWnBJhfZUn5zEwIOycJ8V3PHZY2COTksTvJBO0Dt7t
 Gc7UrXdqFU5BmMC8VW3e6Dl3tQYABHKVcojbS4J3ytqx+LkzDXepWwxwBY8My+C944p9xWYQnz4
 JRt2uxmUk50OjPO6n4TKqeW3L2D7CnhTO5zWAh9XlRKeqVltRUL0QCij9FXNgCVR62x0nhlJm30
 t9fhGSSbdhJhuWo6LQphtMu05fBXBH2pjDAGPM/q7Pf/ZJnVy9MMn36xbkHTtiLtzjVa0TLDjJ5
 L2fN8GB4v4k/WWBte+3FtNvEfu+hJYDJCC11m28rnGJNYuTv9N6NZImlbJ0ZUBC0GjBPrJdPYbU
 OtOU5Jx2HZt/biFLXJQ==
X-Proofpoint-GUID: u-WEthfDHGzbJd8ZXazJZD_N6Xnt08oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090098



On 1/9/2026 2:22 PM, Marc Kleine-Budde wrote:
> On 08.01.2026 18:22:00, Viken Dadhaniya wrote:
>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>> Normal mode during boot.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index e3d2f01881ae..f2f2925e645a 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -44,6 +44,14 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>
>> +	clocks {
>> +		mcp2518fd_osc: can-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <40000000>;
>> +			#clock-cells = <0>;
> 
> Is the #clock-cells property needed?

Yes, #clock-cells is required for all clock providers, including
fixed-clock. For fixed-clock, it must be <0> since there are no arguments.
Omitting it will lead to schema validation errors and may break consumers
expecting a proper clock provider node.

> 
>> +		};
>> +	};
>> +
>>  	dp-connector {
>>  		compatible = "dp-connector";
>>  		label = "DP";
>> @@ -1151,6 +1159,28 @@ platform {
>>  	};
>>  };
>>
>> +&spi3 {
>> +	status = "okay";
>> +
>> +	can@0 {
>> +		compatible = "microchip,mcp2518fd";
>> +		reg = <0>;
>> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
>> +		clocks = <&mcp2518fd_osc>;
>> +		spi-max-frequency = <10000000>;
>> +		vdd-supply = <&vreg_l11c_2p8>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		gpio0-hog {
>> +			gpio-hog;
>> +			gpios = <0 GPIO_ACTIVE_LOW>;
>> +			output-high;
>> +			line-name = "mcp251xfd-gpio0";
> 
> If the CAN transceiver is connected to GPIO0, why not reflect that in
> the name of the line?

Ack, will update the GPIO line name in v2 to reflect the CAN transceiver
connection.

> 
> Marc
> 

