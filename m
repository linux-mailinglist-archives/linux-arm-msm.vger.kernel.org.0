Return-Path: <linux-arm-msm+bounces-56837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D680AAA5E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 02:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B526467FF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 00:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D702928E5EA;
	Mon,  5 May 2025 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1zDILF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527628DF14;
	Mon,  5 May 2025 22:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484292; cv=none; b=ahhB4gOOCV9ZObrmeI4CQxOFALCt+IVoC7NWl1qQroxqAxCUNdNVGJt1mTMxMT7dfty9xZ7SssbJTDAuj5k87G4ieZn9f19DDW3gcOftWH8OSVoC2bv6QaDHCiQvLi8X8UwnzTTwCRoo8Q3UXXSrobmwhV3zeKeib4BM/A0EBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484292; c=relaxed/simple;
	bh=17sWMnJK8wQ0ABgcK00WwNpqi6OGNfq9XbBRBCz2d0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g8qde5nBbzVeQBcDnKLAat9H9QOSV4lc/kPjRWfv3oViV8hTUGOdjPYbeT4RPfN4vF+fQHSZibtcHJ+SsrBEmLbHN6FO9+bqXHfNWxkN6OO7Udqwk0uSl2e0R/Mq2RQPbHcVOzILC2rV7OlW5MBTcnVNZ2BVpwdJJSvrXfcc3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1zDILF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09725C4CEED;
	Mon,  5 May 2025 22:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484291;
	bh=17sWMnJK8wQ0ABgcK00WwNpqi6OGNfq9XbBRBCz2d0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1zDILF77Yh30+B3LyqDzBpVbtpzWSf43B9CX39pn73H6D1V7FDm7GLkTvuxHvMBV
	 47VjdNhDM3MHxFuoFWvOb+ph7s90Z+Cqx4RT5dhR1/0rBak3FdhjMHmNQ3rO8HCbFB
	 /7wiE636fEjbn+H3sI204WlJ1SsZ0GcqVNw5q4+ihau/DVS0bVd3bskVx3g97rI89o
	 Hc0E8Z0g6nNrAZz65NZY77ybUU38piX0IBWXjGs2ZuU0yHDGzdhMiO0M2/kY9O7p25
	 acsaaDaJGFT1f6uzrFAQ+St65TN2rINs8kBMyoFFi4VNws6AFJKV0Y+T3sZpT4NEC9
	 6YC38SMXnvBzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karl Chan <exxxxkc@getgoogleoff.me>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 438/642] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Mon,  5 May 2025 18:10:54 -0400
Message-Id: <20250505221419.2672473-438-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Karl Chan <exxxxkc@getgoogleoff.me>

[ Upstream commit 5d02941c83997b58e8fc15390290c7c6975acaff ]

There are some ipq5018 based device's firmware only can able to boot
arm32 but the clock driver dont allow it to be compiled on arm32.
Therefore allow GCC for IPQ5018 to be selected when building ARM32
kernel

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241007163414.32458-4-exxxxkc@getgoogleoff.me
[bjorn: Updated commit message, per Dmitry's suggestion]
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 69bbf62ba3cd7..d470ed007854c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -217,7 +217,7 @@ config IPQ_GCC_4019
 
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
-- 
2.39.5


