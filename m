Return-Path: <linux-arm-msm+bounces-32220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29343983B30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 04:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6C491F23834
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 02:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5069ACA6B;
	Tue, 24 Sep 2024 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I6FlfQQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DDD1B85DF;
	Tue, 24 Sep 2024 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727144781; cv=none; b=IvjaCe7Py2J+tGYd2JI4a0vhbDyVZnBCi8El5viGBJZw+vLjeHtU46tDU1T7vH1Jhcd54z9w4wTPPwRY00WRHKt+wI+ehNX83V+1eyUUBDzLrQwUwzASJmd/597e59x/BCJhWVDYOxBYdFF9E+9KS530xeVCdNnVOwOK9jTSLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727144781; c=relaxed/simple;
	bh=bVBlh+fY6Ig9uXlKnweewNbRdJcBCdmmmBM3MYgyfkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tu2G+lTjLbRYbwhvjuOteiATHcN/c5uOhbuptd0NK15QGoRzDB0bAz08Xk+RtvBfTSIWO8t3du4YIf0i7smJ7W6jda1whc1Oj9F6l2jd/c5TsC6ko1tTo4ZBYOYptEqY1H3TT7PFlObek8j2t6ROjXuSNJp1m0ZshejaCCQfu0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I6FlfQQJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727144777;
	bh=bVBlh+fY6Ig9uXlKnweewNbRdJcBCdmmmBM3MYgyfkc=;
	h=From:To:Cc:Subject:Date:From;
	b=I6FlfQQJLJgS0B4GYHreTcgkphmT0mtS/izy2z6fKSS7SM/YLiUDuQFlVGy/mj+BV
	 LAJ5Z6OzVK7XlKTu8ty7d5B8lKWjrOvTfhYxuS2lGgxDMgwRhHeUh7zm+vBW/smVbC
	 Lh9cVPMXsPLsFyyrDTIyHDkgs2vabkhVEfSxOnu4vKWN/Wk5xbz+iG7hP43duNJhhq
	 RDxF4v0iGL0s4K00QMKKfxunJksIA+2M8LnIE854C+pIIKC3EfPWYcizvciDBHaP69
	 s0b33b7a0NOtNEuAz5lPT4Chepeo/Zztl/y2h8GLSNs+QJry4OgRR2BW0VhQ/VipCC
	 MEAHSNEfkemDA==
Received: from localhost.localdomain (unknown [171.76.80.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1187A17E0EC1;
	Tue, 24 Sep 2024 04:26:13 +0200 (CEST)
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
Subject: [PATCH v1] docs/gpu: ci: update flake tests requirements
Date: Tue, 24 Sep 2024 07:55:58 +0530
Message-ID: <20240924022600.1441969-1-vignesh.raman@collabora.com>
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
 Documentation/gpu/automated_testing.rst | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..f73b8939dc3a 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,20 +67,25 @@ Lists the tests that for a given driver on a specific hardware revision are
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
+https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ for i915 drivers
+https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/ for xe drivers
+https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


