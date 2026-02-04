Return-Path: <linux-arm-msm+bounces-91802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE9ELwQ8g2ngjwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:31:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E2E5D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B42301C8AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 12:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E647A3EDAB2;
	Wed,  4 Feb 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgdugH8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym6eHBAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4643D7D78
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208050; cv=none; b=k4FS36Lo5wNkziLKmtp536kI4oXF/DJlO5fQSx0H9+M+Il03Fti4DqPCghNgMKUQcJSDOrW6ElSsaPut6o3noTrKluo9SRtY5L63oAwMklNqsO4Ug7Dd7t3mrjsD+B1M+5/hgYs+j677SsEy67bhEfz6O9S/ktAM36qF+rT90k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208050; c=relaxed/simple;
	bh=NoYePyJeITtDZWLlxbhjjztLmLVupNOCPRBxKEy1RQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k70Axfbu3SfX5JLQiFtEO/yaeUrmVbxJsn431iAqDID3uSydCB6ry46jJAHDE//HdLKs3Wxmt0yZBvLtaVdDs+OmlKwVsU0iYnqf+dRrTKIRtHlEKyzkVFHjzWgdWsnXg3oXGMX8KDwsqDNzf14shoeKyH02FYiHSpnma8DJggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgdugH8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym6eHBAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIMj0200075
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 12:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ZUN7KJFcQHbFuSjPGjBedNKVJ9a0qz7QZKFlGaIl+E=; b=ZgdugH8oM9/wNysq
	cS80xGS5uMmZ6HV5kL+Utj/tuM28O5RK7svyRzc9Gc+ihbx1uVCEm8wt4Ri6iZnt
	qYBhSmGcYgHgfNXb+eSyGx/c+5H3szmxh3kvxnCtXJ9rTMTwiVG5OeyCj86B/QXg
	TEDC6DjqPGfCk3HyBdV88wC6fHvITLyhpYXCulU2AeaQvcp/lwNhITGcbexll0pl
	r5AlnPPgmCgWOMIOjAdmouH/8YVzLJy1Krnxxz4iBh4RlMdJv9V0s8EeH4QJM1/e
	R0Q0SRuw4oq0CxWed8LMNIIobMna8z308obqgBqSNn4IsTm6aIlejUL/SY/pFkhU
	r/Na9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3yp5997a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 12:27:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3952cbb9so16390685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770208049; x=1770812849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZUN7KJFcQHbFuSjPGjBedNKVJ9a0qz7QZKFlGaIl+E=;
        b=Ym6eHBAPl0bVsPql3viwkdpnof18opX2r4U/FuMYCr6jCWUzdX/tKZ24NPNv+HMsBv
         l8Pd9GjBAAyGLUMg02jvGal3GJ55VIusH/gJMZadfc3yoMma/JJivQCtsAasq5d45q0D
         VOSZFcQfLKFFOdqCoozFTzpLs4LToQlVlvplJH3n2LRRrFkIv8GMsus6MDgs3FiZTj7a
         3YxogqcAZMzvX3DBaD6u3OYIewfqvPV5FNLg9ssD1dPV9Vuks1KkMEML8NUxdBfUzaCC
         otDnqjaZ/O3Es0ZsBvsSUr1Y1c/cZlj5i6eLCz0WmePvnw3EkjP+ZSgFSjmKTRDtrfrp
         kVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208049; x=1770812849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZUN7KJFcQHbFuSjPGjBedNKVJ9a0qz7QZKFlGaIl+E=;
        b=ol/jPtbArcrdR8Cf6ia7KwITQLdhkU1wgm9jAb5lJxhQYxP0j8Jx9YkAcIFVVCez7m
         iVyESzJLrkERLMVOXpQFXgHDnoeZube/VSExSnFi56UZ0jcLhLXkHvDVCe7FArV8KnSx
         a/tU5Kg33I0gD3DPXt3WkpSW7N7F1czLO8gE46S0uIMUWKE2VBBZDIdIGvtjJd19ZXQs
         bXwK0hnF1NQJeNQYLhauaPUpc2OyQiQ/iyHC3cKaMOMvZEB0h3G5L3ELVngbbvmKtf4Q
         TqPvV/BtQidsg5cQ4WtnwkTe3etfaTYbNHQhplTN1vSMf9AQNGgwGdxb5fSXIMN12qtU
         JjSw==
X-Forwarded-Encrypted: i=1; AJvYcCUrRsNjTL8sDTRwFuOtHPexeNGbRqwSnQ7tK6L6QRFC/HgkRTZSlgRUaC9R2oif4E4cwHQfH+ulYD4SYNr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2EnwNTHCbA3awBXgmTxDhcY5BGS2XIHf3SGnwRR1F1XZ9Lhex
	LTEG/XVILcMcPyuegTNOa6YUfuUxhocdJxnc1l63msxOcu8ysBFRHrCgkvyNVwHlakBmsOWAz05
	1zTMt/RRSZO84Iu88s4AfIWTW3hWnHQM5GBj9LFd8vOYDjSGSKRH9TMavsI1nY4CbXuAi
X-Gm-Gg: AZuq6aKIrG5EPYBQ4SbV3kZMLJQi4lJ8z0RpqSEUW3SUey+F0C2uvtJX+CpMK9lWcl0
	KQIPlWMZpukfKoazqIP4a8JBSpF+x6cbUJDUyC9/P3XBfcXrD6dnwAr1WNIxMMr3RB+qm6hGZoc
	D71udCwfwZ6aTVkLkHSZjJbXcWAH0JaTtx0iKG2NPGmZKmAqT54B9hu7LHsynVLPk6H20J03BvN
	oLx0hc6zOxSUc0G4snAWhjf/ThhjYW8gLyuAHPGUcUjuJVmWptrQFcX0to40C8Xj3DyGvv7csKh
	kut+3LGxxymSUxpbQnD0PsaDEjlU4tqC1+DabCqjUqcQClnV36A6q9r6TJNXdXWxWvj01FW3Ddw
	TyJwsh/KUhMcT/kYjYzYso8KgNSu9MrT6dUu4cmDld7p5U8X3FEjAwJDipiXqz4dFaUM=
X-Received: by 2002:a05:620a:4614:b0:8b9:fa81:527b with SMTP id af79cd13be357-8ca2f85b2a9mr262848285a.5.1770208048705;
        Wed, 04 Feb 2026 04:27:28 -0800 (PST)
X-Received: by 2002:a05:620a:4614:b0:8b9:fa81:527b with SMTP id af79cd13be357-8ca2f85b2a9mr262845185a.5.1770208048142;
        Wed, 04 Feb 2026 04:27:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f17sm121235966b.12.2026.02.04.04.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:27:27 -0800 (PST)
Message-ID: <17896786-5984-4ffe-9f4d-3c352b583a63@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:27:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
 <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
 <52c585a7-bb57-44ce-bb95-6ae9d8d99400@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52c585a7-bb57-44ce-bb95-6ae9d8d99400@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eauq8FDSBjzmgj50drGSkiBbIi7-Cjtu
X-Authority-Analysis: v=2.4 cv=cquWUl4i c=1 sm=1 tr=0 ts=69833b31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6I_ioz3amzGIYnAhojEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5MyBTYWx0ZWRfX7jnSLo9D6GJS
 v0go1v3GVTkkLwdiFs++2ZjoTcfpoQBbKqupa5qMrzk1uQWk6kRRD1l842X7GzQtBpbPQG17iyI
 RXonPKYU8lm8U4zdEI+Tmo09C5HVRgAQmVg7KWWCHcQUvkV1VthCLPL2WzQZdIHzGpQElEdM++4
 YZAkHggTT5+14Hy29Qz5m1/c81AoqGuoF/E5QyOvzraY2JvpCyxS/8SLqM9uqJnkOtUbY5GM/1l
 /trfrVfLqVb6QeelixkS7B+/gkHREk8Q2aLVqJo02QOjoqUBmFDVONUzN1LkS0zKzrfGdIXaw9A
 +vOFHOu08Kk9mQmKzvEs4SLSrrYq+EfNrR5ehwyzcnwIigvqZxUhYqejYQtjOyT7VSFcf1do/cM
 i/Xzy/IUMlGljR1BvV0ZqY2uBCkM7uamILGn74S9THO+cqiG2moqBnrAb5yndT7M4CniQNtrCpw
 MfyuxqQZJ6rXyLy8Uzg==
X-Proofpoint-GUID: eauq8FDSBjzmgj50drGSkiBbIi7-Cjtu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_03,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040093
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91802-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 257E2E5D11
X-Rspamd-Action: no action

On 2/4/26 8:21 AM, Deepak Kumar Singh wrote:
> 
> On 1/30/2026 6:16 AM, Chris Lew wrote:
>> On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
>>> On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
>>>> On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
>>>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>>
>>>>> A remoteproc booted during earlier boot stages such as UEFI or the
>>>>> bootloader, may need to be attached to without restarting the remoteproc
>>>>> hardware. To do this the remoteproc will need to check the ready and
>>>>> handover states in smp2p without an interrupt notification. Create
>>>>> qcom_smp2p_start_in() to initialize the shadow state without notifying
>>>>> clients because these early events happened in the past.
>>>>>
>>>>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>>>>> read the current state of the fatal, ready and handover bits.
>>>>>
>>>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 55 insertions(+)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>>>> index cb515c2340c1..c27ffb44b825 100644
>>>>> --- a/drivers/soc/qcom/smp2p.c
>>>>> +++ b/drivers/soc/qcom/smp2p.c
>>>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>>>        }
>>>>>    }
>>>>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>>>> +{
>>>>> +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>>>> +    unsigned int pid = smp2p->remote_pid;
>>>>> +    char buf[SMP2P_MAX_ENTRY_NAME];
>>>>> +    struct smp2p_smem_item *in;
>>>>> +    struct smp2p_entry *entry;
>>>>> +    size_t size;
>>>>> +    int i;
>>>>> +
>>>>> +    in = qcom_smem_get(pid, smem_id, &size);
>>>>> +    if (IS_ERR(in))
>>>>> +        return;
>>>>> +
>>>>> +    smp2p->in = in;
>>>>> +
>>>>> +    /* Check if version is initialized by the remote. */
>>>>> +    if (in->version == 0)
>>>>> +        return;
>>>>> +
>>>>> +    for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>>>>> +        list_for_each_entry(entry, &smp2p->inbound, node) {
>>>>> +            memcpy(buf, in->entries[i].name, sizeof(buf));
>>>> Is there a reason for this copy at all?
>>> I don't see a compelling reason. This code snippet is same as present in
>>> qcom_smp2p_notify_in().
>> My understanding was that we do this copy because we don't want to do a
>> strcmp on memory that the remote could change at any time. Maybe it's
>> overkill but I thought it was considered good practice and as Deepak
>> mentioned, it is similarly present in qcom_smp2p_notify_in().
>>
>>>> [...]
>>>>
>>>>> +    /* Check inbound entries in the case of early boot processor */
>>>> "in case a remote processor has already been started"?
>>> This i can update in case new patch set is required.
>>>> Konrad
> 
> Are you expecting new patch for this update or current one is ok?

I don't have any more comments. Bjorn left a review on the previous
version so I'd be happy to see him ack this

Konrad

