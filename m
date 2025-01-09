Return-Path: <linux-arm-msm+bounces-44544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D951AA073C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 11:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 560C31889B3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50921638D;
	Thu,  9 Jan 2025 10:52:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [195.16.41.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482021FCFF4;
	Thu,  9 Jan 2025 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.16.41.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419957; cv=none; b=N6u+gGzH3uGILHsYdLYlOmbOIX9DVpSQizC0X1NtGDDiI0R7sYPBiI54S2ik3zR5GMVF/dH7QJ/3oow6oh6q9Wxx6p+hU9rRq4Fwx2gWEFQE3yWVMFG32BGXjF7Tr77Bc3tZktO56A2ukNMQqufhAs0OfI8k14QV1KdlTS2ZZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419957; c=relaxed/simple;
	bh=RskAXAssKBeYzM3axDvBryE8IHmWlO3lawnWgggTabA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtKHGkgwPqgbmIkhiEHwURzwaNJ0l+l2f8lgBAAw+NzKd75RiM3ZhfWyomtfz3od/ZcMWw94izsBIt5GT5k4GBMfgrAj7h5ZiwGHLHrGSebPQNiPbiEks+AISY1cRCRTJw8G+htdspcas/8syVGlQUnMDS4BZ9IuWM5JAIYzrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=195.16.41.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id A0A911F9DD;
	Thu,  9 Jan 2025 13:52:29 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail04.astralinux.ru [10.177.185.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Thu,  9 Jan 2025 13:52:28 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.51.250])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YTM7F3GWTzkWxT;
	Thu,  9 Jan 2025 13:52:25 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Dai <daidavid1@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] clk: qcom: clk-rpmh: add explicit casting in clk_rpmh_bcm_recalc_rate
Date: Thu,  9 Jan 2025 13:52:08 +0300
Message-ID: <20250109105211.29340-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190216 [Jan 09 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/01/09 08:30:00 #26962612
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

The result of multiplication of aggr_state and unit fields (rate
value) may not fit u32 type. Add explicit casting to a larger
type to prevent overflow.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/clk/qcom/clk-rpmh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index eefc322ce367..e6c33010cfbf 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -329,7 +329,7 @@ static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_rpmh *c = to_clk_rpmh(hw);
 
-	return c->aggr_state * c->unit;
+	return (unsigned long)c->aggr_state * c->unit;
 }
 
 static const struct clk_ops clk_rpmh_bcm_ops = {
-- 
2.43.0


