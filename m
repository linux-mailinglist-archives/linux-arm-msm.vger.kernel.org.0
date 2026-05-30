Return-Path: <linux-arm-msm+bounces-110345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEMEFeqsGmrU7AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:24:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56E60BD96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59014300B061
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 09:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF8E39B489;
	Sat, 30 May 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nGMdZ4Ed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WS0QdGTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C02385D6C
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780133088; cv=none; b=onNhsarUlbgbshFooYrYn6QKm5XzcKT2m/Ku1oLqB8SzbYx8S65b6OIN4aejs2TahxNBFHwomkYn5jqJrS2poO/D8etGD/xEdw8qD/neahL+Zc6GrwxP/g8Vy4uvTUZS9Y8xFjw4KOaWRmZCqFwfcPO0jqY12ugzQw4WFN3LD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780133088; c=relaxed/simple;
	bh=mfhgiaTuK6yLmXKa2nqbhtXxlBytQL0xg29eRb69EI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXY1ZcwSJy5fEly990gabAOHkU/lHhKiAiYX1vlgo979eE4hL8GOKucwHGdLWptJ5gov0IF7U4MhlcyFVLbXhfkTHSnl1eAa/0DlihvO7ZinY6dRT96ai48wqY02oxcg9fbqbPgys2LTV78gxLmmfZYtgJXbkeYnCABH01EdYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nGMdZ4Ed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WS0QdGTF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3k8Nv1758088
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 09:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhfBMG5HYdyFgzBc5ZmUm0qXum1tWTYIhgBxs5Py+iI=; b=nGMdZ4EdaG5etDu1
	hDJkj9xN9JtzQ8cKsQtaAn7iZzc8PerP4K/S+PEKS8T2U2aFUFT7KN+OXSIpODwk
	jFUFc4XHKJrT97mY+e4WW5GTOHXq+nUhNWf8uYsq0JZAopt/SSHY24qJuqTBEFfr
	WORR9GZEmAxKRLoIYfidnDrt9tQB6PSLDpI81nHrsyImziIweArJ7evxprHFkvHg
	KW0U39RCHtDSUiNfpt62FWcp0hhNGSUo8C8cKITc7Rh71Hvf8+1lnvKaWYUTjOrN
	ENhSes5HvYdTKLASaXKXoh95L/XjcDSbNzspsWNd8n+2cSSkxBcUYMHPfK3qwKL0
	3TFpSA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr988k5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 09:24:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422b544a4bso258247b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780133084; x=1780737884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhfBMG5HYdyFgzBc5ZmUm0qXum1tWTYIhgBxs5Py+iI=;
        b=WS0QdGTFxOQKDZ8as9xeNtmT+VFfNF+upEiPMwrX5XOJ8pq9aEYeXuek+4chpos6AP
         GivIYChbuQuWnvKK3Md2C8zmJOEueWNg9osXQwpZtNbRxKI2O9QWgXxmbU5tQwl2X/ji
         lqzzDHWh/L7Eja1BlfuDPS+CE/wJxDJnbV4ivxYTQG0x1wj/RRdEX1juzYbtTKTW6uYb
         hUeEkUKqauZoBurkFuA/WxY7VotKeiVhU6xAyEtR5K4jR60a/EKcUpGL9VMfXElFPliR
         xXhf2u4ONOseia+6sbJACXt1Vr7ffbXX2WNpnrz6SO9Rh5SMG2ScKs7Gs0W6ld9k659r
         camQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780133084; x=1780737884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhfBMG5HYdyFgzBc5ZmUm0qXum1tWTYIhgBxs5Py+iI=;
        b=CjQSKyyLjKoH+manTNkP6yFDWQTwBNJi8owLUglubFHkPhIksATMBtm0+Wt0EiRUMG
         bL4BDI7QRzyVRfh4R1NJdtjRPaKPmJxcpSBniP1FXIeAYMebvqWIlFCidEBriecgpd42
         Oa/h4cq8zin9Y+t1/Sg9O97FZp/T8Bc5IN1tFlakXy0QQQ08BihQYSVpUYtJ5ygeiRiu
         WmWOhKRkg3xhvsudLt6JJUqrHCf6Bg1L9fC6XJnWlNMlCBvgEohTx+wwp9MQ7dNrvm9w
         NLpQJuMGzTpUK3Uc2Pn0BEXspnX5w8tPx+LRy+KYuzDPY/Rs2qNYbItkDbmzN/jHy7Cc
         2ZuA==
X-Forwarded-Encrypted: i=1; AFNElJ/pALuWNzCGRehtXCOcf7Gy25uc4ma194v7tIzgBrG57pJH3pjgOGimP4lTTUGj2QlQSmnBEjuiZSRHcNUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2EYC136eE+xXlgTwscSAO1Sc265O7pGxYgK9sjnm5y4Pe9paA
	sP/SRCzNg8GhicaiqUaHuSGpaTw0qyw5GvHccGiVUFbYNo5fkt5pU2I6a5xU3exikpuKUQpfkwM
	QWcVAvNsEkNlRy2hK0lIwjQL1uY2zngeXLqV80XgEr9v7YtR2jT46Y1lqb6/XdqosPICl
X-Gm-Gg: Acq92OGEVbxqetHm3Zk8k/BoU08k6FZyV0uGbEi9nNvY5bFZLWyEoN9ATP6EpHfJHs7
	ZRTm7DdWvRKrV3FTNpzfWypkch3PKLrNx2B2uNADcsvipAN04DBj6yQpWQJM2P9/+ieiFUPlgeV
	hqlbClBzRAUY0oWH3PEmz6kS/AdbuhVMgmPvEKnY+74syPTCcufmhKcPFncogSaL2GFMrvHUzxq
	ow4Zx4DPsK68yPyUXImXo/5ezhr9HWiTm/h00UNoTJUYfGV2tLVZZ4uZdQM1ydT3P5MDudoCGjp
	03U1VTVbE9uabkZlp2YMmDvt0styb5Gbt/F7cKVHm/DQd2Ua5fEoDGqDR3VBe0dokQmXrxTvY1/
	+5K3g/zTrLxILW9c6sRhMx44qC5jzomdvz5+CuAso7QL8rBOiRwGafHfaNhjN9J8=
X-Received: by 2002:a05:6a00:3d01:b0:835:405a:7e6f with SMTP id d2e1a72fcca58-84225362f52mr3054514b3a.14.1780133083981;
        Sat, 30 May 2026 02:24:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:835:405a:7e6f with SMTP id d2e1a72fcca58-84225362f52mr3054502b3a.14.1780133083453;
        Sat, 30 May 2026 02:24:43 -0700 (PDT)
Received: from [10.159.40.18] ([223.187.64.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c93671sm4384650b3a.32.2026.05.30.02.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 02:24:43 -0700 (PDT)
Message-ID: <4d2823d3-567e-4c6e-0950-3f0df80ff184@oss.qualcomm.com>
Date: Sat, 30 May 2026 14:54:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com>
 <178010072997.281459.14229826511412321235.b4-reply@b4>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <178010072997.281459.14229826511412321235.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1aacdd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=oGjwh6mXH1WmlHNvfIVC4w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dY0NOufmnymP-xibv2IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: kOZuVFLjBSFT8hW_UwwWsdJ-ljagWzAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDA5OSBTYWx0ZWRfXziSj+Hn4Q8pB
 DziB12B4DvmqPaOuWn6S5b1DaxM6UFZvpMVsVJexw568H80lTn7MbFUetYm3cy/w66CQ11OIyod
 +wJR7Qstw3TFm9QgKDuOmbcc3m4Gm3Q2IsAiHxJCon4/wYqARcDVfwFe5+vdtb3dZ0iWm2wIy0/
 O8R0hRvxQoSQwc5mzVsSoz1B9oVeaCxisJJDjzVzKpEZeZ+ZicYiGO/tX6k+42dKRfaga3pmyi7
 3u+qACua+/LM8DvCqUcv5jAl9ng9v00dLGm5iLTtYjwqnECfJai0LSHo3AEaXxezLcCq6geiOIn
 VeSF27RU+J3ioTPgFqyNsWkhGo/210PEtsRqCUEviZ9a6YOjCjvY9Jg1I8jgMnEKnWnUsyv8Fg2
 ohwzS9go+s60KsSzZtrhm6PwLeetQKK2jUpDha2AF5zMdrbXukCZCQhic6XdVDUHNuMvYDA60/6
 LpxEDYFk38FcUk0pE6A==
X-Proofpoint-ORIG-GUID: kOZuVFLjBSFT8hW_UwwWsdJ-ljagWzAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110345-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB56E60BD96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/30/2026 5:55 AM, bod@kernel.org wrote:
> On 2026-05-14 00:28 +0530, Vishnu Reddy wrote:
>> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
>> num_comv count unconditionally when calculating the co-located motion
>> vector (COMV) buffer size. This resulted in an oversized COMV buffer
>> allocation throughout decode session, wasting memory regardless of
>> actual number of buffers required.
>>
>> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
>> replace iris_vpu_dec_comv_size(). These derive num_comv dynamically, it
>> uses inst->fw_min_count once the firmware has reported its buffer
>> requirements, and fallback to output count during initialization before
>> firmware has communicated its requirements. This aligns the COMV buffer
>> size to the actual count needed rather than always allocating with fixed
>> VIDEO_MAX_FRAME value.
>>
>> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
>> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
>> COMV size calculation to use MIN_BUFFERS even before firmware had reported
>> its actual requirements. Fix this by initializing fw_min_count to 0.
>>
>> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
>> to 6.16MB per decode session, significantly reducing memory consumption.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> - Rebase on linux-media/users/bodonoghue next+fixes
>> - Resolve merge conflicts due to merged patch "media: qcom: iris: don't
>>   use function indirection in gen2-specific code"
>> - Link to v3: https://lore.kernel.org/all/20260506-optimize_comv_buffer-v3-1-c1b4a44e4300@oss.qualcomm.com/
>>
>> Changes in v3:
>> - Update num_comv from instance data instead of using caps num_comv
>>   in set_num_comv function to avoid wrong value update during concurrency.
>> - Link to v2: https://lore.kernel.org/r/20260504-optimize_comv_buffer-v2-1-69379a59e17d@oss.qualcomm.com
>>
>> Changes in v2:
>> - Update commit description (Bryan)
>> - Update hfi comv buffer count value to use actual num_comv count which
>>   used for buffer calculation to avoid any overhead or fixed values (Vikash)
>> - Link to v1: https://lore.kernel.org/r/20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com
> Please rebase.

Hi Bryan,

I checked that the patch is already present in linux-media/users/bodonoghue →
venus-iris-next.
It also applies cleanly on the following branches:
linux-next → master
media tree → next
linux-media/users/bodonoghue → next
linux-media/users/bodonoghue → next+fixes
linux-media/users/bodonoghue → next-smoketest

Could you please let me know on which branch the patch is not applying
cleanly and where exactly you'd like me to rebase?

Thanks,
Vishnu Reddy.

> <<< deckard@inspiron14p-linux~/Development/linux-worktrees/b4/bod-media-committers-next-plaform-qcom
>>>> b4 shazam 20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com                                                                                                    ‹git:next-smoketest ✘› 01:14.01 Sat May 30 2026 >>> 
> Looking up https://lore.kernel.org/all/20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com/
> Grabbing thread from lore.kernel.org/all/20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Nothing matching that query.
> Analyzing 1 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✗ [PATCH v4] media: iris: optimize COMV buffer allocation for VPU3x and VPU4x
>   ---
>   ✗ No key: ed25519/busanna.reddy@oss.qualcomm.com
>   ---
>   NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 1
> ---
> Applying: media: iris: optimize COMV buffer allocation for VPU3x and VPU4x
> Patch failed at 0001 media: iris: optimize COMV buffer allocation for VPU3x and VPU4x
> error: patch failed: drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:10
> error: drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c: patch does not apply
> error: patch failed: drivers/media/platform/qcom/iris/iris_platform_common.h:87
> error: drivers/media/platform/qcom/iris/iris_platform_common.h: patch does not apply
> error: patch failed: drivers/media/platform/qcom/iris/iris_platform_qcs8300.h:15
> error: drivers/media/platform/qcom/iris/iris_platform_qcs8300.h: patch does not apply
> error: patch failed: drivers/media/platform/qcom/iris/iris_platform_sm8550.h:23
> error: drivers/media/platform/qcom/iris/iris_platform_sm8550.h: patch does not apply
> error: patch failed: drivers/media/platform/qcom/iris/iris_vdec.c:24
> error: drivers/media/platform/qcom/iris/iris_vdec.c: patch does not apply
> error: patch failed: drivers/media/platform/qcom/iris/iris_vpu_buffer.c:2025
> error: drivers/media/platform/qcom/iris/iris_vpu_buffer.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
>
> ---
> bod
>

