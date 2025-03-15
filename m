Return-Path: <linux-arm-msm+bounces-51539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6BA62F16
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 16:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9397E179AFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 15:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86B92046B2;
	Sat, 15 Mar 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YCK6XBHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0352045B6;
	Sat, 15 Mar 2025 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052385; cv=none; b=O+wmG1+TR+2DcEF0ARUu286d38SUlV+bYt5IPy3+eF9Kz1XgF0DwqRUTvsYP1xN6DZyvwmiWNRROXXarqPKr4PoIw/zyhYLT9pRRVho9jR0s8qnbGhcoQNBdMuaKUC6XorYIgJE1GfBWDXOvyHRzZBMdlXeKs4BwVlI/WWBQ3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052385; c=relaxed/simple;
	bh=6UKcRvLmFGMkYbpnTHWkJsGzoz8DT7K8HX8/BTjnlAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRXRaCuNLn6d5Oans1AYgIMQWQVl4GNbxXs4YeKdpGBtsgTcKvZo29TmBUJtn/ZP3wSpFLV+Zg+KJIJVtDW0Ly8UR4yGhP1YkEZ0x5n6O4GtzpdPBNej8R9deNuBQsEwornHXmah+DPIYnH87dUatd3j/sNvuLo8hhRH4OvtHjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YCK6XBHl; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C339A.nat.pool.telekom.hu [37.76.51.154])
	by mail.mainlining.org (Postfix) with ESMTPSA id 69D02BBAF1;
	Sat, 15 Mar 2025 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742052382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwLRg4v+maMgH3qlciCzk8zvUd/Y0FWKjZc0zaS2pGk=;
	b=YCK6XBHlJIpnHd4ttAinlNfodbrepfDBt1z/2HpzIFDZBUTok6ihBuOlEqSj96NV6bv4PN
	3TApuAFZ39pBcJH3vo5lSTi61GQnysr3ry40Jx3T5nC4hcjRbzufJC+Yo6OW3d8crekxvB
	ENLtTiQG8+FORrVf6Yjp0dRlbCm6PHl7zRrINBF+wOOiwVgyHFDySR5FG/BhAjfg4tRZdf
	Xvai0jmgQbJn9YMcYmyNxKYtaRcA2Mys4VykoCbG2l7cKMwkZ/HaJqYXDW6xjtRY6YwQFG
	+RiP2QVmWJejPevdEroa+zYi2tXKDHt+Yq5BPpHAGjiZBVJbAhL/0Objc1Y6EQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 15 Mar 2025 16:26:18 +0100
Subject: [PATCH 2/2] clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250315-clock-fix-v1-2-2efdc4920dda@mainlining.org>
References: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
In-Reply-To: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Vladimir Lypak <junak.pub@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742052379; l=1107;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=a0JbqZV9TU0RP2sdIeXFqsOUuGP3rJw2vpMY7/ARc0g=;
 b=IYArTFRkWSVyh0Ns9+AQXaDxHv71e7vx0kcRKqeNDPJd8ahuPYXrRbc42zpCuYExItGEDf3uM
 qkgO+uFiIk9DCTFtKtmbtOWSVau7X9/r64C07tfdZiVFUi8OSGhQHQE
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Vladimir Lypak <vladimir.lypak@gmail.com>

This clock can't be enable with VENUS_CORE0 GDSC turned off. But that
GDSC is under HW control so it can be turned off at any moment.
Instead of checking the dependent clock we can just vote for it to
enable later when GDSC gets turned on.

Fixes: 9bb6cfc3c77e6 ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 855a61966f3ef565c48cbc8a7a7fac5e5e66445f..8f29ecc74c50bf50e34e4870b7960b8a0183644b 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -3770,7 +3770,7 @@ static struct clk_branch gcc_venus0_axi_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),

-- 
2.48.1


