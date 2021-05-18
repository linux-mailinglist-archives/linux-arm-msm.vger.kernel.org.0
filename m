Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364E3387F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 19:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351179AbhERRxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 13:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237923AbhERRxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 13:53:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82BDC061573;
        Tue, 18 May 2021 10:51:59 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id et19so8875517ejc.4;
        Tue, 18 May 2021 10:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsP0X9SD53wNifUOWr66qcQ19cCdk8WhX9LQttz6sIY=;
        b=FdWvFUcLxCoxgP1buQNZhEGSzhIHgFkHCRHBfPdFYJ1OIehb32ub9sZjPb1nr0s8uX
         3l0bc+a5rMbDhXeDqIRf91Bpe5v7182nqMGTofj1RWsKVFjCjUVqogm+CyzFoDksUoBe
         x0onZULmcG2mrCjtztIaSthMQtRVJHuyOYnpTe8dhfONXB3kNEJtpxAx3uMWF5deQJe1
         hiZFJi9bXkkN4vj8/owdWxTH3PHXo4kDsEZBO1kadVrkeE8pTsbx5iPRgJPAgbnSTf3y
         g2GVT5EfyUol13i4LDS7pr0s77k1ic3BwiUUaM48XVUgPV77sR0po7hd8yuZietlfD9f
         1fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsP0X9SD53wNifUOWr66qcQ19cCdk8WhX9LQttz6sIY=;
        b=keEa9E4mGZ2hxGbDuOXvFBcdWWeB8M0dXfAgA63maVJvwmUAdQ1U8dGICRZkAb7zzX
         SXSHkYsVyT2aNn3uWStWzwJROnaZXPzrbHA6tLPza29JjGOv1kSD/zuVRdfhhy5Ouhbt
         vX9kD4i52TYUcZIZSL1M7H1nk1HH4rDGBZhci/pjA3dIWUOy/Hwzvs5G/L2s2X0EnmCa
         PxyGZxLgRS8tFYP0JX7xnM6DLYBq+zD5tEjn2sGGeMVGU8+UGbVNof5+UeB0SgzDwIUu
         ksAnK9U9wnUSSdvrI2sR2WO+q3QFgGqnOpXL+eiUWWIkJ1Cch4W44Cuut0PIREOAoqat
         GlYw==
X-Gm-Message-State: AOAM533UxHwXxjN9SF/7uykFP9yu2/Z2/o1BB8r11t/jE0F0VA5moMf9
        sfS+lWXxFefXyZWIK/I9OMY=
X-Google-Smtp-Source: ABdhPJyAQTCsHL5sZsq0vnHwyze01i0vgx3SISlC7frKJMr+wLWxjjDHrqUF/e9gI5X/3/uvDL6eBA==
X-Received: by 2002:a17:906:3419:: with SMTP id c25mr7139419ejb.96.1621360318465;
        Tue, 18 May 2021 10:51:58 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-66.xnet.hr. [88.207.99.66])
        by smtp.googlemail.com with ESMTPSA id w14sm13511513edj.6.2021.05.18.10.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 10:51:57 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] clk: qcom: ipq8074: fix PCI-E clock oops
Date:   Tue, 18 May 2021 19:51:53 +0200
Message-Id: <20210518175153.3176764-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix PCI-E clock related kernel oops that are causes by missing
parent_names.

Without the use of parent_names kernel will panic on
clk_core_get_parent_by_index() due to a NULL pointer.

Without this earlycon is needed to even catch the OOPS as it will reset
the board before serial is initialized.

Fixes: f0cfcf1ade20 ("clk: qcom: ipq8074: Add missing clocks for pcie")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/clk/qcom/gcc-ipq8074.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 0c619ed35c82..8d8b1717a203 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -4357,8 +4357,7 @@ static struct clk_rcg2 pcie0_rchng_clk_src = {
 	.parent_map = gcc_xo_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie0_rchng_clk_src",
-		.parent_hws = (const struct clk_hw *[]) {
-				&gpll0.clkr.hw },
+		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -4372,8 +4371,8 @@ static struct clk_branch gcc_pcie0_rchng_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie0_rchng_clk",
-			.parent_hws = (const struct clk_hw *[]){
-				&pcie0_rchng_clk_src.clkr.hw,
+			.parent_names = (const char *[]){
+				"pcie0_rchng_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -4390,8 +4389,8 @@ static struct clk_branch gcc_pcie0_axi_s_bridge_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie0_axi_s_bridge_clk",
-			.parent_hws = (const struct clk_hw *[]){
-				&pcie0_axi_clk_src.clkr.hw,
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.31.1

