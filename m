Return-Path: <linux-arm-msm+bounces-32544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8978F986D3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 09:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA37E1C2179F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 07:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEC8188595;
	Thu, 26 Sep 2024 07:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a6qG1sYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B81E86E;
	Thu, 26 Sep 2024 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727334451; cv=none; b=U0hlAR6A+PZBu3rEc8nmMMdqV3OfE2bwa/QdBiZb3mojR2/0zf74RrvUmQFLaMllM5jzJolftqnJlypaXz0iSrJmlbXT7Q2u5nwuDQc2T2C/ckH1lfNAOOWUgoaFCRIVGQo2B/WBoT47mWjxoi3g/YKC99+25zAgFmykzZhECR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727334451; c=relaxed/simple;
	bh=KnAJPqBaS5mXano/IWPtVY1GwRK9RukKLmDCVvuE62k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQ4hk9Y6TSA0YfrcbeRWg9SLsOMfor0mgoTrKMyiY9N0IbKEuukgqWn1Y1GA3cjEy2PgYJjWoXmsWJlHGFeDn9Tr3yiyx+hlJfjRj2zfXFJLX+YE3kDhd0MWqJlp7MREjMhWwsxDk2rs1OYU5tS2co3WZuBrJgsJQb8IAqkPM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a6qG1sYP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727334447;
	bh=KnAJPqBaS5mXano/IWPtVY1GwRK9RukKLmDCVvuE62k=;
	h=From:To:Cc:Subject:Date:From;
	b=a6qG1sYPRZwPWN61Ga0JUd2JAOsqgmxztWRWL7bQyRnlvitHYMF1KaYiokMoe90QL
	 y0Z3W5WTVkarVdSfrD0gilBztAbMN9+Nl2XmUon16zfnlqbH3MMB6MEo6gwyN1chMZ
	 Ws24NLwZgR0HaoUXMSRR9ZlxGDiUgHCb7Trje6ira3SDxES3YSw1Xp46P3aIhJ4atB
	 bvQwTNUASavoZB4mXLO1zjyG8zshAZLVTm0Y2vAFT0NQFWuMOwyu394ObkzfiDPWs2
	 HnpyVWilPmTXyapS5PY6PZNtVpy2So9ybSPpNinWx92FjggJnEEd6mokyHEC1mm2Tn
	 pMtK3XWjBoW/A==
Received: from localhost.localdomain (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69E9F17E0FDC;
	Thu, 26 Sep 2024 09:07:24 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	rodrigo.vivi@intel.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/gpu: ci: update flake tests requirements
Date: Thu, 26 Sep 2024 12:36:49 +0530
Message-ID: <20240926070653.1773597-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the documentation to require linking to a relevant GitLab
issue for each new flake entry instead of an email report. Added
specific GitLab issue URLs for i915, xe and other drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
- Add gitlab issue link for msm driver.

---
 Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..f918fe56f2b0 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
 known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
-Each new flake entry must be associated with a link to the email reporting the
-bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, the IGT version used for tests,
-and an approximation of the failure rate.
+Each new flake entry must include a link to the relevant GitLab issue, the board
+name or Device Tree name, the first kernel version affected, the IGT version used
+for tests and an approximation of the failure rate.
 
 They should be provided under the following format::
 
-  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Bug Report: $GITLAB_ISSUE
   # Board Name: broken-board.dtb
   # Linux Version: 6.6-rc1
   # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
+The GitLab issue must include the logs and the pipeline link. Use the appropriate
+link below to create an issue.
+https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
+https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
+https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
+https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


