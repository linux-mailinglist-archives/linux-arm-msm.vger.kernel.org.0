Return-Path: <linux-arm-msm+bounces-69013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23713B24FC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA102A2813
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B09929ACC2;
	Wed, 13 Aug 2025 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bFjc8oTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485A29992B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101798; cv=none; b=kJ+9FzpkKYRtNFrinzbr9eRbuKcHzVTs272bRiMzj6vlIJruS3JqB4uu62UeheX8UOiCcCMFor+PqA3gPv1cPRcioCcX3+Abd1bUVLMKwxODnYr/DESkE1ppB3m0ClsY0JoFDJeHLHwtkRk6hHvWqzManu6MYCAyWxlSvCeOGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101798; c=relaxed/simple;
	bh=sAcCDxs0QcAN14ZSkMljLpFkI+U7dhk/yBZFq3zCQKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r427tNVg/sdqmuA7fvXp0j5KQzl+m8TYCpLYGsn4CRCmWj+DVG0rv8f3d6+fTnTv2jVVqoRsc/0lp80y+npRLMsLuPAiy6tgvJWTVIv2HD++YofdMAfIyrpCB6FJZxZt3G4BybiDy5qCciNKV1DM1Rbdwx+V4Llh32GfWHo+F7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bFjc8oTu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZOtXcjPuxjagf9eB8C0wPUSDpBGysa5i4y09sy2PoRc=; b=bFjc8o
	TuIcM9+O24OfyieJtvU9l6niGKeW/ICA1QojsVm4e3rshzScmSISWCXCz2B2VWwz
	UDIekxZo2XOHShgun+U62e9r50wLbq2smZWo2nM0P+IpUeFjDso7LxsSvZmk75EB
	cHunPYyULHsTgNN30c/mqE0ZebN/mwM5z8v4fseb1AxUdTqnZdKj5vysg/JbO6DK
	Qk2mGPhYpqk9myGe/iv2F15OKRHEa1BOOO4sS1nDThLA8l+Uoluu133sbVhPlmqX
	pIdzddYZXjhd/5K6FSlZKonrSeO1OAoI6VPfZ/K4WxKgUZG/f9etZIL6rNN1KKIQ
	TmXzu3PcFYrm/11A==
Received: (qmail 695518 invoked from network); 13 Aug 2025 18:16:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:25 +0200
X-UD-Smtp-Session: l3s3148p1@oaxwekE8vJFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 16/21] reset: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:02 +0200
Message-ID: <20250813161517.4746-17-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/reset/reset-intel-gw.c | 1 -
 drivers/reset/reset-qcom-pdc.c | 1 -
 drivers/reset/reset-th1520.c   | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index a5a01388ae7f..a5ce3350cb5e 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -40,7 +40,6 @@ static const struct regmap_config intel_rcu_regmap_config = {
 	.reg_bits =	32,
 	.reg_stride =	4,
 	.val_bits =	32,
-	.fast_io =	true,
 };
 
 /*
diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
index dce1fc1a68ad..ae2b5aba7a59 100644
--- a/drivers/reset/reset-qcom-pdc.c
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -36,7 +36,6 @@ static const struct regmap_config pdc_regmap_config = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0x20000,
-	.fast_io	= true,
 };
 
 static const struct qcom_pdc_reset_map sdm845_pdc_resets[] = {
diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 7874f0693e1b..3ec22ae1fac1 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -78,7 +78,6 @@ static const struct regmap_config th1520_reset_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static int th1520_reset_probe(struct platform_device *pdev)
-- 
2.47.2


