Return-Path: <linux-arm-msm+bounces-113505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6G/VJuJNMmqayQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:33:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2DB697363
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:33:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TYT/N9us";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fOgtjCcS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113505-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113505-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 159613010C2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 07:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3333BC669;
	Wed, 17 Jun 2026 07:31:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F239934D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 07:31:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681505; cv=none; b=GRoJMmSsJ79+Q6zsHXKXZHszlWnMk6wcMTaQ+mcVaHLyYHf95TwrqLgfYSqXAi10NjMkB++rRfoQ7tGYJKfUmH1s4wgwXnPA1SKMFf1h5QJbo92FUinwzuNc+ad2l8f0GRVZzBqLwkm9mVSawujLUsGMHBHczGK42jmPRs7zDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681505; c=relaxed/simple;
	bh=GqUjQ7jj7J7LZGHhV2LxtMxZH8BTKfrUvuFLZ5Gm2aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM2xb4J+aQ+juXcTMlseCccLJKrASElLeAYHH05DVEqqCawoMmQOdkgI3G89yorNySqkU/YquGn1JpMRmgZ22A4i/RpvWSSF9VsyMJ2JZvVf+CdfKVplYWxejjjruhpHx685QUuSQOMNYhJUn7FWQXJXh+PlNK4Z7T6LOI9ttPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYT/N9us; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOgtjCcS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H6Lbik2976418
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 07:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hFdkEaACk25DwwaRiVlB/bmV
	CKAIF28YfRXJwPpkHxY=; b=TYT/N9usLBsxSmJ+CvaCn0imOTnDvnCI8YY+acp1
	toLXYHLwKN35fKWt6llz3O0Qfr8OpDIL+4sRM7sN75d75bXP5rVJe9MJDNTMBx8T
	HMZ4W1vONZK3ORtgaPjuX6nwoqUs9PQjwyNAH7CmOQs7e9u26YyOyvAyjZeJFUIv
	cFR2V9F+0evpHIl79SPO8A5uG/TsG96d/s+XgdhRBHNKXxbNIEZcYaxG/VYAio7m
	8I2WfAABqmfIMyiFw7y7I6KBeZ/p89d73phXVetJ6+HbKht/qQyF9ducOH4QlC4L
	PkudZZ9B34SPZuWvtyttSNfgWBcHoyBSgOoI+0zCF1yzUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueephwak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 07:31:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c129b3so2599417a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781681503; x=1782286303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFdkEaACk25DwwaRiVlB/bmVCKAIF28YfRXJwPpkHxY=;
        b=fOgtjCcSK7lwIR+fxqod/hqoCTCJQWNPcE/o/yCt11skrAdujof4DeppmVWzhBTm2/
         wHkAM2PJSO80VSOaoSA1TzF1zT51ROgIQ3RnwtQPV9Xgmoridhs63sV9gu5keTlISbUz
         eO2y7W/N/pTEh0JmYlguR/u7DYFRTnvEGvVMjIsWRsgy0T8/8GOl+g4AAA1rw8c+ljKM
         1Nzh9CEqnjp4kMA0kDH4Fc/ZR09fkjJwtLV3UitdMhG4Npb+wHGeZoO5P8OCETCXzL1O
         D1rWaiIZhypHsION1JCH8+pHeMEuloJimKqe1klmMPMG3KpteFJVfQLKP4JlPPhI/Fwb
         ZfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681503; x=1782286303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFdkEaACk25DwwaRiVlB/bmVCKAIF28YfRXJwPpkHxY=;
        b=P1ALM/rHyOXFHvo3Q0q865WtcQrMHR7LeiIgDTB+iGUZUSfACNcX1OJi4u9uMVnC+f
         23Ew2GgFlMb8fk68Gb2Lz5FyOCfiQOFOZent24B3NtYLL0j3270VIO0psDN+UEH0xUOk
         xiI9chO7WjRrMgE5630ki7QZR5CpwfsuMlpjHRuKyN8OohzWbydjw/w4WwRyktHs0JXn
         PqOxE06N0ckyRAjVTXJ9LW+MPf57LSXoS15onMCqVwEv3GQrAnkQCLdKVQ/zKsWnawdI
         slNIAL6sUy8w5PL764xeaKP1uwzgo+NcYNMG1FIwaJlp9MHdPruN/Ho3llbWuM1DXYt1
         fFag==
X-Forwarded-Encrypted: i=1; AFNElJ+asK9mA7lSE55a0QBEnnNuiNsGESMBB5tq1/4XxgP6emyZXdzIO2FJbwFA9ULtKBVovfbTdo5n+VFFeAuA@vger.kernel.org
X-Gm-Message-State: AOJu0YwJM21ctVC3AoZieM0V5Z2MacST5JnWjgfidG5DTM6/IrX2Ckyv
	B1AzvqHoWmSFQqn3y0wsZBbjjpxyvOF/LeO34EERGp1oj+hev83RZkJyNXhv8dueCVTfCIS3vPs
	7yFzcavivyk1J+BAT0rd/a+Qb2oVYVmIWAKqNI9xlPilf0BeNvVNki/64WnAStWwlDpjf
X-Gm-Gg: AfdE7cnpr6+w4SFKV8A8hyDEL2EQKMdbmeK2ngwFZUtJjUKpmUt7rDQ1yDY7yJJhtxi
	ca0XuACMIrUqxqRCb7cfhCBvNSJPZRUCkZ1omulWYkAIZ9VFuicbyjrnLzyZobapPVpVJK4A80Z
	j7D0pIiNymgFWMO3Po2nNsv3wYMY8xbbN6qbtKfE2y0s9Cjwx7De+u2eY5KQvJUBKJD2MBrOKpH
	q9uRXjXG1b+DRwvBj8Re77MpGFGc7UNR7h+kAuO7ptOPo7zj882HandyyVhpIAtoXXuNg1zZhx9
	qvpIIJqmuGW96p6AcGSxSg4GkTUzd+800lEZo6NVwg0yFwjIadGrbwyd3YE4T7X+KpCvCmUl9rS
	uQKXx8NLHCeN+zEzq2UkCaOchCauMiNRWEy+cUQ==
X-Received: by 2002:a17:90b:55c8:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-37c9366b4ddmr2822250a91.8.1781681502793;
        Wed, 17 Jun 2026 00:31:42 -0700 (PDT)
X-Received: by 2002:a17:90b:55c8:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-37c9366b4ddmr2822213a91.8.1781681502209;
        Wed, 17 Jun 2026 00:31:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5208fd0fsm4892236a91.0.2026.06.17.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:31:41 -0700 (PDT)
Date: Wed, 17 Jun 2026 13:01:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for Hawi SoC
Message-ID: <20260617073136.mqq7p5imay5sj2ks@hu-mojha-hyd.qualcomm.com>
References: <20260506110226.2256249-1-mukesh.ojha@oss.qualcomm.com>
 <20260612221514.GA1951714-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612221514.GA1951714-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a324d5f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ar57jroI1Nk7x9OyPucA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xMbPF19L_vnwbXm4ODPh3N8wrIsWswMc
X-Proofpoint-ORIG-GUID: xMbPF19L_vnwbXm4ODPh3N8wrIsWswMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA2OSBTYWx0ZWRfXxgU+gZxFEJnF
 N0SyahsDkBMwhsyq+qMTQIgJF+Qk0FJ/bP2aJbmUXG9qz8x9YWyxa2uVQTZjIVn5Fu/rq0sUtfO
 qTj/agqgqyg2dfB3hyrUTrBFOSFEeM/uLlsDWzrel++TAAsIus4YUtupMta5d0ZUuWNaWqOLTZb
 oKpm1uDZSZ/m7t2glVzDxUT6KhO/chPYQ2VLHhzNVgr8HiFEKV3fjm7ZYDxl3+yRgCWS9NrC6rC
 dlvoykSOAoWRcvI8/T48QpJ+KPLZq16ROaUHTRSqSEktLKc4UbAN7kdBSgZ4c6FVAO9QWtbur9w
 JpmMr7uVVuYuFdhE2Vj1oO4gAr5rplah4UbShiTsnNSXm0vGmLPUnUNqObUzYKMZLUDATwBmxUS
 LnLw9GMEwo95npgqe8Dab50vgNzDJh6SzL4s+X2ZHGw16Dusmfv12pWbgpEf0thXjgJE/KLM80m
 1HjB4sdxblSpZE7HQLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA2OSBTYWx0ZWRfXy8YolQWEf4mz
 y+XjfUbfjxdEV7I/zcmZ344z+lcU1Ak44xLQv6sR0vYXyLXAWCnm8dfg3272h1DJfqQmsuckQop
 Z6FWJDjBwcfY4fJ/VGAI/Qnkm96YQkQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113505-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB2DB697363

On Fri, Jun 12, 2026 at 05:15:14PM -0500, Rob Herring wrote:
> On Wed, May 06, 2026 at 04:32:26PM +0530, Mukesh Ojha wrote:
> > Hawi uses the same protection domain layout as Kaanapali, so reuse the
> > kaanapali_domains table. Also add the missing adsp_ois_pd entry (OIS
> > protection domain, instance_id 74) to kaanapali_domains, which is
> > required by both Kaanapali and Hawi.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> > index 7bb14c20ab5d..b99718e25f2f 100644
> > --- a/drivers/soc/qcom/qcom_pd_mapper.c
> > +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> > @@ -266,6 +266,12 @@ static const struct qcom_pdm_domain_data adsp_charger_pd = {
> >  	.services = { NULL },
> >  };
> >  
> > +static const struct qcom_pdm_domain_data adsp_ois_pd = {
> > +	.domain = "msm/adsp/ois_pd",
> > +	.instance_id = 74,
> > +	.services = { NULL, },
> > +};
> > +
> >  static const struct qcom_pdm_domain_data adsp_root_pd = {
> >  	.domain = "msm/adsp/root_pd",
> >  	.instance_id = 74,
> > @@ -370,6 +376,7 @@ static const struct qcom_pdm_domain_data *glymur_domains[] = {
> >  
> >  static const struct qcom_pdm_domain_data *kaanapali_domains[] = {
> >  	&adsp_audio_pd,
> > +	&adsp_ois_pd,
> >  	&adsp_root_pd,
> >  	&adsp_sensor_pd,
> >  	&cdsp_root_pd,
> > @@ -581,6 +588,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
> >  	{ .compatible = "qcom,eliza", .data = sm8550_domains, },
> >  	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
> >  	{ .compatible = "qcom,glymur", .data = glymur_domains, },
> > +	{ .compatible = "qcom,hawi", .data = kaanapali_domains, },
> 
> This is not documented. I couldn't find any patch adding it. Please 
> submit one.

Apologies for the late reply, I was on leave. Will push the change.
-- 
-Mukesh Ojha

