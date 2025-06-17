Return-Path: <linux-arm-msm+bounces-61541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F47ADC433
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7673B8F5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51DA28FFD2;
	Tue, 17 Jun 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwevWtVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759351514F6;
	Tue, 17 Jun 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147513; cv=none; b=Wq9HgBkNVBzWJigsflyb6k7ZXIv99vKvXR/QtGvHRTXfamTaIIeyF8BZ+IGPL5ttB8ZPyfCf/3t9WEwbVDzvhbPPmIa+pXprF47m6lh/DyGRRxH2G9GZSkJ92GWnuGN+hhX1e3Jc64zUhm/3YQKN1Psr9wCdAsMTqP/Yejog7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147513; c=relaxed/simple;
	bh=aKBDRiikGnavUf2+YErN039Xh/ThzPCTFBbeiq99QQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMpaCFI2iazWBr6LbAjHPPaKpfjBhoh1a/fg5d51nQR50qE5tAe/0VgqvzwnxIiNuXzaC0v7nG+mrpUj/9IAlI7J3CCY0A3vVoJjT0R0tXO9u1g4nls+jHmtwS2OXV+Pe7SM7EIgJWuplUr5hpxKgEiBCDOhWV6J98WJM0pGfFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwevWtVM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CB0C4CEE3;
	Tue, 17 Jun 2025 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750147513;
	bh=aKBDRiikGnavUf2+YErN039Xh/ThzPCTFBbeiq99QQ0=;
	h=From:To:Cc:Subject:Date:From;
	b=cwevWtVMPv9KViLIdf0QNBfl4JBAy6rAqr7H7KV7qgCZ7j/XeVU6m7R28CGAAWFEV
	 wYlCpDGLXdbgS++oCDHcxE0pvycQ0PXQG9l3x9BnQB+pXsvNHN9N1NgSiWWnhorJVJ
	 KxY/XTgTxkAimsHIrOvup0kOUSSVzkHbQBTTe9vkncVEj+zqFHvmWQDB6t+pkyFv0L
	 ZL6FTLoanXOHL9Sfsz8PtrWXO3KRZawR/Bqa4q/o2Jug3d+J7ZPq7haTrbraPQqh+Q
	 OUZPCvWDhuVyKfOTK9f1Jnc+7Lbr0oJCpNQFS37xn5eg3yzECs5bEXsaCr+aBajxKA
	 dz4huunp4Q+Dw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uRRJe-000000002vv-2mDN;
	Tue, 17 Jun 2025 10:05:10 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] phy: qcom: m31-eusb2: fix match data santity check
Date: Tue, 17 Jun 2025 10:05:03 +0200
Message-ID: <20250617080503.11262-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device_get_match_data() helper returns NULL if a new entry is ever
added without corresponding match data.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 9b987911fcdb..9ad7af503baa 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -252,7 +252,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data = device_get_match_data(dev);
-	if (IS_ERR(data))
+	if (!data)
 		return -EINVAL;
 	phy->data = data;
 
-- 
2.49.0


