Return-Path: <linux-arm-msm+bounces-63065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF66AEDCF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 740BF7A9248
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98255285043;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPMT8vHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3B27055A;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286909; cv=none; b=MQ5FIshUloX30jEJV9FBRALA4QR3OsUdq4Dqc1QVoZ6Tv5TMxe4PrNJK9bQBerdP+aiq7kijxsdt62AQ5Z1zCM9qknEIhiP0+4z763E7zTOemTRPqtye35UFZ0QorTxLH77d8pJ2QJqr8kCk0PzbPHwObZVoQ2A+d4A8Me5kLC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286909; c=relaxed/simple;
	bh=8Y2htiPy5meWxzHXQzhyzo1AQtbeIgcyev3Yn6FKh6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIDGfLini0mZBAJmWFk/1Oy2zbsCpca2d52gGLKcd0VQX5hylZVAbN2zLLo4psqfKim+NGZPgqkrCVeN+Mp6KVNlakakG9QxvDy+Y94YWGrXJb+U8IOGa+Mi4OpHOK1dcSe/ksPNxZ+ZKC+8vm7LvoRJnoSAfEm5GnSghhLnjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPMT8vHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34C5BC4CEEF;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751286909;
	bh=8Y2htiPy5meWxzHXQzhyzo1AQtbeIgcyev3Yn6FKh6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mPMT8vHrQ0V8KVI6Il0mkawZgYlIFi9d7naOFlzYL9Mwpr8To2hAhfefixrG7H/yc
	 izB8lNc91m7b0b3hi4bSaxYvEmTZuIKTowvifjxIYFR6Ug7SW7mHUP7SlagELLi0ST
	 +rzwm8ZMnKFspMOchqaD8d81SDxbofmxjbzKyDTi0BgwVHgvjGFSVBWpRu4bnc68o6
	 jB2kd3ztkdO9DhrnK5KVcDMlL2NkxmomMmGBsnrIYzS9P9cpLQYHguljrFM9LjhoeQ
	 /uEXzZVZqDc90aw/t+dGB7GAJnnOZsWOkHTpNskCgviRYSNd/y5t7GxPHiLt+OPAVG
	 5dXBoR/Ze0o7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23671C8302F;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 30 Jun 2025 16:35:00 +0400
Subject: [PATCH v6 1/3] clk: qcom: gcc-ipq5018: fix GE PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-ipq5018-ge-phy-v6-1-01be06378c15@outlook.com>
References: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
In-Reply-To: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751286906; l=1220;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=y65n0Od6u+x9wP3HKotpTyPdgu84le/dyFb7G8W0t/E=;
 b=8GFFdXl2KAWvcdLAfio5sbRql6URuWxu1LrF2UScWzaP2crAPzgbOSYYGfwb2CyAvqVN6HQvG
 cKUzsL4FKfOCe0qZu/cImN6p6estTR7yvV1/7E6WEQD7X3ZhI9T9Gqf
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



