Return-Path: <linux-arm-msm+bounces-27350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F194046D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 04:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19C27B222DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 02:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52507241E7;
	Tue, 30 Jul 2024 02:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qZ3QC/Pl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EFE18E1A;
	Tue, 30 Jul 2024 02:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305805; cv=none; b=eD6oTri8xbHUCl0F2eVvDLZGRu4V0lgVHnWFo5GxcsmWIDBPsqNbTq2jrNsNQJ47cfBd7/4MvQZRev1CWWYKLiCBEl238jf9UrHspUz/bOR11GlO0G6kNXwm26p6JG3tzrBJMLfNy8nk5AUtIlclemdjtqIWa5u+R7QdrioTkOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305805; c=relaxed/simple;
	bh=FTBCIN5481nBICjxsybknMLehNLjeJEbBou3lS+mdEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmfMGrNDYZbhWcNAHCgeQz6Dj4LEyEngm5RBrNi25kqKiXX/VJjtgdnmhalYodhzGgYNCpx+dvay+Cgk0am/GMyA9M8pV/Ng/l7RuFo3Jvfzxb6EHSk5Qe/6rETbneKSMi1GCciQqOjdgl7zXDDQBkQm0ZSjIaEKdm5EcujW/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qZ3QC/Pl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305802;
	bh=FTBCIN5481nBICjxsybknMLehNLjeJEbBou3lS+mdEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZ3QC/PlX7tWusyRZwOyD+8ofspInKbLEBp4SBYPqdDuKD6duA1jbLMjF6aW4Jxhg
	 c0K3JGV6KcLAGnECS1CkyIvS5sUIDp7lrU+bj+q7hZHv8h9ZrwJQYEjrA5AgVSRuEF
	 w4zT+TjWFXHdYpq/R31VyNo7cSJq1/xwFvmMDiNtysnHmpDDpwfZC6qOfDvu5TdEr6
	 jO7O/6FPwDGbnRkYP9Yxycv6tBBA7wxayZYB7bhH0tGtHF1cOq2VBd0syUJBrVha14
	 WnTzqBaqlSZI1E3XOxAXwtKqE4oXdam8TnN1rJ/bh+N19Tzi2l0MBpKf2zHpe1bn+U
	 sg68oG1iI8YlA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BAE4A3782109;
	Tue, 30 Jul 2024 02:16:37 +0000 (UTC)
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
	mcanal@igalia.com,
	melissa.srw@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/6] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Tue, 30 Jul 2024 07:45:36 +0530
Message-ID: <20240730021545.912271-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_DRM_ANALOGIX_ANX7625 in the arm64 defconfig to get
display driver probed on the mt8183-kukui-jacuzzi-juniper machine.

arch/arm64/configs/defconfig has CONFIG_DRM_ANALOGIX_ANX7625=m,
but drm-ci don't have initrd with modules, so add
CONFIG_DRM_ANALOGIX_ANX7625=y in CI arm64 config.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

v6:
  - No changes

v7:
  - No changes

v8:
  - No changes

v9:
  - No changes

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 4140303d6260..66e70ced796f 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -187,6 +187,7 @@ CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
+CONFIG_DRM_ANALOGIX_ANX7625=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.43.0


