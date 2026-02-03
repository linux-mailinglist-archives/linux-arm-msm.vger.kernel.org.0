Return-Path: <linux-arm-msm+bounces-91571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLsZIwFZgWkFFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 03:10:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679DD3A11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 03:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06C9B3034325
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 02:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6296B2F1FE2;
	Tue,  3 Feb 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbUHt19S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgRVKEsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D143145355
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770084603; cv=none; b=iWwj8Zu5WLkhFzP+dum3OkEc+jUbSCTv99a1bRRU0w18E9ty3nBNrUuXFbLaBFiT1xUCFFAtNZ5CIJycSFz81U2BNTyYH+B0ihr1pKl3tpnUo/AAtvcOUSqNmVYcgQgCzPUTv/6RhBynnnPzGzVdWbeYuPzcAi6DWPukh4DTzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770084603; c=relaxed/simple;
	bh=yWiCTrplmzXnkUZ7h7KCGErvzeO+ESEmUPUKPwby2ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JU9YrN1VvR6izk+EVNudkLLNY6WSQ9lPIVjBs6OjB5P2Bf0Mu1KX6yDgivBKdtGeLjBwSpxUkrdmKOr9A3pZy86BDY9WA07S/0LQxRPrmyFrlLdxZ1bWugbej71pCc2QSgKZZYwEQttPcNEoh/5KC9jap4ytqDAxEKVwIx8yHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbUHt19S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgRVKEsQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JUYUC2899904
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 02:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYRVvwXTE4/KeUkaCGAFR+ovh/hxJWmlWltuENhIjXE=; b=AbUHt19Sqag6D9SG
	9k7kgC8fu2sXWwv470Yhj5YtJn8NURLipqCtnCg8455G0Zkg4dIio0Cka8ChEkhy
	gkxfIDWVMO2SuXNcWCL615nrrKRE1TY0ontIqIO0EwXJLV11E34dBRx+NktWtS3D
	TRjUHCE39wA4ihNIcdhDQ1hyASO+Vzh+2gQZ9CXmL5ur1SGK10fp6Xp5TLNfJYEm
	jPz1QZLCesX7ztNkSo8NgVH7VerJ1bxsJ1MTELooYNLTnuCELXslxQjd/z3yPLfN
	8eBnA0nleuKvOzzdwxuzHwVTIEC5YMNx3wQWl51GVx+5F1uKylQ0JCKhtB+l7O2H
	4Td4/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0tfny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:09:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8234ea73bdeso6381856b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770084598; x=1770689398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYRVvwXTE4/KeUkaCGAFR+ovh/hxJWmlWltuENhIjXE=;
        b=WgRVKEsQzIpLwQZvCix2zAz5wIUpf/015A47QUW/vmDdyuJYSvPUqb0Smpi951nYwJ
         A6ddOXJ0iVH1tslbHTB5e4hkRxhO6n0wShyAJAm0NbeOBsvdIjpBJoV5rhbWb8wv2qc/
         /p0T0rCJU46FFe6qbxO55qAAtcWXzRe2hnBOcYFU+xIV8mkvWAU2C1KMq4fhfIfgzbMP
         OPlkhRUJjTWjVD9OxiE64kmomvf9CPL+HsbuHuBXsnpMyTiW/nHlp4fqzG7shrnXTDkW
         hXfcpbBS639Zqd9hR9DW4LDnv4vkC8ryQTmVXeYc3vzauKnO9giC7Sm12chwTcVbeZKI
         Uk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770084598; x=1770689398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYRVvwXTE4/KeUkaCGAFR+ovh/hxJWmlWltuENhIjXE=;
        b=vhDEKabcOYEpZhirS80BiMecp4NhsoHFmmCLtqlPYDC//7BWpHpE0CPre0STtW2F36
         dZ9hb67oA7HdDvY0QCtoLo6V4g1plMGeIYyhXsV5En9N/gzz4Wd5I3OPX7aqsHSmvgKS
         7lVTW9KdjkyqWKgcVAKJtHaud7cWRvqY883QQJvJVoCcNj6gmLjIt6Ab7/3T64uDRkwh
         7O3eB7ECoCmabZC0UabHBKpxThj6uaVjfhlhP3IfRx9fMDqgs211T24XOzOdWAtFj41i
         Rrop2143kKhr2eTJxQdKWC6k+7muCgjh4UJqKcm30cFi8PKzcz92Y8pnZT0DDePJsBVU
         /HEg==
X-Forwarded-Encrypted: i=1; AJvYcCXClDDhyiAzx0acjev/Xb8Tf1254NB0mvvLs0u/i1REZ/nLggxbOnzw8dN0g3Hbnnpp1EoYj68/wY8xBlBY@vger.kernel.org
X-Gm-Message-State: AOJu0YyWehNb6/7hp4hpUbq0p6lau7ZfjNdVKw4zF2DG4xtf1O+lADYW
	ESuh7KNV/OhbC4/ugZw+sEyhTOjwy03aBm1lrRYVn1SN/JVDn+2ruZt9NDodU8VzvV9m3apZvtP
	p4DB3Yb/w0IOYCkOrAQEZNrMO4LtD6brj1uFuDEkURZCXZkuGYPUkhsmvjFEVc9Kcx5INcVgiz9
	s=
X-Gm-Gg: AZuq6aLdk7sYilyUyQVGu9bI1+jnE17BjN+SKIH1WYa8FXmjZJ6IzVO6PmjDfZy5kIr
	78V0QT6w/gGlwjHnSkWySW9Cw8K+uvCqYoQShsNHU/DVCI+L0p/8zKLlEAzXAcHagRfg+O2fijh
	XL+TrLX7zH1JbOgkMxjDrgARMfG66FblI9pLmxHuv9D2SbPGXOYWeX5xpQ030zjPhfPKpbE9WKS
	hze9UPa1b4mLcK3DnZoD0QbrJSWxlSaeLQ2g1eA6kOecWmrFWELClT7e5Wk6akohHYEzJzjHG/G
	mhZwpvWfZPZuWo67hRyzeHd9Gzox1qlbZMMTC1inTN4iIeMvab+8hGVUpNWzm8BFH7VpaHNStg+
	VpYjd1obYgKz871ldBT17vM/UdZvg3WFxG5XkjEgPzbnd+m3djQdmPIIJxtRgNQaJXKMGVl0YK4
	cWtk8ZMtQ=
X-Received: by 2002:a05:6a00:9154:b0:823:c4dc:d20 with SMTP id d2e1a72fcca58-823c4dc11e5mr8366227b3a.53.1770084597883;
        Mon, 02 Feb 2026 18:09:57 -0800 (PST)
X-Received: by 2002:a05:6a00:9154:b0:823:c4dc:d20 with SMTP id d2e1a72fcca58-823c4dc11e5mr8366195b3a.53.1770084597283;
        Mon, 02 Feb 2026 18:09:57 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm18118584b3a.40.2026.02.02.18.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 18:09:56 -0800 (PST)
Message-ID: <55546b03-cbe6-40dd-b794-b2e81efde33a@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:09:51 +1100
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
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44E4Htg9zEMY9XtkMsPRJq+13mq6kSd8RUznHTRvXVXKVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gSKPbSoQrmgBxtQi0629DiKMcLdnakDe
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=698158f7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Ujbnq6iAAAA:8
 a=2ndy_DGNb8SQPXTkz8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=-sNzveBoo8RYOSiOai2t:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAxNCBTYWx0ZWRfX74C2j9FDVE2Z
 ojO8CGpfUoUzBacOHdO5wJdhhudxN4amlflUKuOlLxeBHBsBDfJbcnMy7aNSWOPrlno365jE329
 LYSY22JmgY+1rSazV+1h3yRy4DioM+7RRSA1uoBMnRVcLoYk584gZCuCapUzhzKsv+Iy3P8WD2M
 wDN6VuwlJmDFqR1zJvsawVaXCMPhzOYbgtO82/I5jg2+iTojHLRsgQNujMRnEfrtUrBXYnGnuy0
 XZ+LZJ38T/lvSYKvj9OfBMNUZY+UCQkZnvZto7dvS5hr4+VPfaHAlqfxBfKouxSTEs1Fs087M6I
 e8msWmmtdc2Bjf6aMO6D65HqSD2YDK+x+zJ9HynkaFbXSeAdzv/2/XNtmhgMG/kGhYG0F1wx81G
 D0mQ15c7cTNSbDc/jTsyM6KuY9CVWXf4VhhDBXquYpdWnLtAuJm9pTUTA7Zla75SmQSEzzzdWd3
 WSSZgg8f+tPNqbgArOg==
X-Proofpoint-GUID: gSKPbSoQrmgBxtQi0629DiKMcLdnakDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91571-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 0679DD3A11
X-Rspamd-Action: no action

Hi Jens,

On 2/2/2026 10:36 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Thu, Jan 29, 2026 at 4:22 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
>> client wait as killable so it can be interrupted during shutdown or
>> after a supplicant crash. This changes the original lifetime expectations:
>> the client task can now terminate while the supplicant is still processing
>> its request.
>>
>> If the client exits first it removes the request from its queue and
>> kfree()s it, while the request ID remains in supp->idr. A subsequent
>> lookup on the supplicant path then dereferences freed memory, leading to
>> a use-after-free.
>>
>> Serialise access to the request with supp->mutex:
>>
>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>>     looking up and touching the request.
>>   * Let optee_supp_thrd_req() notice that the client has terminated and
>>     signal optee_supp_send() accordingly.
>>
>> With these changes the request cannot be freed while the supplicant still
>> has a reference, eliminating the race.
>>
>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - Introduce processed flag instead of -1 for req->id.
>> - Update optee_supp_release() as reported by Michael Wu.
>> - Use mutex instead of guard.
>> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com
>>
>> Changes in v2:
>> - Replace the static variable with a sentinel value.
>> - Fix the issue with returning the popped request to the supplicant.
>> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
>> ---
>>  drivers/tee/optee/supp.c | 122 +++++++++++++++++++++++++++++++++--------------
>>  1 file changed, 86 insertions(+), 36 deletions(-)
> 
> I had forgotten about this. I'd like to prioritize getting this fixed
> soon. By the way, how did you test this?
> 

Thanks for the update. I currently don't have access to the setup required to run
the tests myself. My plan is to finalize the design and implementation, then
ask Michael Wu to run his use case. Based on his earlier feedback, the patch
appears to be working as expected.

https://lore.kernel.org/all/292653ba-3836-00f1-acd4-a28b1c54388c@allwinnertech.com/

>>
>> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
>> index d0f397c90242..0ec66008df19 100644
>> --- a/drivers/tee/optee/supp.c
>> +++ b/drivers/tee/optee/supp.c
>> @@ -10,7 +10,11 @@
>>  struct optee_supp_req {
>>         struct list_head link;
>>
>> +       int id;
>> +
>>         bool in_queue;
>> +       bool processed;
>> +
>>         u32 func;
>>         u32 ret;
>>         size_t num_params;
>> @@ -19,6 +23,9 @@ struct optee_supp_req {
>>         struct completion c;
>>  };
>>
>> +/* It is temporary request used for invalid pending request in supp->idr. */
>> +#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
>> +
>>  void optee_supp_init(struct optee_supp *supp)
>>  {
>>         memset(supp, 0, sizeof(*supp));
>> @@ -46,6 +53,10 @@ void optee_supp_release(struct optee_supp *supp)
>>         /* Abort all request retrieved by supplicant */
>>         idr_for_each_entry(&supp->idr, req, id) {
>>                 idr_remove(&supp->idr, id);
>> +               /* Skip if request was already marked invalid */
>> +               if (IS_ERR(req))
>> +                       continue;
>> +
>>                 req->ret = TEEC_ERROR_COMMUNICATION;
>>                 complete(&req->c);
>>         }
>> @@ -102,6 +113,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>         mutex_lock(&supp->mutex);
>>         list_add_tail(&req->link, &supp->reqs);
>>         req->in_queue = true;
>> +       req->processed = false;
>>         mutex_unlock(&supp->mutex);
>>
>>         /* Tell an eventual waiter there's a new request */
>> @@ -117,21 +129,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>         if (wait_for_completion_killable(&req->c)) {
>>                 mutex_lock(&supp->mutex);
>>                 if (req->in_queue) {
>> +                       /* Supplicant has not seen this request yet. */
>>                         list_del(&req->link);
>>                         req->in_queue = false;
>> +
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>> +               } else if (req->processed) {
>> +                       /*
>> +                        * Supplicant has processed this request. Ignore the
>> +                        * kill signal for now and submit the result.
>> +                        */
>> +                       ret = req->ret;
>> +               } else {
>> +                       /*
>> +                        * Supplicant is in the middle of processing this
>> +                        * request. Replace req with INVALID_REQ_PTR so that
>> +                        * the ID remains busy, causing optee_supp_send() to
>> +                        * fail on the next call to supp_pop_req() with this ID.
>> +                        */
>> +                       idr_replace(&supp->idr, INVALID_REQ_PTR, req->id);
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>>                 }
>> +
>>                 mutex_unlock(&supp->mutex);
>> -               req->ret = TEEC_ERROR_COMMUNICATION;
>> +       } else {
>> +               ret = req->ret;
>>         }
>>
>> -       ret = req->ret;
>>         kfree(req);
>>
>>         return ret;
>>  }
>>
>>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>> -                                             int num_params, int *id)
>> +                                             int num_params)
>>  {
>>         struct optee_supp_req *req;
>>
>> @@ -153,8 +184,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>>                 return ERR_PTR(-EINVAL);
>>         }
>>
>> -       *id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> -       if (*id < 0)
>> +       req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> +       if (req->id < 0)
>>                 return ERR_PTR(-ENOMEM);
> 
> Since we're now storing the supplicant request ID, wouldn't it make
> sense to pre-allocate the ID when allocating the request to avoid this
> error case?
> 

True, but allocating the ID at this stage has one advantage.
If an ID is not available, the request can remain on the request list,
allowing the supplicant to retry later when resources become available.
If ID allocation fails during request creation, I have no choice but
to drop the request and report an error to optee.

>>
>>         list_del(&req->link);
>> @@ -214,7 +245,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>         struct optee *optee = tee_get_drvdata(teedev);
>>         struct optee_supp *supp = &optee->supp;
>>         struct optee_supp_req *req = NULL;
>> -       int id;
>>         size_t num_meta;
>>         int rc;
>>
>> @@ -224,15 +254,48 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>
>>         while (true) {
>>                 mutex_lock(&supp->mutex);
>> -               req = supp_pop_entry(supp, *num_params - num_meta, &id);
>> -               mutex_unlock(&supp->mutex);
>>
>> -               if (req) {
>> -                       if (IS_ERR(req))
>> -                               return PTR_ERR(req);
>> -                       break;
>> +               req = supp_pop_entry(supp, *num_params - num_meta);
>> +               if (!req) {
>> +                       mutex_unlock(&supp->mutex);
>> +                       goto wait_for_request;
>> +               }
>> +
>> +               if (IS_ERR(req)) {
>> +                       rc = PTR_ERR(req);
>> +                       mutex_unlock(&supp->mutex);
>> +
>> +                       return rc;
>>                 }
>>
>> +               /*
>> +                * Process the request while holding the lock, so that
>> +                * optee_supp_thrd_req() doesn't pull the request from under us.
>> +                */
>> +
>> +               if (num_meta) {
>> +                       /*
>> +                        * tee-supplicant support meta parameters ->
>> +                        * requests can be processed asynchronously.
>> +                        */
>> +                       param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>> +                                     TEE_IOCTL_PARAM_ATTR_META;
>> +                       param->u.value.a = req->id;
>> +                       param->u.value.b = 0;
>> +                       param->u.value.c = 0;
>> +               } else {
>> +                       supp->req_id = req->id;
>> +               }
>> +
>> +               *func = req->func;
>> +               *num_params = req->num_params + num_meta;
>> +               memcpy(param + num_meta, req->param,
>> +                      sizeof(struct tee_param) * req->num_params);
>> +
>> +               mutex_unlock(&supp->mutex);
>> +               return 0;
> 
> Do we really need to move this into the loop? The structure of the
> function becomes a bit unusual and harder to read.
> 

Ack. I'll reorganize this function.

>> +
>> +wait_for_request:
>>                 /*
>>                  * If we didn't get a request we'll block in
>>                  * wait_for_completion() to avoid needless spinning.
>> @@ -243,29 +306,10 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                  */
>>                 if (wait_for_completion_interruptible(&supp->reqs_c))
>>                         return -ERESTARTSYS;
>> -       }
>>
>> -       if (num_meta) {
>> -               /*
>> -                * tee-supplicant support meta parameters -> requsts can be
>> -                * processed asynchronously.
>> -                */
>> -               param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>> -                             TEE_IOCTL_PARAM_ATTR_META;
>> -               param->u.value.a = id;
>> -               param->u.value.b = 0;
>> -               param->u.value.c = 0;
>> -       } else {
>> -               mutex_lock(&supp->mutex);
>> -               supp->req_id = id;
>> -               mutex_unlock(&supp->mutex);
>> +               /* Check for the next request in the queue. */
>>         }
>>
>> -       *func = req->func;
>> -       *num_params = req->num_params + num_meta;
>> -       memcpy(param + num_meta, req->param,
>> -              sizeof(struct tee_param) * req->num_params);
>> -
>>         return 0;
>>  }
>>
>> @@ -297,12 +341,18 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
>>         if (!req)
>>                 return ERR_PTR(-ENOENT);
>>
>> +       /* optee_supp_thrd_req() already returned to optee. */
>> +       if (IS_ERR(req))
>> +               goto failed_req;
>> +
>>         if ((num_params - nm) != req->num_params)
>>                 return ERR_PTR(-EINVAL);
>>
>> +       *num_meta = nm;
>> +failed_req:
>>         idr_remove(&supp->idr, id);
>>         supp->req_id = -1;
>> -       *num_meta = nm;
>> +
>>
>>         return req;
>>  }
>> @@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>         mutex_lock(&supp->mutex);
>>         req = supp_pop_req(supp, num_params, param, &num_meta);
>> -       mutex_unlock(&supp->mutex);
>> -
>>         if (IS_ERR(req)) {
>> +               mutex_unlock(&supp->mutex);
> 
> We need a way to tell the difference between an id not found and an id
> removed because of a killed requester.
> How about storing NULL for revoked requests instead of an err-pointer?
> 

Not sure I'm following correctly. Are you expecting supp_pop_req()
to return NULL instead of an err-pointer when a request has been revoked?

Best Rearads,
Amir

> Cheers,
> Jens
> 
>>                 /* Something is wrong, let supplicant restart. */
>>                 return PTR_ERR(req);
>>         }
>> @@ -355,9 +404,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>                 }
>>         }
>>         req->ret = ret;
>> -
>> +       req->processed = true;
>>         /* Let the requesting thread continue */
>>         complete(&req->c);
>> +       mutex_unlock(&supp->mutex);
>>
>>         return 0;
>>  }
>>
>> ---
>> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
>> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>>
>> Best regards,
>> --
>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>


