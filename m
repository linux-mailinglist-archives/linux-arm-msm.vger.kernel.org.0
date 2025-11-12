Return-Path: <linux-arm-msm+bounces-81484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF8C53B8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2065C4A5B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3063A3451DB;
	Wed, 12 Nov 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Asi0ZCev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPr+XK0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599B2D130C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968360; cv=none; b=AUSc1JJgtM8IYaUpgP2b7Gx1mc0XNXxINBDpZHdBB7+u4I+3QFklkDrujcJENV59pSBhdJwiu+os/5lcZWRBamww5raHzb2pohc2MozEL5y+yRzl6KBu8ZT/0Jd89CuXJdIAu0eDvH/AZ74gPhvZHCa9sbzN744oK1R7lTfRk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968360; c=relaxed/simple;
	bh=XNGMKOXdST8ZhXMZ1XSg6lZvEmwXGS/pKQzGBgYFx70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqldoy9g5o0Lty5NoNT2Y5Sd1XU1i9S+50/Ee3lEvEYecYNObEytTG/79w+Ai+RNALIGmbMWS0/JWLzoqzUcwEuGT2joy3yblrV+qFUF2IHNOatr9M7tWwjfHTuD9F9nITkQAi0Gsfyj6tKEmN5U3O7yh6IPE+qvTawxXGStLCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Asi0ZCev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPr+XK0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACGHdEK510083
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=; b=Asi0ZCevWHa5vpUq
	wydrPJdR5WLStOV9/DGr3VxUXBZoWqa/zgCg8bnQzNA9P0JK7UM6bgsHvINAq854
	zqyZM0phZQsfIx6xpL9c1I4p4US+sPxmy/0LcPzRNz9D2woOfqAE8a1U3FutS2mP
	RSjHFghPfCdr7dcmWvQAi9fP7Ypnxm6uNKEXYRd73cmbxmuQaAo69Ydiy0SH9v76
	NqxKeS/lvKq1bbs4S4rTIKuTbicFhnAnjDsLE8ovl9cRz8W1G/30ppmUHADbdWLf
	HNty7VP9ltQnvlYP2xrXREZ3xHnosdp2Z7YvNYoTWHluPLcq866qz3nVukaBj5zp
	gc/y5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdghns7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:25:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29806c42760so29141125ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762968357; x=1763573157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=;
        b=VPr+XK0uTf5TfcbZlZxU4bGPxtQM+zOuCykpoawK/4CvGvxCmJ73VtbEL1tVRaCMbO
         0CQC4sBswK1x4f9mK1uRxJn2D8adNRupQhKiyBk+YsU3H6yaD/1X/zSknoGLzJ3rUDtZ
         jh7/SV8c/EXZHYycBVH6yqO/98j6Jvc+Fnni6HtXg/9xJsniAkqzAh5hJ5VixwHi3KTZ
         k6c7/nzRwKTMWlzmAog3DZz2W+uWI+APzq6hCkLiGa6Plnkd6FkY1OlzTJ1b2KkL9aUT
         53IAb6cZV7LbtNGNiuJL3iCbLxptDqJmh1RyRZYcVZhbsWRuTm5S0E4qg6mDga4i81FD
         uxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968357; x=1763573157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=;
        b=SOfbYLS4FmSEijgDUVALLOK35KD681Zj9yIr8Nl1jUWcBOpgmttwMNkppZPw3jd60C
         ckgCz6TnuV13UUUbBKdTKv1OD2w11xqIeXetxIjOjeNPNP9tDeywvamXtXobIFXuTJez
         99peOkuzRW18Zoba1l8z8PgoaBbeZBSU6xiLCbFdNBUtg41DlveJb8/Vs7t5qG3/8Yzb
         +LCpZCw7DO664ObvNbSJcJawt/cwGuU0ZrfxJDRVb18Q9kNvpP8CmfTx1I3G4CLHXqhs
         H0eHQ49VAxnvPvbj+80qFO5RocSy2i+TYuDm6Bp3FqwUhO32RJ2pGixJOuHfaAxjxpqS
         iEhg==
X-Forwarded-Encrypted: i=1; AJvYcCUeh1gQIzd7qGQGBd5tgRNaWNMIDLthPoELHi/sxf6hN2w/yjurJZxdBN7db5FpSNMDYeQXOeOUO5pV5ndW@vger.kernel.org
X-Gm-Message-State: AOJu0YwqX9CF2ZsM1YgJ7C5HgnXOFO0roaMNZZm0rvsvzL/szS97pOFE
	ISNDbcbbKSFrhRKAA630pAI5zAlTE6RYFJI3X7VQw7Pqn/9nvXg5pFcdQ14VJ7gT01As1H6OkCZ
	eG+uXiOk+j6emOoc255Cw52jd/oUSjpGkL9P5d4LEZCgnsEJA6RgWa0ictQDPvvlWisB7
X-Gm-Gg: ASbGncsJByYuOQqE57Yp7BUBoMllu+cxN9UgMDcHm3aJbMFamjAEhbaIDZdSLO43lI6
	jTjH9cXN1+8FKheH3jW2bxUqTq7OygwOA+J6w7Nj9X25NrtAKGfTzfxVZPIAqnkxwZEigbdSMqJ
	38fi6uLy5p/BXT3m4d1QpluUx/lv7Sl2V6I36BTyMLoWlA2hvmwVh5g/jnptbuHsrkgwqGgWO73
	ZlAMnQzGSk6n5DjKuPdBS3arru0Hrz9vIkUfPOE+R6VNQB047RKkqamwVkDLkFxk8CxJjPef9KY
	qZyeZNc3Ltbp4hD/xKbE3vqHrqpqE2TWbPxbM3aNge+Op2x+TMIGdoCnO3VjpW9ZP2ze6JEWf0W
	Qb+d4jCauHBotFJ3LAJvYCKI0S3KoU5dK
X-Received: by 2002:a17:903:4b2f:b0:264:70da:7a3b with SMTP id d9443c01a7336-2984edefea2mr49647955ad.49.1762968357058;
        Wed, 12 Nov 2025 09:25:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlxML53eq5FCGodemREH9wM+Y3YdT+a0wr3azep64CW6zyU6Xwbk8j/OZEoJXgKMwh8FNU/g==
X-Received: by 2002:a17:903:4b2f:b0:264:70da:7a3b with SMTP id d9443c01a7336-2984edefea2mr49647545ad.49.1762968356489;
        Wed, 12 Nov 2025 09:25:56 -0800 (PST)
Received: from [10.216.19.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcea628sm35957245ad.104.2025.11.12.09.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:25:56 -0800 (PST)
Message-ID: <5d03ea27-82e7-1a55-3441-b80c7496a26b@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 22:55:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
 <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
 <btvknf3tcqhgxzf7ckyvfwix6hxle2bs4whyayan5haaejo3sm@gnbszdys32lm>
 <20251110161950.ngs4ihn3asijoqks@hu-mojha-hyd.qualcomm.com>
 <cvfr4zaceknma6camborq4ro3lwbx3dfps2zjagwhwmvwoxriz@jwybwtzdd46u>
 <20251112111540.w57ygzrvc6m3qbrs@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251112111540.w57ygzrvc6m3qbrs@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=6914c325 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oQ2sxdDcfxKlcFxZ0_oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: kIUrm87edaty1CK_TIxs_C2-95f0yJGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MCBTYWx0ZWRfX7GamkxU0cvC0
 khdd1Xd3HO5sNzWsW9K5Wzg/WhY/CtWd6j5zYmX/z/9+24ArT4UCN5UDI7QJ9xQew54t5kh5BKr
 cm9SfTkLwzorZrlwEo8ta4AR9PhtukEeRaGNexIvfefQC2cgRaI8GbyEcu2V/nlIzScoQ4+Y9iK
 Bh1wwKx5VDEXM6VBuy6PbiCScDc1C3NJV9tdCgPlhg7/Bp9RLxS42aOOTPhbwaOE4CIiKK8pKFr
 PsfZ4zoqAJxgl6eDZDXdKrO3m579lL6NHH1/LcX9Q5Xyjx+uF7o1IhC3YZiuXrMS6KgosH0wrLv
 rP7hzBslluuVKu/2f/0sS3Xqef0wwulBerdStc0jlvvZ2Ez/TmHNKahxK1nvO1SzU64zVItLIeX
 Xp0qa+oSctXs4Pq1XUoi8h7hwcB0VQ==
X-Proofpoint-ORIG-GUID: kIUrm87edaty1CK_TIxs_C2-95f0yJGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120140



On 11/12/2025 4:45 PM, Mukesh Ojha wrote:
> On Tue, Nov 11, 2025 at 10:52:34AM -0600, Bjorn Andersson wrote:
>> On Mon, Nov 10, 2025 at 09:49:50PM +0530, Mukesh Ojha wrote:
>>> On Mon, Nov 10, 2025 at 09:30:26AM -0600, Bjorn Andersson wrote:
>>>> On Mon, Nov 10, 2025 at 05:58:24PM +0530, Mukesh Ojha wrote:
>>>>> On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
>>>>>> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>>>>>
>>>>>> Add support for SYSTEM_RESET2 vendor-specific resets in
>>>>>> qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
>>>>>> "bootloader" will cause device to reboot and stop in the
>>>>>> bootloader's fastboot mode. "edl" will cause device to reboot
>>>>>> into "emergency download mode", which permits loading images via
>>>>>> the Firehose protocol.
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>>>>>>  1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>> index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>> @@ -935,6 +935,13 @@ &pon_resin {
>>>>>>  	status = "okay";
>>>>>>  };
>>>>>>  
>>>>>> +&psci {
>>>>>> +	reboot-mode {
>>>>>> +		mode-bootloader = <0x10001 0x2>;
>>>>>> +		mode-edl = <0 0x1>;
>>>>>> +	};
>>>>>> +};
>>>>>> +
>>>>>
>>>>> Make sense for this as it leverages sc7280 and adding it there would not
>>>>> have made sense.
>>>>>
>>>>
>>>> Why wouldn't it make sense?
>>>
>>> It is better to add for platforms we know their firmware support this
>>> from day1 and not add for something like chrome or any other variant of
>>> sc7280 where this support would never come or not tested.
>>
>> So SYSTEM_RESET2 only exist in newer firmware versions and hence this
>> isn't (and won't be) broadly available in SC7280 devices.
>>
>> That would be excellent information to put in the commit message, so
>> others writing Kodiak dts doesn't feel the urge to copy this and debug
>> why it doesn't work.
> 
> Sure, @shivendra please add this information in commit text.

Ack.

> 
>>
>>>>
>>>>> Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>>
>>>>
>>>> Please read submitting-patches.rst about Acked-by, and use Reviewed-by
>>>> going forward.
>>>
>>> I was acking the idea of this particular change in platform file compared to
>>> other patches, if above reason looks fine, can be converted to R-by.
>>>
>>
>> That's appreciated, but per the documentation, the meaning of acked-by
>> is different.
> 
> Sure..
> 
>>
>> Regards,
>> Bjorn
>>
>>>>
>>>> Regards,
>>>> Bjorn
>>>>
>>>>>>  &qup_uart7_cts {
>>>>>>  	/*
>>>>>>  	 * Configure a bias-bus-hold on CTS to lower power
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>> -- 
>>>>> -Mukesh Ojha
>>>>>
>>>
>>> -- 
>>> -Mukesh Ojha
> 

