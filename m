Return-Path: <linux-arm-msm+bounces-114198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fHttCAt1Omrn9QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:59:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE86B6EE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:59:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S0VVIO2O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LN7EV5ma;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E6A030AC53C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32E53D5246;
	Tue, 23 Jun 2026 11:57:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD013D47C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215848; cv=none; b=R8viMdcl0aCAM204SuK2vHcwEe2SKpwyoVd7fENw1wTz9H0nXzQyW6wjrE2cTYzdX9xhDpoKXl0x8sDVipzgrC74D2HApmtlBkM9IXZ5tDb1BcNhRRls511rJ+o4k5ErAjIPxza5hH0Z/47ZLuccI2+GpHz9ungN0krkbSzz0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215848; c=relaxed/simple;
	bh=ta7lCOY3KxJIlrqtQWrMNmSBkzfFL8jzhc14LhT8NbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcGcrqilqGyC+u4tYVawdyilIHQqPnsoQtgr7toLV5K6e24o8qsMg/PmHMrpP3LMJPMNrXwDQeDPfKslwxUBu0ard2mI6feaQ25rsDBhwy3JIORNb5A6HNq5+W1wlR3FkTDTHrVLFrFqdxIAQM1NHt2uIWxKAt+9cHLwGF7CyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0VVIO2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LN7EV5ma; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZLbi4017209
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TINBqYkE26aEktY+EqHl3hxFez9LQ+TsVA+VlTGQXW4=; b=S0VVIO2OBhQfdgaG
	7OzEFAQTUEGVYQrW871GjSkbdL8bv+x24Z9kXKCwVA/0lumnTK9t7JGLCQienIyv
	wWq2iz8+VPzwQOkjlFP6KrCJA3LyWF0HZEzo8EA8IunjBls49e/w1JNzAhH3BZm1
	iBAfgP2koM1OHC8AT1+yOtJAoEN6djiY1Lcnc5M87TCwhY6PH2qo7LC2s7tfDmOO
	guMH3Jg4BLYWAESqLER/p5H+eF9zAHhcpW3lBgsnFnY7M1rfAkqfRqf1eEoxLJNN
	R0AtC/gGqW1nzy2Njj1ATkxHhcpvU1vD9Iuenhhao7DE+6Z8rfNk6d6sTFIiE7R+
	+KJ4Aw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjj5f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:57:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845319bb97bso4510143b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215845; x=1782820645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TINBqYkE26aEktY+EqHl3hxFez9LQ+TsVA+VlTGQXW4=;
        b=LN7EV5madhb6GGSLkt9PbffH8g0j13UE8fefxQhO4xH7dja5AYQfCHGSGIUuLpN4fo
         38E5dtnojY5vAc4mxJkotORSUDQ3D2JxiZU6EphD5npsFAxc50Y8eQdJXY5LmW2zAFoY
         PzEmWj3y8CGdiVY4g7+HXT9cW/oi40nYtJxxheuP1BofgAb+LDa0c6DQeu+nWixqKwoJ
         LUpS1U46ejTgmIG/zUyYy5k3eh33p9JPy7fFPlbdog5OyGl5Kd9PRASxloMgdwfyBMzA
         mi1gaZT/C7AcrLl0EIAgF8vEGZUGGDrcR5hqJMQICouoJfHURaLse5SdnkxYomcZ30Z4
         1SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215845; x=1782820645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TINBqYkE26aEktY+EqHl3hxFez9LQ+TsVA+VlTGQXW4=;
        b=qIJn8PaTrgSB43U0lyCnUeZf1gGgjaW19GWkVAhM9uRdhpE5qZoClbg3HF0AgtJlAQ
         UtMpH5TKim3K0DvhlMBYJutEqSjnsJ/fMc2Rf3E8dkNrwAkIuVP0tgNRSejA2iaA9vnS
         0RlgAZnUUFgZnJo0sD68OjV6DGOSFik1dhjCeOTw6qyJRNhfh7eUUODpCGn7hk7Kcpmf
         kOQqjtseCkpchan3bgXj9H8aJwzDFtpIDGZTY547R9IaoyAGt87XD81MQF4a+xJqsH0P
         ST5DFJ7WRLc5HNvu0YUdyzvt/yS5fnP0jiGO6eNTLyVGM4W4H4fyiKo+htE2Lhgw8vqY
         kBtg==
X-Forwarded-Encrypted: i=1; AFNElJ/4NpLpSv1bkxZtNXtsEW+U4A/skY+BnkxAUetUfTm5COLVPhCmOO5Upz7TNhZJqn+RzEmK63t+6TcIVMfz@vger.kernel.org
X-Gm-Message-State: AOJu0YyZSVAJSgEFl35YOKXuveDQ0LXQ5VII1SekV7uPCYtYxtU1XIBv
	gUpkCwtR+6U+H6JRhBUOe74TK3UV9OGd9DqRszzIWUqevyNNAuxAOCNqeePb9AyLk/+1UFQc8yl
	SksvH9zrdf8W9po/MvIFnte0XIO9mCtmCi3ZT15aqyLSgWzOMXKpF/DOqSZpTAawAxk+T
X-Gm-Gg: AfdE7cn58+pDjv96ibQobn1H85ExOg5PS5WkEW3EJsO+EecV2KIJrg57axpTL7aIXiY
	yTg9ZRrZx+a4W8QwwQr6RRp+AR59/N5Wn04ztTfhUEnWrOwdNCbMiQloXHM5t40d1VoDu9nnPRl
	ERqbygntxlBKXaFDG3RekKA9ZIOePu2YSt8cGY5TFG2zprN3f4yAHE+leYvlpZ2kEWvljK39x61
	1lI1cLZmd3kFIKwgWQM0CVulQHnugAeiXLKO40xOf1mdLPaU3aoPW5F6zie/N0EOEZplSFrnUf9
	VwOQueoVoE8TP9vgT8ihch8X9N8+dDpPE2pMErLW+acsU9JutdWshQFgCMAI+Hsfdjr14n4rn6O
	LEWbUfdS2cgc0fRi1G1ehK9FvkLQru50jF4VGaiA=
X-Received: by 2002:a05:6a00:4c1a:b0:82f:390a:69df with SMTP id d2e1a72fcca58-845508bbac3mr20987618b3a.35.1782215845372;
        Tue, 23 Jun 2026 04:57:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:82f:390a:69df with SMTP id d2e1a72fcca58-845508bbac3mr20987573b3a.35.1782215844896;
        Tue, 23 Jun 2026 04:57:24 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ec335csm10473084b3a.49.2026.06.23.04.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:57:24 -0700 (PDT)
Message-ID: <103ebcbe-685f-48e4-bf5a-4a0625e03a05@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:27:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
 <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
 <7c4c3a7a-ad8f-4603-a0ec-2332f296234b@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <7c4c3a7a-ad8f-4603-a0ec-2332f296234b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX8GYGOxvInjcV
 cQik0HVoVuJf4/9pPBFz1OH+UWw11bQuJ0C/0ZTGgMj5tbCgyt3n0CcqTl8pN0/n/FbEW900lSD
 aM49FkZqDSaqyo3Aq3yiZtyTN70qmo30EdVfztScNqbejB1gX0MpRlincc+7bvlwn1bLAAKu+cT
 enHW4B+5dXTPx5WH8Ce03ptN53tlsOtXoc6fcJ+jqRmuFnc1ko47ZsAwaDccK5Fyz19UkW+doJj
 IXWYtCUe4/u2HrdJplzkiElDepPGZehtecT2NDezMk3Bk2+0KtzhGuGWIkMKaMQhBDjdGU7P2/Q
 TeRY9kvtU+LLKF0pyMFSvw3/dfncZdcViXY1TsYLJkhhv8cICRT7v/IbM5F/Mh2TrsWPfBSlBMj
 IC1W3somPVuMOslO+TNJmTJscPs/RM2ekHTFic3Pbn8HCzcUzoRmLvphXxZykBHAdU65VPtWiHx
 S1E/TetfYPN9b+3HnhQ==
X-Proofpoint-GUID: gEX2LGoJRb1--Xqcz7roGtEvZ9Wt3XVd
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a74a6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BE5Ahrv33Z5kx7RYN1UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXwLLgUyBoFztC
 Chx8Qfhy0v9/yQQOQ2sFc+KO0rgo1KTOmzb7pXzidbUpKuyarq4Hhikeu3f1dLNf7b6uHASjt//
 kJYSBEx/XBQxw6sz9pruc+w3lxlE0oM=
X-Proofpoint-ORIG-GUID: gEX2LGoJRb1--Xqcz7roGtEvZ9Wt3XVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114198-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DAE86B6EE3



On 6/23/2026 4:55 PM, Mark Brown wrote:
>> On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
>>> Hi,
>>>
>>> This series converts LPASS WSA and VA macro codec drivers to the PM clock
>>> framework for runtime PM clock handling, and keeps WSA MCLK-output clock
>>> registration resource-managed.
>>>
>>> Changes since v5:
>>> - Rebased to current linux-next/master and regenerated as a standalone
>>>    series that applies cleanly.
>> Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
>> all messages as a separate thread.
> Also you already appear to have sent a v6 of this:

I did attempt to resend this series, but it seems I missed adding the 
RESEND tag and ended up breaking the threading—apologies for the confusion.

You’re right, there is already a v6 posted earlier. I will ensure proper 
versioning and threading going forward, and will use the b4 tool for 
future submissions as suggested.

Ajay Kumar Nandam

> 
>     https://lore.kernel.org/all/20260604124823.3467457-1- 
> ajay.nandam@oss.qualcomm.com/




