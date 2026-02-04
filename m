Return-Path: <linux-arm-msm+bounces-91776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKkVObbzgmmWfQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 08:22:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61620E2AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 08:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99D58300B844
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 07:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F6538BF9A;
	Wed,  4 Feb 2026 07:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFovH29G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="An37F0FR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679338BF94
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 07:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189742; cv=none; b=CK2Vn6rtBfs4bOXFg6kHXG1Wrb9gWcDNOxsfsWwOszFWxWOuHAtSrxDnY5kda1Zr+hqw72jwYoXFjlQlEhqMw75fRT9OL4ATL/XYGKqfXFGEoWgTW0kD7qo6d9ZaAaUpUfETOap/VELS9/4Q57Ww8XqxbJ9qBHo4Z8WhCM3bSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189742; c=relaxed/simple;
	bh=Kdqj5o9zqZPaE7lxZNasCVYJ5DQOr283NvwUR5FqZJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVIOkf5rixrumGy9gGXdToWJA+X4SJ/wcmwh0ynoetlY6UN6AxJyHM8YWWqXHa0bGOWxOo/sn4ZcwDC5Mm6LBT7KvMEZql0dvfkQXwRjX1VRPjK/tLn4hzKaGR46QBqGtr78zsflWxeKAQG83ZIM93H4dGt3x5Voey4WRVv1taw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFovH29G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=An37F0FR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6147EbXc3735979
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 07:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMb1jbMWPmMo2CXtynqHSyEJghG9wlpGgNkRZHtFP0k=; b=OFovH29G7tp0Hhbh
	n/hLfXPMEz0th4H1dGuOPbIwsVx21RtwfbpiItiaNBQdFpe4HyaIvL/+uspt3Rrw
	62rSRmz1/Jg+K1paJfgQEJMhV98CpLnkTOcq/sY2RVV+z/FVxIwv0x7+6l08LXCy
	9H1s6t3oHovhjasF/W+9x2Z3pRZvF9fKWgJ5UmzGf2VU9q7DX+5HB5ekPHdR48Ol
	F62HGGk/RA7uXCE9qZ54IJqZ+TGGpvZAg0vXKVBVuwiohBOj7DSyVSuISt0H6xE/
	wz7UN8AIFYf5YL5jXiP6GadtUqkKBK92LPy5qltmeSRRLbjK8bmEZu48cMObmTGp
	ZXid/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3yp58cgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 07:22:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a377e15716so173965735ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 23:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770189740; x=1770794540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zMb1jbMWPmMo2CXtynqHSyEJghG9wlpGgNkRZHtFP0k=;
        b=An37F0FRH40we5bdnvqAXVdjBUhY7XvbuB5elKD0PtpMLysZCKiNAjrTYVzcpAVSiS
         aOI8YJfCONuu1saR1e/QtObjnnO3u4ZfrZegx3hzAG6cJbyqHHg3/5ZhH1qywiLLKKjx
         1yU342Cwo34DChT08Io5tbFGlZZjNsgr1BYfy5eb/7ksl6Z5h2JJwNDuRuNeRcXfcYCH
         huUmKBBDwLi5e4iH4xYIm1tWckO55a+rF4hwDO+yyg7DnKoSCLQeCXLWYACSpyaduVXu
         sZbYZfZxGTDr+DAbTWZHt7JwpJktUYVdfYxTJ/iL9wjxCe8yWa5vXplRyqm2OS/Dyn1E
         WtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770189740; x=1770794540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMb1jbMWPmMo2CXtynqHSyEJghG9wlpGgNkRZHtFP0k=;
        b=CdHT6dSgTSmD9aP2HYpX7ZFuCCkl4YsqJmgif927dUOG9HWvy6A8vR4rYFOwpVLVMp
         PZ0E6WtWNBfQm+oMh2cqF9SQZpZbARplJ3xTwpv2uilc+0EZsOwCzhI+zsxD89bHnS8h
         ytdvxEYwf8hG/wqAahMS6Hxo0LtwNw5PmhqQID/GQZlxRqoggiX2EmVedm90qcAeEDsf
         ltpvvECJpmcKkLkwz4P/b5Fgwb/+TEFPccFO6pE54GKPoxX4Irx/Ht2MGpkT8StjVHfC
         PrJVtb5SRr4qUBvzQr4kAH1LZOT67o2Wm8bABKTqQ2qF/UaSjmDIxWulgMXujw8+K6N3
         kLQA==
X-Forwarded-Encrypted: i=1; AJvYcCUzqa1ejHiI1nnXVW0hMDGaKR9rC3BitMwZZs3CdYzsFUiaAuVYgAiUAxipPF+NdnavwHGm/vW5u2rMoEoZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYXHWT1Os4UHUHtIyYLJPiJTIY4xZVPkMqtW9hVJTMzxEZi9Dw
	YvA2uieP/gjQqF3tnxGu4b+ClKZMN5+G6L6dHhzvBE0CsmRTrnss1h3TmtZWgkj9KtMPSdiKTeZ
	GRYTttiNnRW0sxbDrAkJ2zMBHgMZHw86SN1iNeykVn0ol54s269DnC5aO5z5NduDGzzIx
X-Gm-Gg: AZuq6aISXcgLIsp5vSR0R+4WqKZTlg8C8nMetTaO2tqjhuaWbc9ZWoQFa41yEM8UE6N
	J3ZiE9T8tqNoTyMHH8OjIoQp+mgjemyW+ixS11xlenLDdVrDpCoNJEDONLds+dKqkFFuRYTCx3/
	1oGm4nxj45BJCU1hZUsKEtmGevNRAWtzuw9pwX6utlm8dH6A44F/7mrhZY477Cd28Es8dkIrr4i
	Q/yNWWIUEL3DWi/rm9RQgqkUjHRpsw3nC+Sl0MzVS7f5dhURgjZPUXzLbNJaxBIKEVZmZ7LX0mS
	VAgwsJiNcRckSC71wl+i281pjGJ4o0oebgKJ86RkB6/sbyTCa/guzJPyqCoTLpOjslqAxV4TBzA
	EAsd4AoAUEQvPGNkfD526+DmWHOyZwxbNLwAi3jE=
X-Received: by 2002:a17:903:b8d:b0:2a7:d729:6a76 with SMTP id d9443c01a7336-2a934123397mr17751465ad.60.1770189740325;
        Tue, 03 Feb 2026 23:22:20 -0800 (PST)
X-Received: by 2002:a17:903:b8d:b0:2a7:d729:6a76 with SMTP id d9443c01a7336-2a934123397mr17751305ad.60.1770189739863;
        Tue, 03 Feb 2026 23:22:19 -0800 (PST)
Received: from [10.217.239.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9338913ecsm14154895ad.32.2026.02.03.23.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 23:22:19 -0800 (PST)
Message-ID: <52c585a7-bb57-44ce-bb95-6ae9d8d99400@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 12:51:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
 <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7tmUikTTq9rEAAMzFEPZUgRZvk0Jc7H7
X-Authority-Analysis: v=2.4 cv=cquWUl4i c=1 sm=1 tr=0 ts=6982f3ad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nPnaW-RSxlbj0giFajYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA1NCBTYWx0ZWRfXwJESePUKJvew
 d4XsUicF+FmhNYElUekI9bXXKcOADbFUxLCGNhIMMw8Va+Tm3Sw+lsjuYc9ZsEYKrmV+vhFCxjJ
 zKplpFBDrs4UzS1hLMV+ED1KVbhqVoqJnIa1HKGBQFWwYxiPutfJxxEFzM8hh58e9da05OvjKNZ
 JLjRJU5+lhGQkGW21w0a00u9C7euKyVu51v27g3VpvXS+P7yqfcZnUx+AQS6LWJ102DsKI4iIBX
 cgZzPcFDodRrMZV6ekCGLNW3XCY6maCnpj+P/pHhLbNZgDUyyacz7WNqqtYBC8TdPCw400MJ6H4
 0r2vA6v/mERnp349l/Y7NzkxfvjxQCSCysEC8jkhDFzaat9Em0wfu3+sCYUwE0wBrYVEnOVTBCH
 ekxM1TNjXWTVsjK83j5+bl6Ay/geh/ZpqsOc6XgKhqSOsYswr+ZfUNF3ryKZjWG2zSTTolp2s6w
 9LwpTd8oWFB+c6TBScA==
X-Proofpoint-GUID: 7tmUikTTq9rEAAMzFEPZUgRZvk0Jc7H7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91776-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[deepak.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61620E2AB5
X-Rspamd-Action: no action


On 1/30/2026 6:16 AM, Chris Lew wrote:
> On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
>> On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
>>> On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
>>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>
>>>> A remoteproc booted during earlier boot stages such as UEFI or the
>>>> bootloader, may need to be attached to without restarting the remoteproc
>>>> hardware. To do this the remoteproc will need to check the ready and
>>>> handover states in smp2p without an interrupt notification. Create
>>>> qcom_smp2p_start_in() to initialize the shadow state without notifying
>>>> clients because these early events happened in the past.
>>>>
>>>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>>>> read the current state of the fatal, ready and handover bits.
>>>>
>>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>> ---
>>>>    drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>>> index cb515c2340c1..c27ffb44b825 100644
>>>> --- a/drivers/soc/qcom/smp2p.c
>>>> +++ b/drivers/soc/qcom/smp2p.c
>>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>>    	}
>>>>    }
>>>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>>> +{
>>>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>>> +	unsigned int pid = smp2p->remote_pid;
>>>> +	char buf[SMP2P_MAX_ENTRY_NAME];
>>>> +	struct smp2p_smem_item *in;
>>>> +	struct smp2p_entry *entry;
>>>> +	size_t size;
>>>> +	int i;
>>>> +
>>>> +	in = qcom_smem_get(pid, smem_id, &size);
>>>> +	if (IS_ERR(in))
>>>> +		return;
>>>> +
>>>> +	smp2p->in = in;
>>>> +
>>>> +	/* Check if version is initialized by the remote. */
>>>> +	if (in->version == 0)
>>>> +		return;
>>>> +
>>>> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>>>> +		list_for_each_entry(entry, &smp2p->inbound, node) {
>>>> +			memcpy(buf, in->entries[i].name, sizeof(buf));
>>> Is there a reason for this copy at all?
>> I don't see a compelling reason. This code snippet is same as present in
>> qcom_smp2p_notify_in().
> My understanding was that we do this copy because we don't want to do a
> strcmp on memory that the remote could change at any time. Maybe it's
> overkill but I thought it was considered good practice and as Deepak
> mentioned, it is similarly present in qcom_smp2p_notify_in().
>
>>> [...]
>>>
>>>> +	/* Check inbound entries in the case of early boot processor */
>>> "in case a remote processor has already been started"?
>> This i can update in case new patch set is required.
>>> Konrad

Are you expecting new patch for this update or current one is ok?

Deepak

>>>

