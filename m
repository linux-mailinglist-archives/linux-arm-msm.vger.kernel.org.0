Return-Path: <linux-arm-msm+bounces-32760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC64989EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 11:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602CD28163B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 09:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A478318873F;
	Mon, 30 Sep 2024 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kRe5RniR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F82917CA03;
	Mon, 30 Sep 2024 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689992; cv=none; b=bntF3J/ku/wTimIfpgXgMSQ2qOOaBKJssOYwJEct1DHtEezDmJnekURgnFZQ94XBRlC6FbjCVTqP6hrwdchZtMEFO0UQ7vx1WsxZzF7bL8KrhMp2wMqRzlA5qHlAx5t07LPbYj9vQGMW0LQwkRjTKDuz+AdzC8i1Jv1jZCIp1Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689992; c=relaxed/simple;
	bh=xlQB+YRnWzPDGKcdRmDpIo+//kocNTxv1zsa8DtTEpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+q7UgF07z7TofsNUHsktlQeGsap83pZWsAYz9GuAHNk4dT9GiInmI6+Q/dBzz+DhhXE9jDqBuKBhp/yD5Ynv8Lzvnh8smEgoxRNYBFZcEq0v83xQVkmC2WySl8yguWh9axESGnHbLaqicFBABZ7a6qp+HXbqHH/qAymFXu6Srg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kRe5RniR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727689988;
	bh=xlQB+YRnWzPDGKcdRmDpIo+//kocNTxv1zsa8DtTEpI=;
	h=From:To:Cc:Subject:Date:From;
	b=kRe5RniRKjhzyPUIS9aI2gdQY/3yfKtncMkphK8EzeLqmp1VuuBWod/AA66jPXaNd
	 EKRfxBP86hBpWoINgH9hkEhh+lONXGBZUmjk20jMP43TLhVSYUzoeldgkgazVcPL8j
	 v+YoK6UZ7SpvFTo6sS2UT166Ry/DaV7GyOQ6xhSqnDZfk2GxgmN7YU9/I9n9oYwheV
	 StpzBoIns/k8gwxB+xso+IansWWxQUChjuk6E9n9YVfie/psblmf4Nc8Iqe5ZJF9z+
	 Y/fkYSDfLJnwsCX4Wfx+JjgMUPo/W7g2Ggtl0tWUReRwX5zUgUpaokHfSY3/d3MVtD
	 hcqp2lZxrEpfQ==
Received: from localhost.localdomain (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD8F17E1147;
	Mon, 30 Sep 2024 11:53:04 +0200 (CEST)
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
	quic_abhinavk@quicinc.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] docs/gpu: ci: update flake tests requirements
Date: Mon, 30 Sep 2024 15:22:47 +0530
Message-ID: <20240930095255.2071586-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the documentation to specify linking to a relevant GitLab
issue or email report for each new flake entry. Added specific
GitLab issue urls for amdgpu, i915, msm and xe driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #intel and xe
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
- Add gitlab issue link for msm driver.

v3:
- Update docs to specify we use email reporting or GitLab issues for flake entries.

v4:
- Add gitlab issue link for xe driver.

---
 Documentation/gpu/automated_testing.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..6d7c6086034d 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
 Each new flake entry must be associated with a link to the email reporting the
-bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, the IGT version used for tests,
-and an approximation of the failure rate.
+bug to the author of the affected driver or the relevant GitLab issue. The entry
+must also include the board name or Device Tree name, the first kernel version
+affected, the IGT version used for tests, and an approximation of the failure rate.
 
 They should be provided under the following format::
 
-  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
   # Board Name: broken-board.dtb
   # Linux Version: 6.6-rc1
   # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
+Use the appropriate link below to create a GitLab issue:
+amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues
+i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
+msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
+xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


