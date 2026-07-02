Return-Path: <linux-arm-msm+bounces-115932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m0NVMNlARmpyMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:43:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D46F616D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:43:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="V6KsTI/z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i2t6PkOK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B093108DA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28385412267;
	Thu,  2 Jul 2026 10:28:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5A3C7DE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:28:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988111; cv=none; b=sxZYV8dQuirP0b06SBpLAGrhfkI968WBvyjOQSbFQldOvrvHRkuYldYuQTX05p8jEdUZfy/c7he5kN1d17soxSESU1wsfm75aj4cdGXQPVvqHCRULtJVp3w7HXbHRAvIdpuWOOrCbMCn3eah9zm4UH8cGDmaBFJ9qS9tlcgghDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988111; c=relaxed/simple;
	bh=P1vy9asEQrQJVf9UapPUuG0XNcxG4Tq20lmNbus5Y+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZAsQUO7XU8vovjNUDaauQtM4jtgAPmXlRDxrZ1BK6lK21iLJOWazWtUXeFwHMebohoB1YGTpfTEitokkYRupTbHpnmBtz5DTRIPGZJ4SLRfnZZXue4NcrZIzWcKt9RFC3+JT7AoRgvy165TtmlptbnUXZnByjgM1y5B1zet9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6KsTI/z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2t6PkOK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nPV24139534
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DW3cUmnXW6GzIVs2xOe2Jytj
	YX5GLdFSm6aCLCUq2NI=; b=V6KsTI/zCwqLMtzWeZscF7kb+YJDDfNvxSMCQFP3
	IALyu6WxbN2xtFhFFiOUZ4IwHBWX4j9DCNTjUEp83d2pO85Rp22GIx70I9CzIzKq
	8zuw2wMEqkao5E9gE4EbXnz+pj1YuA6VRoRD/lOJ+V48tkUF+747bkA550HvnH0J
	uc5/Pd8M+Vao18QpwWmxI65ppiKybs8FBpPTuTFYXrFGTrYwciA2bRFyolj9VbZE
	jjpryX3/3BoIvGNuGdnYCPVJGWAbot8ARSjJppYPQg9W9su8fXKweDFk4tFJRlM1
	X/28t45XaJyQS10FLT4K+4ALmmcdY7clZhOJn3zldT4uHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr84pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:28:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so2541278a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782988108; x=1783592908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DW3cUmnXW6GzIVs2xOe2JytjYX5GLdFSm6aCLCUq2NI=;
        b=i2t6PkOKYvZZ76pIn0eSZu3bd+5im2+eEy+QlkqFJDBzvB1EYtDUq98fDv5URBb4wZ
         aLNe5iSFfPD1lFuA86AwQ+/2sAJbdtj8nh8sWXdu3uodJoZEnhGiHYNrnNhCaxa9ryFL
         J9phczC5rOSqcnlMQY2rCQIQB8FZviIMdk9phhsVl6zWafN+aOcHjiOh32MMkLiFFEm2
         gcmgQ3f8j4NtiQ+AGRK580j05qwraXY/KKaqISxrYAntGZNnDy6vbzP3GSjw3c3XAp83
         ymLcWGV1UT/mQXaKLlEWLrkzz0JO2BAImT+jHn5z0FLSdcUglg6TeFUUdLlFMqYauzK3
         tO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988108; x=1783592908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW3cUmnXW6GzIVs2xOe2JytjYX5GLdFSm6aCLCUq2NI=;
        b=XR4uwpeA613ps7OEc+L3IBRxJPSAyO8fVTmMFCIYJ/OVtbrfbgV5FSuL24k3T2SevL
         IqHqzWKwT6+8v7U1f5SW3cE9txHT7MOi6n5NuhXieLWN6JDnOe6/FvQdL2Pq2mWKfoXg
         TAKc/9jV3xefXuFXhT5u3CNBnEls//FpukevXrUAPdFXnfX8YTaOz3gqCx5jbiNghjaW
         waXhEQbBT/5prlGxnC56Tra67KcWwlmp7YJ8nCFCn2gIz9cTf2l5uibOYJGXwjQs18rU
         lQmlHCALQfiI8vxtJH+HOTgrC3TlzkoOnigCp+5QxLpEKcEbftLZIDgw8XmBxSL8BamY
         OqGg==
X-Forwarded-Encrypted: i=1; AHgh+RqrHqzF+WKxsV6BIBH/z3szf5IZ/TbG4so+/ezkpvOHHreupx73GxQqtfwd0LSLBNQ9FFTP7QIMgoJeEnbp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhm+L6EMR6o7AWwzSBBAqUlYUUsHNvML8UYnDK5Cf3153sd+O7
	aKdGTvcSgImrvg+I4ni/5RynMdSsxQEIMu4k/LFkVFGqoqbuU1wiBWPdJdTa6deIKKRxicskRb0
	ioa4ve9gHgLFFSX+t4fBSwtH9IgBCCeq6wM69PBGBXoT2WVjEw+zeSSsi4gKbxHjD+7lG
X-Gm-Gg: AfdE7cnMTeguURKsK+4EX2/0FGHeN8X8gWz87dImy1YhfYKYh0Jz9vftD6iGEJRDjou
	Q1bY+AoOGHy2R63FFUpfnbAkO3KmKrQ3JUH2DWddkMpgmd4iPPlNVsbAhDV0N+PLaPrI5ijIABt
	C2Tq9wLzFzWTcFB/8MPiKvhWoVttwU35Oo132dr4X/1uRS47LlkKW+KPgsotZUF+IZZKdzRq00B
	Up4nSIiOVtpQHYTJ7wPxfiD/8wHcC5MI9jAIm5VfHI7UzAqYiT/LaJSY0CYZDjeexBEDF5Fw9FE
	dboPvipb2rPbMqhGZeg05c7QaQVLnB5slDeT/TU9+fSiBcujtGGEFs30XBwEPt3MCWgTZkSrR2V
	g6sOEGH2x1zI+oWLOqG2BW86q3YgncqThhx74Tg==
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-380aa0ac3d4mr5980266a91.1.1782988107482;
        Thu, 02 Jul 2026 03:28:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-380aa0ac3d4mr5980133a91.1.1782988105064;
        Thu, 02 Jul 2026 03:28:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b4c5577sm9211602eec.0.2026.07.02.03.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:28:24 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:58:18 +0530
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
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Fix reserved memory cleanup
 on probe failure
Message-ID: <20260702102818.ixu4reifb2nd4z7l@hu-mojha-hyd.qualcomm.com>
References: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
 <20260629141750.996853-3-mukesh.ojha@oss.qualcomm.com>
 <dfa822b8-5bec-4ad3-b9c4-ead79e0c74d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfa822b8-5bec-4ad3-b9c4-ead79e0c74d6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: d1O6BLQ5T2akXESm3FXLsOH3yHimT2rM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNyBTYWx0ZWRfXzS3DODzFsXx5
 yUdv4jbF7SJm0AoPoaGMjj1RQgi9leK5qsJBHV+TjhWtRGfA2YgcaY3tfZU+Bm25DKl3US/B3zR
 xLWNAJkAC+soLajr6qweDP12X8TRD+s=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a463d4c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ojCUiT_vaKNUMbvm03QA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: d1O6BLQ5T2akXESm3FXLsOH3yHimT2rM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNyBTYWx0ZWRfX1jLslC47ZM6g
 ucVKh+DdkNbwYrGTuZtlCDLSwnNbSglCH5PtWzPs+1ybpbClEY42tNibfPQddWfoC2uco6RE1/u
 JcWjwrahbKddifuIYY562nT5pugU0W0Kg8OqXN297PwU04itD0XAIgFilvRV72ZtVcL6/XNYeVD
 zMmb6e8zDiRCIOd6GlrgodgKcgw9pbezA+BDpFdZH3KYxiPgpZseRlhm1kWRKVuk9scIA37mb0M
 6iIqRxVdKbj7g64DCDLS//pddmIyw7ea+4bd3UpLenYirp/vJopAsHkawWl8N9SV53jqA+BHGfc
 at7wIDZlkCu1eRJpJGAXcucunlYAFY69N0tUU9ZHeToNVQt/hiKQMwGu6OqdJDrSJ7E26hmgYoY
 /FiPIp44qyZtml0qtVEAPRcnHw8L+up9yungW2FlednBF4+UM5q29a3d6YtGNFsfBtJNWoULdS3
 joZNpCMTgq/FjCmB6Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115932-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 258D46F616D

On Tue, Jun 30, 2026 at 12:07:26PM +0200, Konrad Dybcio wrote:
> On 6/29/26 4:17 PM, Mukesh Ojha wrote:
> > of_reserved_mem_device_init() adds an entry to a global list with no
> > devres counterpart. If qcom_scm_probe() fails after the call the
> > assignment is never cleaned up. A probe retry would add a duplicate
> > entry, leaking the original one permanently.
> > 
> > Add an err_rmem label that calls of_reserved_mem_device_release() and
> > route all error paths after of_reserved_mem_device_init() through it.
> > of_reserved_mem_device_release() is safe to call unconditionally as it
> > simply walks an empty list when nothing was assigned.
> > 
> > Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 464ae3b4ca43..f0e19fc314b4 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2785,9 +2785,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  				     "Failed to setup the reserved memory region for TZ mem\n");
> >  
> >  	ret = qcom_tzmem_enable(scm->dev);
> > -	if (ret)
> > -		return dev_err_probe(scm->dev, ret,
> > -				     "Failed to enable the TrustZone memory allocator\n");
> > +	if (ret) {
> > +		dev_err_probe(scm->dev, ret,
> > +			      "Failed to enable the TrustZone memory allocator\n");
> 
> Assign ret = dev_err_probe to preserve the usefulness of this API
>

Sure.

> Alternatively, I cobbled this together, feel free to take it forward
> (compile-tested only):


Sure, thank you along with all the clean up.

-Mukesh
> 
> From 917c849fd21c6660ba0bd55f8b6ce4cb5dfc8299 Mon Sep 17 00:00:00 2001
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Date: Tue, 30 Jun 2026 12:02:16 +0200
> Subject: [PATCH] of: reserved_mem: Introduce devres-managed initialization
>  functions
> 
> Introduce devres-based helpers for of_reserved_mem_device_init(_by_idx)
> to help fight dangling references and ever so slightly reduce the
> number of boilerplate deinitialization calls.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/of/of_reserved_mem.c    | 37 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 25 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 82222bd45ac6..79fa04d4cf04 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -787,6 +787,43 @@ void of_reserved_mem_device_release(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
>  
> +static void devm_of_reserved_mem_device_release(struct device *dev, void *res)
> +{
> +	of_reserved_mem_device_release(*(struct device **)res);
> +}
> +
> +/**
> + * devm_of_reserved_mem_device_init_by_idx - Resource managed of_reserved_mem_device_init_by_idx()
> + * @dev: Pointer to the device to configure
> + *
> + * This function assigns respective DMA-mapping operations based on the first
> + * reserved memory region specified by 'memory-region' property in device tree
> + * node of the given device.
> + *
> + * Returns: Negative errno on failure or zero on success.
> + */
> +int devm_of_reserved_mem_device_init_by_idx(struct device *dev, struct device_node *np, int idx)
> +{
> +	struct device **ptr;
> +	int ret;
> +
> +	ptr = devres_alloc(devm_of_reserved_mem_device_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ret = of_reserved_mem_device_init_by_idx(dev, np, idx);
> +	if (ret) {
> +		devres_free(ptr);
> +		return ret;
> +	}
> +
> +	*ptr = dev;
> +	devres_add(dev, ptr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_of_reserved_mem_device_init_by_idx);
> +
>  /**
>   * of_reserved_mem_lookup() - acquire reserved_mem from a device node
>   * @np:		node pointer of the desired reserved-memory region
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
> index e8b20b29fa68..28beeeb91f4e 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -47,6 +47,8 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
>  					      const char *name, struct resource *res);
>  int of_reserved_mem_region_count(const struct device_node *np);
>  
> +int devm_of_reserved_mem_device_init_by_idx(struct device *dev, struct device_node *np, int idx);
> +
>  #else
>  
>  #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
> @@ -91,6 +93,14 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
>  {
>  	return 0;
>  }
> +
> +static inline int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
> +							  struct device_node *np,
> +							  int idx)
> +{
> +	return -ENOSYS;
> +}
> +
>  #endif
>  
>  /**
> @@ -108,4 +118,19 @@ static inline int of_reserved_mem_device_init(struct device *dev)
>  	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
>  }
>  
> +/**
> + * of_reserved_mem_device_init() - Devres-managed version of of_reserved_mem_device_init()
> + * @dev:	Pointer to the device to configure
> + *
> + * This function assigns respective DMA-mapping operations based on the first
> + * reserved memory region specified by 'memory-region' property in device tree
> + * node of the given device.
> + *
> + * Returns error code or zero on success.
> + */
> +static inline int devm_of_reserved_mem_device_init(struct device *dev)
> +{
> +	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> +}
> +
>  #endif /* __OF_RESERVED_MEM_H */
> -- 
> 2.54.0
> 
> 
> Konrad

-- 
-Mukesh Ojha

