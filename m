Return-Path: <linux-arm-msm+bounces-3635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059C808421
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E7D28418E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270AF33089;
	Thu,  7 Dec 2023 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ffq4awDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A143E10C6;
	Thu,  7 Dec 2023 01:18:56 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 164CF660738E;
	Thu,  7 Dec 2023 09:18:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940735;
	bh=+xSYPhN1BGDcENTTPFKpFCHhHqjjtI0n3VynHDjR278=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ffq4awDW0UzI25jKYArGiPiU2YBsfyjd8oM8rzG6mhrxkEbH3LZdUN3VwB7U/bjVF
	 wQp9Cz8EffogNEkxW0zJCwYDGzCTgal4IM2qIRHH4fAijK7094/teNfc/8UPlbiRCs
	 M9TqkZROFtiPh/GwR5uRKO/OKn3LtjVdGX9JTzdBWLkPcOqMVAyUeR/aLmecWoyacq
	 CnD7RZs6fMja8QVPaxC7fXnTbfmHgTgAZ7yZ1WOC3joJnG5zI6oO0bWbovNieSBfQJ
	 oykp/pjC6oEYhkSlkCMZo+xhDTtjpvgedOvtfR2sD23nVhyfSUmkwC+Vz2kfs6aOUl
	 EEHZzQTpuVJgw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 03/10] drm: ci: arm64.config: Enable DA9211 regulator
Date: Thu,  7 Dec 2023 14:48:24 +0530
Message-Id: <20231207091831.660054-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
Enable CONFIG_REGULATOR_DA9211=y in arm64.config to fix mt8173 boot
issue.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - No changes

v5:
  - No changes

v6:
  - Updated commit message

v7:
  - No changes

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index b4f653417883..8dbce9919a57 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -186,6 +186,7 @@ CONFIG_HW_RANDOM_MTK=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
+CONFIG_REGULATOR_DA9211=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1


