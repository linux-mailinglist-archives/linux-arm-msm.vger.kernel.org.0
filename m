Return-Path: <linux-arm-msm+bounces-60048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B4ACAC13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 11:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE4F17521D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D871EBA0C;
	Mon,  2 Jun 2025 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBCM0S0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5141E5B93;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858005; cv=none; b=MRS4au5FZk6mV6EdipVP4utq6C9zIPJ4BfjYWnadVK+TThARBnJApab/bElDcbUWUmCtwLPP4LKLYn4dwgIfL9tlXuS6Afi4zyG9Zwh+q2WNCbSo9lhAyvaKQ7oY++5l6kFh+8zhLnzFjt43gS4impJmcZfQkqHml+3hpOu2TCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858005; c=relaxed/simple;
	bh=8Y2htiPy5meWxzHXQzhyzo1AQtbeIgcyev3Yn6FKh6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMTAQrtTOwe/YDR4NGAQjlwgvXsenpkUx6XNjO68soJ65XtitV3tH24XHoVaXugG7RKrweZ4nCm4pddQSAxVb+jnlkm4ZFFnpD5ByxiwYHH/d818nexB40OyCF82EfuVbvAhrVF9vYlVhGXBl7fo+ajCqvylzqbYhtd8AkEOi6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBCM0S0y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E91EC4CEED;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858005;
	bh=8Y2htiPy5meWxzHXQzhyzo1AQtbeIgcyev3Yn6FKh6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lBCM0S0y/D4P0m0kmcOJUOickcrkT+90ogntcc8NUdYaVip2sKZ27Ai+mbTplj1a2
	 +pZGDzxDHFyGcqTTTj9ZG0cFGSzk/au2N3INE57f5X3DVxSsCjcR2sUyKibqVLfI8h
	 etYivN9iY03b/S3CA7t5kEGbKg/antLlrfwyPeHE/rjGPbDH6x2Ol3tWPVJ5VgwclI
	 V2pth6CfJ8ThAdNHaGBPiCYr/kBnlCdxuFmp8mV9qEIjg6bFvaQaf4VZ7X7S9Fq7xM
	 ZM+O1FrOdmShf3ioWMWsddq0LPkyr5ZE9BVc/NreaOqaBKA+WzKU6mLovDUrFNySqj
	 TJ3lKTC8HqwDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B95C5B549;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 02 Jun 2025 13:53:13 +0400
Subject: [PATCH v3 1/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ipq5018-ge-phy-v3-1-421337a031b2@outlook.com>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
In-Reply-To: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
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
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748858002; l=1220;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=y65n0Od6u+x9wP3HKotpTyPdgu84le/dyFb7G8W0t/E=;
 b=J6i0CeRvA6g5yfnnvPEPnspy0W4sPcvgdG5EcbLeQhgXVqwXY1YIytvnXRH869FgzGyuuCWa3
 AxNKZ38L9DvAw7yZdgy63eo6MBHB863p9FcohFqR+evggmHPFCtpVz7
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..6eb86c034fda18c38dcd9726f0903841252381da 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
 	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
 	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
 	[GCC_WCSSAON_RESET] = { 0x59010, 0},
-	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
+	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = GENMASK(3, 0) },
 };
 
 static const struct of_device_id gcc_ipq5018_match_table[] = {

-- 
2.49.0



