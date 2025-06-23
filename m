Return-Path: <linux-arm-msm+bounces-62106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C57AE4B29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D932160FA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE98286D46;
	Mon, 23 Jun 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXa4RjH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08426D4C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696820; cv=none; b=YPGpLWfSbxVwyA5Fxd6D4hlMCQDVD08suNH1lBUkaXtI4cam9CefWl3CnjMQM/PTLcX9P4Bvcnpe+gkmR2jpXCbjDKpqCfWqCNctGLfGYmmyusQUh9yCtbe5gCfEDbC2HKRum6WclI5oRua3nTTXMMSgib2cEcmpfT6d+I/QxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696820; c=relaxed/simple;
	bh=eR+ur1cKOg2flLGzDzwtH0YBRTLAIui1olriTCPWVSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gp91HV5xNYjuTahdCQ2pipwPF6W6GPUVrz2VwPR8JXqP2ORK/DT09eZFKSUuk7FKvOoEbWnyOEg6vlmbI6idLqHHYupyXmQ4WMyKWCo0iYcyoUJnbIL5ojJM43BEVilZzvJGzAkEbzlTJS1OEGWWOHJIl4kFm+4q/nhO+6PUpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXa4RjH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NEk9U8024833
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2bRT9SJHlT97u3ops9Jk5UZrZDQEVjvrIec/PkyZq8=; b=hXa4RjH5lR/jBXAK
	vycZBatVTqXUgXL2Phf9cnXpke7WyRnccJu7Vnt2/+9AniZUphgSxHf2wuqm66ii
	z2jpYcW3KYpA+ioPWrMygtQ8wqPbnmL/1+W7agkiP3AF45mGFU6a+Ry5l+5fINN5
	GHiXxgeFx3T1EYprBp6jYa3YpOdV7XUA5QlDhbMRuCF71ND4YTYRYF/YZHY9FwKx
	TmridgQDpb8Q8HqiPPwaP1RKLpFCzMzGsR2Eev9gGhae+UAj1wZzDjvCPAANVmuG
	+50uYvHHG1ufCz6ll2mPrx2mozE/1TxixyRqciDJ4X0O6Q3RpOm/J345wJgshww8
	fvr2Fg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymraxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:40:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb53b1e007so8471836d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696811; x=1751301611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2bRT9SJHlT97u3ops9Jk5UZrZDQEVjvrIec/PkyZq8=;
        b=hu8VSr1nIEf3quY9ng+2oQzgClohBP1TZx3yrv43H8lnhaQg7s+rYIFsLFI+Pla/B0
         cd+6NHfHcmjcHnem/Vf7syvd1MAbUrqQXCAz5xBjC16mTHU8r5cWesnRhDZyaYonsRPQ
         rgl49bMviLgoimIPedJkSrr7bltbg7j69ubcrD1MCUZ81VUBu6EYl0m+CaNdVMcG4t7o
         l3Xv0OHFvl6KwPCUn83fpO+d60x5wO7aLa3DvjVFMCzNGQqiGtW2ERBhNenhTCrWmnLt
         e6aFeKYi44Tsfe4J8nCSiw5he2VAqBvqO2346ubgvKFoEyLDCZE+Y8pwqw58i3i3hsIG
         7iJg==
X-Gm-Message-State: AOJu0YysSowR0PvfgnjQQkPyRXby38xkCVMLdUaf95jNVBfBE9BvuXvv
	GDA6AY+dPyhelDm/P3KBe10SFlXZKhrszlIMbcEjKtb13yhRbdo1oeUcDwle5Ux2jibwwvXypjV
	D22frgZfL+24hr6AaJukdMb85JQ98T2ZJNh2ZtzwqmWlAhRc2YtikTWwsAYBLNsgqmayq
X-Gm-Gg: ASbGncv1/8ZsifpdZ1YAz5FoPmrEGAl7VdQGYLMUuEgQihBa27LWD6x/H6ndRdvS7Sl
	3CUbVWIFK0IF1899/NkhsQSL+mTEaHjmMJ92VXnVTnj6IcE+RfKrMUdcQFAuSPGL8Uh/lMDqVvT
	ua50fbaqgdpdg96WYEYyaKCv/E1Y3y2+8/KHhpoUdV/zotQksS0S5wobU8R5MkrRVOxEbaaGOs9
	iqb2yJzfaksgiBDYj59ae8c06g2skeJ2J39+9nBuyCnfrclaPKSfE9w39gAXKsPnrf6fxzEvYPc
	CYwh6LsCZUplQHNuvYVoA8iHSTjbR/6nEREQxolIqZoEro2VPJxQkq0Bxq9fHKM19AJRJ30JYGG
	E4mQ=
X-Received: by 2002:ac8:5c91:0:b0:48b:6eeb:f98e with SMTP id d75a77b69052e-4a780353b2fmr42899961cf.2.1750696810508;
        Mon, 23 Jun 2025 09:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq/XOpoxNvNR6RSBM0eTtgQkZh2y7a6j9L7YTt/WuGqvanSwKZAsgCnNh09krw6R1+H5c0WA==
X-Received: by 2002:ac8:5c91:0:b0:48b:6eeb:f98e with SMTP id d75a77b69052e-4a780353b2fmr42899651cf.2.1750696809833;
        Mon, 23 Jun 2025 09:40:09 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e04sm730543266b.115.2025.06.23.09.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:40:09 -0700 (PDT)
Message-ID: <53a2cdba-0fb8-4b99-b58e-9318b1bd8ef6@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 18:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] power: supply: qcom_smbx: program aicl rerun time
To: Casey Connolly <casey.connolly@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
 <2d3ff07d-1cd8-4eb6-8b3b-2d0d6f64445f@oss.qualcomm.com>
 <613f2812-3c60-41fe-bdd3-fbe8ea7eeb69@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <613f2812-3c60-41fe-bdd3-fbe8ea7eeb69@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMSBTYWx0ZWRfX7TxOHFkqqTjK
 tSAVYNwq3xuNM+7EI8+jl5hpC65ZcD8wkmIxmmFZ3p+bAJrdhMpxPrabOjR6yzdGUh/KQUmY+q7
 GxCHxADzlFe7rZBFcx+66Sb3mAuVCtvRLNQ+iHoirFV6zuJBLAavB2JVokqM+Lm5ouy9QdEw0bN
 8ABz+uzJkZaKWIjbz+lO6I/JNCaCCVRw98Xk0MHC08lqMyUSZoGevd0aF8yJzbcI9IZ3ygRdRI2
 81edd3lrgnLd0RlYLL9IKybbQpnexXjVHA1nLSJ2gwEUyITiN590CsPo6u/wRoWqc46viIeh1Wg
 zlgvG6CJjg7uJ6a5CssqItZCpQzRf4L2goFqG1To0iMxqu4xRwF6dokvZryl/6TimRyqt6FwXZl
 wf+xykUwJ/YagXQ1kmNwAXIxvPRJgFRNm/irVwDoQNxdQ9dsJZnQLjh9WxGOlUfWnuDssEJe
X-Proofpoint-ORIG-GUID: wGMdAh0oXIvK2dHhJJC2R6ZuxVkUQLS4
X-Proofpoint-GUID: wGMdAh0oXIvK2dHhJJC2R6ZuxVkUQLS4
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=68598371 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=NTzqWVVAQLbBsVAMQFsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230101

On 6/23/25 6:33 PM, Casey Connolly wrote:
> 
> 
> On 6/20/25 19:00, Konrad Dybcio wrote:
>> On 6/19/25 4:55 PM, Casey Connolly wrote:
>>> We don't know what the bootloader programmed here, but we want to have a
>>> consistent value. Program the automatic input current limit detection to
>>> re-run every 3 seconds. This seems to be necessary at least for smb5.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> ---
>>>   drivers/power/supply/qcom_smbx.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
>>> index d902f3f43548191d3d0310ce90e699918ed0f16f..b723dba5b86daefb238ee6aae19b1b7e5236fce3 100644
>>> --- a/drivers/power/supply/qcom_smbx.c
>>> +++ b/drivers/power/supply/qcom_smbx.c
>>> @@ -1091,8 +1091,14 @@ static int smb_probe(struct platform_device *pdev)
>>>       if (rc < 0)
>>>           return dev_err_probe(chip->dev, rc,
>>>                        "Couldn't write fast charge current cfg");
>>>   +    rc = regmap_write_bits(chip->regmap, chip->base + AICL_RERUN_TIME_CFG,
>>> +                   AICL_RERUN_TIME_MASK, AIC_RERUN_TIME_3_SECS);
>>
>> FWIW a random downstream clone I have sets 0x01 which is claimed to
>> mean "every 12s" instead
> 
> hmm I saw that too, I think more documentation would be needed to understand this properly (I'm not exactly clear on what this actually means, when the AICL would re-run, etc).
> 
> I have reports that this works ok, so I'd just leave it unless we have info to suggest otherwise.

Well, in case of such lack of understanding I'd much prefer to see
a magic number that shipped on hundreds of millions of devices than
a magic number that was confirmed working on a couple dozen.. especially
since this looks like an improvement that people who had their hand in
the hw design wouldn't generally overlook unless there was reasons
(e.g. compatibility or some sort of a quirk)

Konrad

