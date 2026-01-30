Return-Path: <linux-arm-msm+bounces-91223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEBhEGb/e2lhJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:46:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B107B5FF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21FDB3008789
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A212DD60F;
	Fri, 30 Jan 2026 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+xshvHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqGZZwik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81B1AA7A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769733986; cv=none; b=UWVx0yZEFNEgdiZVkt42gkSqT2UqM2in1qmGoliEEf5XldfwJR3x59RVaGEU+b/keDtkKmicqDCvTYjbQjcxeh7Vvw+6s0QjEU71kurkB2GIDnXypOqyLDYPXmkv4dVfykz+M+BgeVrOOp1y2P7QnUo4cQNdBtwfAacdgr2Vu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769733986; c=relaxed/simple;
	bh=oyyf9ltil4JNZwVDsmmKZ2dGCvGdvBIZLHRNhDRkcJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Juf8Kw20yddCncjJ3k8Td43EC6nts/fo5LIv3UmPOhty0ruJ1QLXN22Bf/BBLmwcn9iuFoXNGTv3lMjSeC6hsSq1trU3hMioNEucty+1otUJ2G9m28PZ8Nc111NRu6tlSimb6Ad84CRTHUf5N/N53oaLajjh99JankQlQDmsask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+xshvHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqGZZwik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMxiNw4119397
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nTEddwWbBpyzhGVw7MJf2cPA
	VoFusYDp1MzoHCuEkZA=; b=C+xshvHFhdoxraRbFX6w53p9LdFOcwFv7XZxRmKJ
	ubzVKVUri9nEc2dX/u9m3DPxX76/9L55k+zjcRztQLhbUMPcob83HpcUgjDGVIEb
	ygKeKlPmyIumFfdoigEx/B2WKUfKe0oaU88J0VgbN6QfVxIUTLGyRIcPaw+CpTpM
	e4lMgMZLf7NyZFvZ2KvTlFQ2pMOBQ+9DKwo6uL7CKXfJGKDm/C7jBJG1kNVbpPT8
	jfCSLUGOR7nfVRMBe+cTfWjnnqV0vqA9UahOCKMzk03vGuBTJn4LOl6MJHqsWn5z
	pkOCbCDnn3KIh25rlj77N7qXIevm55TuxSp/ppUdWJAyBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtng6vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:46:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b7a28264c1so2631173eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 16:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769733982; x=1770338782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTEddwWbBpyzhGVw7MJf2cPAVoFusYDp1MzoHCuEkZA=;
        b=DqGZZwikCXToFmMxA8TTq6EL0zwjoQm4Ecgi+c1CK22o+ZfzNM3FtcXhLYmGMND5e8
         Vg53cTEcuY4X184Bw/23LPUCEiAdHpGeaS+uEIbPJarH9ZnW9yKwr12kVvSyCLVZfh+m
         9o3DvC562CIKwJD5r+oOapULfcr9ikgNoCGGmSYvdH22+2EWFHJImTVtE0hbENVseJKY
         J24EZlKM1a7MVBNjn1x7HM1fA6fJprqCyJBJjz2kB448xrkj6sx10BJY0gguKdn0YtkV
         Y2a4WHeDKaPeIVudtdHEyWn3p7MLvoVFsJWtv9G06xD2FuzWIVlLZSDYta0kHQH6l2C0
         5zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769733982; x=1770338782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTEddwWbBpyzhGVw7MJf2cPAVoFusYDp1MzoHCuEkZA=;
        b=xCeQZbgz8ugWRuqR19RuqG/pzpzeDUGMWKa4V3G1CchwgEXGfB9adibDYe9jssU+dy
         Ide4ti78LqdEbm7yGqwCPFZe4VtjVM//kW/BVZFEJ/zLmA7sAobDGC3TKTL19xnLHKml
         nTsmObVm1V9F3eRdYkV4+eJZEQGQR1aa18uq5jgKddc4Az71VlUHX9VhMqcsZTeKt1st
         JtXDY7v1Fniw/MwegqC4eoguSS3LahTOBggLr1IP55UtPQNQ5Y9VrTLORCQMc5cFFPLu
         o9WsQdAenDRT8lSyCwWynomulftKLAhfdMzfEbJ6fKRa7QLStyGfqDG3TNjNPh59XEpa
         DXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJdLRskRidFDCRU8+94JOGUe7B+sULYeqGJeFQvnjGyiyOofEAiWrl4+7pmguJL6CV8djZkSAopqbh0bJa@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXhBPxJgXTvewD7HSCG9VgbN18vsaKkDZM5toHuNHLlf6dqBs
	yTzVVegzdlCeYL+yJ/wXqAVkXnMmk0MMAjDnbqW081t84ccOOuULiG1TiiLEFgWZctjrfzjzgzt
	AoyfSBJIHfrjgjiye7Kp4n2EAlTCfKqlD4LdXWBL+DY9vgfVgStJ9q6yCJtq9MCY0Ab11
X-Gm-Gg: AZuq6aK3KRD1SP2NvII+X3U5n8Av2hPbTm3pHUZrG8DS2u7Yc89cOna7g1X/9Oi0dW4
	x0NlS/lP1hgkyomkKFfpp0RGAAEKicbN0EBLBccC+duNzq1YukQTY/ZkzaKwwb/IyRTZBf5+mhr
	ee+R7KmeiTPo5srGRqnP963ujFWSQbleMNJpadlJAyaiqrv/yS5Lw3B1XrADOSVI7i4oVkQnlT7
	prYte98RtliMTibxswkF4heCRP8R7Z5EVjD8QL+ZuLaC00SJ0hMK46n0Jb4XQCiNLORzge0TjmY
	rwTQbtGUvaxRO8k7oPCWbWr9UjksxkgQjV3bNkY5Sq6yKc07CfIGd9xYKsYONHEwUEzypz4FNgN
	Xx/ELu7P2xHWWCH1hwtAjJWE/pc3ApGwB9yXgzSBEZmMSErrVg8B4ha+XsEahJVQ=
X-Received: by 2002:a05:7300:bc11:b0:2b7:97b0:82b3 with SMTP id 5a478bee46e88-2b7c8632963mr511563eec.5.1769733982334;
        Thu, 29 Jan 2026 16:46:22 -0800 (PST)
X-Received: by 2002:a05:7300:bc11:b0:2b7:97b0:82b3 with SMTP id 5a478bee46e88-2b7c8632963mr511551eec.5.1769733981756;
        Thu, 29 Jan 2026 16:46:21 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ec51csm9187299eec.10.2026.01.29.16.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:46:21 -0800 (PST)
Date: Thu, 29 Jan 2026 16:46:19 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
Message-ID: <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
X-Proofpoint-GUID: qLi-e1KIfrlYLuqKsBit2LRJ1eerbYCm
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697bff5f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HqoV7rsciEZpOya5PewA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: qLi-e1KIfrlYLuqKsBit2LRJ1eerbYCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMyBTYWx0ZWRfX38/9kcqs8A9c
 wvXMFPf2YxddVF/7uVkrTl1RycsCA/MxnmYx6v0Tqp9FMXGN+OQZ19B/2WGOAYMklsjxl74p8qV
 mRQhyRyNv0wWfX7oCzd+Su0ZK1tMBDMTVJ+UMfoLcR/qIlYvoGehCzW2UrjEZOq7nO12b+bUe2g
 MqTdv600F1ieck6XAN4O2D2CkprB/0RtImvx3wgYk8vBHuVlRSwuSz7vuatsVkp0hEqyaHrQ3i3
 7l58VDQCgljuIXSBLL6gP5FypEgyHQJFVn2/60dfRIOE6emGW3SaztSKESVhNdikHrR0XGnvgbk
 9tNcsGQut4JZVN9vh3o7P+T6t7V2ZN0La3fvPar4onY1yuwCAmPxKP5JNdiQFabKNvP/+J+oe+7
 A2/yasymCKJNmvlGOl4zzjlYJKDgWeVTYPdKDq1cssyG+Mm+/VZG01IR5AsY0x6HSkd5Dy+XI9d
 +Gq0ExamOvxN7lsuM5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,hu-clew-lv.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91223-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.lew@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B107B5FF4
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
> 
> On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
> > On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
> > > From: Chris Lew <chris.lew@oss.qualcomm.com>
> > > 
> > > A remoteproc booted during earlier boot stages such as UEFI or the
> > > bootloader, may need to be attached to without restarting the remoteproc
> > > hardware. To do this the remoteproc will need to check the ready and
> > > handover states in smp2p without an interrupt notification. Create
> > > qcom_smp2p_start_in() to initialize the shadow state without notifying
> > > clients because these early events happened in the past.
> > > 
> > > Add support for the .irq_get_irqchip_state callback so remoteproc can
> > > read the current state of the fatal, ready and handover bits.
> > > 
> > > Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> > > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > > ---
> > >   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 55 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> > > index cb515c2340c1..c27ffb44b825 100644
> > > --- a/drivers/soc/qcom/smp2p.c
> > > +++ b/drivers/soc/qcom/smp2p.c
> > > @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
> > >   	}
> > >   }
> > > +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> > > +{
> > > +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> > > +	unsigned int pid = smp2p->remote_pid;
> > > +	char buf[SMP2P_MAX_ENTRY_NAME];
> > > +	struct smp2p_smem_item *in;
> > > +	struct smp2p_entry *entry;
> > > +	size_t size;
> > > +	int i;
> > > +
> > > +	in = qcom_smem_get(pid, smem_id, &size);
> > > +	if (IS_ERR(in))
> > > +		return;
> > > +
> > > +	smp2p->in = in;
> > > +
> > > +	/* Check if version is initialized by the remote. */
> > > +	if (in->version == 0)
> > > +		return;
> > > +
> > > +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
> > > +		list_for_each_entry(entry, &smp2p->inbound, node) {
> > > +			memcpy(buf, in->entries[i].name, sizeof(buf));
> > Is there a reason for this copy at all?
> I don't see a compelling reason. This code snippet is same as present in
> qcom_smp2p_notify_in().

My understanding was that we do this copy because we don't want to do a
strcmp on memory that the remote could change at any time. Maybe it's
overkill but I thought it was considered good practice and as Deepak
mentioned, it is similarly present in qcom_smp2p_notify_in().

> > [...]
> > 
> > > +	/* Check inbound entries in the case of early boot processor */
> > "in case a remote processor has already been started"?
> This i can update in case new patch set is required.
> > Konrad
> > 

