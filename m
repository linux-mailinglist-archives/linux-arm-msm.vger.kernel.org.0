Return-Path: <linux-arm-msm+bounces-59707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F522AC6C14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D12511BA3043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4424A28B412;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7HZd+Ll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB671C84B6;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443552; cv=none; b=YwEqvDBfH0rkA5fFtx9mmj2/UOi+EwhsRMy4yp/JV+iD0DmpHRtLkc0icUZJSauKMi2xzYKp4OgBA4aSX6nk7lCwOHASHICs5oWPaOQt2h0yhwMkJJmS3OiHGa+ETT+jkcpU9BGVej2T18pBnE/Oeu755WrxpQVeKjvhQofhkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443552; c=relaxed/simple;
	bh=PEvKO/wryGgjZziPiEVFS4XnMJm6SAdt0loKuMnLA9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cb7yEZJTKw4OjML5cz6SvONgOT2g3YjTLVCL4huuJcmdiKgis0wFXuIbqcPA0VTW2brchHNXCK8dxiGtoHSreejomtZU+DAwLSBTb5jLrNcWG7BgEjhUfE98tWq/pqcQRhSmZDv7tNsHbzH8zYjHQl4WHVx5uzURD/K4KDhSKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7HZd+Ll; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E100C4CEEE;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443551;
	bh=PEvKO/wryGgjZziPiEVFS4XnMJm6SAdt0loKuMnLA9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X7HZd+Ll6udHHaRkGFj2oihkjy9Is68p5WdFt4+vGRMETR7GXP76MIg2Ozb+pdPLC
	 vVbjWD5TxYrD2Cb5u2yeVQq2gXlxR++PsNE26LaEkKu+afd4laG5ebenkf7vg59lZ1
	 bowfuLIrhnif7S85lOmaHWzosGGBLePLb8wGmqn/5ZP/OkvIcOlEx9a6Hyg64+0EXP
	 zeO3kA13boOFBuHsvzn1deG0NNkvJr1RE6mwa/nL0HwJX9cpa+wtcbuDUNX7q/mAMV
	 F3QE8vEmpMAENU3jX3eVbm9yAKYJ0EO0UEw2CvJn00BdKss0gU4G3tgawL9O04yAeh
	 gT0fLnFAQQ5iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACA8C5B543;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 28 May 2025 18:45:47 +0400
Subject: [PATCH v2 1/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748443549; l=1149;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=oIkUIGsEO4IxSACM3i9ZzN1oSf3eDEKLwbaKL+SIoYs=;
 b=plBci8b7HYWaMG2G9Eb+G7+BUipdemJQtdLnwRhaIW7a2U+uloPVTxAQzgwBVkFZoRuft6kDd
 u81Ysjr9Pi7ANUj9eLZlr8hLZ2KTDpxiQX/dsHbJrA9yUUWlCn4aXW5
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



