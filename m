Return-Path: <linux-arm-msm+bounces-92100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANQACIZphmnwMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 23:21:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020A103B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 23:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58CAC3034DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 22:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33272F6904;
	Fri,  6 Feb 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sclpwADi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904FC2EAB6F;
	Fri,  6 Feb 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416514; cv=none; b=Tn0MwdUKzcIyD9+VOmE6Di8wi4TraV2WgGDXBavisjn16DretD/6KS+fXuOjA8QrlS4Su6KWMP2ZG5I7p9wI+E8ex3Q0Cjrngg1eLPaQwHFqFb7JEQmubw8IMxqRfNfDcOaQU4zbUK/KmxsRQ7Ybw5d1Y4uTfsY0Sqv/oMEALfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416514; c=relaxed/simple;
	bh=oQRJiNUzubJ19Wx1XgCCgnTsTPuzcvWNLC/cnrc8QvA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hnIVx0IJwh5b/4SzDAju1qF1jR7D4p9v5Dq5CoNeivpkempOFExqFDXvvYBtdYktaFcVuscPJDRWv24cba2Ik7+U2m0DtoulQ/0X1cwwTkYo1n4kVytjjyq3iOtzytZGjX31gTiv0kTKC3AOtKA99WCPgkcyQG34GCdfF9JjocI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sclpwADi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28699C116C6;
	Fri,  6 Feb 2026 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770416514;
	bh=oQRJiNUzubJ19Wx1XgCCgnTsTPuzcvWNLC/cnrc8QvA=;
	h=From:To:Cc:Subject:Date:From;
	b=sclpwADixRMuZ09rsS1t0+O7jiwtqiALgjAvTpNzHJe46dn1GLZrEVe3OQvWi8zaN
	 eewMrCWCfW1ix2SlZaTLQ+8a41A5GFAREv+8nLah3M5n4njJDFD/m2Pvx2qwhs0atX
	 pncuF/CBxCE3EkFBzSqESpEcfpBXD0eBYlczOdytUiYHpniryUqydOaCir4QefkFwl
	 C2Dm9kVkfUNqvPhOe5NiPR5Q3vJrlTEV+nyb5vKdfK0l6CF/XCivVgsvLA0lwpe7z3
	 mXkOEWFoGnMprJGcq3gnn3IzFN7zJecQMVYdQG78RB1rt4djxPRxhG2RQ1QNFsue9R
	 eu6i4u3Y4IQbA==
From: Kees Cook <kees@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Kees Cook <kees@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type
Date: Fri,  6 Feb 2026 14:21:52 -0800
Message-Id: <20260206222151.work.016-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=kees@kernel.org; h=from:subject:message-id; bh=oQRJiNUzubJ19Wx1XgCCgnTsTPuzcvWNLC/cnrc8QvA=; b=owGbwMvMwCVmps19z/KJym7G02pJDJltmfU7n93tvD9HSCh32WPFpydTev27djntL71dv6nLQ klTZkJRRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwER2/2Bk2G3cZGIa2u5sOuf5 Dob2quKXmfEX/ITi5S9Mm8FovvlIGcP/muT/Cwseapy52xnKmXqkIFVl1sqSU/vVRAUVd/HFNLs yAQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 4020A103B9C
X-Rspamd-Action: no action

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "void **" but the returned type will be "void ***".
These are the same allocation size (pointer size), but the types do not
match. Adjust the allocation type to match the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <linux-arm-msm@vger.kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <freedreno@lists.freedesktop.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d5dede4ff761..271baf4dc4e8 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -332,7 +332,7 @@ msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_preall
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	int ret;
 
-	p->pages = kvmalloc_array(p->count, sizeof(p->pages), GFP_KERNEL);
+	p->pages = kvmalloc_array(p->count, sizeof(*p->pages), GFP_KERNEL);
 	if (!p->pages)
 		return -ENOMEM;
 
-- 
2.34.1


