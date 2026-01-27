Return-Path: <linux-arm-msm+bounces-90713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA9EOg2YeGkWrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:48:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA293200
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A28FB308E33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55113343D86;
	Tue, 27 Jan 2026 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="okzC/emD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E534575D;
	Tue, 27 Jan 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510680; cv=none; b=IQJjnORivFXVHY2P0sZdPHeX55cmIAu5BYq1awRuMGIJU6gv4TDMIS+m4kgkNlq5bvpEwuG6NN91j4H2Pc/digIYEEldNZaQomtzZ475nzFlZp1WEWdxRtkYHFAGRwJT7H82jLo44haasJ9QO0n3OIyJb11A9szQ4RuCcLTn93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510680; c=relaxed/simple;
	bh=K2y+JopQp3ML1S2HyFFzzOui07CPYp0h2VnhObjlXHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNPodiiA6BCKJ9BJOnvE4YAK3m3JiMIHzfT0H+Cnf3lQx1ORqYG1s44efibUrd1A68E3WFP0Vlhzq1IiGiWFqwIs/afUDb1X8ckEtH5/6kGNVgZOPegDz35ZoiaiTI+iM3CAEptI2rriC0IRpmBHj8Dde7wiscpEPykWRNfCVHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=okzC/emD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510675;
	bh=K2y+JopQp3ML1S2HyFFzzOui07CPYp0h2VnhObjlXHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=okzC/emDwg2m0ZwJ8YgnHjUgdkHIkFydWwQPM/eSkAY+6VO8J2a+u5z9puPzvrPIZ
	 7Pac23Coc06sUKA0H7kiY55KdlmLPP/CYsRByx+gFCP2c063eAM4gQycSsZro60+gZ
	 helDi4bzLttqkZq7cPT4eZXukQTEmhDe3OOXE25/m+YnrIxGI3WqpsbmI4r7bMxk5p
	 vqpAn2EUCCPolL/RHhh5Kv1JV/GDtJSeymaYwwbD0FTAHBmKVFtUblmtcEu8r9N59G
	 qzMCMp/xkzjY1BRYJoKZUxQn4IyvPGgys+c6uZNNQhcehtCGx7R0gKAmmCNdpr2M9L
	 Nt6WSXThva+6w==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 024C517E00AC;
	Tue, 27 Jan 2026 11:44:31 +0100 (CET)
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
Subject: [PATCH v1 4/7] drm/ci: i915: cml: update runner tag
Date: Tue, 27 Jan 2026 16:13:59 +0530
Message-ID: <20260127104406.200505-5-vignesh.raman@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90713-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67EA293200
X-Rspamd-Action: no action

asus-C436FA-Flip-hatch has fewer devices available in the LAVA lab and
drm-ci uses only 2 DUTs, causing tests to time out. Update drm-ci to
use puff instead of hatch so the tests can run on 5 DUTs.

Also increase parallel count for amly jobs to 3.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 05eccda6bb9e..b7409f8a13a5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -258,7 +258,7 @@ i915:glk:
 i915:amly:
   extends:
     - .i915
-  parallel: 2
+  parallel: 3
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
     GPU_VERSION: amly
@@ -285,11 +285,11 @@ i915:whl:
 i915:cml:
   extends:
     - .i915
-  parallel: 2
+  parallel: 5
   variables:
-    DEVICE_TYPE: asus-C436FA-Flip-hatch
+    DEVICE_TYPE: acer-chromebox-cxi4-puff
     GPU_VERSION: cml
-    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-Flip-hatch
+    RUNNER_TAG: mesa-ci-x86-64-lava-acer-chromebox-cxi4-puff
 
 i915:tgl:
   extends:
-- 
2.47.3


