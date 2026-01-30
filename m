Return-Path: <linux-arm-msm+bounces-91263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAbiHd+EfGmINgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:15:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BAB9428
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B94DA3037897
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0EA32D0D8;
	Fri, 30 Jan 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wd/Ea7y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeHHckh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA7A3168EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768045; cv=none; b=ZeRGI5Rw/PnLGa2fZi5y1vkZL2GMg00qLiQwNp9QjeJrWY2sCJ3WkecpbG5yxMnTXwIvaDR496ZmYaEOelAKBYCXSUPlpdydBH7L7skgfqCai8/5DYdYdTAJEgOlLDNppC/+V8RMdtAge0qszQgiF1oJp2ilm6hmn0EAusNTMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768045; c=relaxed/simple;
	bh=s3KF/yQ3BM5iy/tXrc50P5H1OS6kAXhytZ7aZaHZf9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfgeIhnroetK/a/Fx6yNvYFxLTDOwx840A7jUBjA19lk8hN7DmcsRtiiuFmfoLMiTP0B2VJAMu+Xrzb462tQCq0QnCwlxPZyvFEdrivQGXJidpS6KKpttev2gTo9+OWHo92rNzJ1dm4OXtQ+pBsJSNiE4V1K65DNSawED/anhns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wd/Ea7y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeHHckh9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VgtE2992846
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQ7DT8Rq8DEXmVEdKQ1S+FaAMBjjkX+Eb6i7XWBVFIk=; b=Wd/Ea7y+JEjiy3Yz
	G0IX5rWZ3pPtCGUkP5nWjkRKfYu7xFKKlZyNXKUFvaRCJqlDbk8pLtEGTuDxJcWn
	+w4jcm8pZfPDXYgcQYZ3Wq/oiZPQwnrRIm6g1CAdaTFagwt8BuMl3fFUN2NgH0Ap
	rvotqwnnrBbr5s7BNV55qiJ6Lz3uGzRWgRlINB9E7QBzgiD9Ypo5s9HCu9jOp4Gj
	xrXwbdDwZ0u2sQgUhPEMm6q6gR92Kao6wRVgIG956Spss0L/3u4ruUr3lsGfaEb0
	eaNXg2GbYSkHhGSDxWTpvsSJ4ZLOCiRnYJOw5bA+idJCL92cK2jETS2Kw3t2xdM1
	VpgLkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jdhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:14:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso47130685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769768042; x=1770372842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQ7DT8Rq8DEXmVEdKQ1S+FaAMBjjkX+Eb6i7XWBVFIk=;
        b=ZeHHckh9wEwHTXfYwOoiC/oGBNDDRiappX+92+kANypUQGvia5dIOLv14jFQ1QMhsG
         Aohz5/TMqrpRx/vj5D8UHz94WoHLGHanmhJUwhX1xRNgMIlSvAmPxhvEzk8dEpj+pwkL
         M/kIPGGHQkGXv0swEYTCOlSpiBJRxEhXMy7HqusKjQ0EgMN8WzEz39aF2mUbfU281nLy
         czQfSZXaUf4RpT3Uj2ERuhx1vlkqgqvVWp6Z1s5jfTVJx731k5ia9qjDsNhL/5TQWNzq
         cjvaNJAh2LeM/4yaC0I7X3jkx4CVZxTkg098r8p2fZaysC3oRm/oeYZMpeWohAYXG6ny
         C17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768042; x=1770372842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQ7DT8Rq8DEXmVEdKQ1S+FaAMBjjkX+Eb6i7XWBVFIk=;
        b=IRaxcZh/DdPFkDhI8Fo+AzOo3t0lZxTuOEG3I4ZGdgjX04B5jQBud/URnyWhCJ77Ci
         SHYUAX7feRXuR4pLjbX/4HvVuD+EiYvB5egmWoQikju8vQfhfqWBQOuIHEZ+mpzrQYqz
         n+MS3703iF08F4Pycmu2M076bZ9B53nPY+03sXRVsrEHpTGa0wFWu9psgKsXfYxgqaQI
         RaEAIyrWwVBXlh8Js0rkxmyRO7wryNgXD80HaV3auJY3WUObKe62u9wBeSOyo+OmVtIZ
         vZdT8kuuOUIig/Q+Qn9VB568cvAn0ENdVhoxcvWVmYvQE2o5AXbLDwHXay5sPv3mh/ES
         w/6w==
X-Forwarded-Encrypted: i=1; AJvYcCX3n2TT9isdR3BrJvhrhhVrl9orxWbBpLyf43U7ubvRCKGH9f1lPL176B+pRQO+uqCp2EIOT6qOtj4FnpE0@vger.kernel.org
X-Gm-Message-State: AOJu0YynwfytMlHXokARPoxAdY66Mm9YGz8NoKofiX3Rs5YRn3KU45l8
	bpzdosrNUs/6aKVR6i4fwBUzDRP9PWRaiUnMSZ1iVHcA325qLiU+hnbN+iyLmjMfBy0e51juye3
	pJ1Jmo/O+bXs+RB0ATi3iRgWmSg6zA/ZaBj63UFLV9UefpgQHPjyFQQ70la9Z9R9qL6Zz
X-Gm-Gg: AZuq6aKPOTZ1CI4UbWFjp/1UcLdc/h34ESXaz3sg2j+OEwYaMLWyhrLKZi56rXSvuYJ
	zJ/qv6VfQ1nsgzvi3zjbX6Ib9Feb9tIVWdtkuj89lFTURi2syiREj2w6rjEcERZTCj83btvsKM6
	mNC1fwByuG1HJwlzLZ9jEmovnISWDndynJVfsj/l7aE+CKIiLP5M2XPO+Fak7Qq34+8yP4urPjE
	0YoyDeBRO9ceYIxTXBYWvQurT9tcZIVMK47HRbXzcoN+OtOFmXj/wfc8BAuFUZjorBvinuQ2uvB
	/0KKCdx4SHX7CpoCyVSuC+f7iPnKVGMi6Puo8VaYoh7PYjcp3cbFQPpo9pNFX5eMbLkbvNgfCWX
	pXmBkoZAJrj0sWC6rWv5MWvwPGxM3j6iSBBQvHk4Ajzbk6aGwbPOtYBPspxvD53V2n6M=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr245499085a.6.1769768042006;
        Fri, 30 Jan 2026 02:14:02 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr245497185a.6.1769768041463;
        Fri, 30 Jan 2026 02:14:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e53sm3856751a12.21.2026.01.30.02.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:13:59 -0800 (PST)
Message-ID: <65de918d-9608-43e6-890d-16672305a2b2@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:13:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
 <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VOGh003H2FXVJfnirk2GZhpYWPXP2dRq
X-Proofpoint-GUID: VOGh003H2FXVJfnirk2GZhpYWPXP2dRq
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697c846b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nPnaW-RSxlbj0giFajYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4MiBTYWx0ZWRfXx5RuKEPaSdtQ
 NNBXeSke+byrmGuIzcdRd9P5SidFSMekTC9vfyPDGVioV2y6I5q55Ktvqigcy9hyK4we984e+u3
 ivIVbJk5hRSmFrryiIIOIBc9Y7L46X0eUdRDD0oRXbB9OCpvoSgL1qRB1s328WhK94rYY8+OO7Y
 yOvgPYQ7+4OGM+OenzM/0kWYxhJ41B2ecFViOTAXsu/OB3bl+S0VeeEh78DcJw9HuJS3OkovIgs
 NDpQ8ycUgNFfr/fHG+tTbSnS8FPSDsioVO5p6NxtgUIm7Y9h2tdKueifjMXaYTm13AJGere30y5
 yL5vQuh/SlEFFKMHVqnOphhx3KMJjNvJ5OFD1ZVNpVQlVlnxt4ozZenTeKlC7WOsLvej5g5fFyq
 zeuTNpLIS/Sj+3PFMJlkhbfVV1J5NFdKYNz3juwNP16Hz1ffADdqtNqksOhcNIh+Qg9bZ22SmsP
 9fUqiHsMzu0pXEmDwCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300082
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91263-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D11BAB9428
X-Rspamd-Action: no action

On 1/30/26 1:46 AM, Chris Lew wrote:
> On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
>>
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
>>>>   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>>> index cb515c2340c1..c27ffb44b825 100644
>>>> --- a/drivers/soc/qcom/smp2p.c
>>>> +++ b/drivers/soc/qcom/smp2p.c
>>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>>   	}
>>>>   }
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
> 
> My understanding was that we do this copy because we don't want to do a
> strcmp on memory that the remote could change at any time. Maybe it's
> overkill but I thought it was considered good practice and as Deepak
> mentioned, it is similarly present in qcom_smp2p_notify_in().

Ok, right, I didn't take that into account

Konrad

