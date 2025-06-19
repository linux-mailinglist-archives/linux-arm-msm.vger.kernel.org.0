Return-Path: <linux-arm-msm+bounces-61794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E14ADFF64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 10:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 572F33A18F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 08:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB27253B43;
	Thu, 19 Jun 2025 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+1PGMhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547D195B1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320299; cv=none; b=eS8V5WvHWaECCl/ZD1GnbQIJkZfbpxfRkM8Xz/89VHPlzDbBIisRACpOE71wHM0WUSLYvIgKAsjzZ0pIYt/8DwxANkLB66Ia+CZhJpBlhbgKQQWonebvAZyrGwWKj/5gx0XY5Y2s5rbgnWN4O+zvwuf7i+7SKUs2ywRY5lW7DN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320299; c=relaxed/simple;
	bh=PbpTuz4WTa28cFpAxtpOHQNwNhJ0jkygBok3OeWvnoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i6HaWtRDYAyQZm9c5K6iCeRkoxfkiEY2wW/qCxe4VTia5fS1793MKdi4o0g3+Z5pLx5///JDLZkAM8lA/7hM/BU+rO5Wkd/jyR6HbXxApcF6kAXy6JWpH+ibGx+QxIj12DPKJwrPMye3WGytN6mbWAZVJAeGqZDbS5jh6WNFE9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+1PGMhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J686uF015004
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 08:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5CbaYk82IflDePG5vYT+cBebOeLvhXszPekPl5GZ2g=; b=i+1PGMhfpRspR4H3
	WDFJVrXsmTNkhW7gw6r4LfxvGRv3y/HmOeHN4FnQb/l7BgzaeMOZgGjLPhLPucZm
	hrEb02cLBHd9AG/uC5DUVjDjuttrWpTjLVCU5XpiJvei9oTDyhLbz/Bxy1M0VtMH
	sUNhfyVEJsuAJBUED3fYFI8wvqD4Onim1BhQd6bwuUIvBIQOfiswDqC1OGysjqCg
	/mFqedjpI12RLGlw8GSnD/KkRiSg893FKk199dG9bu/YwM4ankAVhHVnSLAQrYA7
	w5ytGDkBWHS9CT3SNAAqmVbogPy3udWxvPt9E1y2niP7hcPtLkYtSwQq7uPyeRgH
	+qfi0g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9f31e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 08:04:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31c9a9dcc3so689224a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 01:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320295; x=1750925095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5CbaYk82IflDePG5vYT+cBebOeLvhXszPekPl5GZ2g=;
        b=w9luhBI965a649sIutX5KU8rY8SPvOzITwtnckI0Q4dQ7U5zOe+Dr6N0B/dLntRFkP
         70nai0Etr6dfdQf4QHniHWMSeWLEmzqN9rD75ONgNoAR/1+OJLo4YhOmRI8tB4HeR+Lo
         KsI2EtV1kLMlcEQeFLNp7iN4ZzAnawDP1WvhtUvdLF0Y2Ck4dRfq9etQtN4xi6pzb1xO
         7DemITUbwIkByx+HY9FGs4FYbi3ZooYsxoq/7B7ISR9JNlzOPtp6WOzbji0tX/WUACUG
         2YarJlal+20Ca5gccvx39NAF4AMTUBbc9Bh43qolmCS0eoU7TDeDZiS+Ie3L0UHqC3Xd
         4eyQ==
X-Gm-Message-State: AOJu0YxGSXbLI4n0xH3ooIXPEn9JoNfQrOiNtq7LdY5Q6iwHY39wdWDg
	EJrJcf4XzrfZZXc9ft4zEG2FfbgkAQlzrmovIfvIb/o/yAyXZONzuoG9PdCSIWGf0eGT80+qLRg
	k3GrN2a53BS6B8j7wSovC5KX3t4IJZMvvO5wLdm6JG4ZMm5mhbr53k6+uhQjAs/5RgFfO
X-Gm-Gg: ASbGncsWasEVVYRAQrzc4lIF762O7sWgNuJGhoFbxE7930YMTnRm+mGFzicTfTNsGWN
	RjStsWaynYpNwod/RiiBsb70yXLUgfSbCZIeSt4Td6Jv2w9ozWIoevE7/DJbh8yxGny3dD6EB/U
	nFawJ5nD4FNCwE51d8UFGBaL9sivzyHzuFBWKl5PyMO7SzwKL8K2rD0gRzQg1Q9oURpgbS7Oblx
	W9l0XSfZML7DLPbKYDlFPoPWHMsl0Ih9fCU5UcUJ8y4s+EaPVam79rzwr7PmuBSo6JL7Uhlf/Xd
	m6fXX7QGiyLqFNjh9lsbSItsTYv5zFFUdfl9KgTh4Scv5X2Yj0dwZTnWUD/L
X-Received: by 2002:a17:902:e94c:b0:234:df51:d16c with SMTP id d9443c01a7336-2366b149ff4mr331118535ad.45.1750320295208;
        Thu, 19 Jun 2025 01:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY1beQgQr3/xXUKU2HPw/CdQ0Sirtdrq7sSeNKyvBRqo0slYfZrHuVzsUs/ENA+cfekMDTEQ==
X-Received: by 2002:a17:902:e94c:b0:234:df51:d16c with SMTP id d9443c01a7336-2366b149ff4mr331118135ad.45.1750320294704;
        Thu, 19 Jun 2025 01:04:54 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb2ce2sm114714615ad.161.2025.06.19.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:04:54 -0700 (PDT)
Message-ID: <073c293c-325c-484e-b843-80e254716d7c@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 13:34:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <6463f18d-b258-4773-aa12-d3ae3af60715@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <6463f18d-b258-4773-aa12-d3ae3af60715@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S89-KZg_HTqH9Cthc_1rK4ai6fLf0Yy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2NyBTYWx0ZWRfXyVc/kZCGTX14
 iM6y4xyTP4zl6w8S2hRiiOIgre9VPhn9aw+I0d/oDrpqv99RcrRdwaKbe6Ehu+n3/KIZ556OSB+
 ZHojiFnWknEy1ue47sl8vkxQ2LXzOApvj6Rd/hhQ8XEv1YqzRvfshxSzVRXOpS0VQI9T4dDtUWv
 eQUEvlp0SyMLVPBFwMw8Q5whPuDHBjfY0/FmqyW8BEX6WzXEry5O9are9+oIWokb2NLwjfNfol9
 2Pqk8X60KLnSAbIYyx/J/EjPStmPDvhE2z5GqAPG38ffMoqCQi0OLjFPE3bCZzN4Ac31CBVz0eT
 ekV911N2SX5gZqSa0iRVEmnb/Y3UVAHgYbeC7mJxIH/jLNo9lG9rMTk0Afj9y8YUjJ1wnmK8fge
 GUYFP3yfGfZbv9o/GHN0cxmmPyAlAa9hrybU6UCdVJ/q1a/Lm5xI8jOi8sisftoH0mp4N93f
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6853c4a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yNxIl_n-nE1iyR5tU-sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: S89-KZg_HTqH9Cthc_1rK4ai6fLf0Yy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=994
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190067



On 6/16/2025 4:54 PM, Dmitry Baryshkov wrote:
> On 16/06/2025 10:04, Mohammad Rafi Shaik wrote:
>> Add the sound card node with tested playback over max98357a
>> I2S speakers amplifier and I2S mic.
>>
>> Introduce HS (High-Speed) MI2S pin control support.
>> The I2S max98357a speaker amplifier is connected via HS0 and I2S
>> microphones utilize the HS2 interface.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/ 
>> arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> index ab161180d1d5..d073c6f95d4c 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> @@ -5,6 +5,7 @@
>>   /dts-v1/;
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "qcs9075.dtsi"
>> @@ -21,6 +22,57 @@ aliases {
>>       chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>> +
>> +    max98357a: audio-codec-0 {
> 
> This wasn't sorted out properly.
>

Ack, will take care in next version.

>> +        compatible = "maxim,max98357a";
> 
> No SD_MODE pin?
> 
Yes, SD_MODE pin is always on in this specific qcs9075-iq-evk board hw.

No need to handle.

>> +        #sound-dai-cells = <0>;
>> +    };
>> +
>> +    dmic: audio-codec-1 {
>> +        compatible = "dmic-codec";
>> +        #sound-dai-cells = <0>;
>> +        num-channels = <1>;
> 
> no enable GPIO, no vref-supply?

On qcs9075-iq-evk boards the enable gpios and vref-spply is always on.
Not configurable from DT.

Thanks & best regards,
Rafi.
> 
>> +    };
>> +
>> +    sound {
>> +        compatible = "qcom,qcs9075-sndcard";
>> +        model = "qcs9075-iq-evk-snd-card";
>> +
>> +        pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
>> +        pinctrl-names = "default";
>> +
>> +        hs0-mi2s-playback-dai-link {
>> +            link-name = "HS0 mi2s playback";
>> +
>> +            codec {
>> +                sound-dai = <&max98357a>;
>> +            };
>> +
>> +            cpu {
>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6apm>;
>> +            };
>> +        };
>> +
>> +        hs2-mi2s-capture-dai-link {
>> +            link-name = "HS2 mi2s capture";
>> +
>> +            codec {
>> +                sound-dai = <&dmic>;
>> +            };
>> +
>> +            cpu {
>> +                sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6apm>;
>> +            };
>> +        };
>> +    };
>>   };
>>   &apps_rsc {
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sa8775p.dtsi
>> index 07ca6dd4f759..968730da180d 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -4711,6 +4711,20 @@ tlmm: pinctrl@f000000 {
>>               gpio-ranges = <&tlmm 0 0 149>;
>>               wakeup-parent = <&pdc>;
>> +            hs0_mi2s_active: hs0-mi2s-active-state {
>> +                pins = "gpio114", "gpio115", "gpio116", "gpio117";
>> +                function = "hs0_mi2s";
>> +                drive-strength = <8>;
>> +                bias-disable;
>> +            };
>> +
>> +            hs2_mi2s_active: hs2-mi2s-active-state {
>> +                pins = "gpio122", "gpio123", "gpio124", "gpio125";
>> +                function = "hs2_mi2s";
>> +                drive-strength = <8>;
>> +                bias-disable;
>> +            };
>> +
>>               qup_i2c0_default: qup-i2c0-state {
>>                   pins = "gpio20", "gpio21";
>>                   function = "qup0_se0";
> 
> 


