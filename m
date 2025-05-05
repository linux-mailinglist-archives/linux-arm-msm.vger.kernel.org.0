Return-Path: <linux-arm-msm+bounces-56867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F46AAB340
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD39189EC9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBEF22AE7B;
	Tue,  6 May 2025 00:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/6/1ipP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9A2E337F;
	Mon,  5 May 2025 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486222; cv=none; b=EBaDM6iNAVWpN1Dv5rZQwQenEZClddJW/rx0XBc4IuKT0TKCse0AVfYSCZ+TKbQ+Usxi574gtKDytvcaYaWORnjxV/6VhRZajDzUjjupAvxhMdlUwc+/Va/kseP76/ipuQP16Bgm3RSfcAPmqVjcOqpUTXV+8PkgCeZ3natlbcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486222; c=relaxed/simple;
	bh=IiLY3MlYjhjNmmoSbqN2d/fNvbnGyzmrYAQoTAV8a0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdvSnBf9wFYpX/NglqahvLMKnnttE7/LlnhspDxQdIU4U4y8aaX4yhs4he/IVgg4JVx82w1VuAtvT/90vygdRLBJvld9r70TlEBtaHM2xGhzWx7O6uBhAludfYjhyQ7+fanH8/hAQYVa6kU2W71CLFfCA8zdX2YtcPHC5byszGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/6/1ipP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D5DC4CEEE;
	Mon,  5 May 2025 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486221;
	bh=IiLY3MlYjhjNmmoSbqN2d/fNvbnGyzmrYAQoTAV8a0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t/6/1ipPPgjrQxePhz/l4iywAGbKV7ABncfuk3RR64LKgXeeeayR5yqmNFDa58jZT
	 laXOJzr4XACvilW+KFcaJXlaiUU3hgsPkddwVu+STC7+XdvFIm9Ihvl4cmcQNG9vJc
	 dLWKMQZMjD5cOm5HbMUWxyr70tr5LVuKnwXDbs9OyW4RlcXdpPtCf9WEkn7A3kJP9U
	 ImOls9NK0CnQzEErh58cUFkEDnBie03LkjHUGn7F4kRQKLZnfbocWdWmfHdUyXXHcW
	 Ok/i56z1aNsXxiDuosYb5F5+Z+VTxT42NCgYghuJ6iSttnFNSh04v2QES8mL+G7Z74
	 kceDWj/KICvBg==
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
Subject: [PATCH AUTOSEL 6.6 215/294] clk: qcom: ipq5018: allow it to be bulid on arm32
Date: Mon,  5 May 2025 18:55:15 -0400
Message-Id: <20250505225634.2688578-215-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 1de1661037b1b..95cbea8d380c3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -148,7 +148,7 @@ config IPQ_GCC_4019
 
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
-- 
2.39.5


