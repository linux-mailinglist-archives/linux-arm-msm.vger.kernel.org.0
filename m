Return-Path: <linux-arm-msm+bounces-90770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJTZH3G2eGlzsQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:58:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D582B9496B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814C7302E90E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B555B2ED846;
	Tue, 27 Jan 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqi9W2iE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSIqxOpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BCA35580E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518543; cv=none; b=m/XetYGCrqd9mwkoJNqETXSAhsgo5FgMZpN8LltiC1+JHYGoewONrtmLenFUKeMy0FEzSa70N/Vcn0Lab6sv52MTirNi0b4Pwxz1X6LpXptHGZlt/H+fLxHtGSueZWP1NxEKfRY57SYqL+9XAYSxT8OzG0koPZLlzoW0gFhvqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518543; c=relaxed/simple;
	bh=I5ppPJvQhXKowx/6MCJntPEB4AufpJXLqgP7Xp72MFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDcUr717XD2J/Xm88FkeQlX6J/1XJEsUiDkfX8UMgmZMAQG/xrsBzQYD3hMNA26kOdMjnjxlogD50iXjO3Ocn5KQoT7pdclFki2hCHYGWW4fsnAHmp6XvwaQKQ06CysRixEdlfsAvwTzrX6gtagiN7HU3NPiFYFUdXC3de7KrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqi9W2iE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSIqxOpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87Kim2379285
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4XNJjHe9ozloPS1Ypr9L8/ELG3Y15mTNMRzbVUmNaw0=; b=aqi9W2iE5VvEgBIK
	VJKrp0Ad2F+q/XuQ1uW68ljCMAMolw1TMFq97UEAYMC+vxZyN4mHzUEW9z8y3pWY
	G3Nkg+Voof+5rNFReLSZhGu94vt51tACkz5qIwMH8sWrB1OXN8mGg0X1q+SgBgHk
	v18XVDUssxO2apPoZsu+FuTBxljVSmlnx2llFSWcZ//WEKkVwlsvUnGwR70s8mNL
	g9BBh5fFuhP3brGcFkJL0HMKFg8AbgXTmVu/v+qnaQTM26j2AwDYG6tuCKAFPN6S
	l2RVd6AyJfRaPXOMA+l9ggu/LyVA6W2OwXca54lXdwP3t8FKAaT34MWjGTjYg88g
	KRXddg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8wuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:55:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso171334285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769518540; x=1770123340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XNJjHe9ozloPS1Ypr9L8/ELG3Y15mTNMRzbVUmNaw0=;
        b=dSIqxOprrNoIZvYB7Fwftz86QmSTcO5onyUixWRUDgFreK5dgBIy7qfeXVipWMCwbB
         sT8t0zyzPkzq3ctvgXhDsQ1JQzxRveJwjjyRlDuKDulOdVW3aK86TBRTK8rBn7pYznDY
         hEr4GGIPbdXWfrkw0b9VXnIdwc7y44qh2N5GdqYPkfsns/29xQeU4sElKnzTWHgN1e38
         nwpqsn2zsd2U1//HN7b2SYO2/GvCZPP+E5mLBPNF2rI7Bm/jameau3Y05/AIqWMYYinr
         oFzvXa217uozqrtSM/mYsUNI+QtquFDAJ0uEykh0kU0loxOHHY9eN1jsYvS8HBWv1+jy
         +eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518540; x=1770123340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XNJjHe9ozloPS1Ypr9L8/ELG3Y15mTNMRzbVUmNaw0=;
        b=D0tSTERAg5JltZBThx26yYJ7qpGXgife4e+dRPpwQ3GNbY7JphkK/PptsRAV2u6mET
         BpRMt0X6YeoAYUHt2I2ehy7MpU0KweCWYjEzuww/+Z6H8zsr/89LpiiOe+i/gftRAAR8
         edFMelxpsQeKHwFve/AUydy4czylKZfGJQ34BMjjbUGtHoZmQDt0R+8473kcizaBpKx9
         OPcvSPbMhh7c4OAhxT0LhFbGFQ9WW5AI/dWyyC8oYgdVWeMS1M+8vLU7koYnbhLHx+92
         8T3GcUwYYkF2acZZDo0MCcTPNOaQMCmE4lXzvydfJwCApm/HGpvDOpELrGl9/+4pzCjM
         ZI3A==
X-Gm-Message-State: AOJu0YwykBa8oKeBdEwaRRqcCTeO58cfv6yMfMbBPaBDUKQBti84Rz6E
	Z9uMObO1gt6YSSlUzxK2MgJ+IsLg2CSkGCQTOLLKB5pIH9xUDQFRoPINZVFoqjMK0zeRF9h1ZIB
	9mGNsZZ1xH3dS9fSO6rMfqo9YcBqIQKAR2r8mHjXZyCY8e3FJ4q1TBI0edl8H3Fs6eDl4
X-Gm-Gg: AZuq6aKhKZBBn0Y/uF+bC8rUzVrbagUoZ4u/SLXrPGQTsZbp3L6+uGLzWiDAN5Psnxw
	g8sJZmK5gLfbS+1ju6r0nLExC293Jw2xWLvNGy9oqdtqvQRrxWlFoV8DkwOXyKnc8HhOfnVPzRh
	ueBw5dc0ABG7ZODEhGiZiXO87kdekjlbMcFG4bjBhKwoaRw6YQ1Q9l4YM427KLS4F+TS5c48gKZ
	KNvOvizqVFhhOdHRq8wYt975OLDQ+QCqAZKAWRXDsOHXymBYBJGncTtBoZfge7b+8LUyA2l/PY0
	lp0CLiTX71zrLMoZvn9mx+xQKXDpIGR8fXoCdt+BdBHCLJeaFTRXi3/hM/Mp3SlWGsMqKoGnMQt
	S6bq90caDFzHR/ib8pNupBC3O13dXn6x6czZBGZJXH3UTSovFHZk56P6trUw6qb24u5U=
X-Received: by 2002:a05:620a:2802:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c70b73f90cmr147769885a.0.1769518540477;
        Tue, 27 Jan 2026 04:55:40 -0800 (PST)
X-Received: by 2002:a05:620a:2802:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c70b73f90cmr147766685a.0.1769518539990;
        Tue, 27 Jan 2026 04:55:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b417339sm803576966b.22.2026.01.27.04.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:55:29 -0800 (PST)
Message-ID: <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 13:55:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0yNTE79mTyw8I5tOchchgkwYqOgpz6s-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfX/sWytb05UeFv
 h6WMNNi+fTfDqXtcSnc2bKo01zb6Qg5fflW0kuWoZmxFplOOVNElKZZyase3IeBmFiuqXYs3D/W
 OfzbANaOn42TNBTiwpDXbEaScD7Ozf+AqYuLftKpaHgRtf9rmsXcTgL9tWX9yTMh5mXWZU+AxTc
 6XiFbcqpfTm1+hUpOvZ+7ySE9ErQabby0nMA8qpOF2436C5GJgHpIIBNe2opQtVwqzv452uDRKP
 H0XwIYxFl/DxBVAVK/nTIkDDXqIqjAQSOgKr4Oif8QW/KDIANDt3JE6jvQB24OmHQVRkupwqXxS
 YXp0s5Dz9+DPXAB/DELtu9GSrynymTWGGUId5E5cZMDJJGC9r2vLtiSrCY4mYd6C39acUkqRgCg
 w1J9FjIKVxVeJKuV5kHknCSJfu4JUO8Av60hu8HCdprkMu9Z8vYEpXcOmfPz09KY9tamARHmVRA
 6ySVFd3aKDDl/VzVgPg==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978b5cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=85DL6j0X8AjJ5NvXHg4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0yNTE79mTyw8I5tOchchgkwYqOgpz6s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270105
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90770-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D582B9496B
X-Rspamd-Action: no action

On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> A remoteproc booted during earlier boot stages such as UEFI or the
> bootloader, may need to be attached to without restarting the remoteproc
> hardware. To do this the remoteproc will need to check the ready and
> handover states in smp2p without an interrupt notification. Create
> qcom_smp2p_start_in() to initialize the shadow state without notifying
> clients because these early events happened in the past.
> 
> Add support for the .irq_get_irqchip_state callback so remoteproc can
> read the current state of the fatal, ready and handover bits.
> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index cb515c2340c1..c27ffb44b825 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>  	}
>  }
>  
> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> +{
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	char buf[SMP2P_MAX_ENTRY_NAME];
> +	struct smp2p_smem_item *in;
> +	struct smp2p_entry *entry;
> +	size_t size;
> +	int i;
> +
> +	in = qcom_smem_get(pid, smem_id, &size);
> +	if (IS_ERR(in))
> +		return;
> +
> +	smp2p->in = in;
> +
> +	/* Check if version is initialized by the remote. */
> +	if (in->version == 0)
> +		return;
> +
> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
> +		list_for_each_entry(entry, &smp2p->inbound, node) {
> +			memcpy(buf, in->entries[i].name, sizeof(buf));

Is there a reason for this copy at all?

[...]

> +	/* Check inbound entries in the case of early boot processor */

"in case a remote processor has already been started"?

Konrad


