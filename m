Return-Path: <linux-arm-msm+bounces-65641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76047B0A12D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2956D17350E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3572BDC1D;
	Fri, 18 Jul 2025 10:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sjynf/u+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66892BD5BC;
	Fri, 18 Jul 2025 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836067; cv=none; b=sEZT1t/xZrKsPeM0uUYhZNcrHVLFd9VY/1zJxUd7IELPzA9XFoaj2+L8aOllEJ5FRp7t5/w/loVco1J+Hv2eYC8n+gJH1RREZcRNU2lNAZe4dkweTP4GDkejmt0DGgvG2WtU7FkcqP9p95kJc0vc8KRzadPWgxH7vG0eKudfCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836067; c=relaxed/simple;
	bh=k7CAZOnVX3McTF9rA6EaJjI3tqH2gxRiw0k5BhFfu+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGk92sPGV5nTSbr+kY3oLooIj0ID+Z2CM7OV/jel9+29TH1KufRrBHwhCaxiYwqzAnE5CNJZvrWQ66j3XKsqPT35Sz/5UanROLzt1d3Dd0b7f2YB1mao8FG1HQbRqCaS66VbpLcOaWVarteYgryqxJzJBwLCjdTixJdYRQKe86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sjynf/u+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836063;
	bh=k7CAZOnVX3McTF9rA6EaJjI3tqH2gxRiw0k5BhFfu+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sjynf/u+D9SjkEYOCSDJrxhLi8UWPgyv13WkmDPUqBdHSgA888JhJLdg2oy4ObMt9
	 KYovrzdWiDYVeLa6c/50qDU4SmZUkqP4hdwseHAWYqUiWl9/DLSMkdg/eHjqBXq3V0
	 76icLc08zdr3iH8cQQnP3A3TndrdxnqI6Cmnqdkyh8Y5BRBOLwHTMH0bacvHfMhe6u
	 IMFfDQ7HPmWFgWTe9AEcT9oOMstEHna+guZKMatkjZkjXJJq9RA01Zr/bWQ7IOaSeV
	 dwZJdK6I2M1V9A4pWQ7OUaRAJxUnSC/SMxapeKOdL1pFzZPKZ3IBVSK0VJoykx9kOd
	 sz9xgKfJK5huw==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2D9217E156C;
	Fri, 18 Jul 2025 12:54:19 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
Date: Fri, 18 Jul 2025 16:23:53 +0530
Message-ID: <20250718105407.32878-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These devices are being moved to LAVA. The jobs will be enabled and the
job definitions will be updated once the move is complete.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 81147e86bfd0..53d19ffaaf61 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
-msm:apq8016:
+# FIXME: Disable the bare-metal jobs. These devices are being moved to LAVA.
+# Once the move is complete, update the job definitions accordingly.
+.msm:apq8016:
   extends:
     - .baremetal-igt-arm64
   stage: msm
@@ -165,7 +167,7 @@ msm:apq8016:
   script:
     - ./install/bare-metal/fastboot.sh || exit $?
 
-msm:apq8096:
+.msm:apq8096:
   extends:
     - .baremetal-igt-arm64
   stage: msm
-- 
2.47.2


