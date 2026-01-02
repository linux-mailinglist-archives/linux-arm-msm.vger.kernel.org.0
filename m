Return-Path: <linux-arm-msm+bounces-87275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F1CEF35F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 19:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55FC13011B3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 18:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857A43161BA;
	Fri,  2 Jan 2026 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gD9ZmPSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lv5XODNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF1315D58
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767380354; cv=none; b=YBdQKm+KgqPWEVA5bUheOhFneRTy69gNBbwpO9kmNwYylv5kVbHQhOO+SIMHGGNK7zFHdz/wNO86kWCGNimPB4cP9+zK064C67FpV7ZGRAUswGHmd1G8sp2v+b8T+SRCoe/mtmlofuegagOeRb8WueywaYH8UqWnCt/ZIwHhJJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767380354; c=relaxed/simple;
	bh=Ikc5b75X2N/nN0ui7rHA46nMICE6Qo6nBKXUrVF2glc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQCNXNoMhe7SVYPue+yA5aKsGgrJSzS56D//fD/FTpDBJ5ysMbg9eSYyH+sv/+Fqq8uwBB2uG/vUQ+ArS+H7zwIFqc/BzTmjIpp+mnwM3YVjTBzV/tddVpq4aNwT4bDr5ID8GXET7/pdE0aIZGwJv4auS2D6uJK0FHx1gA9Uqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gD9ZmPSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lv5XODNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vx5d426633
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 18:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkRgZRZXo+1YGbUUFJLarrQeT+vjwljFVTblp9cfZoo=; b=gD9ZmPSjBXnwCWoA
	NTDaIbA8U1MPQwztsl+mcp0jx34lJFZZOf5+pQQugOOwSXmQcMLM+i5y2UuNDaC4
	VeKRUYcSUIoGqtAKksKQP65bqe7AUnEV2IQrk4mPLTNmo6sQG9bOHJA1UKVb4PgS
	7wgyY1jPzI+SFheLVe2VXBqUZ/R53qSREzPontEi2AiCO6X1uuP0fmN/Q3t/oAfl
	fBvC6hSE14STyfq1N167Is6VLgMy4+JhZ3msHKWoMPQeD3oiDhQYE6fndXlEtfJe
	zAioFaPm+OHNQ/Fox89YHKhRQCsoVawh3tECduFHSIhttWyDhpkYErmHZQIlzp3T
	vrOnRA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjsnyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 18:59:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c16eda1a75cso734568a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767380351; x=1767985151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkRgZRZXo+1YGbUUFJLarrQeT+vjwljFVTblp9cfZoo=;
        b=Lv5XODNZ7FDXpzxIWkAy5ZfSORS7U0Mc+7b9o3y2biuWwRpRAsxyHxLtXDW7kVroG5
         Op5AT2JeKyBzwNLH9LB0gb+uhSgAZO3kJhV0gJpb4K4MU0EEXqE/zerdkNXhslLnIMsJ
         Br/8Fpz1wkURH3RVpH+nXKvlRyX6WFyw5OjPwwSSc7Zq/BjvC49EByH4L/gLF3JXV3Eu
         YChHp0Ga4U+AuBO1ES9a2ZuAFrM25Cr1FFgku1KR6JwtqmzxsOpd8yxE9X7xhDzWZgBL
         eUYM0lXDMcetyCKzQoLtgJ4dSgO4k706ESgk046sYnt01qKTPikcgs3ZOLpTiH2bfPsT
         eFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767380351; x=1767985151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkRgZRZXo+1YGbUUFJLarrQeT+vjwljFVTblp9cfZoo=;
        b=kQAQeBFNlyHG6JEL1Hum1wUDcbOZknFrh303tmGUTR1EkA2Xo++QVDdziuNA5DOx+r
         aqfeItPY+hFGhpoHrKmt8FNZvyYiak1KtoDYpxc7n+GqTuFLelMXTcWnmh5LIQs/Onm/
         XwSXnX9yV6gks00ZFz/18zNMCxU/g+1xaiR8sr5HMTgfBXHc5nYr3MHIFlv0MLzSKhJH
         hYW0PW2Nv5WJ8ZMfWNFtK+mzOMJ85B4HTKCSwTnA3mXHcFNv0OpBMzn3BrBl9+eDzCwv
         AUGYSAuab1KVBvZannGhX+dsTAb1dtRMZJf0Tzs1nWvE4eLdtRWcKvZtORRvZJVWnKIj
         9qYA==
X-Forwarded-Encrypted: i=1; AJvYcCWYyxMftGSsNYhDiykKlF6hCyjqwIHyn+kZl4HYzHQXJKRcxrSfY5qmtsiPjz/2pNaoZyNZUCX111MusgA8@vger.kernel.org
X-Gm-Message-State: AOJu0YxV+jrqMznWvD4hsTvSM7eZWMYQlaXNILEIPjc3g+NluuHVFq0E
	33oMEf8eY0mWhPrtsd3OAp+VKVjfrGOv2PQYRNqQRUVKdGIEA7+zbjO/7CsQIL0ZgS/CbrpUvsU
	oOU5jCTMFJW6V3ymKMiKbKxbdT04bW/ZobhZSeWTzFp9OPqkLECX8w0cdoGINZwyOn9GP
X-Gm-Gg: AY/fxX73ifgsew5+Hd1INiePphp+fry5ev2IkLODxqeHz09zXyBPsm123SxgbASd3TW
	QVwIGMupUKRbcZhVgM/7xZC4Ck0aCRSJ3yvw39L2fu0O9EhoBUJTo+OHMu7zThN6MZsCUjFqNIw
	uH13yNI8co0jJDIvjDMbvdVcjZI/FOB+TjQJDN5UjCIPE9opVU8buwlpt7kzt0fBxk+AzslY7Ry
	vua0mLgvpearJnAzA0NoIzyqEQTz6poCwMaVQnNekB/aSQUU9Hc0fiz+NlbVLAARBx7SzxZUB3R
	2S9+BrybcW3bvVOlinoWGUbAjHHsxCkbRFzYG2ST28T/S0Px3vMTVroRw4tUNslmdMioXbfB7it
	N8p0ludvTRmCMC8HkjkXRdk1pQXReOCbDgFxgTo/AUqSpHtnb4CHIqaalbj07VIDhkfFGmlmN
X-Received: by 2002:a05:693c:8399:20b0:2ae:5715:88ba with SMTP id 5a478bee46e88-2b05ec6fedbmr16873133eec.8.1767380351018;
        Fri, 02 Jan 2026 10:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3muKC3i4/PTRcy5wULqmj0X4FCmJIJuF6ICO9XbcUaLwHjYUX6/SJGQ8GKwIqi/uOGdkVOw==
X-Received: by 2002:a05:693c:8399:20b0:2ae:5715:88ba with SMTP id 5a478bee46e88-2b05ec6fedbmr16873126eec.8.1767380350474;
        Fri, 02 Jan 2026 10:59:10 -0800 (PST)
Received: from [10.110.26.180] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42d8asm1635426eec.13.2026.01.02.10.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 10:59:10 -0800 (PST)
Message-ID: <a8af1513-fda6-4809-80ae-bb07d2ed0db3@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 10:59:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
To: Val Packett <val@packett.cool>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
 <DjKkpb96k7gGFmmmqsmLvO6sKcd02WwZq67n9hY4c75sajI_hENGebzfUBW3Xs3WGJ_oXdeYkNcV-T7UkXO6Xw==@protonmail.internalid>
 <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
 <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
 <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6958157f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=MPIAtpv2AAAA:8
 a=qc00Ym10deOxJbe-hpEA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=bpVTN0Ih95UoZ5Wyh9qI:22
X-Proofpoint-ORIG-GUID: EAKWXzPQfvwMRRAyQKlI_mcFCFzctIJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDE3MCBTYWx0ZWRfX6O838YtiCkbf
 ZGlmrFBX3yWEL2+b9U7zWGWJGOIbr+VXIKVqfxLu2aFBoqfWyc3SFNHSHjqTz4ew8M8rRYK0auQ
 RWA5V/0OCzBdSCdD11LysYBM5CohqVUXfzkeegxdIP5rBDBD7rgxvEzvGzRSOzrNBjR8rWrfScH
 Ylvc+1Qx789x6mh2JsKDN9olZywOtlEnjfEFEF/XS0JRwW0LiPQ3AYQ4tMM276IuWN1I2qA+s8A
 YtOvH5q1XzoEgVeacZSkBlTxYNs0pqEn70M0OMmXeQeWwRvc7WB50jgLXcDjWETsQEWd1wRoG5K
 lnJkeOdAlrAmOpEJHopkHiMQqZPd/EvfjPaP8K7Gnf5hiooVLicRJ1yV3tVwwW2nFkceIb0LpKt
 oIuitT9MRO+kI8hLJ5JTR8Q7dcv3OJvubjWE+GWyqF2CWHM7MHomBRIghRU+4iTu9QN7TG5axSj
 ULiS1bB0ruGwtakcQ0w==
X-Proofpoint-GUID: EAKWXzPQfvwMRRAyQKlI_mcFCFzctIJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020170


On 1/2/2026 3:01 AM, Val Packett wrote:
>
> On 1/2/26 7:44 AM, Bryan O'Donoghue wrote:
>> On 02/01/2026 10:43, Val Packett wrote:
>>>
>>> On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
>>>> Hi all,
>>>>
>>>> This patch series adds initial support for the AV1 stateful decoder
>>>> codecs in iris decoder. Also it adds support for AV1 stateful decoder
>>>> in V4l2. The objective of this work is to extend the Iris decoder's
>>>> capabilities to handle AV1 format codec streams, including necessary
>>>> format handling and buffer management.
>>>
>>> This is awesome, thanks!
>>>
>>> I've tested it with rpi-ffmpeg as well, and it works great (only
>>> required one interesting logic change..
>>> https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/
>>>
>>>> unsupported content with bitdepth 10 (66 tests)
>>>> Iris decoder supports only 8bit NV12
>>>
>>> Any chance we could get 10-bit support soon as well?
>>>
>>> 10-bit is massively popular with AV1, especially with home encodes (see
>>> e.g. https://wiki.x266.mov/docs/encoders/SVT-AV1#encoder-optimization
>>> and the ab-av1 tool's defaults)
>>>
>>>
>>> Thanks,
>>> ~val
>>>
>>
>> Can you give a Tested-by so ? 
>
> Sure, if that's helpful..
>
> Tested-by: Val Packett <val@packett.cool>
>
> for the series
Thank you! We do have plan to enable 10bit as well.

