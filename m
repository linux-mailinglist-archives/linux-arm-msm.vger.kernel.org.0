Return-Path: <linux-arm-msm+bounces-93784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FW4GdWnnGklJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:17:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B817C3A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2A1931EA315
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB28C36D51B;
	Mon, 23 Feb 2026 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7wH2lTr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0fZc0yW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2436C0C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873856; cv=none; b=srl5Y6GsBPRXsVKf5B+tmWbePRmvvQohx2D6Wj/I0Brblv0jW9cYTdUr2TR48gPG3yUbM18dCGRIK6KKpDubkVbL1RF4i/T6Ih+cAujytOnTQVpppomH8AcXrsRD+FtrZnvA7zhcWZgqEACLSccZJ2m1HI9siYi9YC3pSOGqJ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873856; c=relaxed/simple;
	bh=7mQ77ZyIRIZpix+MEkpRhzH3l7JakwhyX4cr6888lx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMda2pSxsLdmbxqQoe9hQGBAjhLDLe1tUAYBIugw5mMkWRMmyLiSe9kfJmOeR5opDMziS6LDN4adVEFd5g5MVx0LJ/F/drLWGYtEIkwA97r+tO2YTDEBnOGJJDh2yPhL0SufCfAd7rboWBv8vmtgftk/CgXiFUz/SHBAZyuAr2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7wH2lTr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0fZc0yW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRJ9X1640607
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJ0oJqnbxwoxgHJVLtPPhyhuNFvTLFXLHOGqp8GIsxk=; b=m7wH2lTrbckyyAoH
	Nq0YgUrLHzRpU0f75e++hvwWcg9D/K/6fCSJP00SPtZZ8W5UHstqCNf11HNUsD30
	7nRwYxUv7bSMcvbUjpe0Zaq+1cv650nIJtRQ8duA9LojrHVLgp+IQ9+8PtFKlSnW
	GpQ04ITdzq9W6yvDUUWEFtuc+JuxCz7Gl6zcRERzlYtt899rtAwXc21vyQ+d79E8
	dC6+dCgc+WDc3xPJ5cY8CSfV6sfMO4NTFfEG/y7WjaSoWEuV517kUo0le0Konli0
	a3Ds8fp5jJNkxAd9zD6VG0iFV4s9HKr2bb03+xQAYduExkf4NHC983wP6oIiHbyD
	aCl38Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rhgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:10:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so41152575ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873852; x=1772478652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ0oJqnbxwoxgHJVLtPPhyhuNFvTLFXLHOGqp8GIsxk=;
        b=C0fZc0yWKauHTeuAxdueGUcUCl5l+LTfFx2inv7lreuXYv2IwOq1g5h2q0B10fw3LC
         tzwwuyp9zElQrQtzbTmCwCT2nb6tFInHZyP303NLwwefjymP97ZAi+SF9cmfM0CdAawf
         EJn1i59YUz/7twMFKp/XTc5WK1g+kRHtCAGyndfbTQJ7JOE0/wIpoN3B7fLntKIyjXl+
         iqVOas1xVOtsqJYwONPjKcbxqmwW0jE8WG+yOMNAPT8oceRKZD0WZCWExD/A3CgtjS7j
         OHNjEZo9kjCBchsfuJcZLPDuP2Do1J5PrJwZ1t7SE+Qb5Bk5qUz/879G43CL7mEU6Mok
         hV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873852; x=1772478652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJ0oJqnbxwoxgHJVLtPPhyhuNFvTLFXLHOGqp8GIsxk=;
        b=MrjixywOf2Kep4V/HDHUE4gtxiLFHBnmZGboHt5DRyaNs6i6+7EWAtJADLigPzACrQ
         uQgFKZUnMBUW2l2OtrOnk8l7XypFJiwFHUkjVFMgOJajpLVkFDadvHlYKzXQGbIc1Bk0
         u5O88naRyll9w+tOQI8dHpc+ovclmKwec8/YzUWOZVwm8OR9GvmU//s83qR7tE9cGvFB
         mgfddRkBPrGdhRPmLOGQhKKgv287KZxHLOTJIKIOgkIOOWwS0wGOjEuZa2JzDuPXtBgt
         gixUL11IYRUOp9/iklBNSBiSbyfdzefSW+POq/tiBh/jDMuC5Ci/qA1FwNNcoEArFI0h
         zk+A==
X-Forwarded-Encrypted: i=1; AJvYcCW88lxc4FhBYcbS7pPDA59Y/DiRordRJYTEExqd6J43lZTqiAhjJGu4TmthcHF34VpU935dCRSIrs8wT/Cp@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPldLoDOqBckipeIIvfMRhvG4LA4C3sZSDKq5AcpgRbUiubOT
	Wk1cGTlPXU0sv4D/COXCMfdam4nXv3z86GtPURqSnpm3AQjZMqDawCk87ajmobTg8SAafXrv8vg
	FGxlNSnuSQnnRsFPicOj1gNfqWqTVCToBaBuVYl6w+NodeC+G17Z5p7Oavp9dKv+7N/5J
X-Gm-Gg: ATEYQzzLye36b5APh9F5lDMP1GqEdp4QxAAynK/nAIvDZ6Qm0BWAJ8toeHXBmLnjiqe
	bOz43gRPckpsu2H+3C2Rs4OWdZDNmtTGzUmPJ5Ts3uAHVrXnERQPVhhWWlDrfOzA740cTqKUh8o
	7QtMmNeEwU0E7LnKWrHDTiAE389Z4W6fqyjdA9YHfkGnGXjrH0lv9Y+/YhL/T/amkBbzZeKHyEO
	ogQ2ocE3jjlYooLahlFOpMGGpNQg3nG7SlE9TYIswb6qC4VB/ZJoz2PSB8IV+FDETIW3DMaVvad
	xDQ4eJaMUG4wD8BQ3RM/C2OmDFiC/M37As8+wkj9CYo2UShw8Tq71Vg4PK+YJGsS90oS3umXgRU
	u3DwRR5i/kxR8YsPXyUwWqNJqZpcyU375uH1+VQUYA9a8S2OQcnlmGg==
X-Received: by 2002:a17:902:e851:b0:2aa:e238:e20c with SMTP id d9443c01a7336-2ad742acbf0mr84551665ad.19.1771873852024;
        Mon, 23 Feb 2026 11:10:52 -0800 (PST)
X-Received: by 2002:a17:902:e851:b0:2aa:e238:e20c with SMTP id d9443c01a7336-2ad742acbf0mr84551275ad.19.1771873851123;
        Mon, 23 Feb 2026 11:10:51 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:10:50 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:06 +0530
Subject: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=21201;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=7mQ77ZyIRIZpix+MEkpRhzH3l7JakwhyX4cr6888lx8=;
 b=kvlxSsSTu5ZFmzliiB7GHjfovysmfYNJDznymXxqrq4DKVH4R7zB3Cd4/b/ittKmcGlRKuQuV
 gyFRiLS4ygnDvG4K6x8v13GqxZIcQ/jiEPHYypkTCOfQsqiHh7x6/CX
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: uCcnyrJaCR8_MRpCWziDQd8N6lFTTJXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX57TyZWN8oEGE
 1hZqK38oCGT/6qnSiHMyK8C9J938k7w/l7lOfziAoxaKmOa75qt+pt9ZYrg61YRjZOxoSi4fPFH
 gwMFkFdvYYP0nSf9rV6JAaJVg4Ae6YSutX8qg0wKQA3qdEO7Pc8S1iVtSsOzM9d0e5v44lGYceG
 YCX6/fttGyCGxfDEtk/RqFKYK7u1UL6cT04jtPqyCYz/3ORYzuHDKRCo+T8te9Viiak7i0wMp4T
 q//dhYqHZsArFnNFTSUPmp5oApdS1TCsYBxW3v/IJEnnYSLSSvOt6/UBR1UmfpLWQGgFk07qiO/
 ieP4ofbC6kZc3ASUZTEgvbLsck4gOKpmcSavFXIfAaGh8V046Wjvw6E6UoebHAjm6SIIYLPEZOF
 imXvfeHOFEZ/qNtfTFgQzD3K13k2OSckbvLOjF0uxgD0OnPaIo81XiPkDdOE10E+Bl6u2mh2nwM
 LNtO0kfaKjHl3TqcmeQ==
X-Proofpoint-GUID: uCcnyrJaCR8_MRpCWziDQd8N6lFTTJXa
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699ca63d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8l03lAX63Vq187oFkXoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B89B817C3A3
X-Rspamd-Action: no action

Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
it with the existing per-process memory manager and IOMMU device model.

The implementation extends qda_gem_obj to represent imported dma-bufs,
including dma_buf references, attachment state, scatter-gather tables
and an imported DMA address used for DSP-facing book-keeping. The
qda_gem_prime_import() path handles reimports of buffers originally
exported by QDA as well as imports of external dma-bufs, attaching them
to the assigned IOMMU device and mapping them through the memory manager
for DSP access. The GEM free path is updated to unmap and detach
imported buffers while preserving the existing behaviour for locally
allocated memory.

The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
which records the calling drm_file in a driver-private import context
before invoking the core DRM helpers. The GEM import callback retrieves
this context to ensure that an IOMMU device is assigned to the process
and that imported buffers follow the same per-process IOMMU selection
rules as natively allocated GEM objects.

This patch prepares the driver for interoperable buffer sharing between
QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
lifetime handling consistent with the existing GEM allocation flow.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile             |   1 +
 drivers/accel/qda/qda_drv.c            |   8 ++
 drivers/accel/qda/qda_drv.h            |   4 +
 drivers/accel/qda/qda_gem.c            |  60 +++++++---
 drivers/accel/qda/qda_gem.h            |  10 ++
 drivers/accel/qda/qda_ioctl.c          |   7 ++
 drivers/accel/qda/qda_ioctl.h          |  15 +++
 drivers/accel/qda/qda_memory_manager.c |  42 ++++++-
 drivers/accel/qda/qda_memory_manager.h |  14 +++
 drivers/accel/qda/qda_prime.c          | 194 +++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_prime.h          |  43 ++++++++
 11 files changed, 377 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 88c324fa382c..8286f5279748 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -13,5 +13,6 @@ qda-y := \
 	qda_ioctl.o \
 	qda_gem.o \
 	qda_memory_dma.o \
+	qda_prime.o \
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 0dd0e2bb2c0f..4adee00b1f2c 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -10,9 +10,11 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/qda_accel.h>
+#include <drm/drm_prime.h>
 
 #include "qda_drv.h"
 #include "qda_gem.h"
+#include "qda_prime.h"
 #include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
@@ -166,6 +168,8 @@ static struct drm_driver qda_drm_driver = {
 	.postclose		= qda_postclose,
 	.ioctls = qda_ioctls,
 	.num_ioctls = ARRAY_SIZE(qda_ioctls),
+	.gem_prime_import = qda_gem_prime_import,
+	.prime_fd_to_handle = qda_ioctl_prime_fd_to_handle,
 	.name = DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
@@ -174,6 +178,7 @@ static void cleanup_drm_private(struct qda_dev *qdev)
 {
 	if (qdev->drm_priv) {
 		qda_dbg(qdev, "Cleaning up DRM private data\n");
+		mutex_destroy(&qdev->drm_priv->import_lock);
 		kfree(qdev->drm_priv);
 	}
 }
@@ -240,6 +245,9 @@ static int init_drm_private(struct qda_dev *qdev)
 	if (!qdev->drm_priv)
 		return -ENOMEM;
 
+	mutex_init(&qdev->drm_priv->import_lock);
+	qdev->drm_priv->current_import_file_priv = NULL;
+
 	qda_dbg(qdev, "DRM private data initialized successfully\n");
 	return 0;
 }
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 8a2cd474958b..bb0dd7e284c6 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -64,6 +64,10 @@ struct qda_drm_priv {
 	struct qda_memory_manager *iommu_mgr;
 	/* Back-pointer to qda_dev */
 	struct qda_dev *qdev;
+	/* Lock protecting import context */
+	struct mutex import_lock;
+	/* Current file_priv during prime import */
+	struct drm_file *current_import_file_priv;
 };
 
 /* struct qda_dev - Main device structure for QDA driver */
diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
index bbd54e2502d3..37279e8b46fe 100644
--- a/drivers/accel/qda/qda_gem.c
+++ b/drivers/accel/qda/qda_gem.c
@@ -8,6 +8,7 @@
 #include "qda_gem.h"
 #include "qda_memory_manager.h"
 #include "qda_memory_dma.h"
+#include "qda_prime.h"
 
 static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
 {
@@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
 		qda_err(NULL, "Invalid GEM object size\n");
 		return -EINVAL;
 	}
-	if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
-		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
-		return -EINVAL;
-	}
-	if (!qda_gem_obj->iommu_dev->dev) {
-		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
-		return -EINVAL;
-	}
-	if (!qda_gem_obj->virt) {
-		qda_err(NULL, "Allocated buffer missing virtual address\n");
-		return -EINVAL;
-	}
-	if (qda_gem_obj->dma_addr == 0) {
-		qda_err(NULL, "Allocated buffer missing DMA address\n");
-		return -EINVAL;
+	if (qda_gem_obj->is_imported) {
+		if (!qda_gem_obj->sgt) {
+			qda_err(NULL, "Imported buffer missing sgt\n");
+			return -EINVAL;
+		}
+		if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
+			qda_err(NULL, "Imported buffer missing IOMMU device\n");
+			return -EINVAL;
+		}
+	} else {
+		if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
+			qda_err(NULL, "Allocated buffer missing IOMMU device\n");
+			return -EINVAL;
+		}
+		if (!qda_gem_obj->virt) {
+			qda_err(NULL, "Allocated buffer missing virtual address\n");
+			return -EINVAL;
+		}
+		if (qda_gem_obj->dma_addr == 0) {
+			qda_err(NULL, "Allocated buffer missing DMA address\n");
+			return -EINVAL;
+		}
 	}
-
 	return 0;
 }
 
@@ -60,9 +67,21 @@ void qda_gem_free_object(struct drm_gem_object *gem_obj)
 	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
 	struct qda_drm_priv *drm_priv = get_drm_priv_from_device(gem_obj->dev);
 
-	if (qda_gem_obj->virt) {
-		if (drm_priv && drm_priv->iommu_mgr)
+	if (qda_gem_obj->is_imported) {
+		if (qda_gem_obj->attachment && qda_gem_obj->sgt)
+			dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
+							  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
+		if (qda_gem_obj->attachment)
+			dma_buf_detach(qda_gem_obj->dma_buf, qda_gem_obj->attachment);
+		if (qda_gem_obj->dma_buf)
+			dma_buf_put(qda_gem_obj->dma_buf);
+		if (qda_gem_obj->iommu_dev && drm_priv && drm_priv->iommu_mgr)
 			qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
+	} else {
+		if (qda_gem_obj->virt) {
+			if (drm_priv && drm_priv->iommu_mgr)
+				qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
+		}
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -174,6 +193,11 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
 	qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
 	if (IS_ERR(qda_gem_obj))
 		return (struct drm_gem_object *)qda_gem_obj;
+	qda_gem_obj->is_imported = false;
+	qda_gem_obj->dma_buf = NULL;
+	qda_gem_obj->attachment = NULL;
+	qda_gem_obj->sgt = NULL;
+	qda_gem_obj->imported_dma_addr = 0;
 
 	ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
 	if (ret) {
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
index cbd5d0a58fa4..3566c5b2ad88 100644
--- a/drivers/accel/qda/qda_gem.h
+++ b/drivers/accel/qda/qda_gem.h
@@ -31,6 +31,16 @@ struct qda_gem_obj {
 	size_t size;
 	/* IOMMU device that performed the allocation */
 	struct qda_iommu_device *iommu_dev;
+	/* True if buffer is imported, false if allocated */
+	bool is_imported;
+	/* Reference to imported dma_buf */
+	struct dma_buf *dma_buf;
+	/* DMA buf attachment */
+	struct dma_buf_attachment *attachment;
+	/* Scatter-gather table */
+	struct sg_table *sgt;
+	/* DMA address of imported buffer */
+	dma_addr_t imported_dma_addr;
 };
 
 /*
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index ef3c9c691cb7..d91983048d6c 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -5,6 +5,7 @@
 #include <drm/qda_accel.h>
 #include "qda_drv.h"
 #include "qda_ioctl.h"
+#include "qda_prime.h"
 
 static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
 					struct qda_dev **qdev, struct qda_user **qda_user)
@@ -78,3 +79,9 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
 	drm_gem_object_put(gem_obj);
 	return ret;
 }
+
+int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv, int prime_fd,
+				 u32 *handle)
+{
+	return qda_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 6bf3bcd28c0e..d454256f5fc5 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -23,4 +23,19 @@
  */
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_prime_fd_to_handle - IOCTL handler for PRIME FD to handle conversion
+ * @dev: DRM device structure
+ * @file_priv: DRM file private data
+ * @prime_fd: File descriptor of the PRIME buffer
+ * @handle: Output parameter for the GEM handle
+ *
+ * This IOCTL handler converts a PRIME file descriptor to a GEM handle.
+ * It serves as both the DRM driver callback and can be used directly.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+				 int prime_fd, u32 *handle);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
index e225667557ee..3fd20f17c57b 100644
--- a/drivers/accel/qda/qda_memory_manager.c
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -154,8 +154,8 @@ static struct qda_iommu_device *get_process_iommu_device(struct qda_memory_manag
 	return qda_priv->assigned_iommu_dev;
 }
 
-static int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
-					    struct drm_file *file_priv)
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct drm_file *file_priv)
 {
 	struct qda_file_priv *qda_priv;
 	struct qda_iommu_device *selected_dev = NULL;
@@ -223,6 +223,35 @@ static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_man
 	return NULL;
 }
 
+static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
+					   struct qda_gem_obj *gem_obj,
+					   struct qda_iommu_device *iommu_dev)
+{
+	struct scatterlist *sg;
+	dma_addr_t dma_addr;
+	int ret = 0;
+
+	if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
+		qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
+		return -EINVAL;
+	}
+
+	gem_obj->iommu_dev = iommu_dev;
+
+	sg = gem_obj->sgt->sgl;
+	if (sg) {
+		dma_addr = sg_dma_address(sg);
+		dma_addr += ((u64)iommu_dev->sid << 32);
+
+		gem_obj->imported_dma_addr = dma_addr;
+	} else {
+		qda_err(NULL, "Invalid scatter-gather list for imported buffer\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj,
 			     struct drm_file *file_priv)
 {
@@ -248,7 +277,10 @@ int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_
 		return -ENOMEM;
 	}
 
-	ret = qda_dma_alloc(selected_dev, gem_obj, size);
+	if (gem_obj->is_imported)
+		ret = qda_memory_manager_map_imported(mem_mgr, gem_obj, selected_dev);
+	else
+		ret = qda_dma_alloc(selected_dev, gem_obj, size);
 
 	if (ret) {
 		qda_err(NULL, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
@@ -268,6 +300,10 @@ void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_
 		return;
 	}
 
+	if (gem_obj->is_imported) {
+		qda_dbg(NULL, "Freed imported buffer tracking (no DMA free needed)\n");
+		return;
+	}
 	qda_dma_free(gem_obj);
 }
 
diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
index bac44284ef98..f6c7963cec42 100644
--- a/drivers/accel/qda/qda_memory_manager.h
+++ b/drivers/accel/qda/qda_memory_manager.h
@@ -106,6 +106,20 @@ int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
 void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
 					  struct qda_iommu_device *iommu_dev);
 
+/**
+ * qda_memory_manager_assign_device() - Assign an IOMMU device to a process
+ * @mem_mgr: Pointer to memory manager
+ * @file_priv: DRM file private data for process association
+ *
+ * Assigns an IOMMU device to the calling process. If the process already has
+ * a device assigned, returns success. If another file descriptor from the same
+ * PID has a device, reuses it. Otherwise, finds an available device and assigns it.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct drm_file *file_priv);
+
 /**
  * qda_memory_manager_alloc() - Allocate memory for a GEM object
  * @mem_mgr: Pointer to memory manager
diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
new file mode 100644
index 000000000000..3d23842e48bb
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_prime.h"
+#include "qda_memory_manager.h"
+
+static struct drm_gem_object *check_own_buffer(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	if (dma_buf->priv) {
+		struct drm_gem_object *existing_gem = dma_buf->priv;
+
+		if (existing_gem->dev == dev) {
+			struct qda_gem_obj *existing_qda_gem = to_qda_gem_obj(existing_gem);
+
+			if (!existing_qda_gem->is_imported) {
+				drm_gem_object_get(existing_gem);
+				return existing_gem;
+			}
+		}
+	}
+	return NULL;
+}
+
+static struct qda_iommu_device *get_iommu_device_for_import(struct qda_drm_priv *drm_priv,
+							    struct drm_file **file_priv_out,
+							    struct qda_dev *qdev)
+{
+	struct drm_file *file_priv;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_iommu_device *iommu_dev = NULL;
+	int ret;
+
+	file_priv = drm_priv->current_import_file_priv;
+	*file_priv_out = file_priv;
+
+	if (!file_priv || !file_priv->driver_priv)
+		return NULL;
+
+	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	iommu_dev = qda_file_priv->assigned_iommu_dev;
+
+	if (!iommu_dev) {
+		ret = qda_memory_manager_assign_device(drm_priv->iommu_mgr, file_priv);
+		if (ret) {
+			qda_err(qdev, "Failed to assign IOMMU device: %d\n", ret);
+			return NULL;
+		}
+
+		iommu_dev = qda_file_priv->assigned_iommu_dev;
+	}
+
+	return iommu_dev;
+}
+
+static int setup_dma_buf_mapping(struct qda_gem_obj *qda_gem_obj, struct dma_buf *dma_buf,
+				 struct device *attach_dev, struct qda_dev *qdev)
+{
+	struct dma_buf_attachment *attachment;
+	struct sg_table *sgt;
+	int ret;
+
+	attachment = dma_buf_attach(dma_buf, attach_dev);
+	if (IS_ERR(attachment)) {
+		ret = PTR_ERR(attachment);
+		qda_err(qdev, "Failed to attach dma_buf: %d\n", ret);
+		return ret;
+	}
+	qda_gem_obj->attachment = attachment;
+
+	sgt = dma_buf_map_attachment_unlocked(attachment, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		qda_err(qdev, "Failed to map dma_buf attachment: %d\n", ret);
+		dma_buf_detach(dma_buf, attachment);
+		return ret;
+	}
+	qda_gem_obj->sgt = sgt;
+
+	return 0;
+}
+
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	struct qda_drm_priv *drm_priv;
+	struct qda_gem_obj *qda_gem_obj;
+	struct drm_file *file_priv;
+	struct qda_iommu_device *iommu_dev;
+	struct qda_dev *qdev;
+	struct drm_gem_object *existing_gem;
+	size_t aligned_size;
+	int ret;
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv || !drm_priv->iommu_mgr) {
+		qda_err(NULL, "Invalid drm_priv or iommu_mgr\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	qdev = drm_priv->qdev;
+
+	existing_gem = check_own_buffer(dev, dma_buf);
+	if (existing_gem)
+		return existing_gem;
+
+	iommu_dev = get_iommu_device_for_import(drm_priv, &file_priv, qdev);
+	if (!iommu_dev || !iommu_dev->dev) {
+		qda_err(qdev, "No IOMMU device assigned for prime import\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	qda_dbg(qdev, "Using IOMMU device %u for prime import\n", iommu_dev->id);
+
+	aligned_size = PAGE_ALIGN(dma_buf->size);
+	qda_gem_obj = qda_gem_alloc_object(dev, aligned_size);
+	if (IS_ERR(qda_gem_obj))
+		return (struct drm_gem_object *)qda_gem_obj;
+
+	qda_gem_obj->is_imported = true;
+	qda_gem_obj->dma_buf = dma_buf;
+	qda_gem_obj->virt = NULL;
+	qda_gem_obj->dma_addr = 0;
+	qda_gem_obj->imported_dma_addr = 0;
+	qda_gem_obj->iommu_dev = iommu_dev;
+
+	get_dma_buf(dma_buf);
+
+	ret = setup_dma_buf_mapping(qda_gem_obj, dma_buf, iommu_dev->dev, qdev);
+	if (ret)
+		goto err_put_dma_buf;
+
+	ret = qda_memory_manager_alloc(drm_priv->iommu_mgr, qda_gem_obj, file_priv);
+	if (ret) {
+		qda_err(qdev, "Failed to allocate IOMMU mapping: %d\n", ret);
+		goto err_unmap;
+	}
+
+	qda_dbg(qdev, "Prime import completed successfully size=%zu\n", aligned_size);
+	return &qda_gem_obj->base;
+
+err_unmap:
+	dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
+					  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach(dma_buf, qda_gem_obj->attachment);
+err_put_dma_buf:
+	dma_buf_put(dma_buf);
+	qda_gem_cleanup_object(qda_gem_obj);
+	return ERR_PTR(ret);
+}
+
+int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle)
+{
+	struct qda_drm_priv *drm_priv;
+	struct qda_dev *qdev;
+	int ret;
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv) {
+		qda_dbg(NULL, "Failed to get drm_priv from device\n");
+		return -EINVAL;
+	}
+
+	qdev = drm_priv->qdev;
+
+	if (file_priv && file_priv->driver_priv) {
+		struct qda_file_priv *qda_file_priv;
+
+		qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	} else {
+		qda_dbg(qdev, "Called with NULL file_priv or driver_priv\n");
+	}
+
+	mutex_lock(&drm_priv->import_lock);
+	drm_priv->current_import_file_priv = file_priv;
+
+	ret = drm_gem_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
+
+	drm_priv->current_import_file_priv = NULL;
+	mutex_unlock(&drm_priv->import_lock);
+
+	if (!ret)
+		qda_dbg(qdev, "Completed with ret=%d, handle=%u\n", ret, *handle);
+	else
+		qda_dbg(qdev, "Completed with ret=%d\n", ret);
+
+	return ret;
+}
+
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
new file mode 100644
index 000000000000..939902454dcd
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QDA_PRIME_H
+#define _QDA_PRIME_H
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-buf.h>
+
+/**
+ * qda_gem_prime_import - Import a DMA-BUF as a GEM object
+ * @dev: DRM device structure
+ * @dma_buf: DMA-BUF to import
+ *
+ * This function imports an external DMA-BUF into the QDA driver as a GEM
+ * object. It handles both re-imports of buffers originally from this driver
+ * and imports of external buffers from other drivers.
+ *
+ * Return: Pointer to the imported GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
+
+/**
+ * qda_prime_fd_to_handle - Core implementation for PRIME FD to GEM handle conversion
+ * @dev: DRM device structure
+ * @file_priv: DRM file private data
+ * @prime_fd: File descriptor of the PRIME buffer
+ * @handle: Output parameter for the GEM handle
+ *
+ * This core function sets up the necessary context before calling the
+ * DRM framework's prime FD to handle conversion. It ensures proper IOMMU
+ * device assignment and tracking for the import operation.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle);
+
+#endif /* _QDA_PRIME_H */

-- 
2.34.1


