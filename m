Return-Path: <linux-arm-msm+bounces-91228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMdeB1QZfGlgKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:37:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C636B6804
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94F18301C5AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0769C487BE;
	Fri, 30 Jan 2026 02:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1yv4IdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvzRBZon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB51331A5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740580; cv=none; b=S97vmwWq86LTEvBukscoQNFDs+++/KQ50tBcnSkBa7uJkQr5Y3CVD7+1fE2O4f6hchS3YI2S7zhmciWVDDacUKnEyFwOVRiFAmn1BdKpCIDLf96xYD41GdBZXaSs8521IyRjqmuhDXY4PjlH5d/PmUuFTAY0qHYVfjhBB5vGoYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740580; c=relaxed/simple;
	bh=sNxkkwg8e+L3ZfLAzXjjQsC3Ixos8TiaadGrkPPZBuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKls3bmpeQHnNK1t9sOs8iiBovJ9XYAh4sCL/AWVS/KVkXasUQAGIAmMJ6xjHGkyriuJAKtNnwwDtvgsSibJUM5cg+fpu3Fbeqy44j4C+oBRxpgyJdKNXQj1xNeleSn+StogAqDAidsxIgw8aujquS+Lgtmn//DNZnGY0QezH/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1yv4IdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvzRBZon; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMxiXZ4119397
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0awdT6874YGtHlqtAyniXTK9
	kMRgr3FTTfRaGKb2iHQ=; b=X1yv4IdOyKB6PET67d45m3p9Yb0f9qcHDyx5XP8A
	5xWePmsQ44fIKbvBqgHHl9zUpy2MFiFthrC2IfcpFQfvLXkAT0QAodAC/IHitTNL
	wOOZ2BGXcWklP7BmG/f4IYb0hpW8pxLyWzb21hCrEXTScir1KsBwjtiGrcJhctri
	kZIra5UEPLd3jITsuwFBw4uv45O9aC8g9cqPVHl/rY+5RrV+D0UP3CupHAM9Tlp3
	XfaciA0EmC7vBgvTHZf6WgIqL78L5I/qbJZ9TFEWeCj4K66yS4r1gU4o+ezYlZUM
	t4JUuczbfDoYTzkxd7m/69mthmDXyweEJ9uBeEScEGAByg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtngewx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:36:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b315185aso723763185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 18:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769740577; x=1770345377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0awdT6874YGtHlqtAyniXTK9kMRgr3FTTfRaGKb2iHQ=;
        b=UvzRBZonb+3QZOfN1n2tvtbXJOL5jkgkmZrHVrSzBRMeavas4JUjV51nId10mZXDt+
         Gs9EvxjYKFvusphiT4OW4d9NdEHJ0tDyZYETvA+BC9KJikNUK7Q79zEKsrmCp7mzWwHV
         24WZlra4bz8wXti7kAomage6TE1wmPGWPEtooa+J9nKTOnkdTxKpzaG9oQNynnEIKKbr
         YUuWcUon+XLRZzeqzgPWfnD48ipSzH6FKfYyEwgAICEMIfjtoyZ1hXDAaaTthyFV44fv
         QxsP4JypgP0C50+HDcbpx3bWNdDzcpIrThd+in9kxkAnjCQZc1ksZPDMWckP8MBmOAcP
         ZUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740577; x=1770345377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0awdT6874YGtHlqtAyniXTK9kMRgr3FTTfRaGKb2iHQ=;
        b=eZ3UECSM3OklSa0c00+4DC4ksVg3dB/CBBJvI8HKTdaHsf8e174OgvIQQmaXrlOY7F
         w4GUFZmSb7x/vjjTXMPEmiomdQbPjdBY6hSALqXvJi3uMHGEI7TiLE6XCHK9lUnmFC7X
         rhxR1IfnsPgI5Q4NoI7296EF6ioe3iAQSzPYtYsxjmuv/S/4ZgvH29YO21q+H7tbz/Lx
         I/ucSDBhZGd3YGRY0NzHY+ihejZj/zv5V0fjRXijwrPuB92gqxCU29jDALGimuHNH+IM
         SxPYpWgNKSRwEHP3+jVn1HaDLK4Zu3E9rXcKI6O8Tyy1/J4V55NcfouvZn6rj2Lm6BII
         zMzA==
X-Forwarded-Encrypted: i=1; AJvYcCVVFp0wFzHGpq+oPd+UzPyG+1rB5dXA+bEp65ekYdD4okgImNCUzaThBIljfsLsQTdai1x4J9dRpPXlNcO0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzltq3aRLksag6xTZOjE7L/SvxvQtrcSCf4p4II20wAZc+ZydCH
	e7zhna4lfP/37QrrsxGBYVaeoWp+9OsJg374S8oOUmM2T/INaPdZ3PhgA1I5BDkrzMkNBxMhbos
	FYZRnTuGfaj1NNUKOARuSggGkk9GH287nVMPOD9ouaccd9C78emNnvTeIrjRWViv896ml
X-Gm-Gg: AZuq6aLHlOE9OvkgxcpKVCZJ1kWQPJOG/6DABCb4MgRhwaJVGfsUfFk+V6i2ph7XDK/
	dfG2eSo/DJoLjsofNFonMdxPbBYItklhHoJG0Gy2kgR2PV0n3eOD+pJAbCrthMwF2f9hdUf/3qL
	rqvXsLqBkYXlIAjhxvFYFvmEn30F3ynAcPYKl9e/HAQ0LiNdcTC9EJ86TEuwlg/WYLtBcOzhAAT
	WHH4bEeMtNeqKRo0NdL4w/t6cEz06cr3jcPYWnYmXTLd6DxAV1g4bZIqoq+yur+Ysf7jiXD4QXl
	dcwOSVzFodicjAPCkkNiRTy8pdiAoJP2Kpv/r2SdVQW+cxQvxHYeyunv3D7mCTE/iPnDXta8wxu
	4l8qk5jgVlVc+DivvU/jpPzE1aDpiRHKsVLUoxuZD96n+xGhZA9z3k7OEN4ovOTK//ZNTv5cNwf
	UDJDN1lnpZdD3+1ZjRYid/XDk=
X-Received: by 2002:a05:620a:254e:b0:8c6:a034:9226 with SMTP id af79cd13be357-8c9eb34e749mr228383285a.82.1769740577634;
        Thu, 29 Jan 2026 18:36:17 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c6:a034:9226 with SMTP id af79cd13be357-8c9eb34e749mr228381185a.82.1769740577160;
        Thu, 29 Jan 2026 18:36:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c61882sm11991331fa.12.2026.01.29.18.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:36:16 -0800 (PST)
Date: Fri, 30 Jan 2026 04:36:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v5] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <72tlx2t6n46k53of4xxhihbfsce6qd4x35iwaavuspc5ma47rz@qs3bzn4bartf>
References: <20260129234140.410983-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129234140.410983-1-xjdeng@buaa.edu.cn>
X-Proofpoint-GUID: qPKYZngOcTvGaJM_r6CekbgBJMIEM4bw
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697c1922 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W5TWiRnh0Z6joxywpxMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qPKYZngOcTvGaJM_r6CekbgBJMIEM4bw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOCBTYWx0ZWRfX3uQDES783KXx
 olvtr3/88cW6v/4LSQUSF8mhgolybycFGsyiC0ZNQGVyQoytLYZv0XULmZy5v6bBEsmZZIWY9vD
 t0sjDuFqGpy0kBvbpw3S4a0COmq5HG+RbmtcF1wf1+AbIQiCm1MVhl/k1fjgT63IV9SfdgRKUi5
 L6kJLnA7xOt8Ulf6IuYr0R23CecaD3G0cKHWVG4+8mbryXSdzO05ofMutSpaShXGI0D5+tmfk4v
 9rntBcnrproOW8vKD5S36br/pBCbfNDxbcOFyjbm9aEe6HvG4kMmBRpDB8sImbGGZOuwfsbnX7I
 Z0JwdCOg5SEarUgi6ZCpbwDc/04ztIEpWEC8iqN/bKvwGibz4DErKH8TZ//Ipq1DMzCqVC5Ji0y
 kNoCNcwj/LA4pXhbojZVxaaogzvNAMAJYBJFgZ18ZQGxlq1t2QnRIBvcjPJMkw8Bq7QNnV6MusX
 nDS+EP7hrmH3k0ed2qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C636B6804
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 07:41:40AM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> This issue was found by an in-house analysis workflow that extracts AST-based
> information and runs static checks, with LLM assistance for triage, and was
> confirmed by manual code review.
> No hardware testing was performed.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

