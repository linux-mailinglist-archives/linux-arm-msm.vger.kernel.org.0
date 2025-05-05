Return-Path: <linux-arm-msm+bounces-56860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000BCAAB170
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBCFB7ACD01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 03:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB62A401192;
	Tue,  6 May 2025 00:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/yfNcjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100A2D9007;
	Mon,  5 May 2025 22:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485495; cv=none; b=nwtqnv6D2zrfkrSBqbRdu5xv4znivzbvg6Wu3iHrdbtx2mC1lO48RN2MashLnzi8wLjONRTA4kslQ0zdJq0Sj7J3IskNqOkqwdcPkg7FvrWJNr2Z6N4VhwWW6HsJy631WjDhz/jJE6mebZ0hdVwT30Bb/7vocKHa7NNJArRRNxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485495; c=relaxed/simple;
	bh=t/wh5WgaTzrkkPIfKm3MJyzuB9mCCQvMMenJOs6+r2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lfp76MdVNkGS5A36RxTNKPjWLX8r1m/kIbNSkVvAYYvgoBOBMWjxD++k0aAi4KCY58xj1LmWxNScZ/Vfo1sckVCEVEq5cnhnLVXBFjj71iMcv5z6RNq5bzRVhsadnD4f37cGAPBQhWopCimHS1phQKUNYtUTTXL1OJ96ngp+bb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/yfNcjW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1FEC4CEF1;
	Mon,  5 May 2025 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485493;
	bh=t/wh5WgaTzrkkPIfKm3MJyzuB9mCCQvMMenJOs6+r2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/yfNcjW5CaB79o7fpMVu3LgwdWyDI6e8xnA9i17TSWRAzUmGHmZXmse0zIICqyVs
	 YO8R1D9HQmnRYM06kGBMBbvNL2xR5u0953P3cVKYOFyRmy5N0xYIqyVkYrQTMocRlR
	 7yf+uffIdZPZDYoYSdnPX6u5IntM16yDUE0FnnHp2cI5AOds7/QDEJD8s4fQg1Oe4P
	 J1Fge/32MRm997pUENw38Eei2925qqMZ4Akc3xGHtqwgNlD6yE0BKCOGAIA6B8ap6Q
	 KtnYA0GOnuRxesgYqkuyVT1UWkhnfBx3rfRCWlhRABQWTFFonls1s7/IjsmpDCsw7J
	 M/TzQgH4tB7ng==
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
Subject: [PATCH AUTOSEL 6.12 345/486] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Mon,  5 May 2025 18:37:01 -0400
Message-Id: <20250505223922.2682012-345-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 16145f74bbc85..fd605bccf48dc 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -199,7 +199,7 @@ config IPQ_GCC_4019
 
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
-- 
2.39.5


