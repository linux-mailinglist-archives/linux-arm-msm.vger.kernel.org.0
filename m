Return-Path: <linux-arm-msm+bounces-112198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mMx8HrQhKGoB+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:22:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6E660F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:22:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ysX01lqr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEAC03079FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A503634E762;
	Tue,  9 Jun 2026 14:15:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24F349CD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014526; cv=none; b=TBDYOgUYrtM+XiihCsyi2G/W8/3pcg0rDoiSsSbsgR9NJVxaJMPpIwbutvH+YZ/UzC7v4QFuwTNQLKTIblk/ijq0pZv+cjCi6m3X1F2+/zqvKhixGPW0mKEuLnIalWqYr0c4n5j+yhMU017BVvNsA2jeVM/rLtLpq6biDNLOa+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014526; c=relaxed/simple;
	bh=issgt3k3RvI/5CGJJzJAMkNYfQCHRM53jrOTT6DroO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj9oKVwxoZkBvuc5kJbj4VS1G0bKZFSI9i+Qi7rjToNtJlBbZ8GZaIQ0K/b6Z0nfqlkU3VS3WylkiEqM5iViVUIw0D55UUIlIxIsbxBDOTyG9ElGNQTnlRQYCGbs7/qs3w2BJlgfHF0MaamJH6WCg8mnqiYb2hzmb4t7x5rhOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysX01lqr; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19582085e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014523; x=1781619323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXs3e9o8/qwduDh5D/7PUgnbBUvjl2lx8El20vD0f48=;
        b=ysX01lqr2YfYZ8Hb2mQB6O2oP74cHzWHtHWS57DLP+g18P+yI6Cf3MamQI9SpZNMXH
         mobdz1rxaZt5aFyKMook18Ds07NNFJH7ruhsgbdAUng93eifT2y1bwEm8J591Iytw6dX
         S3XKuLhooyMhT9ozK0Z4CPyAfSWLSFOHBoAzm0ScgROlReIV5eoOavn4/3p+ms34oD65
         16TsKF7BhRpp2WBbF8cTAqxwHfYoSLUM7mk+wNHNq9J2vG+mTOstdRUnTU7E/2zfmK2n
         NhOJ7gG6+8BR0jEl/kEwXJa6Z8d4RH2jNqput+CuhFP8/f2zdTlt/sZWzU1GEZGJIP9x
         V2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014523; x=1781619323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXs3e9o8/qwduDh5D/7PUgnbBUvjl2lx8El20vD0f48=;
        b=CnuAig92dCiCN2GQ6ybQvtZyUs9Nk+MGltlO60KrHHftQOLtVB4dChJ1pzbPo0VogW
         ht6nRQZYJNJ4XXLPIOOx053J/OGSXTn+/baX7gWewDgtlSFvD8O6Wpp3iZMYaY+jEFJF
         4YSF7RjN7naFNCihSe9ud3WhDxDupdTYyh46nz+DCz2KQqNOiBBsuJ2iouJQdYN8D4j/
         OeDO+aboANnG6p5mu7O/95F5MBkdX8DYuq/a8R7RVfjG1up/6/aQUKKXB6o+ZxxsDxGI
         9oXEQ169BrE0GxQCFTtVFEY7tnOG0t4yaaPkr8uLrckupb3OqvCWW7f3ixDGaw+9ruvf
         Kc2A==
X-Forwarded-Encrypted: i=1; AFNElJ8kjkHMF0XTKDIOe6f3oizLCCyJ5wyxshSttJuS83OdpMsi+8SyWWKlllWSrYuB1h2Qp5BcmPkxuBOLjcrY@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLNrWBu0TqRi2zvB7d9UDCLXm8v5NIOPSur3eHo4j4YpuVwcy
	rmeUb4FUhUeL7/NvpGfYKjRdNuLEpQp+DQaHyICfMoD2G25QgMvBPfxF2F3i5KfQzLY=
X-Gm-Gg: Acq92OHZQLxBuRGH0sMyzoNnDKF2+0JfNlQpSZDfJ1vvsXDTg2UfH4O9ZQrYZ5GJLqG
	sZGznLeSeSIOBiMcSqPc1XP34GyB1CXPLblPYg0aqOhj+v5owszZZtuMwID1KjbBnMKA1D3QjnQ
	MdWgukiN/dkxD6pysVVfx1ghSPVHprd5uLUOXIlzImKX8ZhKFU3h4OfyGy5GncS0c2cE6ao2dTl
	7rX+zQY4Sk2T7FATNI+OTZ12EQ57W9kTSdGdIbRPyYZzejcAYiZEqZYZgLvKBgTJkm+CnK+kVJ2
	+RwlkeFGbYaylHVir8DiWADbMKxjTeh28wWN9V+KvaUn/IpuZ8XJ1JAOPoEQYpJq2biPG7p1RR7
	DLfImp3ZsNWuA9/X01s4jdrMQ+841kM1vCyILj1y7joMq5kHaSYuqLIT2RhTDdx45lFAXLXD+86
	1+Qc0BqAkz0XKGbGEgb3h+SDuS7weAb0e5nn/8fB/C2RQg669wjmFQa0wKSA==
X-Received: by 2002:a05:600c:5246:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490c26196e9mr324507225e9.32.1781014523109;
        Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:43 +0200
Subject: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112198-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5B6E660F3C

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not seem to exist on MDM9607. Reading/writing the registers
always results in 0 or crashes. The math in the frequency table is also
broken. GPLL2 on MDM9607 runs at 480 MHz, so:

 - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
 - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz

Presumably, this definition was mistakenly copied as-is from gcc-msm8916
(which uses 930 MHz for GPLL2). There are no branch consumers of this root
clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
parent instead of this clock), so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 7c1890934fe8..61809e221d69 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -677,26 +677,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
-	F(155000000, P_GPLL2, 6, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
-	F(400000000, P_GPLL0, 2, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 apss_tcu_clk_src = {
-	.cmd_rcgr = 0x1207c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_gpll2_map,
-	.freq_tbl = ftbl_gcc_apss_tcu_clk,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "apss_tcu_clk_src",
-		.parent_data = gcc_xo_gpll0_gpll1_gpll2,
-		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(57140000, P_GPLL0, 14, 0, 0),
@@ -1515,7 +1495,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
-	[APSS_TCU_CLK_SRC] = &apss_tcu_clk_src.clkr,
 	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,

-- 
2.54.0


