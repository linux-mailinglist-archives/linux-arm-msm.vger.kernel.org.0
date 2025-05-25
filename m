Return-Path: <linux-arm-msm+bounces-59344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245CAC3613
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE443B40C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23FA25DD09;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiW7+iro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62C259CBE;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195768; cv=none; b=jMYl6mfmyZ0zhreuW7F71GbsbiLtiaUH4pAZ+Lf1oIlBCY/o0BbaFyDfBt2BW2gXnNbuTBveF4rK1uHWOuA3SMlPZBs2TVdZezG+P5hDeuht0j/lpK5GUcyZAv7Z+Cm19fc54XSVar5Z0pjoxssflvFvYV6OETMFSww7rY06tmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195768; c=relaxed/simple;
	bh=PEvKO/wryGgjZziPiEVFS4XnMJm6SAdt0loKuMnLA9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSl2nlBV31PLa/NUUPOp2530IxGkcPR1ANCzrF4uyurxddW3FD8ARmK6F8iIAJdMS0w0IzuYVpUN3Q19YCvcE6jdX3jCNQC7fdNDQsklyHUZBpYq4vbOZ7hA4DOAgl4PglxMUEKt9qV80G7+Lww27unf7X7lP7twLXFhC78cmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiW7+iro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29996C4AF09;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195768;
	bh=PEvKO/wryGgjZziPiEVFS4XnMJm6SAdt0loKuMnLA9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oiW7+iroJjpTyWIjPq4AmdRXqkEnu5YcTzsXcYjzZnHw5EYGieoPGs7snQghgSYg2
	 dr0l2qPeJoT1HAT3hQs/DJrwCK/PEYufqcUGMJRYsL7befgZPTVtnh7qG/8ytiZ3nF
	 6VY4KWNw9/kGYFRo4cpLNgjRUpNBB1NWbzhPB5APwd1A/eoxCn1rQwH9EBc5pts0G3
	 MNE2PUWH44UyMpeCRikBwz/u5T4QlR35MgK7+JAjv+5205+76MoOdtl2eV8TYSvNzm
	 GLVi2h5SEbZdWjC/fV8UNGuETazrweY9LuiSzhnZzFbQUTU/cEBhAlc80BbvtZTmOc
	 nqyUURDIrkLhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBFBC5B541;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 25 May 2025 21:56:05 +0400
Subject: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748195765; l=1149;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=oIkUIGsEO4IxSACM3i9ZzN1oSf3eDEKLwbaKL+SIoYs=;
 b=02XFO8KJUlDf/GQd0oZSxvLXGTZYrGzhEljPdbdnmF3LQkWU+O1zbHOfU5UYGN6hY3jyv7wMk
 IdbCEfGcfhPBaDz4Y5AKdRWodS3NgeHf5YGFoZkJgwCqcH0fCYGK81c
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The MISC reset is supposed to trigger a resets across the MDC, DSP, and
RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
of the reset definition accordingly in the GCC as per the downstream
driver.

Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
 	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
 	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
 	[GCC_WCSSAON_RESET] = { 0x59010, 0},
-	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
+	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },
 };
 
 static const struct of_device_id gcc_ipq5018_match_table[] = {

-- 
2.49.0



