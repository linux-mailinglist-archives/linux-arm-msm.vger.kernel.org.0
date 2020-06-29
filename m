Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1899020E5FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgF2Vn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgF2Shu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:50 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC92C03142A
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:07 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id q198so15989853qka.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=0Vr/iUCTL0YCeERQJU5A4XFXP9WRqstSxzdmUQD6ykn1ca7JzGnnei2ewZDfArLcSu
         CYypdB2pqO57zT6zodFJ+ZD2IJlbzrIK+M+0o5ZTdkG8QVZhgL9zkp0H1qxCaw466lPK
         6Bvj8YaLOMYtN4/izEybXm6/6yU52gkFLcOx+I3rM5FhrNY74YEXLbbNt48iXwhoEPPu
         iXBbUAWO7sDhCLWBK888xnmlUL60CSL1wubqDtYE+gsqRKrAtDHB1OF8tXE7vDS8nrL4
         PTrSsSyc3GZc2W9tFD0ZGVWlquLpWeYBoT0Xyb1zNWMo124SuQuu2KPXpOSkUPdRlH8B
         rUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=I7ROUwK3UIiU/So9m33oELOq7UquwoRQoBGfjzMVtwU2u39+Q7oHbfpUl3P9ZH2hYg
         yc4BRwhodJOHcqS0bWSiGAX2Z46rw50ojwClqskAMFI2WSyZ2ny4gI9MOClyxggD7D8Y
         0RsedqXSksimqgwsFlPqL3+NCI+XJS3qFRVsMUXZ8N/VjLBoOdPKBMHcx/onMzxcgopp
         DhaV/SdsoSol9Gx/869EcUVrdf/TTFzbJGoIbiUuXvDv7XkhFjosQ47ctBlVN1Xs9Lxh
         lcRfIVmPCaP7EJRN0q8J61r2QzxHZK7bt3OBdeFv21Z0sh1jNlElG+WbgVqFXTBVJKJb
         Kq4A==
X-Gm-Message-State: AOAM531UAVm2ufDp5DqYvZ00f3PZp6ioWwBOonIv/D2D5cDO5TFZUgCa
        KqYmzzbjIqd4WsdzBUdE8no4vkcWVNs=
X-Google-Smtp-Source: ABdhPJyEZvgI7BCAXGHakCfxARGoDPMIkgxM8m5Edq3X5e6ibIASdaGalKlTTXkySTsiXwmys77+LA==
X-Received: by 2002:a05:620a:483:: with SMTP id 3mr15187886qkr.299.1593451266376;
        Mon, 29 Jun 2020 10:21:06 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q5sm408363qtf.12.2020.06.29.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:21:06 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 05/13] clk: qcom: gcc: remove unnecessary vco_table from SM8150
Date:   Mon, 29 Jun 2020 13:20:35 -0400
Message-Id: <20200629172049.30452-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629172049.30452-1-jonathan@marek.ca>
References: <20200629172049.30452-1-jonathan@marek.ca>
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

