Return-Path: <linux-arm-msm+bounces-88279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9099DD0A57C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF64A302D6E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D4235B157;
	Fri,  9 Jan 2026 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkncIn2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lp0ve6UP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882A33A712
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963358; cv=none; b=MDwGn9QYgUWaRXsmhAfd+5WBFERt5Bfweq6kQnA3aDRu8LCRAC854MY6caQzhMBjr2qwhTRieD0GTkDPj1T81jmra6+Oa/bsXcPoCa6o2lTFsAohON0uLunvOwnCmuj97RFaj0KjeIqGF7Mb8L0t4qZLDB2PC/DOU+ez1rBaILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963358; c=relaxed/simple;
	bh=Ug4/iKld1hZF0G/aMDskAl/jEyBcg7VXYNJFY3DRVGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVfQhuh8kf29rpQ7bYDhF7fuHZ5l8kYxbVYxV/21R4OxCAAfFtvF11OhaqXAapYCN+mOYUxo2KtGq7EfqOk9eslDngK8uLZIv4VcwIMhWRYLjpD4y+N3wPloSyaP3xhlvxlYICDhPgCnGiM1p3Yv+QSZfM9WIkdzWk21nPWw+ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkncIn2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lp0ve6UP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098NvqF3727469
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y7QZR0Y9/fOdrnWjQpdxPYv0mAMnGM70MwSvMlGLYs=; b=RkncIn2UTruWCupw
	clCSKllpY7yTzEhrAdWwoVw8weNkIeUOlcUnLzU+gMt6ag5H/GlFLvAcBzHd4FsU
	9M1YVSBOPTZBNSaTPzdr65Dg1BxDHKhWiTYTxpO+d1NmNxdudPyAZtY587Xhk66m
	UIM9NGptQITosuCkjgSSjTun9RUmaaqioXJFpnD3cz83nLGkkFBXn/TBZbMm83In
	YcoZIg7MvVgGIca8Te0tY0CntMROR0nSWt4iXgjNw4KNNMCNrWnC/xBZs/IcKwbi
	h5Jesg4Bvggihay0ZUGl4LKVHUqQv/TW7eE5U76uQVJJkyEiZQX+wcHeo+xSqfE5
	9biG/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkj3be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:55:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso90212775ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767963355; x=1768568155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4y7QZR0Y9/fOdrnWjQpdxPYv0mAMnGM70MwSvMlGLYs=;
        b=Lp0ve6UPzdMSHUDU8uM7hAJBsQmzDLVp/NHzNyQjiujpLEhIoeGpqu41BnNbSgQq1E
         noXQ8V0/xibmOaUF2eC1qLJkID8400hECedUZSxf/ph8SD/q7nwqIM0AQ16Ke8pL3aAF
         Ea0kCGGgwAs/+p90x+J5nXBH/j7pLaNDDz4B7lAX5lB87DHzNri9oHnOqc1vKOMrU/Gu
         ZIj1U01Oz6+Anhm77W80egyUwqvWXzAB4u3ISIH+ZZrl0CM6Q5wKrTSl3plIkHQ2A3mS
         L0iIvOTVARraz6k4/qzQkRy/xPzrE8lhjC57EY5aFkN6Mwm7EWZSp1E4bjwrFR2Xj05d
         fg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963355; x=1768568155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4y7QZR0Y9/fOdrnWjQpdxPYv0mAMnGM70MwSvMlGLYs=;
        b=w1KCk2iPWvEo3uOP37hp25fA0tOFz1OFSo4YufZ6vKuPzYHxAfbKuhMHI6znJ9QqoS
         lTASHqVtu0rO3x3kye7Jj2FG0z0RVN8nSHFElso55q/jQI1k0d9J/T5r7f40rlKHVk2k
         P51Yh5M9Z/u7MLOk3UldU8pfZPzzbeJL+C3izyQ08dKAA+3wGRaGOIyPNUi1axFKidW2
         SF15UoY0meFX/ryETIHmPWqJNAHauQC5mpzY2/whpBfNvkFoeO7Dw7J+9G7O9zc31ohE
         /g2+1oZaaeAUoTGttR3zFqHMzcFqr5C5VNL/EfUTr09qA/Z9903qbEOHwk4+O/pV0+0m
         UebA==
X-Forwarded-Encrypted: i=1; AJvYcCXrSEB4z3x7ZJEg+krc1RRVGOAnoFoOGKPUo9JJx7Bqy0rNDULKWvu/kx6Pyhqd1WOh2mWsZblWpgqcVdk3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3BdkX/efKo4x0gXX2xXm1UJOlfKFIAi0MBREy0f2UTfmCWgHe
	1+ZzhOmvEYx0OEB5ntZMFMXk0usU3x6opsk+rihPiSuO/Frcj7IVp2oK/rMqDtxDaq8BskqrDLb
	31F4Ng4r61K9We9Rpa0RkNZhHJiIvBkxZXMprCWb8tT+ajsSfT92v+D53VaAioWJjs3a7
X-Gm-Gg: AY/fxX7oPFkXcTyopvdZmwoJ+xLrQkQF3a7mWpXm0nidfrdeZoAMYoMmmwRhroVhtI2
	1JMqxH/jYPHj3wPCl+v2SlceKJt3apjv9DjkZZ2lg6z9DeK/J2dL3r2jv4BGYkrn5E6gZhbUtdW
	N24Yo41DnqAaRRfz22QwLY1lWP8pMwKyErPA5S2Qqzf3DfrG2EwkqdTPI9T27q73IXxaymmvOkC
	tJmuvTYelVvbj5BxDicE13yUVZ/ESIAJXpiRGDUwnXgbjBbmy58Ec+tUJ+n2cQ+35BtRQdL79XA
	8SRBDtJ/fVZGSPv8WygcWUWsPZ84pIVDGHvg6XbNnYBZo+GqogGmDW6jNd+lYK2ZikNAiio4DO+
	4KLDPe0PC7n131t4LWRWO9awCWOZOxt/t+8svVFbNTQ==
X-Received: by 2002:a17:902:da90:b0:2a3:e7b6:ab53 with SMTP id d9443c01a7336-2a3ee429ad9mr96438905ad.22.1767963354573;
        Fri, 09 Jan 2026 04:55:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRvPFaCk3aiZqPxKoB2BhMRvNe5PxgAssVJoc1Z/IpEWtlXCJngS5jtmKYMCSdRK/RKZ6LhQ==
X-Received: by 2002:a17:902:da90:b0:2a3:e7b6:ab53 with SMTP id d9443c01a7336-2a3ee429ad9mr96438575ad.22.1767963354104;
        Fri, 09 Jan 2026 04:55:54 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2eabsm104022635ad.49.2026.01.09.04.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 04:55:53 -0800 (PST)
Message-ID: <76ef0674-ba19-4d91-b243-bb338d5f9d59@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 18:25:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mkl@pengutronix.de, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <jlynppc5lspzcc2pkz7y6jgd6h2l7e6cparntvxnyx5rnfp54n@tymil62yg4go>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <jlynppc5lspzcc2pkz7y6jgd6h2l7e6cparntvxnyx5rnfp54n@tymil62yg4go>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960fadb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nFdRy7DZwwtMklkiA8EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZmWFcL5-yHheT1cUQ6_ngmvTdJo3_5J1
X-Proofpoint-ORIG-GUID: ZmWFcL5-yHheT1cUQ6_ngmvTdJo3_5J1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NSBTYWx0ZWRfX4cVSXAZrHi3O
 N+5B4DX5v68ym8IDNOCFGb4pDiRvITbEVbHIrT92DEPUkC3Lz1axo4EKzTBUKnbhF6krdBP160Y
 IvGhdYg6XgOOzVwgmHYZ5UP5B6fKoUTRH78xPNvw8hqJlqfE5xVBej4GikfC3yAndD0hzbZAe2W
 byUimG0FY3eb0XnxryB1eFFD/3RUvtG4PwEQU/KWX3U7fEBAEn283Ok+4yntSvDKd+ft7JDcYf2
 OOmD/ACkCHGgAgFPX8+YRa1qUCRCJUJjqhBZM3lsiONKqN5ZPa+wI4k3oydqzSKUMHq+/xOcd8Z
 LijRVKAOgLrB6kNN6RvcwA6Wa9wcpE2uagZMTvapKMAioLu+w3x66G8+wEg2BHUyYboOCiyNoXw
 xGrauoggIqU4foNef7adCfQen6y62ksYPCfCxq9iW54C+gbnGE7EpK32AQEhrKta5BhzOjzavpf
 tF5bB6M7NiNbJ/ixGbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090095



On 1/8/2026 10:16 PM, Manivannan Sadhasivam wrote:
> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>> Normal mode during boot.
>>
> 
> It'd be worth mentioning how you tested the controller.

Sure, I will include the testing details in v2. Thanks for the suggestion.

> 
> - Mani
> 
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
>> +		};
>> +	};
>> +};
>> +
>>  &swr2 {
>>  	status = "okay";
>>  
>> -- 
>> 2.34.1
>>
> 

