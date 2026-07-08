Return-Path: <linux-arm-msm+bounces-117778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D1V0ItCKTmpRPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:37:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF37A729474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o5nTaVNM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e9FjsjZs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CA6E307FCA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B9049550B;
	Wed,  8 Jul 2026 17:34:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE674C6F08
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532074; cv=none; b=jdmwpUg44Rwj2zIi+ZpPKDghlczGectScWTVMbeNHipPHMtBa5th5nME0nHNUabx62Ca7fys9iqmGHxOMdqNf+w7k6n3GkDhR7L+tgYrLfpMTe2Pvpl0S2th7zRVaz5k3EFN07Swh4n+dLhv8Xg0ePQBTc+SYOi41dDSViRff6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532074; c=relaxed/simple;
	bh=msxs1qArrF5K/V1XnpZrEZ0fRkjOhhPrkAqnxLdjyYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8YImE4+v/4wA/pFhT8hPhDOnNPTJNTj7buZgeXURzaMqcFspWuJx91TV1tR5bXtMH3vosIVkWBSU+LWhreunxpvp94lgG9f4aVU7JgofVlZheMsvRE9Neep9uz9hKqMeqP91Q3SRph4VF3RJoaux20+RncBifhWqrkVQJq+FLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5nTaVNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9FjsjZs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLrMX3200155
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1rGgtM6FUa0v9t2Aypzhl2gBrk+6B3pV8ze
	imKlx9fg=; b=o5nTaVNMyXVvtbjvN8QXkf5x3nHWl3wU7kPWITeRW8MYTP5bHnS
	gxJzP4y44c8ilWFZF1lX5ipOapLujj4zIWtTvCQyMGN1KpKHVHzQXn7vbyTGMBwL
	NpMQ/Vs5CThwP94Z8qMTAXsXWpiaMzBFE5jm5M4BOKEFRb4QaDHRFOLczOHYM1gh
	r2HQT+l+ZL+emtJGWKTlh2VWeukZIk+YqWWc0e75dzCiH7hd6ywFTrMkzU2IkUl4
	Af+6FqHOXMEdbg2tZh9fbKrFt7PSQKo2UJmuzTLPIJTRZht4e7TP0MRMQ9tfvFAe
	lsrMC3Qemo5LsTBnhskUmAXnI7NZygWjyOQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5c2kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482fd61e83so1508399b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532072; x=1784136872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rGgtM6FUa0v9t2Aypzhl2gBrk+6B3pV8zeimKlx9fg=;
        b=e9FjsjZsPJ6bLkIUhkrc71CCNJ5tfbZUpg0gasRZ0PwbAdt8BBnNngS05DMaNEyX9y
         og7vJC6pbzdvC31Ylrvmlm54SF6OrxcquTCTYT9Qkf50uwktBnqvax+UIwpo/XBSaXYc
         WLKHXzRgulfEMqqz8elewMMNJ9czLvWvHMaLOJG5FTXpVceKrkovOiZFncg7Ho98aGMN
         UuKA+gcy7JCfxrqxUYf/07bj0QicTMwrsl/zaauctbG6qPQb+17VUnaJT2fqZBxxlukR
         s8F8ujfeRbxDzewLB2uZKrpylesNZgXzM3omkNUpLZG7S/kcay8gm2MYujJ+vOKcm9Cw
         lm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532072; x=1784136872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rGgtM6FUa0v9t2Aypzhl2gBrk+6B3pV8zeimKlx9fg=;
        b=aGbxPERni9aiA/bolgm7BNwzPcL5MkzojiG6qa0yKLGGeHx6stFcnSEpVRr1zLy14+
         fdFI85cMqdRRr4LPjlwZinNkjJHSmdum/JQz44IjW5IxGEdMF0S2lrm/2dyYTuxhD7Do
         5Q+vd0Ev21DPMb/hW08E70tsppT1KYz3dXX6h7ORlE2TTlpb+k2GeY/Eia/PNfdb9jct
         qT62o/YeV4R6LqhmM41/BeQcCBf+T9Go+OtDQJ6TIYPTKCRYx86lhT6HJS2W6HOGqpRb
         2qzILD7GmRgrtUkJ9mEVjdYQfw/JuXDXOTRSYM3lhXqYuzuzz1nBRmnSodmoCmWFVWau
         L7Tg==
X-Gm-Message-State: AOJu0YznIE9XCvcFaFEOtc7sNZ9g6k+u1AskqNl9TDOOnDpA5h4icoIL
	FsFqHPoQsiF4bD2YDleQG70TKtypOoSfBO7oE3s+4ONB+x/kvOULFQHcCXgFfZ12Cex9nJawbNk
	b9ylXj9MnvsBZ6yxpLJacRKndiKZlFIPBveea8rnPrmyOZpyUzZ5STR8btVX7bZEqVc3Z
X-Gm-Gg: AfdE7cliQzbTZv5PgZOXr34VNjbRzIFPTCPmXcoPc9ugIzorwR5JCPdLDsyKwvG9yZt
	duFDEXJUfSU1iRGj39U+F4QjsX/T69fcYRUl3i08/PJfEdYEELL9b3ZvRyF4BOLfO8venzkOpDw
	pXBGOb8RG45UGlBdq83v7F3vN4512wHdljJdZlMj9zAquCI2LOE2hY8zKR4VI78Ow8WRouF6ewe
	8rZ9B9n9So5J59l3ZjOl8xYZ6BBzNRqSZtgYHdO3MmDOpMB1f81/ZEUr4I8ZJhsUtQrdXj+7xDH
	4vm/9XNAsMqLDhlmyUktiQdxlc2AF5xkwlvIvSgiKnT7v3mbCdznRmwWljZ0pfcbcSt1y8hzBD8
	dvm/8lNRRMiip3IL1NT8mqhu45vS7SpRQ06eUohfvrEDO4/WxQwIVTM93uw==
X-Received: by 2002:a05:6a00:3026:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84842e7e06cmr3612080b3a.0.1783532071784;
        Wed, 08 Jul 2026 10:34:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3026:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84842e7e06cmr3612048b3a.0.1783532071301;
        Wed, 08 Jul 2026 10:34:31 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4edb4sm7399904b3a.33.2026.07.08.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:30 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 0/6] drm/msm: A couple lazy-vm fixes
Date: Wed,  8 Jul 2026 10:33:48 -0700
Message-ID: <20260708173356.578713-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e8a28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=384pi0yy4wJ6F0PkkBwA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX6suf5LbWtm6y
 G9Y+lyiOIg3HAsjklphiED17xmu8EncdXIOIrX+kN43O4bh1RsHi1AOIaGFrs8Z/FpvUQesjp53
 8FWwklhrOES9FzN8ktHRZJs5DGjPuX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX+6A5d2x2uXc2
 aOfQav4L7jICF8yax6KmioqHtW/2JXNOmbCHH/C34LRALiSUssEK/lWsAu6ohKm278/lcjmPurn
 SQL5sPChk9r7fLHIai/j/6fvguDl5oBHnV41RZOpWvY03xoiHAEBA9RX4hjGDN0RbVA1VOnmZnj
 YIi2PN9McFOeQ32e2jOYcJHvr2qrLaWmdzapCf/DbwaMLC/SafDm1B/xaHLMldqUCkkdbvWU3fy
 HNIuND7SJl8ZE4Y0qfTyGJU9+XbwCtEQ8QBAajuGuAm/9QnngRBbqfG38AGkhBy4XtsR2Cjcq7S
 yAHkZe3xrdaTWJXjBqKx6h5vRS3hGSW5kEHR13Li27CHL840fQRLZScteILBPV5ndav4P4Dbfgc
 o2e0fOClrraRAs6H101AOM/iCPTpmemWFeWbWluFpDkdBR8qQ9cMV21w133cRrZqpr52pLDLYkP
 RbMO9h2sQ/mDk018DKQ==
X-Proofpoint-ORIG-GUID: ggWD1sIn64q_swt2fM0oct19ds7oLOd9
X-Proofpoint-GUID: ggWD1sIn64q_swt2fM0oct19ds7oLOd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-117778-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:akhilpo@oss.qualcomm.com,m:airlied@gmail.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:marijn.suijten@somainline.org,m:sean@poorly.run,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF37A729474

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.

Rob Clark (6):
  drm/msm: Fix barriers accessing ctx vm
  drm/msm: Block VM_BIND for shared VMs
  drm/msm: Validate lazy VM is created in GEM_SUBMIT
  drm/msm: Validate lazy VM in GEM_NEW
  drm/msm: Fix per-process-pgtables check
  drm/msm: Remove invalid overflow check

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c           | 13 +++++++------
 drivers/gpu/drm/msm/msm_gem.c           | 11 ++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    | 15 ++++++---------
 drivers/gpu/drm/msm/msm_gem_vma.c       | 11 ++++++-----
 5 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.55.0


