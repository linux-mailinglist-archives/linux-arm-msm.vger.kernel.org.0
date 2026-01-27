Return-Path: <linux-arm-msm+bounces-90716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJghOTuYeGkWrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:49:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C09324C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51BF330C15E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DCC3446B5;
	Tue, 27 Jan 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NJW/8eJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5F344DB4;
	Tue, 27 Jan 2026 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510693; cv=none; b=vEHJT0zBSCkIKXym9DfkIGoR3HQICoHKuzauD/LHbd2X86d9ufX1kgkx5PlnWkT+Z5qZ+ixCHq1OLuGJdIKEFvU04y4dwFu2f6/dXhNoEpIWiBdDLfQpZGytwc6lVz0quS4JZDnmN8jQVYCFibF1pixecM558Erej2SCqF7dHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510693; c=relaxed/simple;
	bh=qYSt9bUzQj5PyLabpQbUCQOve2lblO05FC7MGh9qImw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwb/FNkYSZ6Dd9o3Mzd3CvKOCLxTaSfjureCv8+0dvTKujxNDKHvFCC/9KqN/T5yBE9ayHvBvCP4qQ5GaL++gu++phe2Qxrq5rXR2cfRfry2YOxskrAI2E6I8KYBTQLjThlkPYcfmCuTW/4rGIngYw+etCqSM8NyUkVmqQDjl9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NJW/8eJ/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510690;
	bh=qYSt9bUzQj5PyLabpQbUCQOve2lblO05FC7MGh9qImw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NJW/8eJ/0fjsVjkD9hNxyNMHFzxPA7QiELRnVSJ/tBEgwal3OLvg5UWufex+uMvmy
	 +A+jaYPaDN4FDmi9ILRED9athTHjU4tOhmVaQgeJOtqLYmERrmyK7RGVQw3zsHGzUr
	 wmo3j+GKT3H2AUHuQHHRGs3vcq2ipDGPhyU8/2SrB48dGXXbZBj7GX806vR8GNDE3J
	 Cy0s3W4BQN9k8y1e+XBul4S8QX+9gLLESWvuTh/VMA1vMwlQ2e59IRibNpe5zw46/e
	 ou/ERa3qbe2Loa9C2GUFQDmS1OdQnnVWyDY29Nt86Gd73Izcplr0mM3HpKPoD2trJX
	 WyZwxbkw0mung==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A56917E0DB7;
	Tue, 27 Jan 2026 11:44:46 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] drm/ci: disable rebase when pulling *-external-fixes
Date: Tue, 27 Jan 2026 16:14:02 +0530
Message-ID: <20260127104406.200505-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127104406.200505-1-vignesh.raman@collabora.com>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90716-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,user.name:url]
X-Rspamd-Queue-Id: 692C09324C
X-Rspamd-Action: no action

CI jobs were rebasing the branch-under-test onto *-external-fixes,
causing conflicts.

Remove the global pull.rebase setting and disable rebase when pulling
*-external-fixes so they are merged instead.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 5485ea756382..d00d549cbd9c 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -3,9 +3,6 @@
 
 set -ex
 
-# Clean up stale rebases that GitLab might not have removed when reusing a checkout dir
-rm -rf .git/rebase-apply
-
 . .gitlab-ci/container/container_pre_build.sh
 
 # libssl-dev was uninstalled because it was considered an ephemeral package
@@ -62,25 +59,24 @@ export PATH=$NEWPATH:$PATH
 
 git config --global user.email "fdo@example.com"
 git config --global user.name "freedesktop.org CI"
-git config --global pull.rebase true
 
 # cleanup git state on the worker
-rm -rf .git/rebase-merge
+rm -rf .git/rebase-merge .git/rebase-apply
 
 # Try to merge fixes from target repo
 if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
-    git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
+    git pull --no-rebase ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
 fi
 
 # Try to merge fixes from local repo if this isn't a merge request
 # otherwise try merging the fixes from the merge target
 if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
-        git pull origin ${TARGET_BRANCH}-external-fixes
+        git pull --no-rebase origin ${TARGET_BRANCH}-external-fixes
     fi
 else
     if [ "$(git ls-remote --exit-code --heads ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes)" ]; then
-        git pull ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
+        git pull --no-rebase ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
     fi
 fi
 
-- 
2.47.3


