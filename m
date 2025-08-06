Return-Path: <linux-arm-msm+bounces-67864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F73B1C2AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A7F160E31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E2E28937A;
	Wed,  6 Aug 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmWZchVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC3288CAF
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470882; cv=none; b=mYJOr+aFTcKxNp+EEn1tRkcYhHlvdyzgU48Ywwhe96XHFVGgXzhdME7coW8/8Krse2K7QXnE845CE1hhh3B2+lSE+r9+4w/uwxEXIdZWd/j3aWwIfQ6nhHM+yhB3naC3DhsuElQxRya2batycOHbJEVGW55H6ng9GDvb0dnEWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470882; c=relaxed/simple;
	bh=eXeFflPzyYElNM7RCdEcYbzkvkU93X8aeiBdOj0Htg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+jH23LY9zCKypin4C/jFt8mHHllJeNQWLJHDhD5uIjb2osO52wb1lmn/deyhfH8bPYK9tccWF1y5VkGwBKBU57f0K4VgqK1BFV0cenVs0MMf/+EtZJqkIsXnOfg4JxFeyqEY7d0najt9D43EQFhRg2dky1evCFBQhGcxIGgmKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmWZchVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765Fuks020908
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 09:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6D+xwxfaNPC764NxYBxFtb97mFQ1jkjyZhyg4hVCh4U=; b=LmWZchVg8NuIE4jQ
	rM42U7p52Jc28Jo3fLE3S84DQLS8UD3F/D06WIwMjPM69EXfsNbaNlGjI+uB0ugk
	MOWJPyZpWL7YEVLSoeF+6e0/CchKFvX7n8IpWij3pYFuignp0xwgJc4iMGzOcWa4
	hVazFSaNR9dT06CaZAaN9lz3odHtq/Aa27D+M49rn83mS0PA77pSqn7qI0MaIFgT
	hbauKmydFUSt70hbO98EsPp6S1Iwo04geC8KitENwE4xLkefnSA2M6nIGK4rBSP0
	mKzOJe1qgw2vfl/c6YgOf4RWNZfagMd6XqPVpdIywTH7LI2Ec5SmMsLqTNpiZvZn
	1FGS0A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1a5cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 09:01:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7074b13178eso11052596d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754470873; x=1755075673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6D+xwxfaNPC764NxYBxFtb97mFQ1jkjyZhyg4hVCh4U=;
        b=LoKyrWxAog70qyeMz4SnzgpNwlMrrCBanMjwctEUUwETNT01VS8jKefHC//vmGlw6v
         vH3NW83S6cQxXMYLP89HRDJxdnkI7XH5sp7kUJHb/ve5lCD4LsPVT6c+VoUqrMT5Lt+7
         rYZRAiCjGG/4bGiZGIUYs3I/sQxySg0ukR4n6bBfCd80lxXgz0wbUFFfJ+aOd9MrN6qU
         Xc3eZ//34iGzA6vlR1RnrZhMQVKuUlqb+Ha1N2iarBWVJ4ve6/khASqR+1j0nKf7gWo2
         6QjcKS2QRnU9o+PB2hUO/LuWuBAVU8wqGIoe11famcgYAWfnJAJZrqrjjbfSr8+ZkePf
         eS6A==
X-Forwarded-Encrypted: i=1; AJvYcCWf9eEuRBnwvfUzSuP42oZ5Gs/CV7MI4jXckZAWa38R+3FE4xPAymKk3Ic/QTkUfuISdBrv/NpVQcwwwi4I@vger.kernel.org
X-Gm-Message-State: AOJu0YzRoJcIdL9AkyFrWxWLQDaHQlIytg2U74h4TUiaHrB6H4Il6gnD
	z6EvGjT5/hY3o8N8SZ7GRpv7KwfHXLgD40WIB3yEhWDLt6oaeXspaH20a2b+rhnTHVWcdE0W09F
	6dput/e8l77yD00eNPgqXm9Ip24ekfBoQpDgmp/68qFqITyIqSbke6U4bu9qCi/kuKYX/
X-Gm-Gg: ASbGncvWW4gFE/1uGiWrVPdupjuduVLAR5akKhJbsE/fAjEX45HXyAGCRZOOKTLdc/T
	EecIQ/clBe3lRgaRH5NPtrg6Ek5gkjyW7PQdzx7gYoOsiQRAcxr8abH/3eZzq8TrBZqd+JmwWgI
	I954qx8v3G5hiDHGzwsB115EP7p8/8XsjNquyEuLbsEtGfiKsPqDympHwMrqYt+fPHsw0Wi2WbO
	5R4g9mPRadBa8xqe/4S6Zoh8LKGzUXk67jPRJxmA5BInJKinKl3KBTxFiZXol3t55+tRu3IO0Of
	VgEw42vHbYBismvRSFm0cLEipKbgKZZPjcGTJnvqecEDIPPHu0olSHgzvZijqZX9G453U0eIfuW
	BeUWQEvI+kVG9nHBMWg==
X-Received: by 2002:ac8:5d08:0:b0:4ab:701c:aa54 with SMTP id d75a77b69052e-4b0913f27a6mr15927861cf.4.1754470872821;
        Wed, 06 Aug 2025 02:01:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQfhvBz/y7VBf77xH41t0vN0JNTEXgDYwxJcvoC4l/blB8yRe/xKAvpfQqePz0oZyARObcPw==
X-Received: by 2002:ac8:5d08:0:b0:4ab:701c:aa54 with SMTP id d75a77b69052e-4b0913f27a6mr15927561cf.4.1754470872234;
        Wed, 06 Aug 2025 02:01:12 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078cbasm1067576766b.5.2025.08.06.02.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:01:11 -0700 (PDT)
Message-ID: <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 11:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex> <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aJMMhIqNupwPjCN+@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5dEujE8yDSa4
 6RTWHfpqc0alntIy/B2S7sgu/UOtF2p7+FeaZ+T3ECeZNwyDmYkGkQEM+l5b3pbxnHOJ0rzfq5m
 QhUpH1ci1j1ROXxqQM3MpxYNDLYFqR0vbZ/VRRQes39da02zIGawk6ny3sfYMFoocegsiZEa1UG
 ggKN11im5LtSLTWv7+za2ESUXds6wTDgQFubwJaito4Tl3CSyh/OxbpBXfNnhjfN/qcv2A6FaSk
 v7nOQIkpMFvFdzkvCny9BAsQAlGqXaUHUg9o9F6xhHZhLEN7GcU20FID6qfnlde92jBmkQOfwLK
 W3sciGIEDw4wN0+smu7tv6C6XdVjuwckHKwq30SlUraYwAoFHR41jETk/oS7A/fbcCuPOshjeCG
 HWnybzjT
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=689319d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=JpaEw4Cn0_AnavUb80UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dq76Fy-HKPG4xWVBw0fHu8hcSLUfqN3n
X-Proofpoint-GUID: dq76Fy-HKPG4xWVBw0fHu8hcSLUfqN3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 10:04 AM, Jorge Ramirez wrote:
> On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
>> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
>>> On 05/08/25 12:44:23, Jorge Ramirez wrote:
>>>> On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
>>>>> On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
>>>>>> Add a qcm2290 compatible binding to the Cenus core.
>>>>>>
>>>>>> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
>>>>>> encode at 1280x720 (HD).
>>>>>>
>>>>>> The driver is not available to firmware versions below 6.0.55 due to an
>>>>>> internal requirement for secure buffers.
>>>>>>
>>>>>> The bandwidth tables incorporate a conservative safety margin to ensure
>>>>>> stability under peak DDR and interconnect load conditions.
>>>>>>
>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>> ---
>>>>>>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>>>>>>  1 file changed, 50 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>>>>> index adc38fbc9d79..753a16f53622 100644
>>>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>>>> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
>>>>>>  	.enc_nodename = "video-encoder",
>>>>>>  };
>>>>>>  
>>>>>> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
>>>>>> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
>>>>>> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
>>>>>> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
>>>>>> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
>>>>>> +};
>>>>>> +
>>>>>> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
>>>>>> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
>>>>>> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
>>>>>> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
>>>>>> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
>>>>>> +};
>>>>>> +
>>>>>> +static const struct firmware_version min_fw = {
>>>>>> +	.major = 6, .minor = 0, .rev = 55,
>>>>>> +};
>>>>>
>>>>> This will make venus driver error out with the firmware which is
>>>>> available in Debian trixie (and possibly other distributions). If I
>>>>> remember correctly, the driver can work with that firmware with the
>>>>> limited functionality. Can we please support that instead of erroring
>>>>> out completely?
>>>>
>>>> yes, in V7 I did implement this functionality plus a fix for EOS
>>>> handling (broken in pre 6.0.55 firmwares).
>>>
>>> just re-reading your note, in case this was not clear, the _current_
>>> driver upstream will never work with the current firmware if that is
>>> what you were thinking (it would need v7 of this series to enable video
>>> decoding).
>>
>> I'd really prefer if we could support firmware that is present in Debian
>> trixie and that has been upstreamed more than a year ago.
> 
> 
> I share your view — which is why I put the effort into v7 — but I also
> understand that maintaining the extra code and EOS workaround for
> decoding needs to be justifiable. So I chose to align with the
> maintainers' perspective on this and removed it on v8 (partially also
> because I wanted to unblock the current EOS discussion).

+$0.05

I thought we were going to eventually relax/drop the fw requirement
when the driver learns some new cool tricks, but are we now straying
away from that? (particularly thinking about the EOS part)

Konrad

