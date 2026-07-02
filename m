Return-Path: <linux-arm-msm+bounces-115983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dwykCk1RRmqzQgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:53:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62236F7166
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:53:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E7iI9mpb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gW4+MpRU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09D7C3024E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4578E2C21D9;
	Thu,  2 Jul 2026 11:53:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF32C21EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:53:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993209; cv=none; b=RKm/dtWTBsJNhKZ2ImVwVSBHTnqAumlO6op5sMzt5BEnT1ktwZWKZbPtaGZB8lhxJ6YYpRTUcWNBAem+a8DZEFyhzulWgRmFxc418ZZOFQPlyH3bXyBtA84Oi2eD2oajtSGQj5yghGR0a5A90s81bLa78E1Cc8ewBfoq9rqh//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993209; c=relaxed/simple;
	bh=iQs/O0m1YoOXpDL1qFq1QeXVEZYVWU0DuKi+oSvZ27I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlqEOcmrbEJ07bGsZCeSgDsjVKZIEg5dttD1WjZEIv82UOc3CnC3CA4yXRX85BXOLYU1JpM0w3JLgC2hWEjjEezWxdG3+STM0qD70c5F84oNXlQ4AVp4BCzNPYlsqUnbQD6ez1WwgcRdj2qGDhapIxFdUzFAp8Cx4wryek/ss6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7iI9mpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gW4+MpRU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KtgT4117250
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4PQUlUFrH6cer1y0BcGOBwg2mPTIaOdshDz1KarkeA=; b=E7iI9mpbwfWUnOD9
	cgdsx38NMJSCv/mYBRtxefeHArYjQlhganxBUKL23X+wJH/+k3XOZyoZO/HklzvA
	vC/6G4IAyj8LTaFDCAv8CWDadyFKNfDGynsDPMe/WkuAs+cUJogqFcD++rlSzb/7
	JYp1DIp4eRD5HvUocRuKhvN2eBZ60ZDibJSrBmaM5CRI9AycRpAxPpSyXTf7+Drm
	UXNwzZ6Hn+69s0NcL4LfTtDEtBAJoZJRF2khGpJBsOHTTl9L0OH9KYKz9hn3rdpw
	eWGi1sewYSOwMkBqTLQA+kkN6owqDn9D1AiLfy2CJInIgLrR+cKFuEntyJiFePWT
	R/OCeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bgj08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:53:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fe90ee192so2528697a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993207; x=1783598007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4PQUlUFrH6cer1y0BcGOBwg2mPTIaOdshDz1KarkeA=;
        b=gW4+MpRUNMzeRWTqJcpTPkVdkApIR2jUO913eDGndkCMfU0kajthcxkXocb5dwCGQY
         OsDoP9I9xN3I41zaceo4F9KcNkqIQt+W93wbDaeCWz9L/923NntVwW+Yxr1OjvoEto7f
         VHpua+MH3+Rj8L0+QJRC3jB/VEOwLj8uNXL7mMHO9mr9xeDsuzm2YGe3xQS+AJ6xW2pD
         IvDJ6UwKSghpqZbVSEz4WN14icYHjDC+AcybxbfufhCB3ey+pLbfzM4LzALJHSGjr6ww
         D8En16bQaF8cNRb0VEWGHbkhuHo0T8rsGydhM5IdM3c+PaDQx7GfcfYjD+7pi9rT8WpU
         3ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993207; x=1783598007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4PQUlUFrH6cer1y0BcGOBwg2mPTIaOdshDz1KarkeA=;
        b=YpizOTigWhq12fT3jIzD8nJYwPb+k02hdnwWli3GWzLUv7E/bpb+IV2f6Kb5RJ67Uy
         iuE6pZeRX9EMdLLzOdDwzmACM3/aNHGi/AJZ8+RmvUHYdgQQj/14KCoCKQrtH2960p/P
         +ruP4yLbeUJAGU8nmdZx8ZLbfJN48uxF5IoHHvB5MMUkBJCqGmRISfR1QyvgJ2nlq9mL
         vkeXRh66EatNc4B2rA5UGKwvwwNWd3bjLGMOpiwngu4W/N+iE5sgsYeQovpjg+tonwbE
         yeBQYXzAQDvATpS3dCOYB/qzKwoES8BbTeZbinRywbeJ1Orj92dQXSvyqepvx7qoWsTi
         A72g==
X-Forwarded-Encrypted: i=1; AHgh+RrYz4xGro9u6iRCCimOCOvSJGqTf50MECgmZ3gjkXYVFHMvig6C7IwbsmaJwewdAkET6j2XIHWcZt8mDGe2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8oyR7q+4CYH0ar/Nnye+Ctk1bM+hCR54JFAllN9HC7+E/Iji
	GGwnB7dpZF0hKlYOAFQwiuX4PZceqn7W0Ls/VV2v5/90kRxcga3Yx8uDVv2tCw3R/zJcZrHhSMb
	v4vevXpgZvOqZ5COdk7IC7ZcA2k4t+vmv5wNqgWYgOUd0kvZ0IOfRl62CEqz6HpcbQBYD
X-Gm-Gg: AfdE7ckgLDNZRjDJFRvoMPpSmjDawSeyMa4IgNtJfjyfkWYwRpuoU/v0C9xRQsVWK2k
	wpMcgoHmhDwWZcdKg7sTwDs8oFxpBmfnXxEEhMD29a+U64s+D2gNilM5V/OUjQXqR6yhC/jw8Rd
	A0EtCQ5Yfym39IUJiMo6X4Bq7aR7QBXo4MB570ptCLmnpZ2wUJiQkb2qVFj5NlVz0irxHmB7KFl
	N8GgoVOSmwYSsixr4qKKhoGII6qFD8TJxhuMt4yzJKy3lFwS7T0tnb39qODqYQICNXbD2sAwRPJ
	ScMf05fqfDuN8ujQwARX9fDGYPlLrzn4l9brChLkjGSvkzfBralKVwLkpJ8ntRhkBf2MXWjBKtF
	ZohRXHnPvifIUcibGD81gMr6wTBby2BmIVBxGyz1O9+Y=
X-Received: by 2002:a17:90a:e706:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-380aa0f53e2mr5940301a91.10.1782993206543;
        Thu, 02 Jul 2026 04:53:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e706:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-380aa0f53e2mr5940243a91.10.1782993205836;
        Thu, 02 Jul 2026 04:53:25 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.106.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm15615998eec.9.2026.07.02.04.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:53:24 -0700 (PDT)
Message-ID: <04b67f29-2afe-4c72-8c9b-bbde56f27a83@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 17:23:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PM: runtime: Clear runtime_error on supplier after
 failed get_sync
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan
 <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
 <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
 <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XlRCr3RlBMSiG35FQ05j9nL55c8WQtCR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX+KCObH8eH8Hk
 w1abMyRU351unrSH/kh7djt0571h0cUWEt6CdKO0hg1Ay1FvZAgzwjkv/8vkgQrvhHmi3Wy02/y
 qULgj2pi2Ao3GwnSaq03IPQU6rZk4KU=
X-Proofpoint-GUID: XlRCr3RlBMSiG35FQ05j9nL55c8WQtCR
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a465137 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZY8+d+ilh5AZ8AQMB2/tOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fOj4YSts-j8utWejEp0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX74cOj9n2UH5J
 uHA0Xal+rBR34MbEwmbX+u1TBlPLhW9KtyxEneqlEmURBqMYUESEpX0u//LAgSVeiQyXxC34qGk
 1DASt3mpIKbf7c6IMoO8yUa4ywwQhj3VfioLwsh3tf4QQmJBawFrbajNu3Iev5Ordiv+4qzaMjA
 b+W/pUd1jSFz8i3djGflcPtZoEpCEWKRB0oAMc8H00RbGJ7C+fkgj37RxYihMNmfJxZgtkbXGW1
 qTZVcqOMQ213S8U/eZLbFN+pLgctdq0S/nq6c4Ed9/7Sv+jiuE657gFNSgKeJM2lKVkhn5dGK06
 DY4QTKibzSE0lfHcZXlTL4NtH/KyNBDkACFEIU4I5AykdtaorS3E+s503L49maZy4EXA/6ABDfd
 eF7KGkc8/9IstlMXViTIl7nyYOR12pxrKPc4cXibLZTFSrShsCQJPXnI9V0br+mhsa4az5hWWWr
 YfqhmnJ7ahCJyH7u0Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115983-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A62236F7166

Hi Rafael,

Thank you for review.

On 02-07-2026 17:07, Rafael J. Wysocki (Intel) wrote:
> On Thu, Jul 2, 2026 at 8:08 AM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> When pm_runtime_get_sync() fails for a supplier device in
>> rpm_get_suppliers(), the supplier's power.runtime_error field is left
>> set. This causes any subsequent rpm_resume() call on that supplier to
>> immediately return -EINVAL at the top of the function without
>> attempting an actual resume, making the failure permanent until
>> runtime PM is explicitly re-enabled.
>>
>> Fix this by calling pm_runtime_set_suspended() on the supplier after
>> pm_runtime_put_noidle() in the error path. This clears runtime_error
>> and resets the runtime PM status to RPM_SUSPENDED, allowing the next
>> consumer resume attempt to retry the supplier resume normally.
>>
>> Change-Id: Id5067d09caca464f663fc95fe745d037e9c56664
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/base/power/runtime.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
>> index 335288e8b5b3..9811d024d140 100644
>> --- a/drivers/base/power/runtime.c
>> +++ b/drivers/base/power/runtime.c
>> @@ -309,6 +309,7 @@ static int rpm_get_suppliers(struct device *dev)
>>                  /* Ignore suppliers with disabled runtime PM. */
>>                  if (retval < 0 && retval != -EACCES) {
>>                          pm_runtime_put_noidle(link->supplier);
>> +                       pm_runtime_set_suspended(link->supplier);
>>                          return retval;
>>                  }
>>                  refcount_inc(&link->rpm_active);
>>
>> --
> I don't think that this is the way to go here.
>
> Can you please say some more about the specific scenario in which this
> happens and explain why it is OK to effectively discard runtime PM
> errors occurring when suppliers are handled?

This was observed with a consumer device whose supplier's 
->runtime_resume callback returns an error (e.g., a transient failure 
such as a timeout or resource unavailability). When that happens, 
rpm_resume() sets power.runtime_error on the supplier and returns an 
error. pm_runtime_get_sync() propagates that error up to 
rpm_get_suppliers(), which then calls pm_runtime_put_noidle() and 
returns, aborting the consumer's resume.

The problem is that power.runtime_error remains set on the supplier. On 
the next attempt to resume the consumer, rpm_get_suppliers() calls 
pm_runtime_get_sync() on the supplier again, but rpm_resume() now 
returns -EINVAL immediately at the top-of-function runtime_error check — 
without even attempting the resume callback. The supplier is stuck 
permanently in the error state until someone explicitly calls 
pm_runtime_reinit() or re-enables runtime PM on it.

when rpm_get_suppliers() fails and we're already propagating the error 
to the consumer's resume path, we should not leave the supplier in a 
state that prevents all future retry attempts.

Would you suggest a different approach here? I want to understand what 
the preferred recovery path should be when a supplier's resume fails 
inside rpm_get_suppliers().

Thanks,

Praveen Talari


