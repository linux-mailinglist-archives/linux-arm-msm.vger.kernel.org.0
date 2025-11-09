Return-Path: <linux-arm-msm+bounces-80864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF64C43B31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60B094E611C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8012DCF46;
	Sun,  9 Nov 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMvthkoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EEF2DC782;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681206; cv=none; b=Rz91havA3haK+dXwQv3k60WGpHFoBVf50dCkZaBGiQfYktHMhNj+rWvZAY+bVVbuGTkdGnyvpoJoJfiwNYW1/mX0vmjpSzrguniHSvJZ+LCO5Huqh7KbkfCK7Vc7NWJsLlS2KvLVPOY7PYYfZTlJZZognJFaouwMEo7zk3byy1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681206; c=relaxed/simple;
	bh=v9s3btskZ2Rth9gu+uq5qbWHiBXoJGFfPepBVDla8cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnJ59n/whl9FbEx92vQKmK38kkRGDuNkRGjTj334qnT9TXgdOSlouKoIfVPwDdlf1oYPHFxp2DDJPYX49X92ECQ71Bbs6Jdc9K6/MHsVgjS/UfOMNKBztyE6AEBJNUsIeeqjeB85X77eiNcLFv71U/25SYGQwQRSTvuhE7pT8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMvthkoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D33AC116B1;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681205;
	bh=v9s3btskZ2Rth9gu+uq5qbWHiBXoJGFfPepBVDla8cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BMvthkoogb6dq7u4Nn1p9FCE3i3y5+E6imoU69qf9TmBGHna7izsm3YWSM/v4nQb1
	 GJjDujj6mfFifd0d/ETRgrNAUhSvE8/dRyQOsM/gEHgva9OJNjzSVKhwsC8DZmXrIQ
	 N7OKCnoJnOL0yUrnenEv9DnFY3fwKdtm+qcimAhsIBPzfgrFnSrLb6kDPyd+xobR5z
	 8F8XJrAczTONO2qLo7S06qwFxgwD7R0mspEMOSVK4gJ0GUWhB0wdNy4JE3fm4z6rVE
	 SC8ZxgT7pLQrq51maNkrivQfsS390gZX6FahdfAEDoucMS7kldvxHMP0+yjJ2a+JOU
	 OnJmRvMA+kqow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBE0CCFA13;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:49 +0100
Subject: [PATCH RFC 6/8] media: qcom: camss: csiphy-3ph: Use sdm845 C-PHY
 configuration sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=nfr/qGGID06B5OD83q38f0PZZSjfhMYGec9zEfG35dA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEGFyyePuixhaOiyf8A2P/GEclcOykEU12C2eU
 u4BeBtWC2mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcgAKCRBgAj/E00kg
 cnYjD/9KCEaAnRuojFAoWEehaCNM56MLeAxGe5I7ssqSeoX4YcvJJ+ehdA5HRpcVSPcnuF5lCMV
 rqcwuDCpuncMXRurj4eDav04LUENS1UReMOU/z/y2GsoMgbmIPh6HOIKJdHOn9W1tCph8KTsCpw
 ZFzH+GMxX5Hdm69cFY2JWwFTj3S1nsiw8GNmM6SQt8rDbTc7r1dCnFn8+pqO6iu27YlpJxtpZjA
 NaASxpO4IEYBONOxgpGL/h1UzTNScS7tEnthar8lA12HAkF/Zi/BVlfzeu314tw8dgAJBlpSm7v
 DkiPT3morRrnpgybbM9YPyrxselJWuCmZ1TOJDfXIUTG+Hmsj3sONHZdX6UZDvXT8qHpKqRv1nT
 QWVbqdh3DFB/kbiqIdIFNTIIFoUWu8CmPdcf4uF6btOODeS9Mopq5vmlrD4lqVb3hQqGJd4oIUw
 0r6KIj+BCziGNMqY3bVTMBuPa9XiF/+GSaTx22czR+sSVDFp+tKd0N4TsgF6PzuHp1NbM867sl+
 J9Pe7dBieez4fLs9t43/NgRPTqfQRAn5yt95+L4LUhUQsgzIEvREzF5Nk9kuZAHv2C6XpGNDDc0
 o0ml18iNg5HybKwQRPLp9o1N9Kv9T6xoi1PXnufADen0RrWpAYC/B0ovj4T1msOlfDGbSOdqjdQ
 UAqux/51YhlDDPA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Enable the 3-phase (3PH) lane configuration introduced earlier when
C-PHY mode is requested on the SDM845 platform. This ensures the proper
initialization sequence is used for C-PHY operation.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index c2adbde6b4e0d..03f5c4676e89a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1103,8 +1103,14 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
-		regs->lane_regs = &lane_regs_sdm845[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		if (c->cphy) {
+			regs->lane_regs = &lane_regs_sdm845_3ph[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
+
+		} else {
+			regs->lane_regs = &lane_regs_sdm845[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		}
 		break;
 	case CAMSS_2290:
 		regs->lane_regs = &lane_regs_qcm2290[0];

-- 
2.51.0



