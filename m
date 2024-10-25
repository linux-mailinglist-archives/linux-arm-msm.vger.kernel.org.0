Return-Path: <linux-arm-msm+bounces-35924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC59B0A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB01A1C215B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C55B21A4BF;
	Fri, 25 Oct 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FIyjcyfN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619F18CC19
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875792; cv=none; b=k5c0crEhjI2vq5BubEb/WsyCeNa9xAUrtlFI8D+s2D7lWKj7nMpUgxh/TTA3zJe7JWA5/GiI8HuCovcu/mqgRDgJH2dj9loi3xcC9z8nz+HDP+syiCNzUo4UDchtvz7nDnsgijIV9pKx70hd1qdz/lxBerE7nFRp9w8VGfFZjRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875792; c=relaxed/simple;
	bh=WPGGcqaGiVoPmUoLM39b0KmLkesOa7TEdpIDHgfpP54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GV1T139yXheT4L2PoujKsdEKUpkAxRyPke7Z7DSlZKMU/eD9tkmsAib7M16TYj2nYXppe191p5eVMP4+xrctbeDV0Z2wJ+flxuoHGvKEoLRG6+sH1eIGYjZxry9eHw8BvDzkxKKuv4BRzt/nA8boRZqqZ+qf+MH9dsvuU5Z/gZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FIyjcyfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAvlkE008859
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcTKvOKbWn/IHq1qmbozjkGUKSKdBdJRZlsqwxZRKHk=; b=FIyjcyfNZM2gA28+
	/9+xiEfvFxJtXtxdG+VY/dCz8RhUszFCmuYtr4Srb26vFA3Kz7RxRAj7Tqc0ZBzf
	BBIskolE9HHpucIjVPt8bjj03KGFjPF2n0M0DMjlJMTOzfUGM2JPgCfALDdurNwP
	yiRhgWvgAJPzRzTSS8vnK/ZDE1jQj9K1laOvHxCf8frvoVbzIYfgYDUR+Xt9EOIX
	ROGTQGWfYUlG8oFrJ7q/6jnerBBKIBhzFHrtbDcZUJl3z3TiXg3J+HiLp/rA0fGG
	uuOaSVRe+86i0H+j3t480M3iY1Y+q+BDEW1QXsscTcJJa1DmqVUrcL4tuhEBLhYW
	egc9wQ==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52msyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:03:08 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83aaad1b050so34760739f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875783; x=1730480583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcTKvOKbWn/IHq1qmbozjkGUKSKdBdJRZlsqwxZRKHk=;
        b=h1x4sBoRFhQKwPF0lrrRorsICBAZhU2+ptkiX4M/fu2HOCKVYlSA/Un7uRTEk8GgM3
         rHjZbQq/f96i+V2cUsNsYQ9Q8UD0wh5v35zrBO7tidnp3fxnTf53PcCbQHc9msrgTthL
         dtlhKn0sNMtkePlZF8vMwTwuaCXYUvuq33sBazkPxB4H6JGAEQMNyMmToX1U2uZgr27Q
         cygwYVir+6+sxOTDXVrGl4UE/PD/lOx5rUubDn+14QAXWY1Utx69Uj/HUuu7w99iNRhp
         zw4DOx+sgo54GNGtRtleJegF5ud5+IDktP2uczxP0rwgdRml8BrtNLXJy4ESpF22HlFd
         7nXg==
X-Forwarded-Encrypted: i=1; AJvYcCXgnAZCD48P6y8hgjNxM9khqX+tOWdR7t4qgHWh4+4zkOJbFbwxJU0KFo8awix17S0eqP/AgRcY4xNqyM6r@vger.kernel.org
X-Gm-Message-State: AOJu0YxBA+eC4Ysa8FXNhNJGnI8LNCpy1Lo7z73OxDv71fd9wSwfO7kY
	4AEJJn/wOmDrqE282XgEiLUjltl8x+yunoeyGBj5SsDBSaV0AL0+FT8tHN8ZpfNZUdEt0W20Fqv
	O4VJDUSYAqNw+8WVyuwxPiREvD43A139CNjtJs6nlSUPEVaYvz5tQMUZNf2CNYigm
X-Received: by 2002:a92:c56f:0:b0:39a:f126:9d86 with SMTP id e9e14a558f8ab-3a4e806d563mr4396625ab.0.1729875783519;
        Fri, 25 Oct 2024 10:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFSKWdgG6048ZgDp7DafsAW3/5cONZNPlZ3U7SrY42s9TAXMiE0WlKFoU+kd/+YC5PraD7sA==
X-Received: by 2002:a92:c56f:0:b0:39a:f126:9d86 with SMTP id e9e14a558f8ab-3a4e806d563mr4396375ab.0.1729875783022;
        Fri, 25 Oct 2024 10:03:03 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec81a1sm90067866b.25.2024.10.25.10.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 10:03:02 -0700 (PDT)
Message-ID: <6852b25f-94a4-4e04-adc5-5c79eb1f17ca@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 19:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
To: Eugen Hristev <eugen.hristev@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20241025084823.475199-1-eugen.hristev@linaro.org>
 <c1d4c2b6-85a0-467a-930c-ac2797c72699@oss.qualcomm.com>
 <a4c44b88-d106-4365-b405-ced561b9e526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a4c44b88-d106-4365-b405-ced561b9e526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wpZCaOokjBI-r1pzhy48yo6GW-CZZ6ny
X-Proofpoint-ORIG-GUID: wpZCaOokjBI-r1pzhy48yo6GW-CZZ6ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250130

On 25.10.2024 2:06 PM, Eugen Hristev wrote:
> 
> 
> On 10/25/24 12:03, Konrad Dybcio wrote:
>> On 25.10.2024 10:48 AM, Eugen Hristev wrote:
>>> Reworked BCM_TCS_CMD macro in order to fix warnings from sparse:
>>>
>>> drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
>>> drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
>>>
>>> While at it, used u32_encode_bits which made the code easier to
>>> follow and removed unnecessary shift definitions.
>>>
>>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>>> ---
>>>   include/soc/qcom/tcs.h | 19 ++++++++-----------
>>>   1 file changed, 8 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
>>> index 3acca067c72b..130ed2582f37 100644
>>> --- a/include/soc/qcom/tcs.h
>>> +++ b/include/soc/qcom/tcs.h
>>> @@ -60,22 +60,19 @@ struct tcs_request {
>>>       struct tcs_cmd *cmds;
>>>   };
>>>   -#define BCM_TCS_CMD_COMMIT_SHFT        30
>>>   #define BCM_TCS_CMD_COMMIT_MASK        0x40000000
>>> -#define BCM_TCS_CMD_VALID_SHFT        29
>>>   #define BCM_TCS_CMD_VALID_MASK        0x20000000
>>> -#define BCM_TCS_CMD_VOTE_X_SHFT        14
>>>   #define BCM_TCS_CMD_VOTE_MASK        0x3fff
>>> -#define BCM_TCS_CMD_VOTE_Y_SHFT        0
>>> -#define BCM_TCS_CMD_VOTE_Y_MASK        0xfffc000
>>> +#define BCM_TCS_CMD_VOTE_Y_MASK        0x3fff
>>> +#define BCM_TCS_CMD_VOTE_X_MASK        0xfffc000
>>>     /* Construct a Bus Clock Manager (BCM) specific TCS command */
>>>   #define BCM_TCS_CMD(commit, valid, vote_x, vote_y)        \
>>> -    (((commit) << BCM_TCS_CMD_COMMIT_SHFT) |        \
>>> -    ((valid) << BCM_TCS_CMD_VALID_SHFT) |            \
>>> -    ((cpu_to_le32(vote_x) &                    \
>>> -    BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_X_SHFT) |    \
>>> -    ((cpu_to_le32(vote_y) &                    \
>>> -    BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_Y_SHFT))
>>> +    (u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |    \
>>> +    u32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |    \
>>> +    u32_encode_bits((__force u32)cpu_to_le32(vote_x),    \
>>> +            BCM_TCS_CMD_VOTE_X_MASK) |        \
>>> +    u32_encode_bits((__force u32)cpu_to_le32(vote_y),    \
>>> +            BCM_TCS_CMD_VOTE_Y_MASK))
>>
>> FIELD_PREP/GET?
>>
>> Konrad
> 
> What would be the difference/advantage in using FIELD_PREP/GET instead of u32_encode_bits ?

Probably none. I thought it was a function and not another magic macro,
as it's lowercase..

Doesn't le32_encode_bits do what you need then?

Konrad

