Return-Path: <linux-arm-msm+bounces-91667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCXdAIHmgWl0LwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:13:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57246D8DC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C9C730131F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C65733D6E3;
	Tue,  3 Feb 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nl6YtP03";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLqR9fmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D146B33D6D9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120509; cv=none; b=K1rI+LiXicv90W4lf9Hm1dYvjTj4NPB5oT5peGr324ECzwT+kJtCo1PhewNBcpSeMD9pe8YtblybDYKzJ6S1i1ane0L+YqQPNXdq5o7oaT6V4POtIZFItYulbIihr5AJAwTH3gwFsiBMGCL7Jv04NJOYVvsXWHlKQsxoPpbVBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120509; c=relaxed/simple;
	bh=MCj4UzcWNYvU0euy+ML1A5R801sYbI+2J7fg5rHBXVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=VTW7uC2TE6pCVa6G/pjGPPUdEG5B8Ikq164bs2Ow4fAl+m2zP8T6Rzx9M8r0c8zYljNxX6bOc5LUXeGdOqMQcDj4mgGyL/8S2bC8lFFSTtqbLF1LSYhI8g+durkkYR4LJ/ub2cX9rv7BuGDEZaxOPf0OT2j/q1YuElcYg4IQ37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nl6YtP03; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLqR9fmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613BMJ5N2848483
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7h20MCirN2R6w9UGWVeyGVzBsz4bKvBB1VWC/VSR0k=; b=Nl6YtP03sJmlmlWI
	NqhiqSHHqr2Fs9mO0HZyIujupk60wK48NPFS2lVwy68IfD69aVohvyccLBC7TzYw
	Aa0NpohjhVVepb8/SL5awQg2IlhioIe6jxcLQpIil2VweZWPeZtSAiTDf8uuVZha
	FvhuZ4TfyD4VP3+JI2G7dAaBpy9PcSyJWZqCKTorJ8ldXnW4419eI9EHRbPvV3kS
	5BTHKlKqgBt5KtynGAsQpECtV5C2BmXGawvsfj0oD4iXF3TuN5m4l4mAN2sxMsm9
	ezgSt8qQoXatu95irv9AH2weX0b1go6WyGAm0cy7S4RjJZ3W+ylXvojq6mP+z2g1
	Pd1BpA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33g428-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:08:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8231f407512so7084386b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770120506; x=1770725306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7h20MCirN2R6w9UGWVeyGVzBsz4bKvBB1VWC/VSR0k=;
        b=RLqR9fmitrPGODrR3H3AuunwLt1Bk5R0n6H/Oa0KYPFmqTJtJUyiPq7KfIKmA3X64A
         snNHYJUaPBr9YzSP123XbJis8NzKRv4l84076afgwqJu+xzNZAaq/cyoN/wA7X1mjtZE
         Y+0XI6mXnyZ237jgXgh4jXNh5qbs2k2EJ/MJEOwSJbU83IGm146QHVzkxpragjis15RB
         ewdI5gtbadgLMjAHpffwcDws4UVy70vV9VYzZr4OJOIq0H2UM++pFOFBFFD/+CmvO09r
         +SREi+L1tLJzBPSqx5LPlzvzp+HO1xepkLqESLraPVLle2iVDm9DkZgPt8BWZBye9p20
         NULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120506; x=1770725306;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7h20MCirN2R6w9UGWVeyGVzBsz4bKvBB1VWC/VSR0k=;
        b=BQbUnGbpqJcOPgIrzRXGOCf6i2wYJDyJMvQhujA7P8SyVpWgCBAS7Dq0d4xgplXUW/
         kusKzxPs5GWgwooXkAZ0AwSgcX81cGkGy+02aVk7ibBQN7VX3bAj+i2WM9oKW/3sMoh3
         gcSRMp3cmr1DHlZmf5RUGuAydm2C6BPApqOONnpvJ1Q8FROwVp1P1BzZlnWBT66KDAWM
         sruyETu/qqUaYiaEjM2wItecKxNeLTjiIXXjLWT6+OQYcHKbHXdV03yPc/nGpV/r5K0y
         +CVGiGQ7lQ3d0wRty1ncsJP3SXwsr5e3LJLcHLN89EluPHYbvtjLnrKsB06vMwtuODas
         v73A==
X-Forwarded-Encrypted: i=1; AJvYcCUmKKNAjlqt4/qqxIVRk89h/8L1XzwOfv2NKLX538fP1/IxwECMgLmz/JDcO+0BX9uFN9RaD3wrP9hG/OvI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9LEF20nVLgetJkS9lJZpu7sZM+XlJ+XxI7RMF5Ehka6Zj0sVc
	hg6UE64UWl34J/JsiFtjFs77JR/okjxZr7w7AZqiswZ2M8NSlp5NdJcLILefJ5an3gGVCoGWiCV
	seSRObLOwmmqS4Mee0ZVeMyUtXvv3shPdgX4jc6PBcqfUUhAY4K6Y+BwjcKW8yRyZdpac
X-Gm-Gg: AZuq6aImsJQxAO4cRFHD3WNAkLDitSOylOFjcMZAH91TUnX8PhbOOFpXIY5cQ76BFwj
	3nxkHzTsgKtuRooUqHKW0WmxwhXAlGq6yuXlKfkEESxTrVc+2oWOv86gn0EW3Mht4CBhG+qxZHF
	ghflGGS82n8FU2sK8+k7HeFOzS2UPq0iHgeekkfEghCUjoAN/FceONz5g++bcqRFo2V9fxm12Hk
	4ue2qP6cMyA2Xa0V46n+C4un/yYPZMSZkLSOQZM+BDMt5MU38BBRaaCl3o/4zhxZ6yRdjtiofxZ
	phjBj33B4AtWcYlxp9fVk5u7GIEV2YqgYB+iJfQ9lq7KlRnMx39XvN8vtFZnagqiA0Z/9BMUj3j
	jT03vjc81DKRvmgHqdomO0lwtrFgNahsT7ywEO66apBDmZyvWMH39QBsws3wbtmsqSUYd2Uwkqe
	EecaQ=
X-Received: by 2002:a05:6a00:3a1d:b0:81f:adb3:21c7 with SMTP id d2e1a72fcca58-823ab684020mr14247664b3a.22.1770120505627;
        Tue, 03 Feb 2026 04:08:25 -0800 (PST)
X-Received: by 2002:a05:6a00:3a1d:b0:81f:adb3:21c7 with SMTP id d2e1a72fcca58-823ab684020mr14247634b3a.22.1770120505146;
        Tue, 03 Feb 2026 04:08:25 -0800 (PST)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c5a190sm22756121b3a.68.2026.02.03.04.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:08:24 -0800 (PST)
Message-ID: <592129fa-cd8e-44b5-a18c-1fb6c6ed102b@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 20:08:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Greg KH <gregkh@linuxfoundation.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
 <2026020245-catalog-outburst-f805@gregkh>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <2026020245-catalog-outburst-f805@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=6981e53a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X5nBk1X44HCHp22wJVoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: sflVyO3k23Kewt2V4BUc5f5xpYSmOU7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NiBTYWx0ZWRfXzjj4vP0jt+Kp
 B/RXrjiis7SyQT9nbhE4K90DRm2pWLMawXpwo5FaTLAzx7tnsrUa1aUw2IB+DZLKpBTeqP1Tp7p
 qhEjac1+mwv1wmD9owN48/iEXjJZuDyJGoFb0nFjboRLLNJC7NuzxEGv3X75ZvT+gu8GuWDWzis
 Y1d3CNP/6DFuifC9DYjqVey+or8piNxNPbnAR2lU1ueFvQ0DdLxzcioboKSxjRLIS3A6g9XszwM
 sb8erxeM/SYVJNHsRQ9YwbLJMD5G67GO7/yHkiwUfIwgiQLdzlIDDhLER1BBRjITyXPxf93iZJg
 gt8hmVbptqVgMXf34Oe2BZHtb47XayNh0uDExP05siu+2kJEB62sY02pFtG99x+Ee2YdFS3mAlU
 Cs3msPIohpfrZ6Wiz0rsKrY4raVLnrU51HcmYrXhqRsqIMWJo5XLUzKf+X2J8n1GVuMDHEZDs/G
 TJwqqfAtYkZ2QegLgmQ==
X-Proofpoint-GUID: sflVyO3k23Kewt2V4BUc5f5xpYSmOU7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91667-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57246D8DC7
X-Rspamd-Action: no action



On 2/2/2026 4:41 PM, Greg KH wrote:
> On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 10:49 PM, Greg KH wrote:
>>> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> The fastrpc_buf_free function currently does not handle the case where
>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>> dereference, causing a crash or undefined behavior when the function
>>>> attempts to access members of the buf structure. Add a NULL check to
>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>
>>> What caller passes in NULL here?  I did a quick look, and see where the
>>> callers check this properly if it could be NULL, otherwise it all looks
>>> sane to me.  What in-kernel user is causing a crash here?  Why not fix
>>> the caller up instead?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
>> in a lot of other kernel API.
> 
> But you do not do that for all functions in the kernel, otherwise the
> kernel would be full of checks that are never hit at all.
To clarify the intention: this change was not triggered by any real 
crash in current callers. The motivation came from the v1 review 
discussion [1], where it was suggested that a NULL check in 
fastrpc_buf_free() would allow simplifying some of the caller paths.

[1] 
https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> 
>> And it was pointed out in the v1 patch discussion that this change was
>> needed:
>> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> 
> Were the checks removed from the caller side like was asked for?

Currently, I have placed the check inside the API and removed all the 
checks outside the API.

> 
> Also, your changelog makes it sound like this is a real bugfix for
> something, when it is not at all, which is what I object to the most.
> Don't make scary changelogs for things that are not actually happening.

You are correct. I will modify the commit text that caused the 
misunderstanding.

> 
> thanks,
> 
> greg k-h


