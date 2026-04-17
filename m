Return-Path: <linux-arm-msm+bounces-103569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPiMOai14mmf9QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:35:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEA41EEBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4746030414A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CD736C9D2;
	Fri, 17 Apr 2026 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhrxBHvF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUsC27Ji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5626F2EBBA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776465307; cv=none; b=KT9tqnNF8DSQ2dGbM4qtbstcbEdekUVWo3FudEBRhOW16tWupQI9h1sjVmtkzlUGKpqgzyFz4tXN3FbzUNnBrSEOMM/MstJa47L9HL7bElOUI993My1ytDDCjeVtBfjFDehOk+gbz/Js8yfjlr67RnSeyzDS3y4Qq/3RPTZ5Vww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776465307; c=relaxed/simple;
	bh=fvXCt89ykBu122iojhodOpRBQPqgpIs5ky43cNxj5hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHqx9ULQX1wFAT/wjOm/056ixQxGdBjTH/5Rn/Uq1dE4ZGl6vI7vYb3+Xw5aDgQ9SquHs6qseJl3PEeNwbxvUMZQoOcQOIm2roBGJnKa82whn5O66JEHB8o7iHz7R6LeNrX+AkyNX4FpY7b11fC1zckSFzKnwATYVLnaZIDImDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhrxBHvF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUsC27Ji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4HPV4068731
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lV91OmQ0DpFrl6eQP6Fk2nhC
	QuvgBovKBq0SbXWQTWk=; b=UhrxBHvFci7gKxOXqkZHhWy6PS+7KcQpJ6UjXAyC
	bVrNJ1r4p4CP7r1ktkugFS8ICyHXEbuEv/ryB4sP4LauuHQ00yjL0bkN/fnVQsGC
	QNuQJpfeU5rLXUS/2G0v9x/xJkvXnIB+lw3AkECw7BI80YYqnAkyQOx8am0V08KA
	i8RPdLKPL5te/bPc1gIss7hh2BRzLWqK7JoPoUVRaWk0L2W9VOk8TPk/9xg9o/Me
	T0HqkgPzOCA52s5mz3psDOFH4iwqtu3ETTSEh10HITw2EpxpossGGNOBw2KD/GRM
	Z6Hf7xOzo2Thht2UVjwS6ewpxQ22EqwxJdy4K+xLOU7BlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2gmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:35:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e2eeebd33so28884501cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776465304; x=1777070104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lV91OmQ0DpFrl6eQP6Fk2nhCQuvgBovKBq0SbXWQTWk=;
        b=XUsC27JiVkkzi0dcb3BdpXlocq5/ZqBMzFmy2sOEGtbsDDU7QG6YxXDK8ibgAZPi47
         BM3m6ayOVEjw8fUimfyukgWGeNcsQ1M9XVmK42jIdeRcx+wkdczPz4gvbmOOwTA3Pryu
         3dMN06ky63Hc98cOw7MRgMzByJvmtzaPIXg9ekhHIcAdxIkFUhcHvfeGvfVDnByTSO09
         OfTkekTbPp2DpGx9DI5UZKAr2ax4ARtaQHKXNsD2pOI5Kj6hYa3xVNnjglu+RzSJsw/H
         qFPbhastv4wFAVOf+Iix9DLf1LPUqv7uNL7feKVetNXSKagVd9UVklyD0s8GXyRQ/+W4
         fl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776465304; x=1777070104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV91OmQ0DpFrl6eQP6Fk2nhCQuvgBovKBq0SbXWQTWk=;
        b=d8CskXiCyUomMPppoM2bV0GrP7bVsfTlVzR8JQV2CfaE+bVKIHmzhgKS/9WxUyd5qH
         54SXyAMVusTG7uc05ejcWNlLSx9BYp7sC3mG7nAnYxOI8F9LLCyz+6qlufKHatrSrTfj
         N3OhdLayM/wwkF13xjTinzQbJEf96qkNolWe74DNAQJ4Y8lqvE7t8/9h2uJ7J+i3Xaxp
         Ld4sg6Tvmvy60U1rUclKbgUau3MWIQRkdQRMNnACFM9GvCVx1hOwxR/94BaHVPh6/r8i
         CJ3LyZnKGExzlQT+4JbkhyPuiHN7OFGLQF0fsmFdWyqpTuwWYpmxcrU94ZJ52UaEBsV8
         QSIw==
X-Forwarded-Encrypted: i=1; AFNElJ+jo3SqtMUmxlhHdpcZA3Y4E1qEMoSZ7JOHBL2L/tNx8CfEazs/aPu4mXiXzoZqiMd7s/BRnIGrehF6j5I8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/fd5gWX4KUcGQee7uuhIaclid4KnWfDq/JV/x1hfTthHNqPD
	8auoDX1fS0zKcAiqbgKyzBDu+xKBui2j2xKQ/Cb7c0UiZ3cjUUbZkNrghwiSr0yzhpqqQoFYT9n
	p0QLuJSxNwH8MFz+xzcT/oQuDsTL/PMb2fhvcq3C83n+lOq2Gns9mc+lkObbhoRu1aXFH
X-Gm-Gg: AeBDieuIzOjWNoRW1u7YNKHQWfIAJ5drWDYT3c/AMqOUVcobPnNEjUHrx+yayywHIW/
	plno6slNI28mlvBnFsE8KKh6Vg38YSZxSQPN9THfnEDg7efVBScLDNXkMJgZvL8XDbCXJx3ETLJ
	Z4QMUjx1RGwkvg25OIBzBIk98u8jxo31GgmWUPslK5YFvyO5c15dKuOjTlgszXY1gfkJCRmeMRy
	nDNa29CREajLSje/c6jQMNJ/UvMTjzsdXj1lZ3pkyHN0CBXaOl6LP0uLFDPD2kycHjhSIgYKyVR
	3U66uflbpf6wHQUIJlcxdIsyPLy6RttVbYR/4QlaFK9K3qYig3eI85j3mcxF7dlqu2kHyYCtjNb
	ew9KLnckyAh9YPahFyRqunlnzeuuRZ3HMCOVZKgIKg+7mchBrNLl3FbtB003cHcX3Oc4UN9/kFW
	Ygp38O33kxGcFJf68o2Ye+OLT7v8Fjm2vtHUd9xQAf6wdpZg==
X-Received: by 2002:ac8:7fd2:0:b0:50b:36af:56a6 with SMTP id d75a77b69052e-50e36b3f5c5mr73676701cf.15.1776465303582;
        Fri, 17 Apr 2026 15:35:03 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:36af:56a6 with SMTP id d75a77b69052e-50e36b3f5c5mr73676261cf.15.1776465303129;
        Fri, 17 Apr 2026 15:35:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41cc7f832sm7682e87.28.2026.04.17.15.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:35:02 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:35:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Fix NULL pointer dereference in rpmsg
 callback
Message-ID: <lqu6wykpvqpbm3boqjsy3tqqle75g2utumhsh6gha24xzeveda@7rwcsbwpkvua>
References: <20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2b598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zAZcFUoMMnNVK3tmhPQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: aE4oLqHawsOm-eyOhXveM0GHITOxOZeZ
X-Proofpoint-ORIG-GUID: aE4oLqHawsOm-eyOhXveM0GHITOxOZeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIyNiBTYWx0ZWRfXy39usSoUSN20
 pk1DR2+EW3mDUn8IGuyssyHnk9Wmy2SgUsZUoXVj10qKB9Zn8tJj7eBzvqveQJXabXdotfuLapC
 QFoUjr6CIS8G7y4NwwQaFuDnbP2SA5Xu8Xw6OOz3j/UCT19L/yy+yLvZPa7DMpocRCQtz1UnP8Q
 hSxzlboU1b4kH7DBpPdz0sIPK2wGNRSwop9mid03aWWRkxdg5+oXTQs58WbcwJ4YZKuEaKGKNrQ
 pzZyyVHnFBiVU2lkTzBD1kYtew7F/JKSahhJd5v/EerOlxUVhdGlwPDSFsb5cZ9qIH2zOZGu3AO
 wUZQMaMBB4tttGDWbQieaW00LBNzrvmb77pVl7Kd1ENkSFMQwvtxp/fMF/+F9cEaTJp5oWkHoIJ
 qfS9l/42l0ZMdhCcJBOsAJKHbg9kim/qrTEGz7/InB5FsxXB24RkamyzKK0DgFWj77bA9XO+hOk
 pVB04yha9cjKTBxdE1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170226
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103569-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68CEA41EEBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 01:31:46AM +0530, Mukesh Ojha wrote:
> A NULL pointer dereference was observed on Hawi at boot when the DSP
> sends a glink message before fastrpc_rpmsg_probe() has completed
> initialization:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
>   pc : _raw_spin_lock_irqsave+0x34/0x8c
>   lr : fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
>   ...
>   Call trace:
>    _raw_spin_lock_irqsave+0x34/0x8c (P)
>    fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
>    qcom_glink_native_rx+0x538/0x6a4
>    qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]
> 
> The faulting address 0x178 corresponds to the lock variable inside
> struct fastrpc_channel_ctx, confirming that cctx is NULL when
> fastrpc_rpmsg_callback() attempts to take the spinlock.
> 
> There are two issues here. First, dev_set_drvdata() is called before
> spin_lock_init() and idr_init(), leaving a window where the callback
> can retrieve a valid cctx pointer but operate on an uninitialized
> spinlock. Second, the rpmsg channel becomes live as soon as the driver
> is bound, so fastrpc_rpmsg_callback() can fire before dev_set_drvdata()
> is called at all, resulting in dev_get_drvdata() returning NULL.
> 
> Fix both issues by moving all cctx initialization ahead of
> dev_set_drvdata() so the structure is fully initialized before it
> becomes visible to the callback, and add a NULL check in
> fastrpc_rpmsg_callback() as a guard against any remaining window.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Missing Fixes / cc:stable. Otherwise LGTM.

As a side note, we really should rewrite that part into loop over
subnodes instead of the of_populate and depending on subdevices to
probe.

-- 
With best wishes
Dmitry

