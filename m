Return-Path: <linux-arm-msm+bounces-79678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF4C1FCC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 271934E1CC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5104634D92B;
	Thu, 30 Oct 2025 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a54NaDnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsSi98aZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA669217F31
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823651; cv=none; b=DgHYyno4x1Z0FsxE2KiYGih/PAVDsekk+wTHoaXxIC5qtSSZNx4D6tY1GuVvh505t5gxpOD3wC5utLOkXN2eAgJVzrbZhV2pHQgV1Iywu7ySD6yq7mPRU+JUWK4bzZQnuTZfKuPuo1VoahuoTUc+zTfoy2yMCWS8sDrM1cQwcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823651; c=relaxed/simple;
	bh=gScbkDU2tMkMbU5XMFpYdX8Tgbcg7R6DWWlrrbi5+lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOFKu9JJo5gyrVyMdci4ywZvgySko+M/BBjyF8iD8tDdANd2TptOunSUIvyHI1fYmy3FMgGp5S54Etm/zjBta6OUTnUor2bGWcrm6LIOytwiCnLWQTwt17xvpdNFeg6Xsjv23jbVv5E8ZHrIzBdGoiBvIPAVRTYtj/c55pB6WR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a54NaDnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsSi98aZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PKm83509316
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dolrDvyLLeJPSq8VGrdo9Rvs3EhFl0wZrMGmfYfKpWE=; b=a54NaDnF4usSEogu
	QobgvHTPPginjaFJi8glamT7uhEOtbzkH94s3vfwruIF13PdWiANPiY31FwUjVMS
	7Vihxw4mncqG8ACNBZ/4mbV9l+NzJykVsjB2kxPZMQTGO3xJ33YSdFtDI3kRbVo8
	TiirplC+5zhqMre4vA96VejQfnsOdPhAo1s1b4BbPFJIBcmX0vA8GRNsOIHHLMuO
	RvkE5s/PysOkykA9suyqPUK3krJmbIAXGkgFY9eSjXiv1+IoBKUPBSF2iB7RIjTL
	aH5xvOcX2II36f+4QQc8rnUgvY1BfVbCxm6f0+C2F+mwE2+rFP6fPduiE6j+tuUp
	JES55Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdgbnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:27:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e890deecf6so1483791cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761823648; x=1762428448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dolrDvyLLeJPSq8VGrdo9Rvs3EhFl0wZrMGmfYfKpWE=;
        b=FsSi98aZb8XwLp8THe1eU9qNl0wEciCduNHCxSG+7MzB63ogTgrvtREA7LkR/ulZGq
         6OPlfBkF/5tsMcpCUFmvOdNgZP/b2BA9VeKzMqfkZk0GLYDkDqzopwE5oUW940mvMJWs
         iyz8jPyQClvPYRDaDX/SwlgOfF8sH2gSGYuLvS3FkzzCYZdutzan5LkpMxmMHhu0nJoi
         Uq6tMqvfsCPTNv9zrFphIHfAZldGAy6Oc0eXLCNfS0ZvV77oN2Ml+x111+lOqjecDL5p
         pz819CUGz+L2F/boVTm1XN+6dDqR1g+U8ApIm+xDXRFlvL+QK/cOhnQSDPSx8IbDAHoc
         kKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823648; x=1762428448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dolrDvyLLeJPSq8VGrdo9Rvs3EhFl0wZrMGmfYfKpWE=;
        b=BSrBJ/ppoKWfgsioNI9sgMD617UQ0DD+banh6A8cGeK7/izDsbETnofC2iyhJSHXgt
         2HY804yf8sYsgMbbBGcjHrkLp7qoCY2SmimNFwmBXiMpsgUTC8cDDyr3WCxcFv9vAyw5
         gxw2xs+kpjPpvM7Vs6GM1iwa/4oSgIVDING/iJMXRb5t/AU6RbMFAAO8L2edJj5wzIp8
         2IPpfTN7iMc7XTNTO5muzcJDOgcJvsGMh318hXYxgSQC36DGCCv2l7HUO1bUdL6o4aQJ
         lHhZzIqk7to5R0P5jYkYRiOe2ekvcae0ZYD8NYGMH8zlx1XTwFxqr7H9r6f0qXNDYgxI
         Tv/Q==
X-Gm-Message-State: AOJu0Yx5uYDhjHIjnAfll3lyOM9s0ABOrOZtou7hNh/MNZ+6LcrE+7iy
	SMBgOcNuI1jTx3phXfMT9ITZED3suMQnbCX64Id5wG+wTxEvygB1wVfUJ8yhw3PpuoONLIlKX6L
	QHohhCrirnmyItm0M6H8bCoYGpr29D/SlqesjW7S51rb7sLH/1yaQ27IqM7CQLLLZy9tP
X-Gm-Gg: ASbGncvnXbo1XMdKl/3URwWd3bmEwAfsUCZaokZw+w/JqL5lADDmBcmiB3ItsQMd9Cv
	ez+w1KyljLADq13756ovWtC6GbYnDvM+J7fAa3bXxluxTvmv1NkhehnycG1J4MQID8QII52rVDy
	YaBA+fsNidtyWcgu0DbrFDgkymjY1xy/i66KqZIqdaMUaipyS20mJXbogJE6I5XycSpFcfNvsuY
	VtLSmEm/6NRiTw6FDJQhUoFv/XyxQoLwTZ/CT4ztTATV2WIojloqO52pfihEjY9yDo0ctC1/Wzi
	z0MFdI0qjJZhETdYbcweoJCRnylQJjjv9Wj1Edwb/ysPX9/WAAxG77OWdtcm3m41slCIzD2rRp9
	/vaHd7OQWdeEH9DAlNnJ7vEzaHvNxQOvTiNa6gUAltI9X0jc8xWSIrPPh
X-Received: by 2002:ac8:5a15:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4ed15b93402mr50539841cf.5.1761823647796;
        Thu, 30 Oct 2025 04:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYVz80JvGU7K+j5WFJeb7bD4kpxZ0lrwv8tVbqw6CKX0X97Z+l6X4/p2gx3NTPXjrGl6PeUQ==
X-Received: by 2002:ac8:5a15:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4ed15b93402mr50539601cf.5.1761823647245;
        Thu, 30 Oct 2025 04:27:27 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d9b536710sm1383533766b.57.2025.10.30.04.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:27:26 -0700 (PDT)
Message-ID: <d9d0947e-66a1-4ed0-b784-53c38bca784f@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:27:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
 <b5d9d47b-7fb2-4ce4-9bc8-0d28395b78db@oss.qualcomm.com>
 <0cf2521b-8d05-42f0-aab8-35cd370e599e@oss.qualcomm.com>
 <8caa1cec-d881-4e77-8d77-be043f8d13d6@oss.qualcomm.com>
 <c33ae377-454e-4f7c-8af3-0738cf0cf701@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c33ae377-454e-4f7c-8af3-0738cf0cf701@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PGD-pDL8B-42ZQgkLVU6mAyNYxQe6IPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MyBTYWx0ZWRfX3pVXqJBJOZQy
 wz5b0CkmVXFYlT0Zws+ikCbv/lXfvY8gMoqPpoED26twumuiODiBo3UvKiBRTCWxZYlbg55aImA
 7kZb667Nchm9ceiL05Uy97cAUeajZzklz0XQEw8dMNjBEI3LgkEQlGPs7GblTSEqMK1oEFpYJ1/
 jF5dbH8hmKbCctRAW4V6lgxBAswSDTFU1FhDnEugbmZWk2kFO3gMyaNG4tQq8/+/TitM8PYn+p1
 SmJ4AsA7grAorBPT2Z3GQGBM8jMN9VH3Z7vd5+FWQfeCIpwcQnJmM/1gR730vihjOqgtCzMRJkE
 nzuqk+vuKViEu++1UZHXIwhMio6+KpfKBGjpbzbuwBf/hpPeZsPBvSFkUGjnSWXoSGdQ+73wtRl
 6S9ZuFTi5AH7wSmLn8RbQydwqo9BuA==
X-Proofpoint-ORIG-GUID: PGD-pDL8B-42ZQgkLVU6mAyNYxQe6IPb
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=69034ba0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tbJ83c6aquYa7vyjLWoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300093

On 10/30/25 12:07 PM, Yongxing Mou wrote:
> 
> 
> On 10/30/2025 5:41 PM, Konrad Dybcio wrote:
>> On 10/30/25 10:08 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 10/28/2025 5:08 PM, Konrad Dybcio wrote:
>>>> On 10/28/25 8:04 AM, Yongxing Mou wrote:
>>>>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>>>>> control node in kernel DTS due to some meta may not enable the backlight.
>>>>>
>>>>> Aligned with other x1e80100-based platforms: the PWM signal is controlled
>>>>> by PMK8550, and the backlight enable signal is handled by PMC8380.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> The subject must say "hamoa-iot-evk:"
>>> Thanks and got it , will fix it in next version.>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>>>>>    1 file changed, 55 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>> @@ -17,6 +17,16 @@ aliases {
>>>>>            serial1 = &uart14;
>>>>>        };
>>>>>    +    backlight: backlight {
>>>>> +        compatible = "pwm-backlight";
>>>>> +        pwms = <&pmk8550_pwm 0 5000000>;
>>>>
>>>> Try adjusting the backlight value.. you'll find some funny behavior
>>>> near the max level.. which reminds me I should send some fixes for
>>>> some laptop DTs
>>>>
>>>   I tried sliding the backlight between the maximum and minimum values. It seems that at a certain sliding speed, when approaching the maximum value, there is some brightness flickering. Is this the phenomenon you’re referring to?> [...]
>>
>> "maybe" - for me it was the brightness actually going down beyond ~80%
>>
>> The issue is that the PWM hardware can't really do a period that's
>> == 5000000 ns
>>
>> But it seems like this is no longer an issue since the driver now
>> rounds up to the closest supported value, see last couple commits
>> to drivers/leds/rgb/leds-qcom-lpg.c
>>
>> Konrad
> Oh,thanks for sharing that. I saw the phenomenon you mentioned. Previously, my baseline had already merged this patch series: https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org/, so I didn’t observe the ‘brightness actually going down beyond ~80%.’and just very slight flickering. After I reverted patches, it indeed appeared.  So here i want to confirm,
> pwms = <&pmk8550_pwm 0 5000000>
> can i keep the value 5000000 ?

I think so.. perhaps make sure the period is appropriate for
the backlight device at the other end since you mentioned it's
flickering

Konrad

