Return-Path: <linux-arm-msm+bounces-97057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AKAEXK3sWmTEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:41:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D365F268C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D863305364E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9D33EB7F4;
	Wed, 11 Mar 2026 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsIX5GOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58E3EAC6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254402; cv=none; b=KZLPecw7rdknWY95mjxNYHUAp1k6+EY2SGgAIySdbgdT/B/zsR5dTzCMqRJRO9rlHouSyGGxNNGQDxnPrrK+zv+2vNkt377OB/v3K+z/FR2ijfs+q+SdAer1DUt9SOFI1V25U2tdb79q1Oqhjo3a4AF0O5nrFfJNsxsxWvNgT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254402; c=relaxed/simple;
	bh=l1kAITtOZcQOmSFLzPmQl3EIsJ/gX0Hpg+PJUyHpctc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJypOl5OJNENrTMSJqvnkXFItYWtRC/PwpZxC5Jf9FDg4tySNqiAtfzx7zBPeLhetAeUyDWOHztuI8CnTD4j03wmqg4kRkntaE5B9XlwohiruHH1G1UOKowque1KcQTcfXj/6501MNUUVqkdb0NofVyU4bDk4oDVU41Us+6ADBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsIX5GOj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853aec185aso1302675e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254395; x=1773859195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm4Ve62f3rcwFTWsVQvRStE/hVreGVU1FcOWBt3eIAU=;
        b=KsIX5GOjYv/S8g6KCjuks1wZflpCKL1EH1okeJbbsWk9xPSk/B+D/EUYIP8rfS/nu7
         NY8z6QVpUhyq+O46PPKCq5WVOeOJ1aez6GxGMmDuzngFD5G1mjvE1zREQ9x75uEmzNqi
         LB4FdOrDlSO1OJxLYcKLpD0QO7KHAnOx7H6vhimK0RUZ16QsRnBMD/bHPcpFpNMfL2D+
         7DxvqWa4vqYCt7focD+xufcIb4nIDqfIFwjjDN41X8Rt7db1yzoNqzNGprypHSEtBkNf
         scZ6V7a6ilcLOdtFOnwlqVhSckmT8KyMjPucnsStUtGR+x3pN1I51qJdAKzErCvozxVo
         Ujow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254395; x=1773859195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cm4Ve62f3rcwFTWsVQvRStE/hVreGVU1FcOWBt3eIAU=;
        b=Ktle39Gm468XW1GFdBYU6oYyBF8NNGhsvSqz90SypM/6lLSfwANx/FTduO2OSqHHzp
         cviKB3cFBh/5qgbNxJyEeOBUt4mBobX/YVT+SYfU94a4Wgy3jZ2ml18Rj+oSlPa3+yt6
         le/LcQUD532CAPV1+6L8g63QN45oxv5WllzxXSuBOZBJUK2kmanlwFK/YHRvdhQe6l6U
         kq5slhGNTDdpTGUgnVUGgCy9M21jeuwmFeP1BkWtAi/cdF8UBysZk/3+EqDIIMlLkYD3
         F81UtXNHwWnmRWd+0B1VcFTG2VQBDjNX4VnwHuVpWphBCWGBZu081J5vJdYmqL0ioVMJ
         0o6g==
X-Forwarded-Encrypted: i=1; AJvYcCUD4p+p1HOjEYXsT4dDOzUTDCzqEVyClxm0kOHft9IhvEqss9cIxO7RMuokjad2OpvSgXQaDx12yymvOKvA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vg2jyJWZ+/hCwUzqXgZzviiDPLFs8cP4mSXm03gfd1vnnff2
	FLYlPSMYtNwdfiMHetzbMikm+lrGW6b1/i2njUXhbZAg8+aUSYXZI3NQ
X-Gm-Gg: ATEYQzw3qgPZfkspzHauzG6Muzs5XBEcAg1mfyDiDHA+Mo2aJtjkb1tdEuuK1Jwjurr
	JK4hqpk/05qTHtCabTvr4CQgi5nPpM77/k4BZaCRjUFE3MhoDXizdb04m/hrTE027kBQOeyQRPu
	o6FGhG+YL8+agWIoBtXQtmbfb3vC3eRDb8mnStCuBJwyYx0VOTsbgn/G3h2j13XTAsDqzWZaSx7
	NdNE1BxgTf2E96GrRxwCcNCVpiNh3SGsl7ystcSOmsFZUvbNmH1/Q9P+O7q2rC0mkvjYfJ+QFmF
	Xu34+2kEDVv3xMG+sO286rTeeangkK91QUKx6V3LEMWyOzKVvxCsogGgtj/l3e2k8EAkYOZ8e6b
	0KxVnt4b4j0yURpET91l/Hhc4wZORv0aPT0FntUzUjexwDy+9V8sB/8oBPCrAAKDAdwALze2Too
	IrkNBoaOevaZlbpeXC4GN1l1xEgu4+SaROciWcICIrnHvUzoXMHvP58o0=
X-Received: by 2002:a05:600c:19cf:b0:485:49c5:8eb7 with SMTP id 5b1f17b1804b1-4854b1012b7mr62036215e9.22.1773254394912;
        Wed, 11 Mar 2026 11:39:54 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/4] clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
Date: Wed, 11 Mar 2026 19:39:39 +0100
Message-ID: <20260311183942.10134-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311183942.10134-1-ansuelsmth@gmail.com>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[phrozen.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97057-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phrozen.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D365F268C34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: John Crispin <john@phrozen.org>

The CMN PLL in IPQ6018 SoC supplies fixed clocks to the networking
subsystem: bias_pll_cc_clk at 300 MHz and bias_pll_nss_noc_clk at
416.5 MHz.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafbf5732048..28d655d6320a 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -52,6 +52,7 @@
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
@@ -117,6 +118,12 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
+	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
 	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
@@ -448,6 +455,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
+	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },
 	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
 	{ }
 };
-- 
2.53.0


