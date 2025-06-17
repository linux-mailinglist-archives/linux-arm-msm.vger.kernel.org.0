Return-Path: <linux-arm-msm+bounces-61540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016EADC430
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E5573B785C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F8528F958;
	Tue, 17 Jun 2025 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzNQLXT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90F1E1C3A;
	Tue, 17 Jun 2025 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147454; cv=none; b=oMyUACvQJ1kNxhVxugHZzUJfkoC1ZkeZaF/joEzuzlmkS5NZ3hGD8TVP9IuTsNC2PcFV0TY6LLvq8tzwC/jeyocafvqiq2IV3/PcjDy/SLBlxsXmlFlaLALi1Hx07cUJWJ1PQ14U6dybO0THMYdvuK7sJPDWl8zfCSLrEp+pH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147454; c=relaxed/simple;
	bh=dy3g+x9GMVU2qM2eIBhOZSDgOoVRonZrdei7KKM23c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpEeXjXbiAsd53ZGency1z6H/AohDp5M5vJXpQfX0W1QuSV3ZYozYPpuBhMQlyXGSn1bwUS2DTpuU7VxqANi9d0iBF1H9aDYP0sKfXAv/iZLi+F5ajPOlDXjtTSgJtK0nzPDK9SZQZMIN/a8xD8TOBMZuDwRJmE4GwR8ALA1/z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzNQLXT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03605C4CEE3;
	Tue, 17 Jun 2025 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750147454;
	bh=dy3g+x9GMVU2qM2eIBhOZSDgOoVRonZrdei7KKM23c8=;
	h=From:To:Cc:Subject:Date:From;
	b=hzNQLXT42HWnVyKirQstzWcC2u/4MdikTSkt47AyMB7HiAoJud62cKQZUAdY8clCR
	 6Sp9QGMPxcXt9BRwwictMfUBPyIDGEkT37gSV6CEVtz5aQePTBIwDf8VFg2vkOmyp0
	 RRk8wzR0CI5Jx/AREaTfJVsAqg4/xzAlBXTtA0XaqzwoFl089br8Q4HhUt5rNYcdvR
	 NDYZgp5BBKenLUmZIf8oWsFCVWpYWIzaEZyMPFyAW8GvTF0Dbs3Jv4pWSPsgcZAuY6
	 3FazJyOSR/uyfR8/B9Gc9F4PWwi2zmUqHf0vWG0WrNS3Ea1ZyvB9nlX70QaSsgXOAl
	 pLuvstd8RhIMg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uRRIh-000000002uN-2Aya;
	Tue, 17 Jun 2025 10:04:11 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] phy: qcom: m31-eusb2: drop registration printk
Date: Tue, 17 Jun 2025 10:04:01 +0200
Message-ID: <20250617080401.11147-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers should generally be quiet on successful probe so drop the
registration printk from the recently added M31 EUSB2 driver.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 9f02b8a78f6e..9b987911fcdb 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -288,8 +288,6 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 				     "failed to get repeater\n");
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (!IS_ERR(phy_provider))
-		dev_info(dev, "Registered M31 USB phy\n");
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
-- 
2.49.0


