Return-Path: <linux-arm-msm+bounces-48762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A45A3E6AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 22:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE76517CC9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 21:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A506C264FB4;
	Thu, 20 Feb 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7fJ8uQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CB2641D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087060; cv=none; b=oUwMAmVy1XhruPxiNyMVfKJmQaVcHJDWDKXyYntjsfIlxGxoKL0aTlmcA9svI7Q5C1sm9Ava7S6tFlpn9UJxFhVJc+BGPuvQEsQpIyiaZR6MoiKa6FY+QqJqOBUaKiYsCPSsyKHeofHnbkRlxD7fdb73ufg8BEmA5owUUy4XrLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087060; c=relaxed/simple;
	bh=Jcm7PvHpMe7tKGTpIyGRdzGtn040bJAdsFeXtJ5E8RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNSiEPUSx8a3RjprS61fcrlsr7qHPM8r60VpVJYPQMdU9R6lAr6gIzBZKGxm6W72bdjsiWbcjZhnRIrHRniG2FIlvC3PHSMS1a4FsPS/Em/4UVDqSk8/GkItxzRocpfmvlFjw7r+n5/eN/mlp84cZ+HNRGvXcMx6d82WgMP6pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7fJ8uQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KFkLni015174
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 21:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4b/yWlz2b5oRI/+oWIeuPJO4gw6pMqA+jcdXud5kRy8=; b=M7fJ8uQ/YQo+U5c1
	AI+PflHA7lAcH+DS21iEGwiibUMtciUIcKz3/V2ET6UD0hQcsJbfLVBht1sSBkDP
	MuSPUB4eM9endoIm754gqnrbvAXD1oMQqePAQ1McSuYXQ1Q/IcjaP5IQawfcgYzg
	SrJ6aebRLmxbr3uxqont8+AqcSirCol8DRtPa50Ofion/M8SvF2QpzcI4omYgnOI
	DbGmJfm3BR/4fTr51Za7mhC27tnfcbgPcy36zGym0Mb2W7Nz96oBIy6LA95wBR+J
	oLRKdz8T2UYLs0w8pFqxNMNMaO2VF95bopoFJvA0evNecWoDCF7QnYVkyt3x15Dc
	XdvnQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4fgjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 21:30:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220d9d98ea6so44011745ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 13:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740087056; x=1740691856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4b/yWlz2b5oRI/+oWIeuPJO4gw6pMqA+jcdXud5kRy8=;
        b=PK44rOUafqUmxupyeGSsBGptJnkQC495KMtM2u4Sd270VO/gcKLZmNbv3tBImvgFLB
         IrM358vlK/PM+ih1pNockDtP+gKRqLlvZLxL5Vz/EikNQiPMUFAddI5nn71ZXQka3UXy
         nwn8JGsQQxR4kOzBlSY+5SmxOdCjmnd8uOP13fOZkbPD5792ChIQrtJZLgYwIwfWlJsG
         Kr6ApZcrb4EvWEyx19tgSeoQVgBkhSN3t399MF0hrapPSTQldYoQfK+jLb2utQD55pzK
         FwDCg1rBGlmV/6am4uV5KlcN/7rGCI/ikQZQg7Vp1rjf1fzzte7h2hnMB0Netx7nRjl4
         LkCw==
X-Forwarded-Encrypted: i=1; AJvYcCW82/XZraMuQiuGdlU8kHf1prEQIpbXMOEss0og+11bbVnZLMcjFG4Ow00oqwcy2UuvyQ2FPyPLe/A5BIyx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5fLTkkktYozqkyn9cVjRxh1EPC7Fjz9D4a0LZyzzmL73x+Krf
	QXXUjZJqLz3ptKqs+1C+f2Apv5EjUEMHa3f+WbLjLbRFznRIaoJHI0jD8MrErxqsqrAs/DHdU+9
	HwvmcdZz44iPYrfHVEMMfjIDso10TuPgvJe4THCEubWp2lrPcjKCLYbVpd2H+o/lv
X-Gm-Gg: ASbGncvWqR13bDcDtUwxY9c6SvWklGHfKUHAlJ1EPOyfPLMC17OOuXdFTTPB0bi2QZP
	SkCEbrxywuL0PsQEQvHdoM9fAvo8FPpBD/Gw4fbBI1oFs4Bo1ybtgFOx+clSCdfbqRamJ8HcR4q
	97PPKPPUGrEdmx4SX6zsiUHQxFLfc1vE26/559++Pf1mGPZ0ttp1nPkxAzB05DkfaYpmJ2Cba8F
	5ykIOQNyhgs71u2UMBtKBoVQrGOc5aCz9i1YdjtWvOUonKR9pi11b3CWb/7OXdj4FPrBXC6wZ1d
	wUFodBtFuuSugRVRbjTk5+KMV+DbJguYKzdVfrTh8UmlENjrV0M/HmHiSrgIAq/Soi/wYw==
X-Received: by 2002:a17:902:da91:b0:220:c143:90a0 with SMTP id d9443c01a7336-2219ff600b7mr11659005ad.24.1740087056263;
        Thu, 20 Feb 2025 13:30:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNaLSENnRatqWhogdEYw5CUZWUoO3mcRQXara8Vz/XKsvoelzsFfaRcRLsxSscNETH5JB+8w==
X-Received: by 2002:a17:902:da91:b0:220:c143:90a0 with SMTP id d9443c01a7336-2219ff600b7mr11658495ad.24.1740087055823;
        Thu, 20 Feb 2025 13:30:55 -0800 (PST)
Received: from [10.71.108.77] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d559089asm125179175ad.241.2025.02.20.13.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 13:30:55 -0800 (PST)
Message-ID: <e97d17ca-be8c-42a2-9767-77d73eaa916c@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 13:30:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM
 resolution
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, andersson@kernel.org, krzysztof.kozlowski@linaro.org,
        morf3089@gmail.com, u.kleine-koenig@pengutronix.de,
        marijn.suijten@somainline.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Zejiong Huang <zejiongh@qti.qualcomm.com>
References: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>
 <20250220145522.GA778229@google.com>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <20250220145522.GA778229@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gSXqF4XTi_dZUQBHZoqVZ9cbOdc-fhVD
X-Proofpoint-ORIG-GUID: gSXqF4XTi_dZUQBHZoqVZ9cbOdc-fhVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200143



On 2/20/2025 6:55 AM, Lee Jones wrote:
> On Wed, 12 Feb 2025, Anjelique Melendez wrote:
> 
>> Currently, driver only allows for PWM modules to use 9-bit resolution.
>> However, PWM modules can support 6-bit and 9-bit resolution. Add support
>> for 6-bit resolution.
>>
>> Suggested-by: Zejiong Huang <zejiongh@qti.qualcomm.com>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index f3c9ef2bfa57..4e5c56ded1f0 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -24,6 +24,7 @@
>>   #define LPG_PATTERN_CONFIG_REG	0x40
>>   #define LPG_SIZE_CLK_REG	0x41
>>   #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
>> +#define  PWM_SIZE_SELECT_MASK	BIT(2)
> 
> Are you sure you want to shove this between 2 seemingly related defines?
> 
We placed the PWM_SIZE_SELECT_MASK here so we could group all the masks 
used for PWM together then the masks used for Hi resolution PWM together
i.e
   1. pwm clk mask
   2. pwm size mask
   3. hi resolution pwm clk mask
   4. hi resolution pwm size mask

Would you rather have definitions grouped based on mask type?
i.e
   1. pwm clk mask
   2. hi resolution pwm clk mask
   3. pwm size mask
   4. hi resolution pwm size mask


>>   #define  PWM_CLK_SELECT_HI_RES_MASK	GENMASK(2, 0)
>>   #define  PWM_SIZE_HI_RES_MASK	GENMASK(6, 4)
>>   #define LPG_PREDIV_CLK_REG	0x42

Thanks,
Anjelique

