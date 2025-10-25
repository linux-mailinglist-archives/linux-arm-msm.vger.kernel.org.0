Return-Path: <linux-arm-msm+bounces-78780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6AC092D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF8F3B6010
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA57301703;
	Sat, 25 Oct 2025 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGJQys4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8313009C3;
	Sat, 25 Oct 2025 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408550; cv=none; b=l1Icu4b5txEph6EC5ExVZYrZcKKtXdBuyg8d9pyWU92VsIW3xS8zhmMs8y/+lU6MQFD6lzw5pSmUaDCxuJn4gidXnV1U0Tmgauhbm9dIGcIsPT1BCJRmt3mLls/L6kz9oOEjDtX5wNjMuZBpsOubDo6wJ9A/zOwl1g12iMdx3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408550; c=relaxed/simple;
	bh=xiZnHE4a0Tuy8f8zhG4xwga0jp+aRPCvNabDrksZmp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o4J+/AvZnSj45c0m4O2z+C2eQq3tBwdRZs30/u8Rb7HMVeEVOpbjNVwODJYTUA18dgqOeZxFvEu74pVhl2vCyIodhpZ+g9J95INa0coK4pdvr62qrQqz37xbcq+At8SLEPL+fpB7OLiXmAsbDst3dJSEOkLICydhrR9Ak5puayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGJQys4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E29C4CEF5;
	Sat, 25 Oct 2025 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408548;
	bh=xiZnHE4a0Tuy8f8zhG4xwga0jp+aRPCvNabDrksZmp8=;
	h=From:To:Cc:Subject:Date:From;
	b=bGJQys4JyGxqEjKjYdgfAUrC8+WVGVxrDQqBKEXkpC0sgVlMw1kk6Orb5mZZmgaDO
	 vbkFCEWA0e7QjlL1vFgVg1CrTFa7WMH73SKDKQbV/3yemc7mF2hjooYoZpU1H/jUuV
	 JtEi62ucvqAt+VEMKm+CBqtuy3sFXNoc6GHT6YTX7qgai4jrW7zVMyQIXQ4mbviCq5
	 p8KKLEneGAnTZyvEUMvkdFFJevu7c4h40Bd6aJr8RD2k00UsqqNtFK3QI/BPmsIiky
	 P5yqcSSD08ssUQHyAw0SXWUaoKbV8jD1OmRmGYL4E3NzswBLCyanHiiYfujQZ7Cwgv
	 jlBYGhZx55l3A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	quic_ptalari@quicinc.com,
	bryan.odonoghue@linaro.org,
	quic_zongjian@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	quic_jseerapu@quicinc.com,
	alexandre.f.demers@gmail.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] serial: qcom-geni: Add DFS clock mode support to GENI UART driver
Date: Sat, 25 Oct 2025 11:53:52 -0400
Message-ID: <20251025160905.3857885-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

[ Upstream commit fc6a5b540c02d1ec624e4599f45a17f2941a5c00 ]

GENI UART driver currently supports only non-DFS (Dynamic Frequency
Scaling) mode for source frequency selection. However, to operate correctly
in DFS mode, the GENI SCLK register must be programmed with the appropriate
DFS index. Failing to do so can result in incorrect frequency selection

Add support for Dynamic Frequency Scaling (DFS) mode in the GENI UART
driver by configuring the GENI_CLK_SEL register with the appropriate DFS
index. This ensures correct frequency selection when operating in DFS mode.

Replace the UART driver-specific logic for clock selection with the GENI
common driver function to obtain the desired frequency and corresponding
clock index. This improves maintainability and consistency across
GENI-based drivers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250903063136.3015237-1-viken.dadhaniya@oss.qualcomm.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Fixes a real bug in DFS mode: The UART driver previously never
  programmed the GENI DFS clock selection register, so on platforms
  where the GENI core clock runs in Dynamic Frequency Scaling (DFS)
  mode, UART could pick the wrong source clock and thus the wrong baud.
  This change explicitly programs the DFS index so the selected source
  frequency matches the computed divider.
  - New write of the DFS index to the hardware register:
    drivers/tty/serial/qcom_geni_serial.c:1306
  - DFS clock select register and mask exist in the common header:
    include/linux/soc/qcom/geni-se.h:85, include/linux/soc/qcom/geni-
    se.h:145

- Uses the common GENI clock-matching helper instead of ad‑hoc logic:
  The patch replaces driver-local clock rounding/tolerance code with the
  GENI core’s frequency matching routine, ensuring consistent clock
  selection across GENI-based drivers and improving maintainability.
  - New source frequency selection via common helper:
    drivers/tty/serial/qcom_geni_serial.c:1270
  - Common helper is present and exported in the GENI core:
    drivers/soc/qcom/qcom-geni-se.c:720

- Maintains existing divisor programming and adds a safety check: The
  driver still computes and programs the serial clock divider, now with
  a guard to avoid overflow of the divider field.
  - Divider computation and range check:
    drivers/tty/serial/qcom_geni_serial.c:1277,
    drivers/tty/serial/qcom_geni_serial.c:1279
  - Divider write to both M/S clock cfg registers remains as before:
    drivers/tty/serial/qcom_geni_serial.c:1303,
    drivers/tty/serial/qcom_geni_serial.c:1304

- Consistency with other GENI drivers already using DFS index
  programming: Other GENI protocol drivers (e.g., SPI) already program
  `SE_GENI_CLK_SEL` with the index returned by the common helper, so
  this change aligns UART with established practice and reduces risk.
  - SPI uses the same pattern: drivers/spi/spi-geni-qcom.c:383,
    drivers/spi/spi-geni-qcom.c:385–386

- Small, contained, and low-risk:
  - Touches a single driver file with a localized change in clock setup.
  - No ABI or architectural changes; relies on existing GENI core
    helpers and headers.
  - Additional register write is standard and used by other GENI
    drivers; masks index with `CLK_SEL_MSK`
    (include/linux/soc/qcom/geni-se.h:145) for safety.
  - Includes defensive error handling if no matching clock level is
    found and a divider overflow guard
    (drivers/tty/serial/qcom_geni_serial.c:1271–1275,
    drivers/tty/serial/qcom_geni_serial.c:1279–1281).

- User impact: Without this, UART on DFS-enabled platforms can run at an
  incorrect baud, causing broken serial communication (including
  console). The fix directly addresses that functional issue.

- Stable backport criteria:
  - Fixes an important, user-visible bug (incorrect baud under DFS).
  - Minimal and self-contained change, no new features or interfaces.
  - Leverages existing, widely used GENI core APIs already present in
    stable series.

Note: One minor nit in the debug print includes an extra newline before
`clk_idx`, but it’s harmless and does not affect functionality
(drivers/tty/serial/qcom_geni_serial.c:1284).

 drivers/tty/serial/qcom_geni_serial.c | 92 ++++++---------------------
 1 file changed, 21 insertions(+), 71 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 81f385d900d06..ff401e331f1bb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1,5 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
+/*
+ * Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
@@ -1253,75 +1256,15 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	return 0;
 }
 
-static unsigned long find_clk_rate_in_tol(struct clk *clk, unsigned int desired_clk,
-			unsigned int *clk_div, unsigned int percent_tol)
-{
-	unsigned long freq;
-	unsigned long div, maxdiv;
-	u64 mult;
-	unsigned long offset, abs_tol, achieved;
-
-	abs_tol = div_u64((u64)desired_clk * percent_tol, 100);
-	maxdiv = CLK_DIV_MSK >> CLK_DIV_SHFT;
-	div = 1;
-	while (div <= maxdiv) {
-		mult = (u64)div * desired_clk;
-		if (mult != (unsigned long)mult)
-			break;
-
-		offset = div * abs_tol;
-		freq = clk_round_rate(clk, mult - offset);
-
-		/* Can only get lower if we're done */
-		if (freq < mult - offset)
-			break;
-
-		/*
-		 * Re-calculate div in case rounding skipped rates but we
-		 * ended up at a good one, then check for a match.
-		 */
-		div = DIV_ROUND_CLOSEST(freq, desired_clk);
-		achieved = DIV_ROUND_CLOSEST(freq, div);
-		if (achieved <= desired_clk + abs_tol &&
-		    achieved >= desired_clk - abs_tol) {
-			*clk_div = div;
-			return freq;
-		}
-
-		div = DIV_ROUND_UP(freq, desired_clk);
-	}
-
-	return 0;
-}
-
-static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
-			unsigned int sampling_rate, unsigned int *clk_div)
-{
-	unsigned long ser_clk;
-	unsigned long desired_clk;
-
-	desired_clk = baud * sampling_rate;
-	if (!desired_clk)
-		return 0;
-
-	/*
-	 * try to find a clock rate within 2% tolerance, then within 5%
-	 */
-	ser_clk = find_clk_rate_in_tol(clk, desired_clk, clk_div, 2);
-	if (!ser_clk)
-		ser_clk = find_clk_rate_in_tol(clk, desired_clk, clk_div, 5);
-
-	return ser_clk;
-}
-
 static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	unsigned long clk_rate;
-	unsigned int avg_bw_core;
+	unsigned int avg_bw_core, clk_idx;
 	unsigned int clk_div;
 	u32 ver, sampling_rate;
 	u32 ser_clk_cfg;
+	int ret;
 
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
@@ -1329,17 +1272,22 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 	if (ver >= QUP_SE_VERSION_2_5)
 		sampling_rate /= 2;
 
-	clk_rate = get_clk_div_rate(port->se.clk, baud,
-		sampling_rate, &clk_div);
-	if (!clk_rate) {
-		dev_err(port->se.dev,
-			"Couldn't find suitable clock rate for %u\n",
-			baud * sampling_rate);
+	ret = geni_se_clk_freq_match(&port->se, baud * sampling_rate, &clk_idx, &clk_rate, false);
+	if (ret) {
+		dev_err(port->se.dev, "Failed to find src clk for baud rate: %d ret: %d\n",
+			baud, ret);
+		return ret;
+	}
+
+	clk_div = DIV_ROUND_UP(clk_rate, baud * sampling_rate);
+	/* Check if calculated divider exceeds maximum allowed value */
+	if (clk_div > (CLK_DIV_MSK >> CLK_DIV_SHFT)) {
+		dev_err(port->se.dev, "Calculated clock divider %u exceeds maximum\n", clk_div);
 		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
-			baud * sampling_rate, clk_rate, clk_div);
+	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n, clk_idx = %u\n",
+		baud * sampling_rate, clk_rate, clk_div, clk_idx);
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
@@ -1359,6 +1307,8 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 
 	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
+	/* Configure clock selection register with the selected clock index */
+	writel(clk_idx & CLK_SEL_MSK, uport->membase + SE_GENI_CLK_SEL);
 	return 0;
 }
 
-- 
2.51.0


