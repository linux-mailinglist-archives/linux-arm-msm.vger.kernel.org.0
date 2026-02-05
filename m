Return-Path: <linux-arm-msm+bounces-91853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCW7OOX8g2kXwgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 03:13:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA00EDE75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 03:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8091300A395
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 02:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1592D271469;
	Thu,  5 Feb 2026 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARGVtVsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="er2fLIJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB196222590
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 02:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257603; cv=none; b=b2OOv0w0eqmcf6mLm9ClqCqEGy0nXIY2urOkR1GGT5FnjbXYfTa71cxd8ZwuU8Dw640vp6G2NIl20E6Yo1jfBaoA354mKcrjaMwBC0EFdRxDHC+eogb+nM+6d4xRfeWWYMADjkxYvuzuBOXU/J9rmy3B1d+yCvFwgFENSsaUtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257603; c=relaxed/simple;
	bh=VT0RRHqikmhaB49PP3uakHdFjLZY9wK4a+6e63Eobik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ces/MLe2/ZOO90zsFqsSgPQQtp1teF07J6R844X+rxV5XUMm7U5/ZNE35YFjmIdHbjhl7l/RC9tP+Bvbx2gbrz0K4TW9DYgv6/5ObIq/bPoj7x1uiP6uVGDYfSAJipL+lOwkDRbqACeDX3q/QEpjBB71iwzLyp0mCot8JyPllbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARGVtVsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=er2fLIJX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6150XvHO2248789
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 02:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TmYQxlWA+6vmLSILzeLWelWHYXBVJ+qD/ZnhBA9sLk=; b=ARGVtVskil0SLjuB
	5AxsrR9dWElnhlB+Vj7R/c9XKPt3qzDvQNmdbhLUeCe67rBdM4e9eMzAeNFUfVwF
	lx3WcNDkY8HINgwoVFKvbRgfKZFEDCZTMELaqbG9PQdfNejRXBuxT3lovB9glKBi
	ejcmmaTDARgOitdIv/sRlvOOKkjhbRwUH2EtpCLJoJXqPeb7Bgbn10iGk4JWb3ra
	LlUSdW8EmsycxhhYfON7RrPDPZcaA/BBD9Nol1bkoQ3h6H2h2zPKMN8rlakxB85f
	SHjAkYq6D2seSBV7iuCfQtU2xu2nSwIFHL71WRDwlWaL15ZnLDX4f9yTXgUiuZs1
	b39aFA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qva0t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:13:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82343404fa0so192492b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 18:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770257601; x=1770862401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1TmYQxlWA+6vmLSILzeLWelWHYXBVJ+qD/ZnhBA9sLk=;
        b=er2fLIJXIk2KrVPfeqUBbNFwbdq72+l1U485TBUwJXNNA57PUccDVuA85XvQUFHd+m
         h+PGRvckGOhupR69QR4gzA4guZiG78UjNI/UPKFVP363ggQb/7XIb3pzKdRk1wr1Whrz
         0g87/UDMiEQ9KF9NQxyLhpH/aJBIDH7RSNCfvXQ3/DfZpPh6MKBZMdcrGUjrHioYG9iq
         fqYEdGukhU9uLSOXbyTBm6XHd++bENYY4V5cirdKWk83Wou4uf2a0+jY7MMsFpxch3Cw
         vknbPeNamnaF4iV31RylXfjWpmUsY4sEbo/X/pWLsZMXphCHhcSgF9s2o5b+9MXHIOMJ
         3o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770257601; x=1770862401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TmYQxlWA+6vmLSILzeLWelWHYXBVJ+qD/ZnhBA9sLk=;
        b=COHMiRGhcEeWEjFzSdAupp8V4u2zb61FddTVarSKtaTyh3ATNLNgQCEealqnwqYa+C
         cSKroVmijKO5nOCqN23jmuHwoomdo5KzFKllI4gDEcud3U7y0VOOMdeoNKlqrnpFJDqN
         h83EKogXsZxXUkcifWJtumLqKYQXdCzLwKu5V/0qwln77PvvFECY4wo1sAfktGm+b+tN
         tgYuhq/1x1DPoFX2hvWIOY+xsMaPXG1PlBUOIx1gqM33KGhBv/CMX9xH7WGxxlMgF6As
         mKDOcVwdgPTLf3Ei15sCg+cmIa8be0qwREXeM004+yTlXR1U4FPljALz8DYhB04drkxr
         n5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsnmW99jQPA/LdHMsEsFiVoHsnmqyofMVNseskdH4c37LYL8oci08ftNzBwMvHeyz1/tDhx3YvbWZkuGCf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxuyafTJjlC5FZ8sonETLXihmLawSWWKNc0PdzCYZvD4zCmc5
	TasdfSTgUAzyaA8oBTVP9BPWx7ca+JFVhABvQ2hCKBuUnI16lDxv+x9OmsQIfpm3g3aUHODi8TA
	Vd6JJkssme2XZcPOvvfowZf5mxY7X5kHE3Zmqd1bg9Q0pHngByjMid1OkQmkAi3povnU=
X-Gm-Gg: AZuq6aJv4zHk/qZSOHcg++IVxwRpYHlvfpls9ccOtJWrktQVM/dx4eL6FPHJTLJnSWC
	rM37QEl0txEYBYG1KQH5KnZLsdUUW5r9tBzEASbIyKALM4s9LMZgrxrZGETYvHoVkRW15s2CYxS
	9ccZJLMjmvy9u9J+1ZFk8xTjM7xjJWR03LI+v0NINqbPE3nKiadwqJyfKy4mTRLnybZhLo/ZfOq
	WVwwGjfdG9sGuhs3YNl/bwOGuS3olLdaTdCVF8exVfQx0yo446a2FCX4/BnGIBR5UUBjw/G12/i
	uCAmKcUHlZWph8lChg6nDdxxk8FIFlxJtI3LDuJjcVV7/lOdWFu2pSokfoYg0YL9iL99OzPd0oa
	6EKRE8jJGLVTkYxFUwlRV6kw5ER0SE9q2fmAlSBhLCVgajpHUYFbrSsoG7NqQMaML9jsjGQA8PJ
	YP0vCQUIg=
X-Received: by 2002:a05:6a00:4285:b0:81f:9cbd:68f4 with SMTP id d2e1a72fcca58-8241c74fab4mr5279373b3a.70.1770257600855;
        Wed, 04 Feb 2026 18:13:20 -0800 (PST)
X-Received: by 2002:a05:6a00:4285:b0:81f:9cbd:68f4 with SMTP id d2e1a72fcca58-8241c74fab4mr5279344b3a.70.1770257600238;
        Wed, 04 Feb 2026 18:13:20 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d438897sm3492276b3a.37.2026.02.04.18.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 18:13:19 -0800 (PST)
Message-ID: <b8086bfb-f240-4115-9ab0-18509775932a@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 13:13:13 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tee: optee: prevent use-after-free when the client
 exits before the supplicant
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com>
 <CAHUa44E4Htg9zEMY9XtkMsPRJq+13mq6kSd8RUznHTRvXVXKVQ@mail.gmail.com>
 <55546b03-cbe6-40dd-b794-b2e81efde33a@oss.qualcomm.com>
 <CAHUa44FfowG=GpgLcq=sp_TqRArJtf0_V-tsJY11HH+FEA6u+w@mail.gmail.com>
 <4c9e4f5f-e0f3-42aa-852f-064f4024af26@oss.qualcomm.com>
 <CAHUa44EhaztJ+5piu0c-HQbqZFX47uLPJ+VDRp=Bp6BMeeARAQ@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44EhaztJ+5piu0c-HQbqZFX47uLPJ+VDRp=Bp6BMeeARAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=6983fcc1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Ujbnq6iAAAA:8
 a=3xFdlRoA-qh3-JnTDmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=-sNzveBoo8RYOSiOai2t:22
X-Proofpoint-GUID: bJ_28fx_Jm4LgqT7MSxW45-Oy7j3mGHJ
X-Proofpoint-ORIG-GUID: bJ_28fx_Jm4LgqT7MSxW45-Oy7j3mGHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDAxNCBTYWx0ZWRfX9eOnXeYpeD5e
 SmXu8zKpMaBYa+8TkS3FR/Xz0njUN+NAogJcVY46iGV90J/TOdliB6I65hS81LNcn4rdYUNtD9d
 7UEwMwfAsNfj1vAA3itbqVBnJgDdPXUln5aZCGjTurscruH7A/SlgPlJM0VOE1EycVZi2HPYpi8
 sm6wOc4XIaJEx6thn10MJoH+qYXl75XZxhVySX8eKW8JchuVE9x0NKCY+0tHhw0MPx0iZri9Stt
 VWZfhxyfODrSmagPEHt65ivBB9hpaqJlK71NDAVqTnTZqLSmpYW9Fh2xgR7g9zV4tIAtLdqGuHl
 IGmJpWNLKV4XBqNJr7aiRx8bQhRH8lDIADRHiA6l4laiHYQ+yutM5YlamGxXPMR6U9KflgT4qH6
 0HdfVYOdojT5fuEzpzJxQt3YE7rtsOVcVsmbWh1r4iKobFuMwepaiQIDKi6Xj4QBpNOz+oEYh7r
 /8J3jFHubWsQQP2CAxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_08,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91853-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BA00EDE75
X-Rspamd-Action: no action

Hi Jens,

On 2/4/2026 6:46 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Tue, Feb 3, 2026 at 11:56 PM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi Jens,
>>
>> On 2/3/2026 5:59 PM, Jens Wiklander wrote:
>>> Hi,
>>>
>>> On Tue, Feb 3, 2026 at 3:09 AM Amirreza Zarrabi
>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Jens,
>>>>
>>>> On 2/2/2026 10:36 PM, Jens Wiklander wrote:
>>>>> Hi Amir,
>>>>>
>>>>> On Thu, Jan 29, 2026 at 4:22 AM Amirreza Zarrabi
>>>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
>>>>>> client wait as killable so it can be interrupted during shutdown or
>>>>>> after a supplicant crash. This changes the original lifetime expectations:
>>>>>> the client task can now terminate while the supplicant is still processing
>>>>>> its request.
>>>>>>
>>>>>> If the client exits first it removes the request from its queue and
>>>>>> kfree()s it, while the request ID remains in supp->idr. A subsequent
>>>>>> lookup on the supplicant path then dereferences freed memory, leading to
>>>>>> a use-after-free.
>>>>>>
>>>>>> Serialise access to the request with supp->mutex:
>>>>>>
>>>>>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>>>>>>     looking up and touching the request.
>>>>>>   * Let optee_supp_thrd_req() notice that the client has terminated and
>>>>>>     signal optee_supp_send() accordingly.
>>>>>>
>>>>>> With these changes the request cannot be freed while the supplicant still
>>>>>> has a reference, eliminating the race.
>>>>>>
>>>>>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
>>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>> ---
>>>>>> Changes in v3:
>>>>>> - Introduce processed flag instead of -1 for req->id.
>>>>>> - Update optee_supp_release() as reported by Michael Wu.
>>>>>> - Use mutex instead of guard.
>>>>>> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Replace the static variable with a sentinel value.
>>>>>> - Fix the issue with returning the popped request to the supplicant.
>>>>>> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
>>>>>> ---
>>>>>>  drivers/tee/optee/supp.c | 122 +++++++++++++++++++++++++++++++++--------------
>>>>>>  1 file changed, 86 insertions(+), 36 deletions(-)
>>>>>
>>>>> I had forgotten about this. I'd like to prioritize getting this fixed
>>>>> soon. By the way, how did you test this?
>>>>>
>>>>
>>>> Thanks for the update. I currently don't have access to the setup required to run
>>>> the tests myself. My plan is to finalize the design and implementation, then
>>>> ask Michael Wu to run his use case. Based on his earlier feedback, the patch
>>>> appears to be working as expected.
>>>>
>>>> https://lore.kernel.org/all/292653ba-3836-00f1-acd4-a28b1c54388c@allwinnertech.com/
>>>
>>> OK
>>>
>>>>
>>>>>>
>>>>>> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
>>>>>> index d0f397c90242..0ec66008df19 100644
>>>>>> --- a/drivers/tee/optee/supp.c
>>>>>> +++ b/drivers/tee/optee/supp.c
>>>>>> @@ -10,7 +10,11 @@
>>>>>>  struct optee_supp_req {
>>>>>>         struct list_head link;
>>>>>>
>>>>>> +       int id;
>>>>>> +
>>>>>>         bool in_queue;
>>>>>> +       bool processed;
>>>>>> +
>>>>>>         u32 func;
>>>>>>         u32 ret;
>>>>>>         size_t num_params;
>>>>>> @@ -19,6 +23,9 @@ struct optee_supp_req {
>>>>>>         struct completion c;
>>>>>>  };
>>>>>>
>>>>>> +/* It is temporary request used for invalid pending request in supp->idr. */
>>>>>> +#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
>>>>>> +
>>>>>>  void optee_supp_init(struct optee_supp *supp)
>>>>>>  {
>>>>>>         memset(supp, 0, sizeof(*supp));
>>>>>> @@ -46,6 +53,10 @@ void optee_supp_release(struct optee_supp *supp)
>>>>>>         /* Abort all request retrieved by supplicant */
>>>>>>         idr_for_each_entry(&supp->idr, req, id) {
>>>>>>                 idr_remove(&supp->idr, id);
>>>>>> +               /* Skip if request was already marked invalid */
>>>>>> +               if (IS_ERR(req))
>>>>>> +                       continue;
>>>>>> +
>>>>>>                 req->ret = TEEC_ERROR_COMMUNICATION;
>>>>>>                 complete(&req->c);
>>>>>>         }
>>>>>> @@ -102,6 +113,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>>>>>         mutex_lock(&supp->mutex);
>>>>>>         list_add_tail(&req->link, &supp->reqs);
>>>>>>         req->in_queue = true;
>>>>>> +       req->processed = false;
>>>>>>         mutex_unlock(&supp->mutex);
>>>>>>
>>>>>>         /* Tell an eventual waiter there's a new request */
>>>>>> @@ -117,21 +129,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>>>>>         if (wait_for_completion_killable(&req->c)) {
>>>>>>                 mutex_lock(&supp->mutex);
>>>>>>                 if (req->in_queue) {
>>>>>> +                       /* Supplicant has not seen this request yet. */
>>>>>>                         list_del(&req->link);
>>>>>>                         req->in_queue = false;
>>>>>> +
>>>>>> +                       ret = TEEC_ERROR_COMMUNICATION;
>>>>>> +               } else if (req->processed) {
>>>>>> +                       /*
>>>>>> +                        * Supplicant has processed this request. Ignore the
>>>>>> +                        * kill signal for now and submit the result.
>>>>>> +                        */
>>>>>> +                       ret = req->ret;
>>>>>> +               } else {
>>>>>> +                       /*
>>>>>> +                        * Supplicant is in the middle of processing this
>>>>>> +                        * request. Replace req with INVALID_REQ_PTR so that
>>>>>> +                        * the ID remains busy, causing optee_supp_send() to
>>>>>> +                        * fail on the next call to supp_pop_req() with this ID.
>>>>>> +                        */
>>>>>> +                       idr_replace(&supp->idr, INVALID_REQ_PTR, req->id);
>>>>>> +                       ret = TEEC_ERROR_COMMUNICATION;
>>>>>>                 }
>>>>>> +
>>>>>>                 mutex_unlock(&supp->mutex);
>>>>>> -               req->ret = TEEC_ERROR_COMMUNICATION;
>>>>>> +       } else {
>>>>>> +               ret = req->ret;
>>>>>>         }
>>>>>>
>>>>>> -       ret = req->ret;
>>>>>>         kfree(req);
>>>>>>
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>>>>>> -                                             int num_params, int *id)
>>>>>> +                                             int num_params)
>>>>>>  {
>>>>>>         struct optee_supp_req *req;
>>>>>>
>>>>>> @@ -153,8 +184,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>>>>>>                 return ERR_PTR(-EINVAL);
>>>>>>         }
>>>>>>
>>>>>> -       *id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>>>>>> -       if (*id < 0)
>>>>>> +       req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>>>>>> +       if (req->id < 0)
>>>>>>                 return ERR_PTR(-ENOMEM);
>>>>>
>>>>> Since we're now storing the supplicant request ID, wouldn't it make
>>>>> sense to pre-allocate the ID when allocating the request to avoid this
>>>>> error case?
>>>>>
>>>>
>>>> True, but allocating the ID at this stage has one advantage.
>>>> If an ID is not available, the request can remain on the request list,
>>>> allowing the supplicant to retry later when resources become available.
>>>> If ID allocation fails during request creation, I have no choice but
>>>> to drop the request and report an error to optee.
>>>
>>> We're allocating in the range 1..INT_MAX, and not more than a handful
>>> are expected to be active at a time. If we run out of IDs, we have
>>> bigger problems.
>>>
>>
>> Ack.
>>
>>>>
>>>>>>
>>>>>>         list_del(&req->link);
>>>>>> @@ -214,7 +245,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>>>>>         struct optee *optee = tee_get_drvdata(teedev);
>>>>>>         struct optee_supp *supp = &optee->supp;
>>>>>>         struct optee_supp_req *req = NULL;
>>>>>> -       int id;
>>>>>>         size_t num_meta;
>>>>>>         int rc;
>>>>>>
>>>>>> @@ -224,15 +254,48 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>>>>>
>>>>>>         while (true) {
>>>>>>                 mutex_lock(&supp->mutex);
>>>>>> -               req = supp_pop_entry(supp, *num_params - num_meta, &id);
>>>>>> -               mutex_unlock(&supp->mutex);
>>>>>>
>>>>>> -               if (req) {
>>>>>> -                       if (IS_ERR(req))
>>>>>> -                               return PTR_ERR(req);
>>>>>> -                       break;
>>>>>> +               req = supp_pop_entry(supp, *num_params - num_meta);
>>>>>> +               if (!req) {
>>>>>> +                       mutex_unlock(&supp->mutex);
>>>>>> +                       goto wait_for_request;
>>>>>> +               }
>>>>>> +
>>>>>> +               if (IS_ERR(req)) {
>>>>>> +                       rc = PTR_ERR(req);
>>>>>> +                       mutex_unlock(&supp->mutex);
>>>>>> +
>>>>>> +                       return rc;
>>>>>>                 }
>>>>>>
>>>>>> +               /*
>>>>>> +                * Process the request while holding the lock, so that
>>>>>> +                * optee_supp_thrd_req() doesn't pull the request from under us.
>>>>>> +                */
>>>>>> +
>>>>>> +               if (num_meta) {
>>>>>> +                       /*
>>>>>> +                        * tee-supplicant support meta parameters ->
>>>>>> +                        * requests can be processed asynchronously.
>>>>>> +                        */
>>>>>> +                       param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>>>>>> +                                     TEE_IOCTL_PARAM_ATTR_META;
>>>>>> +                       param->u.value.a = req->id;
>>>>>> +                       param->u.value.b = 0;
>>>>>> +                       param->u.value.c = 0;
>>>>>> +               } else {
>>>>>> +                       supp->req_id = req->id;
>>>>>> +               }
>>>>>> +
>>>>>> +               *func = req->func;
>>>>>> +               *num_params = req->num_params + num_meta;
>>>>>> +               memcpy(param + num_meta, req->param,
>>>>>> +                      sizeof(struct tee_param) * req->num_params);
>>>>>> +
>>>>>> +               mutex_unlock(&supp->mutex);
>>>>>> +               return 0;
>>>>>
>>>>> Do we really need to move this into the loop? The structure of the
>>>>> function becomes a bit unusual and harder to read.
>>>>>
>>>>
>>>> Ack. I'll reorganize this function.
>>>>
>>>>>> +
>>>>>> +wait_for_request:
>>>>>>                 /*
>>>>>>                  * If we didn't get a request we'll block in
>>>>>>                  * wait_for_completion() to avoid needless spinning.
>>>>>> @@ -243,29 +306,10 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>>>>>                  */
>>>>>>                 if (wait_for_completion_interruptible(&supp->reqs_c))
>>>>>>                         return -ERESTARTSYS;
>>>>>> -       }
>>>>>>
>>>>>> -       if (num_meta) {
>>>>>> -               /*
>>>>>> -                * tee-supplicant support meta parameters -> requsts can be
>>>>>> -                * processed asynchronously.
>>>>>> -                */
>>>>>> -               param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>>>>>> -                             TEE_IOCTL_PARAM_ATTR_META;
>>>>>> -               param->u.value.a = id;
>>>>>> -               param->u.value.b = 0;
>>>>>> -               param->u.value.c = 0;
>>>>>> -       } else {
>>>>>> -               mutex_lock(&supp->mutex);
>>>>>> -               supp->req_id = id;
>>>>>> -               mutex_unlock(&supp->mutex);
>>>>>> +               /* Check for the next request in the queue. */
>>>>>>         }
>>>>>>
>>>>>> -       *func = req->func;
>>>>>> -       *num_params = req->num_params + num_meta;
>>>>>> -       memcpy(param + num_meta, req->param,
>>>>>> -              sizeof(struct tee_param) * req->num_params);
>>>>>> -
>>>>>>         return 0;
>>>>>>  }
>>>>>>
>>>>>> @@ -297,12 +341,18 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
>>>>>>         if (!req)
>>>>>>                 return ERR_PTR(-ENOENT);
>>>>>>
>>>>>> +       /* optee_supp_thrd_req() already returned to optee. */
>>>>>> +       if (IS_ERR(req))
>>>>>> +               goto failed_req;
>>>>>> +
>>>>>>         if ((num_params - nm) != req->num_params)
>>>>>>                 return ERR_PTR(-EINVAL);
>>>>>>
>>>>>> +       *num_meta = nm;
>>>>>> +failed_req:
>>>>>>         idr_remove(&supp->idr, id);
>>>>>>         supp->req_id = -1;
>>>>>> -       *num_meta = nm;
>>>>>> +
>>>>>>
>>>>>>         return req;
>>>>>>  }
>>>>>> @@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>>>>>
>>>>>>         mutex_lock(&supp->mutex);
>>>>>>         req = supp_pop_req(supp, num_params, param, &num_meta);
>>>>>> -       mutex_unlock(&supp->mutex);
>>>>>> -
>>>>>>         if (IS_ERR(req)) {
>>>>>> +               mutex_unlock(&supp->mutex);
>>>>>
>>>>> We need a way to tell the difference between an id not found and an id
>>>>> removed because of a killed requester.
>>>>> How about storing NULL for revoked requests instead of an err-pointer?
>>>>>
>>>>
>>>> Not sure I'm following correctly. Are you expecting supp_pop_req()
>>>> to return NULL instead of an err-pointer when a request has been revoked?
>>>
>>> I was looking at it again, and storing an err-pointer as you do in
>>> this patch has the advantage that we can tell whether the ID has been
>>> revoked or was never supplied. In the latter case, it suggests that
>>> the supplicant is doing something wrong and might as well restart in
>>> an attempt to recover. So, please keep using an err-pointer as a
>>> placeholder, but we must be able to distinguish a revoked request from
>>> other errors to make sure that the supplicant doesn't restart due to a
>>> revoked request.
>>>
>>
>> Understood. What if I switch the stored err-pointer to EBADF instead of ENOENT
>> (which seems more natural), so it doesn't overlap with other supp_pop_req() error
>> codes and the supplicant can reliably detect it.
> 
> Any error returned by TEE_IOC_SUPPL_SEND (or TEE_IOC_SUPPL_RECV) will
> cause the tee-supplicant to exit. Even if we update it to ignore
> certain codes, we must also consider the installed base. There's not
> much tee-supplicant could do with this error, except logging it. But I
> don't think that is very useful either. Unless the tee-supplicant does
> anything wrong or if the device isn't working any longer, we shouldn't
> return an error.
> 

The direction of data flow in optee_supp_send is from the supplicant to optee,
so the only way I can return meaningful information back to the supplicant is
through the return value. I suppose I could simply ignore the revoked request
and return success, but it might be useful for the supplicant to know about it
in case it needs to roll back something.

At this point I'm out of ideas :). Do you have any suggestions on how I can
inform the supplicant about a revoked request in optee_supp_send while returning
success return value?

Best regards,
Amir

> Cheers,
> Jens
> 
>>
>> Best Regards,
>> Amir
>>
>>> Cheers,
>>> Jens
>>>
>>>>
>>>> Best Rearads,
>>>> Amir
>>>>
>>>>> Cheers,
>>>>> Jens
>>>>>
>>>>>>                 /* Something is wrong, let supplicant restart. */
>>>>>>                 return PTR_ERR(req);
>>>>>>         }
>>>>>> @@ -355,9 +404,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>>>>>                 }
>>>>>>         }
>>>>>>         req->ret = ret;
>>>>>> -
>>>>>> +       req->processed = true;
>>>>>>         /* Let the requesting thread continue */
>>>>>>         complete(&req->c);
>>>>>> +       mutex_unlock(&supp->mutex);
>>>>>>
>>>>>>         return 0;
>>>>>>  }
>>>>>>
>>>>>> ---
>>>>>> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
>>>>>> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>>
>>>>
>>


