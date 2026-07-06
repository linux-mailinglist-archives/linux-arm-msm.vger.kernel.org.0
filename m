Return-Path: <linux-arm-msm+bounces-116638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /5CLEndHS2pLOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:13:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D12FF70CCEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:13:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XE7VxoPL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="DpZ/1RkN";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116638-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116638-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43203300101D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187EB1A262D;
	Mon,  6 Jul 2026 06:13:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB793BED79
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:13:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318388; cv=none; b=OLdLmKatpTPDRex7aDU1igzcfPaEvu1lmZ7HpineaTFZknOz1bzDfYa72DDM2eBIGE5zLCa6wwCIB5IccB1/aKdFGZDA0lvLzXn8hkHYjDRg+jOhk4QRycCxApkIAPmdBU/mQfPWeAVx7NhxgU4JLMa9/kFO/EmL5lOklZjm10A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318388; c=relaxed/simple;
	bh=1dbOqwoLq6acjjmcdd/pF19xPGUMpUB+TtDu0bgMe6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siphZ9McoKcP3nGCs/glzsRv7n+tvi48gvIMinh3TNuB3NMFoAYWoc5CXexbVBixkPE7ifRAz/H77Y+Gj7pn2lzbJmHScgNKD1pOavOiEQF4Qu+qU+cWUOhSJE/bEq+N6nlmbOCtDA8sPylZKGcRSDmUVi0ohGRXABkFK6BzzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XE7VxoPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpZ/1RkN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641mXJ3402640
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKz4CaC/c7J7lYoZ1j+G1HE7pYhCs1U+Xzm8efUob24=; b=XE7VxoPLvtu0rC7r
	U8nG3KeyQXspD98WHqNbF2tmUpbK1Q/9PhrSBGHckuRhrneTfrNmw2mY+epRfAVl
	lOMOFp1a77mhkcWENkSvgaIZXGoggLzj4MGZuTj9j3FRBc6qzjjEBGiwpLGpAPhF
	NVChyui42K0hCO90aqSMN2R8CZZuT73bF++eJ+UsYuINf21Q+4XcBBT3e2bC2Dw5
	Ne0mXYQS0T2K4XUIQUPmDaIG9pW8UHIOaq6vQxZB4PzDchYnz5Qm7m6OH8Xg59vD
	sfUW9zxZQXKjox4lSjgFakSqBFS5HKEmoJZxFQWd7+ZBtv4G18d8pp2suaqHvMOi
	uHH0eA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgmge0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:13:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so4397192a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783318385; x=1783923185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKz4CaC/c7J7lYoZ1j+G1HE7pYhCs1U+Xzm8efUob24=;
        b=DpZ/1RkNqINg/AiP53aWLBN+Qu/dwKH9qC0cmRwIHv32IjqSwJuaSq4rBdsLyDmiLE
         vcdbVhD9BT3XP7PvIYHWZCFvmj6XXHl3hSGF8I9Fb7mqc17pGpPk6pX7HntJLcAYim0j
         x5YXRaFXbzjCoWsLEZfqhMTQI6IbgiZo3STuAqyYXpcpbTvZqHmkRdj3Gmm9oAWWWF1s
         C2Swq26mlbADIaYHBt9pGtkKe6dieT7h2+xZPTbVL7luhOr2bbgSF9yeHXI48Yy0plty
         +IWfndXPoC0+Z8yy7onmnV8/PN6vnp9ltY2o9WX4IFi5sojTFWmiwx3yCOV5ETWsJWzW
         cGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783318385; x=1783923185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKz4CaC/c7J7lYoZ1j+G1HE7pYhCs1U+Xzm8efUob24=;
        b=ZW+Hf7xD8d5tZ5cXmx5IffNXofYaJLC3SdzwCC9XtaTf6/FFrYdoyQGB6KbQSclYiS
         Vi/3v/PNZJcdJ2VBF/RLBu5qotxdrukP/vYBFrgBdaaB2NDkPCMJq3a2qlymTH7D6qYl
         nF7EyNWulkgbRe3fOzloAKMvkWJLOxXDQLEFlJ7Q2A+7zZHKs2lZrrgK9fGNYpcR95kA
         F9c6On3/fwbYYLMYXwV/QajmqL0L1XvIzaa3veRxRK55qLPuOLnuaYISPtg2YlL+B4XC
         2Gi7YdpVbhB98ZxpIaJzGs4ztbIYDWHfTlr3CYEgmthP6msxbdThJJteNnRNKx9sF7rb
         2bFg==
X-Gm-Message-State: AOJu0YwLtRflVBnAdfXGhhRQe6PvTPTmQv0Co5///tq9U57mP0qVg/i4
	YqHW7Fj/w9TkAom50CxbYFGFTL6YiystJWtgALk+os0nT/BzUsjFmqCCO+VzHRgq5qwdN8dI+ny
	NrDXce/uy71/kdZ69Pv8XrZO9RRyuJATiMSst0JuuL0TFjWhuhkEWxK57Ajxoy9WzDiqk
X-Gm-Gg: AfdE7ckWDn+iZn7BZ7iHdlwC2jhjiW3EbkB+e6rwv4pwMx3qmBCrdW151fBoi+YtIF8
	rM3jox3vZuggOcg07n7kDksbess6xIUk97vyMxpySyyg/SK8zERWWZ2Hqrb5TmGhDrNveM4+f20
	UTpWHkEPqq2Tcb8+STHpNLyap8SiNrr/0wEUXoKvZED3o0c0ASBeF9xBZPb08HlhEMMYfFOt8uu
	a6FBiABgJUM/aoX5ostIzYge+okSKa5DJhUly226+LKZRw+Flqkp614+Z/FvemV+OFopIIuyosW
	PRicpqWjcmjQdSPQBf1rucIBhh5/+tg2SBiARvWCy70g4+IsEDqT+X9hHy9wszLRsCTTrVjFe1i
	MEbUiZ65TRtQZu2U83zW3Wa4hSKuPIhbpmPrN8Z0Tdw==
X-Received: by 2002:a17:90b:3805:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-3829f6e3e0emr8352824a91.25.1783318385121;
        Sun, 05 Jul 2026 23:13:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3805:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-3829f6e3e0emr8352798a91.25.1783318384627;
        Sun, 05 Jul 2026 23:13:04 -0700 (PDT)
Received: from [10.204.78.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127d147a8sm4313752a91.17.2026.07.05.23.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 23:13:04 -0700 (PDT)
Message-ID: <113f7536-92cf-422c-84ef-cb55a037aa81@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:42:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: create duplicate sessions after all CB
 probing
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
References: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
 <6a7e3394-9dc7-4371-9935-47f3be8a59f4@kernel.org>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <6a7e3394-9dc7-4371-9935-47f3be8a59f4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2MCBTYWx0ZWRfXym2QYXt1u857
 mBQPm6AO7B8GFZQyQipoYSh/wtcXBVOBaLVEY/a2AicSf1+7j3U+3B1A1CRDmvvUqYrGG68zCgd
 frwr165OCvg1MkEk8bBPC+FvaXhZQLE=
X-Proofpoint-ORIG-GUID: 5RhKV4_qQNCmBJZciwOP_PQ-Ky6kTQWj
X-Proofpoint-GUID: 5RhKV4_qQNCmBJZciwOP_PQ-Ky6kTQWj
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b4771 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jvgINQJEQb2Mk2KRUnwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2MCBTYWx0ZWRfX9VGgGPNbSVyW
 JUl7QgQ3qTxV8gGZaSStJnS3P+P8LAAhY61u4gzjwdgIlpJsn39jm3Ayn+QRKmAxR6ZvqcnEGmj
 HjBc74v135lJD+kXwzb7igEycQP2etEA3D2nsFZgCnp6E7n0fQVAtSqWeHYsaUX95RDJ+AMNrex
 p2H7/ygmpdWyjZNtO9Uwl7UvwGtY3AM7tZAsbfTDVtuRPRPNTXLUd6b2ZRM3eolNGc0ZY+c5XHr
 BZByMpRXvM6fpF63ZOX5i4mbhFLtPxd6CL1P/KsN0DvvpjSptwBFK2JaUQr4E57/zrc1uAyFLdd
 k8jtNHe9jWtkgIuQ9pjPhZ+HjJAyJ9jTD09dy1nRieD546wMk8xzgOL0jvHGRqplY31bsxki4FP
 344nAh2n+7kMIt8cUcQ/6uMcWNsbi7paixY0oIUGU9b66Dc9mjcuJanystyXhnWGOjZcmAG2QGK
 B5RB0s1heyVmIfmfJtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116638-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D12FF70CCEA



On 7/2/2026 1:51 AM, Srinivas Kandagatla wrote:
> 
> 
> On 6/9/26 11:33 AM, Vinayak Katoch wrote:
>> For ADSP, only a limited number of FastRPC context banks (CBs) are
>> available. Each CB supports a single session, which means only a few
>> processes can run on ADSP simultaneously. If all sessions are consumed
>> by fastrpc daemons, no session remains available when a user application
>> starts, causing the application to fail.
>>
>> To address this limitation, a Device Tree change was used till now:
>>   qcom,nsessions = <5>;
>>
> You should mark this property as deprecated in dt bindings.
> Which should discourage people to use this property.
Ack, will update in v2.
> >
>> However, feedback from the upstream community indicated that this change
>> should not be made in the Device Tree. Instead, it was recommended to
>> handle this as a driver-level change.
> 
> Changing it in driver will make it applicable for all the SoCs.
You are correct, that is the expected behaviour.
> 
>>
>> Instead of duplicating sessions inline during fastrpc_cb_probe() using
>> the qcom,nsessions DT property, defer duplication until after
>> of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
>> all compute-CB child nodes have been probed and the session array is
>> fully populated.
>>
>> For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
>> last probed session once of_platform_populate() succeeds. This keeps
>> the per-CB probe path simple and ensures duplicates are always derived
>> from a stable, fully-initialised session state.
>>
>> The qcom,nsessions DT property is no longer consumed by the driver; the
>> binding and DT sources are left unchanged.
>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 31 ++++++++++++++++++-------------
>>  1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1080f9acf70a..46afbae9c234 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -30,6 +30,7 @@
>>  #define CDSP_DOMAIN_ID (3)
>>  #define GDSP_DOMAIN_ID (4)
>>  #define FASTRPC_MAX_SESSIONS	14
>> +#define FASTRPC_DUP_SESSIONS	4
>>  #define FASTRPC_MAX_VMIDS	16
>>  #define FASTRPC_ALIGN		128
>>  #define FASTRPC_MAX_FDLIST	16
>> @@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>  	struct fastrpc_channel_ctx *cctx;
>>  	struct fastrpc_session_ctx *sess;
>>  	struct device *dev = &pdev->dev;
>> -	int i, sessions = 0;
>>  	unsigned long flags;
>>  	int rc;
>>  	u32 dma_bits;
>> @@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>  	if (!cctx)
>>  		return -EINVAL;
>>  
>> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
>> -
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>>  		dev_err(&pdev->dev, "too many sessions\n");
>> @@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>  
>> -	if (sessions > 0) {
>> -		struct fastrpc_session_ctx *dup_sess;
>> -
>> -		for (i = 1; i < sessions; i++) {
>> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
>> -				break;
>> -			dup_sess = &cctx->session[cctx->sesscount++];
>> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
>> -		}
>> -	}
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>  	if (rc) {
>> @@ -2445,6 +2433,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	if (err)
>>  		goto err_deregister_fdev;
>>  
>> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
>> +		struct fastrpc_session_ctx *last_sess;
>> +		struct fastrpc_session_ctx *dup_sess;
>> +		unsigned long flags;
>> +		int i;
>> +
>> +		spin_lock_irqsave(&data->lock, flags);
>> +		last_sess = &data->session[data->sesscount - 1];
> 
> Why only for last session?
The number of ADSP CBs is small (3–4), and earlier sessions are consumed
by fastrpc daemons. The last CB is the one available for user
applications, and the previous qcom,nsessions approach also targeted the
last CB implicitly. Open to a better approach if you have one in mind.
> 
> This is now un conditionally done for ADSP which changes the whole
> behaviour.
Until now this duplication was only needed for ADSP since it has fewer
CBs compared to CDSP. CDSP has enough CBs that this is not a concern
there. The unconditional behaviour for ADSP is intentional as the CB
shortage is a hardware constraint common to all ADSP-capable SoCs.>
>> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
>> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
>> +				break;
>> +			dup_sess = &data->session[data->sesscount++];
>> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
>> +		}
>> +		spin_unlock_irqrestore(&data->lock, flags);
>> +	}
>> +
>>  	return 0;
>>  
>>  err_deregister_fdev:
>>
>> ---
>> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
>> change-id: 20260609-dup-sessions-ea2acaac1994
>>
>> Best regards,
> 


