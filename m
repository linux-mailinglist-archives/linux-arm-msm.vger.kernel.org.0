Return-Path: <linux-arm-msm+bounces-87612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210DCF6860
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50FF63005BB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206E42253EB;
	Tue,  6 Jan 2026 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4r/SNOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6Q4cHM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628B22172C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668006; cv=none; b=PgXQ5uGxrpUGQwoGthgK4yVYOgkLLBd7+nZbT+zbRrmU9bURGYzecnY4FZQ4D38ro5nvLrNaPWM8BVNpfB0poAe6griaIycaaD8pzi1ETlTLAXRNEiIHkejXzA9kBbvAxLuKRLdaGAI3uJzcGKTznYp9WBLwPC7mzMqwmHjlTts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668006; c=relaxed/simple;
	bh=ExgOVxrL4uRSF5zFvnR2+cfheCUZyO1RgJeJzYXvDe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3aBNJnUWZbFkftPh4qH4S65VnsNjmrtsgqcGYIVfI3SfLKEslKELXf7IArenk2ZVghDUNttbq8Qj/wchsGjbteFlXrtBMm/U45dpdiG7NXGDQlpyoqAgu22UuwmFlUevDNHTov+pfYq92aHgbPsJVjnFh6S6NR69QbF+VLFlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4r/SNOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6Q4cHM2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nZlh2528273
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sb6ALk+FayNpDrW/SZCWcNggZoJNOZD7/vK9n0ecD8=; b=o4r/SNOaOZ3Sy2LP
	B9F7NHHdc2iT4yJ05jT/soB+4zSUuBg20a8zaDHRXvmM7b5sw3OZZJQaSadHXMZc
	KdQb/NA1ZFNMQdDEHpSLbTgQHTANI0vpGaeMel041GUuOWIlCLDzFvqw01/g+oCh
	GBwzG/3sLesKUyVIvaYVccirRhE6F2XkZIXX2V4nd+7rzgC9+4UZC3TheKdl3ZNu
	XWLfWnIQ58wuDeTD4ultblleg2GTzXQJuZkJqNHAd+duT9j7bVvGg/GiX95qSg6A
	GOnm3+unTKYjhR5mRLvPat6GviPz5s+MZi/HGzpHPjg1VDGgy/Xo/EM+QVALZNeh
	w8tzbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus2kc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a094144faaso1105415ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767668003; x=1768272803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sb6ALk+FayNpDrW/SZCWcNggZoJNOZD7/vK9n0ecD8=;
        b=H6Q4cHM2qMt9gBh6Pw5q5xvNk3hXPXR64yGtOoDFr4ZkvKhjbc4XgM3Rm5oKSmfO/Z
         3z/xI1VJp6AOsbCFVIPAGFPAG4hfEP/JvIqyOG4jAANzp9QKcsbhHE8c9zHEVQCld9Zc
         mHz2/Fa9TS9Aujhmuusk/YQEON1uCaAtqlERzU7wP/XGHzCTfKj7v1p6x0zEBHA5aIZD
         r5ydeLStnT0ID7fl6JFxcMfSyfbFYN96BHi6PmGFer3JcTE9Ri516Hy2o4+T9BoohneZ
         wlheIeP7nceA2ZgI+E/NDmXObJ13JaVTF+ECUVRjPbhHJLOIqiE4NAV/8PrjIfwkcgqE
         +C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668003; x=1768272803;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sb6ALk+FayNpDrW/SZCWcNggZoJNOZD7/vK9n0ecD8=;
        b=ZVV7LSqVphCfHmPFECPZcDvhdduzdPSf7xEeL5QcQqU6PNAf96m6Z9sYSyQQFRxeEd
         N1HcEO1tDp8XsFryPbihtA3JKtq4H9SYbisXKDzQDl6KjQVmz8NQhMdMi9L/geRbIjzP
         cjWf3nPoP8OreWOk9Cy9QLI5ZQk00H0i2PdH72gHGp//Hx6+4gmtidPRtXwrLAHdysLh
         ftjiJ0eIrRf1hfNUGRfZqfuoLOHNOCl1OJ4+T6H7k2q5kex2NsJ1Mmo37Y5imqHwOY06
         ph3/sGFqx8P/OhYdO4RdNdYjrF8i2ERpk+PWV2pRa9svjqHVCs+8SBHPXxx2235ok49D
         Fpkw==
X-Forwarded-Encrypted: i=1; AJvYcCW/SUEAah03uUIh8xxXaHGhXxI2CLC+Qtvu569bME4QRFckBW+hp5nTDySSmOsmita1hA1NNh+ktc3kr6xh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+qzZ3WwAwPi+fK0EQc+f2qKSX357Y+2H9jyhiKnVPgYi4ezN8
	gE7e8n80p0Z883SyxdNL5XsQrVjcwCFyz1w2xoNgr1ml5FevQUNi3dertVnMFAXl8q6R9U1E4Sa
	qE2NDh93sc9zfBEZfxveJqzwbvSkBK6lsm8o1PrX/A06WzyAUDaqF4SvKZhiRLpvEmPtP
X-Gm-Gg: AY/fxX7W/ArqjKMGLuJY7pFi+IIFWVk1mmeDV2wZuvVf5+hnvxVcPFs21M0vchz2BrN
	PNlLNEAO/rjfLJydQSVYyenBKuORSkF5q+X957dRvmzyBJRTSAkPsJuNvQON2oHiXW2DmiRh8ub
	j3sAT8Py0hC++bpyo2cYiONfJZdFbiTs1k7eprHLfngKx5GCQ+fC6zypN0+8bqGI8NRMs0k1G5w
	lSYLJoO/P1U7YJrOn0SQjxfvlYhTZImDavcYGgX6lbHA6qYlNG8n9y/0hVm3o3t+fhlczkkJPBe
	biz6mIJe/ewmyOVCydD3yKmH5RtaPXrpPUzXDY4ldO936YJ1EUwytLXERbKLY49zCRLqOfrIeMQ
	G0nQTXNBKaS8yjxJ5rIXn0hW3lRjJS4ATi/dbofgs2p7KaomWOrLCZKzu7lIKkI+OJJrKk3+KH/
	A=
X-Received: by 2002:a17:903:38c3:b0:2a1:3cd9:a73c with SMTP id d9443c01a7336-2a3e2e07568mr11427235ad.7.1767668002876;
        Mon, 05 Jan 2026 18:53:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2kfXlCUI0BD9z3n18+iUsP0BgUQhNCyDRb3Uyc9G601hcb9aSHxBve2YTgccA0eybGGCr5g==
X-Received: by 2002:a17:903:38c3:b0:2a1:3cd9:a73c with SMTP id d9443c01a7336-2a3e2e07568mr11426965ad.7.1767668002308;
        Mon, 05 Jan 2026 18:53:22 -0800 (PST)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm725333a12.31.2026.01.05.18.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:53:21 -0800 (PST)
Message-ID: <81cae5ea-8791-4170-a93e-08c016d74e10@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:53:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: Add TSENS and QUPv3
 serial engines
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com>
 <20251225-knp-dts-misc-v2-2-a8a8a31fd528@oss.qualcomm.com>
 <fc67634b-d47e-452b-bbad-35884b75d0b7@oss.qualcomm.com>
 <175e9c72-bde2-4351-a429-7d88d255100c@oss.qualcomm.com>
 <hezcpngxf5lyopkvzh5b7f66jr5f6bjowphigviqimadpcgpbs@ki7qfxs52ynv>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <hezcpngxf5lyopkvzh5b7f66jr5f6bjowphigviqimadpcgpbs@ki7qfxs52ynv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MPCWSlkCDAnGUl-4qJLCQV18U_vXVVcY
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695c7923 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ECFfsz5tPb39LHsnSlcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: MPCWSlkCDAnGUl-4qJLCQV18U_vXVVcY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMyBTYWx0ZWRfXypv34WaPPWoN
 P1J/z/3VSX0f9QYkOdVPUDr9RRXOSx/sNkEWstERe23egdV52MArec7WvSmeuwYDLHXJjCb/Ahz
 Ii4ESUGI56AXpKbm/SuZeOmkGwZK6dirm504NDLJiVgdOz+R6BIeDtm2NqcH3c/F4vtZ/oeeAlz
 oq9U9fE+XlxJpyZhTCQeqqsY7O+3swYjP71zkBS+Or27xGx7p8uV834jguvS4nn67a19+SIFp+W
 4VaJEYTmFOm+6LtTvrGN2Q2fUqWdEQdTh/VB69Orz+A5fq3K0fg222YwfguTM8/N39RMY0UTloh
 Trs0GvBIGhKNgvvntlzBL19gwW1QsBeptjf8U0UI/ZOOlu4bOLnPBh2D+cqZvRiBtx6fJEPJT7+
 8bARl0T2i/RN4JNIyw/ZX2GaBcnwyv34FqTARz15325xT5T6Q7EFKmFGxM3rUlvU4AFdDoTJE9Z
 jLsrPKSbyRMOkuke9XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060023

On 1/5/2026 11:22 PM, Bjorn Andersson wrote:
> On Mon, Jan 05, 2026 at 04:24:19PM +0800, Aiqun(Maria) Yu wrote:
>> On 12/29/2025 9:12 PM, Konrad Dybcio wrote:
>>> On 12/26/25 4:06 AM, Jingyi Wang wrote:
>>>> Add new features on the Kaanapali Platform including:
>>>>
>>>> - Temperature Sensor (TSENS) and thermal zones
>>>> - QUPv3 serial engine protocols with 5 I2C hubs and 24 QUP serial engines
>>>>   across 4 QUP wrappers, each with support of GPI DMA engines.
>>>>
>>>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>
>>> Since the base DT is now merged, all subsequent patches are
>>> supposed to be patch-sized, i.e. usually scoped for one feature that
>>> makes sense. This one happens to be an arbitrary concatenation of two
>>> separate ones. Were they separate, the original authors would benefit
>>> from the full attribution and they would be easier for us to review
>>
>> Hi Konrad,
>>
>> Are you suggesting to split this patch into 3 function independent
>> patches here?
>>
> 
> As far as I can see, you already have 3 independent patches here
> (stuffed in 2 patches) - they don't overlap, they don't depend on each
> other. So, yes this would be easier to handle as separate patches.

Those patches is still modify the same file here. And we intend to work
as a team instead of individual developer to ease the maintainers' job.
Here is the 2 options, which one will you prefer?:
1. Have the Tsense and QUP patches split into 2 patches, while still in
this same series.
2. Have the Tsense a separate patch, based on latest merged
kaanapali.dtsi. And have QUP patch as a separate patch, also based on
latest merged kaanapali.dtsi.

The options will be guide on later new functionality added for this
device tree as well. Only single device tree series is suggested, or
tech team suggested to upload their own device tree patches.

By the way, coresight patch is already reviewed-by. We referenced here
only add tags. And clearly inform you that the dependency is all
cleared. So you can apply it.
Also, the other patch can be based on this latest change, that you can
apply without any conflict at all.

> 
> I would still like to see dependent patches be gathered and sent
> together in a patch series.
> 
> For example smp2p + remoteproc + glink are owned by different teams, but
> there's no benefit to merging only smp2p, or only smp2p + remoteproc. So
> seeing all three (or more) parts in one series would be preferred (one
> patch would also be accepted).
> 
> 
> 
> Regardless of who sends these patches or how this is done going forward,
> this patch 2/2 is two separate, independent patches. Or you need to
> describe why they belong together - what is the connection between tsens
> and QUP? (I presume none)
> 
> Thanks,
> Bjorn
> 
>> The current dt series is to ease the maintainers' effort to have an
>> organized patch in one series in below manner:
>> 1. And the series of the dt change will only have all dependency cleared
>> functionality in this series.
>> 2. dt maintainer won't have any conflict when apply.
>> 3. we will suggest developers can do it's own upload when basic
>> dependencies like mm-clock and pmic dependencies are all applied.
>>
>> Are you suggesting splitting this patch into three independent
>> functional patches here?
>> The current DT series is designed to simplify maintainers’ efforts by
>> keeping the patches organized within a single series, structured as follows:
>>
>> 1. This DT series will include only functionality where all dependencies
>> have been reviewed-by at least.
>> 2. DT maintainers will not encounter conflicts when applying these patches.
>> 3. We will recommend that developers upload their own patches once the
>> basic dependencies—such as MM-clock and PMIC—have been applied.
>>
>> This reflects our discussion with Bjorn and serves as a lesson learned:
>> even with a Reviewed-by tag, patch application can be significantly
>> delayed when the DT series involves a highly complex dependency chain.
>>
>>>
>>> Konrad
>>
>> -- 
>> Thx and BRs,
>> Aiqun(Maria) Yu
-- 
Thx and BRs,
Aiqun(Maria) Yu

