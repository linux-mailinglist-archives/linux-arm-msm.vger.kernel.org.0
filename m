Return-Path: <linux-arm-msm+bounces-108298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BgjVCvePC2rjJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:17:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1A5745D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 322903011874
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636B2395DBE;
	Mon, 18 May 2026 22:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRMe8GJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D12F7EF5;
	Mon, 18 May 2026 22:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142644; cv=none; b=ZkjWJ2HJtpH9AY3XfnkDUP1dd+Wr3JAOJTR/fYGTqJTCxh4FIyeonnjq5Ql0UOqayZrYPBwqJWGRzZRV9uEz6k3QopH8ogPB7MEeyrxDrtgmDJ5WUSAYV9V+8NQQVR2L45FTsLK+ilHEPAfeaPoqPUsUK6vXDVWUvwMKltiCo4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142644; c=relaxed/simple;
	bh=2byBZ7K9TFGi279fR4cU+LvkzjbAdmFJbPPXhJHi/og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wp/94AfYpcRfq1rWMJqSef8P0KDfRbiBBEQdxT3Wsu+gvMlahRC51lQcDNMLGfztSletklec1DPkn9YLhpPtgyygjRmN7CFy+y0luwL+pFGxy9RdiSHNCBQJRiusZwWUgb0ngIGE7fPbWqDhIOEvA0Rn4hJv3lpqasi1DLcQlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRMe8GJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32911C2BCB7;
	Mon, 18 May 2026 22:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779142643;
	bh=2byBZ7K9TFGi279fR4cU+LvkzjbAdmFJbPPXhJHi/og=;
	h=From:Date:Subject:To:Cc:From;
	b=DRMe8GJ9sRVOyuVrnmUVJ7QxRmRD1w9H4qhOiYdA4yCgrvGUT2+wnMMgrG+1jJRpz
	 QVZbXcKKqelR3ILk8NZuvOkQQaH5ppyjXs9LUwYrPTzazw/AAxRRv65Qb00mn1uh13
	 L8uZAeY18nqUnhO+UR/b179QmBGPXRFYkS9fR3cZNuWyFrjGq3WkFQs9G9o79fpbYm
	 POWoXgsAfIBZaoQC+5ZoyjGEEUkgA3esSdC95Mcahtb0V2DA/5kbREtKBHopnWw++B
	 6OTsH2g6WBIzxQUDiWQVxmit1WEOaABhp0MFwmD6RYiGUP2lJBhk78cP5cyV7UDeAh
	 6TK/m0MxpmLdQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 May 2026 15:17:14 -0700
Subject: [PATCH] drm/msm: Restore second parameter name in purge() and
 evict()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-drm-msm-fix-c23-extensions-v1-1-0833559418c7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXahSYwUryI+mHRat5Ao2VYKp
 Xc31ccfZr6NFEWgdG02KviIyivXMKeG4vORR7D0tcm29tJ603FfEidNPMjK0TrGOiMfL2UTog/
 mbOGdowq8C+rqh9/u/9YlTIjzIdK+fwE754OxfgAAAA==
X-Change-ID: 20260518-drm-msm-fix-c23-extensions-1bc5b142e533
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Daniel J Blueman <daniel@quora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746; i=nathan@kernel.org;
 h=from:subject:message-id; bh=2byBZ7K9TFGi279fR4cU+LvkzjbAdmFJbPPXhJHi/og=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnc/R9UrV9GMav3RZuWpCmsMiiZVRIY+H/fZ9XTS/9MT
 vhxZd3WjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRCZcY/ml9OSycliWrHVmz
 Zvbxu3eSTNWVD7Hu0tp0yMmnJfzbjdWMDLunm57Se1ptwLOwe8rj8u+7bCeb63boFNiHRokl1bv
 E8AEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108298-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 77D1A5745D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After commit 3392291fc509 ("drm/msm: Fix shrinker deadlock"), all
supported versions of clang warn (or error with CONFIG_WERROR=y):

  drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
    105 | purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
        |                                                          ^
  drivers/gpu/drm/msm/msm_gem_shrinker.c:117:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
    117 | evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
        |                                                          ^
  2 errors generated.

With older but supported versions of GCC, this is an unconditional hard error:

  drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'purge':
  drivers/gpu/drm/msm/msm_gem_shrinker.c:105:35: error: parameter name omitted
   purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
                                     ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'evict':
  drivers/gpu/drm/msm/msm_gem_shrinker.c:117:35: error: parameter name omitted
   evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
                                     ^~~~~~~~~~~~~~~~~~~~~~~

Restore the parameter name to clear up the warnings, renaming it
"unused" to make it clear it is only needed to satisfy the prototype of
drm_gem_lru_scan().

Cc: stable@vger.kernel.org
Fixes: 3392291fc509 ("drm/msm: Fix shrinker deadlock")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6e39e4e578bb..8f118b5185a1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -102,7 +102,7 @@ with_vm_locks(void (*fn)(struct drm_gem_object *obj),
 }
 
 static bool
-purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
+purge(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
 {
 	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
@@ -114,7 +114,7 @@ purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
 }
 
 static bool
-evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
+evict(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
 {
 	if (is_unevictable(to_msm_bo(obj)))
 		return false;

---
base-commit: db339b6bc9f234b4883eb02946ea01d8d9faa11c
change-id: 20260518-drm-msm-fix-c23-extensions-1bc5b142e533

Best regards,
--  
Cheers,
Nathan


