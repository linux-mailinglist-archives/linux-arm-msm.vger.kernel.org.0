Return-Path: <linux-arm-msm+bounces-115355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +vD0A0KZQ2rtcwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:24:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8EC6E2C96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gc0JpTHs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K8IYr1a0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115355-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115355-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07798302105E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642A337F742;
	Tue, 30 Jun 2026 10:07:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B13EB7FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:07:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814058; cv=none; b=DieWgEEuIQCLzD3C7ce9VuGGi60XHeLQ6PFkUJlwi36BAfHcTvFzbxfAB+CRmp4wlOCEk3WfysaMTnlmQaIiLASrFLpi3ZkuCaPz9DlCtWKKYkIotDLr7MgIncMTcO3xSNFAGuHdFhhU4x1EYfN6AACLQn88AMbj/9LQfYxPPVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814058; c=relaxed/simple;
	bh=mLvNUZffSS63xSXb11pJ/jLKFpi9EXoIt0IvFzGW5W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVld727XgWu35vxYHEfP1bY9RyDfwh2+AMmx9YPgBhXBBtuhKg3VSRdkx2qnShvCrVadm1ihR/OQGt7CyE6dpfF31iLG40Te4BAbWN8anx2WT+O+qe8zw+bwpI2245ybu98+ijectK99pITMgdnCtU2YsP92jVrJ5X6KQsl6BZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gc0JpTHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8IYr1a0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mvmN1604965
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y4TvzQBPS7Y+M5mgFjPqd5e3
	S5l4MQ/lwElSlGrUn9Q=; b=gc0JpTHsO0YLKGYZhS4XAv4PNcG6SeN8lr1QSM/T
	6DTEK4C42ApQLxwSIhtCz1FRehVrDAQpL3Yabde/HQArr0HNyXt4yKD1MQjvpqWG
	HL1NcXaC2lMoaPMLG8qxqyREXvsvn4QXbO/I6+LFhZQURCVE008HNIR3DqM+/yae
	z8hTrxFoE9ne4nhIniEhhPFYUR64RsaCSAQJlRfWEQNhw5IfRjsNPjnziS/2+2I9
	987OSHbAa5ZkeQnWu8106dFv0bJtBa2t0aodQVBjf8vYcOcYqqRbHtU4tHmWmZA4
	4oLzm2As0bS8htqPmo/FcWe0Js9H5V8EhCMxKGK66GTejg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfj1b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:07:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed53abff8so1872106eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814053; x=1783418853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4TvzQBPS7Y+M5mgFjPqd5e3S5l4MQ/lwElSlGrUn9Q=;
        b=K8IYr1a0VYY0ByY3an84XytKtBNEfxZ4dr6k9BCZ8eCfwtFug2Kr4Lmoh+V01pXi0N
         OvH/tz9NPX8y2ZWHhI3kSgsAyHwzJuu9grP/EnORJ/viMJhSSleeCn9857lI0QAZyL5y
         7wByqr2hB3pW1eJxWQhZOptRJQP826vgZPl8R2t2aEXN9W1a0eh6PGYHQtv+TaZW4qma
         XKLib40cL+3ehzkVOaM/rA0As/7i5MBDNbH/qzW7TZzNyZXriJypbpx7WJkR78u5YD5c
         lACriESC4ZzUlvhu4C7U+8w6xfKqlRw7yL09Ep+kReWCVs8JyaaKzpYNm+tUplhKP19e
         mFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814053; x=1783418853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4TvzQBPS7Y+M5mgFjPqd5e3S5l4MQ/lwElSlGrUn9Q=;
        b=kG4XT4FoLlt0uZl6GEXqglHQ/gQiV7Ak4mfJZGNgLij75vdgu4k5MOA+nMFI1EENka
         XpdELn2F97VerHXIUSQCx+Li/FbSXDVgLhcT0DEHHFbOKv1RnQpUT0FZOaiZWH1X+SJ4
         DCE5O+wLcBkFuJyjF2tJGHI96vcSjTwSSgCAeQAvQOvgcmplh2iZx+dr01y3scOIrNpC
         t+10kN8E3Yly4EdQ7a84G6TMHW26juM7W9ATdrsI2Cub85AbLObSIuw6UdnPtm6tD+rJ
         /T2XEoiJ6O1g0eAm2GuDK9ahZGifqaacy5eP3lf3eEkw5OGMiKmLDIsA5KJnyk2hDBAo
         M2Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3m8XcwMgMgsMFP5C8M77mfnFGPfy+nk0BzUPhT3z+4Go6FJHTobZWPVAJWeCYcrFUUZ9E6CiyDJaE/EnX@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDWLrdt/sANN3wfD4TIK6E7y+vuSkYGdVX7oI4MKuAS+cGXwl
	H5rBz5grRIEAeL4XXRk4zzu1vDJNljyE/G4Sv17fqH3PuNEiJbJdlfNy1FrKiSkw1T+PVgN816B
	r5ePQPDlkiemRg8WmOftVZkWuMEdib/q0T4tLxi7aO/3TKxX3TOZk9asqi0ZJrS5iMP7r
X-Gm-Gg: AfdE7ckjnexsEU0ZO/5KdQ0ZbB4WB1d1awwfcxd+FxVR6h37pOj6PwSZxLJnoM0d3rw
	xcrMJL09qSCUw85+LAM2USkITqpgJH7MvO4g0JcvBO6Rr4Quf4CZPt194qQUWhSwgyxyKmOZPQO
	o9T5KpjzIRCVdEAH+1IgAIZQiMJcbf2GCqSxl9miQJMjp9QPc/PzdMsTBn5OwYkWGdFEM1VoqcK
	2H4w9WI6lny72Sp3Yn/jVbjNg+7Wzo2x0if6KBvfrS9IFonT1ue4EzrlImNX5uN341CRey+M+ue
	d0WvZDDVkk/xALktSuOB+AD6hTgMYMIdb+5Gv7DzeGc5uePbtUScYgXd4SGWYDQqy0BH5JFg8do
	MKvC9a7S+sEp+PLw5jIuRFI4xQYrCFD04NyiDlw==
X-Received: by 2002:a05:7300:a994:b0:30e:cda8:e37 with SMTP id 5a478bee46e88-30ee146e061mr2094591eec.20.1782814052960;
        Tue, 30 Jun 2026 03:07:32 -0700 (PDT)
X-Received: by 2002:a05:7300:a994:b0:30e:cda8:e37 with SMTP id 5a478bee46e88-30ee146e061mr2094543eec.20.1782814051827;
        Tue, 30 Jun 2026 03:07:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm6828280eec.12.2026.06.30.03.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:07:31 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:37:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] firmware: qcom: scm: Fix NULL dereference in IRQ
 handler before __scm is published
Message-ID: <20260630100724.etwuz6l4ir2hdism@hu-mojha-hyd.qualcomm.com>
References: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
 <20260629141750.996853-2-mukesh.ojha@oss.qualcomm.com>
 <6f8e6b61-a6cd-490f-84d8-9ddb8638d952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f8e6b61-a6cd-490f-84d8-9ddb8638d952@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fRRnHCLFFMCl3GpRi6xSzuR5czwaDPWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MSBTYWx0ZWRfX91n7wf49poDK
 JNN4DD/6oEQe8y3OHGi+KlnQ/ruIOLgWUTr4Fkv/IQTX0LLXAW6SMyCT1ZcK4wuHekaQHmqHAc7
 tBV/CJkCVUxVcML51aZbJeBt9VlWE04Z7x3FoZREAvzm/6V3gZUSEre9fuNQWjMQlDInwt8MDFM
 48zJv1tyyBdlIy9essQDuwvaauB+iN3eZWRWW8xMJWfBFMpxaZToVFctnY7/lpQF2Va1f37tGk4
 8uq15dpIL3X4ZVl2yRn2xKVoWtf5x60IC44gP4fMG+OrvDQEwfUSt/FBPMRoWDn84gO+7b4CZCv
 wG3fZfXZGg9TrbNzqAMIMsORiAiLG119xMyYt0lTYDOC8I427kVfZdYVysYL0DaoEIkONrHv9FD
 Qg/GiLh3W0UogmgBKd2e3O2NGtnRdFJRBk/8nNTEAZ1xZNIvqTMAPvtULMcFPYFrQ/vIJ1sR2Bl
 weifMiNkdoQyU5QWMJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MSBTYWx0ZWRfX5P24lZEUnW4D
 4klHAyl7eiHNpiLOSHyZOz0SwO4tEjBf3UB8BRwtKHJFSaBcBWo1ahKkNWXmids02v/EG3nXLxL
 gwJMhMT9Hw6vfqn6oS87FJsotiwKeOg=
X-Proofpoint-GUID: fRRnHCLFFMCl3GpRi6xSzuR5czwaDPWT
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a439565 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PLhmOCzo5ojB0wYzfGEA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115355-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A8EC6E2C96

On Tue, Jun 30, 2026 at 11:50:30AM +0200, Konrad Dybcio wrote:
> On 6/29/26 4:17 PM, Mukesh Ojha wrote:
> > In qcom_scm_probe(), devm_request_threaded_irq() is called before
> > smp_store_release(&__scm, scm). Two paths can dereference __scm before
> > it is published, both causing a NULL pointer dereference.
> > 
> > The IRQ handler receives scm via its data argument but passes only wq_ctx
> > to qcom_scm_waitq_wakeup() and qcom_scm_get_completion(), which then
> > dereference __scm directly. Thread scm through both functions so the IRQ
> > handler path never touches __scm.
> > 
> > Non-atomic SMC calls made during probe (e.g. from qcom_tzmem_init via
> > qcom_scm_shm_bridge_enable) can return WAITQ_SLEEP, causing
> > qcom_scm_wait_for_wq_completion() to run before __scm is published and
> > dereference it. Add platform_set_drvdata(pdev, scm) early in probe and
> > change qcom_scm_wait_for_wq_completion() to take the device pointer and
> > use dev_get_drvdata() to reach scm, removing any dependency on __scm.
> > 
> > Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
> > +int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
> 
> I think it logically makes more sense to pass a struct qcom_scm* here
> and get the data from the caller, but potayto/potato

To maintain the abstraction of struct qcom_scm* to
qcom_scm-smc.c, had to use a different way.

-- 
-Mukesh Ojha

