Return-Path: <linux-arm-msm+bounces-91154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PXiLiA9e2mNCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:57:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71439AF43A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A635303EE92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C180B385522;
	Thu, 29 Jan 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fe/0YN+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VT9TtOW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1B3815D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684208; cv=none; b=KCzUn4zX40IZRqlTZAK11luyTd45RSU2OtLHsfX5y8Ybd0fq3C1wmPL1I1gwXB8FtjyfUfMijJ2KgfA6ebb03CtfWJOz7oqnHzcJ5raHAsfno6V8O/PtZ+JKMI5BVtQVe/oiiYuvPOpTtMM/c6qzHjOd+7fXD0RCmn9e/piamkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684208; c=relaxed/simple;
	bh=NftH4NbySuxTwiS3x7VPTmzHnoh0WpL/QxwCqSDMyvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdFyn5UqHcjCFg4Bdpb6k85+t2lkS06QhEd5t3GXH1iSMd2Wa40jrNgXTTGBV9YwXazDO7RPaMZYuCu43/MZqkiRBBgWC6o+Kb4igKjspNEMhGmuuk8ekZmURcYnd4Z2ue3hUDkZIHvU0KeupREeXwqQjCwGQzu78DKrsqlJQqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fe/0YN+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VT9TtOW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TA0qKi2033410
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+70wOe9GzJyEZl1jsTNS3cNPpQOsspWrv2NzcTlOHI=; b=fe/0YN+gbNWgLrb+
	rVRwkg9k2vWOD7p4PQrUolrDCEs+KJnAi0ruzt3Rpw3NMK4dBkbqw3jlhRCWobdP
	xszs2zjf77mY4eVYgLc/duduE54abowqX8GaKHLwhT6aBW8kK+td/uNhZMAfcZ+i
	5z4URz4V+quOh0EG1+GvnnG7OFYSceTRSr0HngyDGtsoHIKTBxvnsWMz7Vys0j29
	IqFlOdvjqNFO9Txl0WLCjiknX0L8nGDxBWylDfXhNc4no4hO1VwNZwyK/+Uqn1rz
	Lhx/iaFL8mgqsPjlYqFHY1drMyt7FO4RTC4pr+2Y0BnAHpI0mJK6m+T53tsiT4Y6
	hZ6R7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy266e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:56:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352b6ad49ddso644866a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684203; x=1770289003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+70wOe9GzJyEZl1jsTNS3cNPpQOsspWrv2NzcTlOHI=;
        b=VT9TtOW35ZjAETEyeOHzwhJ8z7UGnJUYOUJSckWZYNQplDNUg7aXlMZ/rdxNGpMNXz
         Kqwt5KUetv+sGz1lq+nDHco8cKosGkotb94Z6/Xe/g0xkhPR8lHQzKkILfZVN9avmEo8
         TSj+smGY0if1B8qqGLu7TEwfMgyBg1KO5SlMOiJ9h37NxQaze0cBl+dv/RuAVLSX6WwI
         NXCmIwQA6WSyH9Rvd8JNt0jXCg8/bbs2YFc/GIFdHT5/CXq/K5dA9I/Hrzw4520Ef8Hz
         PXCfXjSwbWQIMqRqSiWB1HEvxfqbE982I/wycCxDYEgVyTBrRcAZWv/MQCNHfv8e8kP/
         1J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684203; x=1770289003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+70wOe9GzJyEZl1jsTNS3cNPpQOsspWrv2NzcTlOHI=;
        b=tXa+TDR0Sy0y+akxI6QSi/gNVPrR11jlGGsUliw78rjsoCs4XpAGnzeYHwe1Aq+uHj
         3EWy3OfPlLnoXEnHo4FkCEl79Rw1s4t3YtuRbGe3+kzdbScwlB41HBQjoKo7TXTt9uwD
         EvmrkSQ3q2UmLkJ4PsnOF4oJo9uKjxlWmJn7skY1ihZIAkjX0LRb1iyRe4DYRb19ZFTo
         2Dzr0UP9nDXDuav/LYe0WPddnsyuuUHo5wVAjd+ToTxrlQvCJwDz/44RRpBofZAvLchk
         UlHUCjfEiM5+xeTv6n0lDKXfYQthBlgkHxgmNKtBKOJbeThusa2vtvdi/WZn8T+ZVEsi
         kllg==
X-Gm-Message-State: AOJu0YwwYqmFoycs9szy7IB/McXBJfLRohrfRWOC7LLEumDFt/24KWVH
	ggLso7VpLSuHFo9OIS/mgWDsN265D4Pg23onYjd1Bi0W+t1SAoYPT5n3nY6I0EQalqeU1Y5A1da
	b5Ct5c8uKnz2frvPt2ZgTDy+ZXOfjd+bX+o5eCMKK5i6VYU/DQ67yY1a1BUDDxzuUrQZO
X-Gm-Gg: AZuq6aKRT8FR+zUjUYWkGMgI2B2W8ZfcN+jXwU+2XYx/pLasIiQF6FUZZHoenvbRln8
	zoqIHVmVj0rbUvzWh6apRsn5bBGeVuioykvOt4rHHQjQZfuZnS+eLFiUzbE+pRvnU3q5H+/mbmU
	4VnjFTMRan/cOYW5fTmcdx+7SiZrPkSdendwyCkqqa6/WXZP4VVlZTsZTjdHZAguuxlrdKDAJsH
	BUU1xWjvM3a7p52Do319IlxFai+QfmxKjekwKLt+o1xSNt+tGkgS+2F7hPmmcp63M1XjY84WY32
	6PdGd5lZ5GkH9+QyloUblIx498zcaKBMx+kgXZQ/s8YEVFAzOixnGACVaBnCw1LHPZMTXAt4N6G
	8FvuXUEsYyKPqFqC/VeC53Kn09DSK9XdAY/KutS8=
X-Received: by 2002:a17:90b:4fd0:b0:343:c3d1:8b9b with SMTP id 98e67ed59e1d1-353fed6fc6dmr7148486a91.19.1769684202955;
        Thu, 29 Jan 2026 02:56:42 -0800 (PST)
X-Received: by 2002:a17:90b:4fd0:b0:343:c3d1:8b9b with SMTP id 98e67ed59e1d1-353fed6fc6dmr7148465a91.19.1769684202472;
        Thu, 29 Jan 2026 02:56:42 -0800 (PST)
Received: from [10.217.239.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e9fsm7877407a91.2.2026.01.29.02.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:56:42 -0800 (PST)
Message-ID: <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:26:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MiBTYWx0ZWRfX+F8ZbduL7aRt
 m1PDbv6XneUZ3266N5g0HTqFleKw+eil8KghgTNsMDbL6QPxsm5CS3bFc7KIejxZ3ILABAOIi+Y
 bsYeCVvVwAxNbhdMgzfxXS3JVRouaBaqlOtrD2oZlbPucxy4rjRFHmoWEpZTfo8hCSKEZ55kgGT
 oM4MEJk3O7zqrl3Dm1BTcmkZL1q/xNsznd9/8JVHApOz9hYvUw5hASHdPIplmqakp9uc2WD09x2
 zTUNzoPAkCkMV8BO4kgH4UPGqTlgzugP9WLbij5H/3xR8c4M/WeLkkdbq4sSHnPPOzlLgjxQC2D
 iDP60nFX0uIvEuHRjcQt55n7dCl9DpQ2gq57HBE/tI96l0nuZfXqTfq/OUJ9D/76kIdTLgevDAO
 sHwSfAwQmbBNi+RGk3AEbCl78iB7ZznhOxoVf3hjpafBtLTwEbLYzd++7+D6RAkce1YXEWIXtlT
 9sctVwykP5Th3KZE4FQ==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697b3cec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eYfYLhE3UDMrALPLOrsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Tn2bBmB8MYe1iM1pybOfdjx1EvLHb_5z
X-Proofpoint-GUID: Tn2bBmB8MYe1iM1pybOfdjx1EvLHb_5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290072
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91154-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[deepak.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71439AF43A
X-Rspamd-Action: no action


On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
> On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>
>> A remoteproc booted during earlier boot stages such as UEFI or the
>> bootloader, may need to be attached to without restarting the remoteproc
>> hardware. To do this the remoteproc will need to check the ready and
>> handover states in smp2p without an interrupt notification. Create
>> qcom_smp2p_start_in() to initialize the shadow state without notifying
>> clients because these early events happened in the past.
>>
>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>> read the current state of the fatal, ready and handover bits.
>>
>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index cb515c2340c1..c27ffb44b825 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>   	}
>>   }
>>   
>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>> +{
>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> +	unsigned int pid = smp2p->remote_pid;
>> +	char buf[SMP2P_MAX_ENTRY_NAME];
>> +	struct smp2p_smem_item *in;
>> +	struct smp2p_entry *entry;
>> +	size_t size;
>> +	int i;
>> +
>> +	in = qcom_smem_get(pid, smem_id, &size);
>> +	if (IS_ERR(in))
>> +		return;
>> +
>> +	smp2p->in = in;
>> +
>> +	/* Check if version is initialized by the remote. */
>> +	if (in->version == 0)
>> +		return;
>> +
>> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>> +		list_for_each_entry(entry, &smp2p->inbound, node) {
>> +			memcpy(buf, in->entries[i].name, sizeof(buf));
> Is there a reason for this copy at all?
I don't see a compelling reason. This code snippet is same as present in 
qcom_smp2p_notify_in().
> [...]
>
>> +	/* Check inbound entries in the case of early boot processor */
> "in case a remote processor has already been started"?
This i can update in case new patch set is required.
> Konrad
>

