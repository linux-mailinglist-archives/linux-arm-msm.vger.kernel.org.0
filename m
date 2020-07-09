Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1348E21A14D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgGINyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgGINye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:34 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB070C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:34 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id l6so1803537qkc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=Bm+cJZcw8lBOA1VWMFEuZRinjCzdRz4WsrMdSj8RPciFM2TAVO10U5xCHYrdWCqXe4
         z4Zz9Hna7qm1epZ0bjKszQeIhAXoTUUPBoA6L1yYnz+I4eXH1tIc7eJxioJ6+22L6MQW
         kRFs0D3Q1G+podAogNq+sk0z3uI35NbsRxJ3zSeD2tN9d44Gr6eFOZ7psSJHCS6acAKy
         Nrzn1M7uopQkkSUGgG9F8IadyeYlzmpfsKR4BxplGOwHftKbhr68TpXPtoLQPmPxdqxP
         CdhOKRGuya9Qk7pP0IH5PfqP6hmairkT2LSL87vW032Lc1wkA3UfPaw3w3hDKQ9NyOgj
         buzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=sqzSzZEtn9CL7a2DebtBfmZBcoHjAUKdrSvs6UYferfFLk62rsBKhX3gkecBqGNz50
         qsTjo8GLyFUS+uuJ1nDvgejLCl6CZ+aOURRQZYma/nKpdOu+oaVSiQGU1JEVDLW3Joee
         5Lj9yDl8IZZ73m4ui1fCxNI/0EPxBAUl5S1JFyyOjVEbCch5m1xivPEwoQGgi3JwIPEQ
         gxQvfW2UjPFM2mMLQDzHLIRaTpE+z/jRQiYl/4nK0jH26g1FcJzTXDdsnT5tojahe8hb
         xmq4j215THcbRr/KnHun6jt23+MyUIK+WrdepSJhbc087gjZAUmMPPsf4M828xdfQLJD
         Dydg==
X-Gm-Message-State: AOAM531GeZfSzwf9rucFRGf7tkcUuxa7NqkC2OXH+roif5YvFacWlV2i
        GIoeBfpp8yIS2fdLZwwa26ienRLtJrw=
X-Google-Smtp-Source: ABdhPJw37kH3im5smTGeBCDUSp/SURXzq5WwBzBJ0ebLhKt5prhiL4Fb2+HJM8hrRJso76++VGBqaQ==
X-Received: by 2002:a37:93c1:: with SMTP id v184mr50690654qkd.480.1594302873710;
        Thu, 09 Jul 2020 06:54:33 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:33 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 05/14] clk: qcom: gcc: remove unnecessary vco_table from SM8150
Date:   Thu,  9 Jul 2020 09:52:36 -0400
Message-Id: <20200709135251.643-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The fixed alpha pll ops only use it for clamping in round_rate, which is
unnecessary. This is consistent with SM8250 GCC not using vco_table.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/gcc-sm8150.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index d7778def37da..8e9b5b3cceaf 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -34,14 +34,8 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static const struct pll_vco trion_vco[] = {
-	{ 249600000, 2000000000, 0 },
-};
-
 static struct clk_alpha_pll gpll0 = {
 	.offset = 0x0,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
@@ -85,8 +79,6 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 
 static struct clk_alpha_pll gpll7 = {
 	.offset = 0x1a000,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
@@ -105,8 +97,6 @@ static struct clk_alpha_pll gpll7 = {
 
 static struct clk_alpha_pll gpll9 = {
 	.offset = 0x1c000,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
-- 
2.26.1

