Return-Path: <linux-arm-msm+bounces-117982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bnzMTeYT2oEkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:46:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30B7312AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:46:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o2fAAmFv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AA0n9ErO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C72503001449
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6EB1B142D;
	Thu,  9 Jul 2026 12:46:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887A16CD33
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:46:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601204; cv=none; b=StdVrrRZr3se4IrzZDoNyq60vfbv1ZXU6dJpV1y6NEkLa1aQFPitwO6Jo1pIQwMMCkOAQyAieqtkXRnH7cpZgUjf32sL2QRuipPe6TjuLLCtnnAS6FyRTJtot0FAUbXs12rPt5qpvoX5FsrmM71Q+bTlJRNwcj+ADlJ/vO8zbas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601204; c=relaxed/simple;
	bh=1kodj8OIziNbF3vfucD7WMjztL9WkrD1L4H5d9DlBEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaYiSNXx5jGWyOKggvQDmaNONqagG90ueRPSlIcEE5NXsZVbmMjd0L4YyQXhKOW9z93kAD96n6FlqRdeL43ZGM3xyV4kuIT7yi4kfqY69C7S29FYjNpgBy0ABuTAICXi4eqQD+EE55p4gS2KRz2UYpdZOlV7Ac2rsauaG5IlsvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2fAAmFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AA0n9ErO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNcFM1668002
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DHtR4jzhJvIrAtVRAzbVcsYU
	lhY97Xzupz9H7IBcdD4=; b=o2fAAmFvAYYLy+eK1faE4nbwATt4Hr2wyfGaQp2P
	BxC9irIQQdNpfSN9mIBieZ0Z7MPw40X63wTeEZYPvCXgKJ4mHgaGS+HQEdF0w7aJ
	L1QrsqVaiy+Qv3SdIbAzvWp5v28Y6AxL0SSWit0IX6kwbvbDY/g8IxaJgluUYUxP
	5k2tXJ0VIB2VTHSbw91c0G7pgMKLB0xKPF6QGqBnjmOrUXK5YjND6GajATqUxLIC
	MAt+A+0ob2Q1kByw0w65tfp4qQt9NXD5nUo5oQqH/oEKTVKEy8uE7s+hZtPWs5G5
	J20lmSC7o8E6Hh5+ly32mFCgHRqs7GN1C3K5VhFLIi0c9Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6ksjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:46:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso325000137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601201; x=1784206001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DHtR4jzhJvIrAtVRAzbVcsYUlhY97Xzupz9H7IBcdD4=;
        b=AA0n9ErO9l1hDOIsfpLnm+ubJkop6O5htkmDMTZxFCQ3YR//mt5+xuv+i24IyMJ/tB
         x/T6yj0kxvBDoGGx3yDILPKtT/2rxhnTxIkhG6+yRwEAwsoQHlbem2T+3yRAoPoDPbVc
         0BZgNr+oTLsP1qik4FQK0nytBVRG4ftsKhIV8BkNcg50v2Q885ZMXyLLwrZQTKFSQmpP
         NkqR8gtstN0sN8U1DQsi+GITk39YKwYVWC/y/FUoyMrL+SIbdQU7xhWxnn7Sql4OjLVe
         bOaN/Qqz5A4yTtQxeT9qHxF2Z3DArd3mth5FFeaufqbpaAOz/nwKWRrLBswcAYa8UebQ
         4n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601201; x=1784206001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHtR4jzhJvIrAtVRAzbVcsYUlhY97Xzupz9H7IBcdD4=;
        b=pkpHwSOngVL8byHybqhP8h5d4KbBNKFEgR7jGM+IvpWivrKCznKeP/aWCJ/EXHdq7l
         yWhaxeVit5TKkSwhjpEI9akRSRt49Xe4m9nbur/exK8X/9wssA3rT+DvA6/e50YUoeCH
         uGRaKfAMaQpaiuZVwJ/HitYHo00tIHvcEE80oeDNjAPabIdrTdMgt1hVmLxCtIMOoCmX
         9QOlbRDKGEae6ATVARTytBs9bMs1YXYBaWdigXjMFr0BhWFc1Mw3fZ8CDzNcdZ2jkmZY
         6SN3osD5GuPRhQs9xytOPC37or0Dn2e4WN56+TmTODKOkbLKd3yJL6jagiqtx/3IDCRq
         Ya3w==
X-Forwarded-Encrypted: i=1; AHgh+RrQhV3hukjRYJFA5NNrzY95DfoA22b2zAqiO0C7/aH2PO1NJfDZdVmhRt1584RDivQvt2HxzUnBMkkA+8bH@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYRwnDYuJZ36Az1P3Oviu0Xwc4kTG3dUGSfMxToeqb9zqrx/F
	ZkjlQvlfRJTFzNEemiaqwKfSnxGiGs9DWNjyBYLzYmDFa6zEr+JbHI/FlTE6InNjMGBucXHJyI8
	L91Z+NcFpbA3B3dkG6AxVdvojkeZwSWqTyLdUeo8RBTmmgoKfaZbmQXIco842CC7jOS0BcRvBT3
	bw
X-Gm-Gg: AfdE7cmqHuSVGKtiTog1Zr4w4liRaJeiJ7ELCYIFSfcedxtCTMRF5W3frko3Vfrkgmt
	i5VqfreX5vWBJEYtvZ2diNG/ib2bk6HqfER6MTkzcEncv0Ne6znB91v2+rrAyDfCZzzbIeQv6/d
	s8wZqo+oRtHopTabRX4OJ/03YWtuGKCenbkoChfVvGAMk3byTmQtwktBxGa5fZHR/vJrFO0egfd
	sIs/XpZ/Is+a1+2ezM0sowCtmRRTX2aJT2mhp/aUDOIBPrzG9Kilhn7HbqNFLcNa8R+zKS5aA80
	ldP7quzBZ/t9OVn7pLRlpwkNz+I1d8zNhKYdCq4xOS70AEPagsT/FBMnC4U0nNdAjGOvTK4kZro
	Nm5mplo2ZqEc/xzoM4Bx5Re9R5piFwfDtRbe2cjcgnDChAkhUZ3poCsXGpWIfEylR8uFEGvzWpi
	D4jKuWSVdO59oXA3GnEPEv4lTd
X-Received: by 2002:a05:6102:292b:b0:738:3525:4403 with SMTP id ada2fe7eead31-744dfe5c18bmr4104956137.16.1783601201538;
        Thu, 09 Jul 2026 05:46:41 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:738:3525:4403 with SMTP id ada2fe7eead31-744dfe5c18bmr4104921137.16.1783601201109;
        Thu, 09 Jul 2026 05:46:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377075sm5142317e87.28.2026.07.09.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:46:40 -0700 (PDT)
Date: Thu, 9 Jul 2026 15:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, abhinav.kumar@linux.dev,
        freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
        linux-arm-msm@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run
Subject: Re: [PATCH 48/60] drm/msm/mdp5: Convert to atomic_create_state
Message-ID: <kcexmzb5sukst5366m5k6docyldh4nrw43p5gigqiznwbjalxd@5ncarrjxdbai>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
 <20260709-drm-no-more-plane-reset-v1-48-302d986fe5f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-48-302d986fe5f0@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNCBTYWx0ZWRfXyQTCqmKR4QyY
 N+FzMQjD0cRLoNfGwSKfxUXBZFXyS1dKdPLOXFOe5yO2QSA0BDFaxwf0Wjw8O47ZWQ+0YfqK8Jb
 Dz8RQ9BYmgD8/6UUdd5/RjKniboCqIk=
X-Proofpoint-GUID: EiWiG7hYdW65Lsw5he-MJTNyd0DFV5RR
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f9832 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mVv-3nkEeNymqhpJ9RMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: EiWiG7hYdW65Lsw5he-MJTNyd0DFV5RR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNCBTYWx0ZWRfXx9jEvJnpZcv1
 LRO5+j/V0OUMbriKgN+QSQGvA9vXzWXCudS2E1w5YEVXmDfveuvhwW+TNPqlKn7ckQHJy8efxqe
 +/uWWsBDB7HBKfhBYLPKnQT4BaL9iRoSCdSFA4fcMIWDhgN8f1VzUaTQdZYlIbPUrpFZ/1Hr5zA
 POC37ugfpw8zA56yQF6gD4RuN/uskaBe0R5+Rz7LYBD7qnXD35GSR/eBoIL1YEg3uEMD3lkLpU6
 BlgiWzTzL1r5NcfwdKPC1kQu739Z7/IXT7iFbhCrYa9qPDl9maXYcMgEnKMLRv9377x5CHoMvsd
 7J4SGjJKETaBvLw1V3F0bBvprVZiEzMWNvuMJDmpIuaee2DPUbk/ZV8CcG4qlV8/rMTrHtIUilq
 x1ALPZUBTjDKeiSeq0Gx1JYNp9Esd6SnrofzufVr5N0lETTIIOVgWq2RMo3uhtkBjswrLL7BxPQ
 n0jues38k2lN3l2sJBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117982-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:abhinav.kumar@linux.dev,m:freedreno@lists.freedesktop.org,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,linux.dev,vger.kernel.org,kernel.org,somainline.org,oss.qualcomm.com,poorly.run];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F30B7312AB

On Thu, Jul 09, 2026 at 01:51:14PM +0200, Maxime Ripard wrote:
> The plane reset implementation creates a custom state
> subclass, but only initializes a pristine state without resetting any
> hardware. This is equivalent to what atomic_create_state expects.
> Convert to it.
> 
> The conversion was done using the following Coccinelle semantic patch:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Ack to merge it through drm-misc

-- 
With best wishes
Dmitry

