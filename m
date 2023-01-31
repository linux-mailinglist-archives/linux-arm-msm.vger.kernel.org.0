Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0CD6828AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 10:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjAaJYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 04:24:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjAaJYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 04:24:37 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3923C27
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:24:35 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id gr7so15122158ejb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmC1IkH97rxflKvJM0pwi7Zv+nkNsmEOV6trrwONEdE=;
        b=Ey0/yFObwrz2Tu8+/zA6YV8K/tqRzhzaInUxC0IjUNj1t5bYMLJTf6leJ/pMynwTbk
         qvOrW+ikumJAKa0QAuTaMqmdAYyJ0XZFwW4VaDawyAJrNZT/R3oIfTuNPJZynKrhvZ6N
         ZBT6qalLOxkrDEvO+/Beu0mq4EpyjQYbaWh6MrX2TFQpDcHIBdK5+H2vnANKYjoZrYKL
         2CHIcfzfxsrJgHb0DDhil6NBe7LkffdI/FqXbkks+GoecdPvWCDNXq9WDt7UCMW4GZXn
         Oem+QAKGbUTc6349YLqDre/k8ehOwbjFPfWdS7Wzk0aIhRema5pZ90gBBXOsQewohUoO
         GIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmC1IkH97rxflKvJM0pwi7Zv+nkNsmEOV6trrwONEdE=;
        b=u4spXc/GKpPDlcjqhk3wdUv4e+EipP+/WVdTovMKUUqi4dE171UttwBuVnHiH2D5hb
         /l1mMwa6ilGciBtElNkrIVM2y8mqcs9yMDz8YUDs/ZW7ifpXbQRzTR84ORGG7EoRA0vq
         31zr4bWxsPnB/Ib80EfvsVMmzC7JPwc969vMZXP48IJRQi5MR7irapiqj1YitjZCa6ne
         ZepwHCeUf9dZyXjPLATW/yhUl2Nb8jNyFCTjEwwg6VJeXuAJD7SaStQGmA4vtUIsf+S7
         Ig9g6248w2jpTykSBerrpJ38ydpzCFiKypBBVtS47Fa9Y41Cz69s2QhMayMVGAZ8T2EA
         gtmg==
X-Gm-Message-State: AO0yUKWUD3KZcyagvdMpIQoRPe4Mi6aiaXSNYnNDqVCSrnZaB43bdgSl
        MAyfrwTomCnl2yxxLC7PxgEBmw==
X-Google-Smtp-Source: AK7set9+gcfVbBMMs2xFrIxgkK39fXYlqkP8FNFp5ZGZG0JNcMCMy6HrWdwtXF4WGNKXUZ01Cn6WeA==
X-Received: by 2002:a17:906:18ea:b0:878:5c36:a14a with SMTP id e10-20020a17090618ea00b008785c36a14amr19918559ejf.23.1675157074388;
        Tue, 31 Jan 2023 01:24:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0084c7029b24dsm8205198ejb.151.2023.01.31.01.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 01:24:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
Date:   Tue, 31 Jan 2023 11:24:31 +0200
Message-Id: <20230131092432.122711-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
registering the GDSC (writing the value 0x2 by default). This will
override the setting done in the driver's probe function.

Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
function.

Fixes: 745ff069a49c ("clk: qcom: Add graphics clock controller driver for SC7180")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sc7180.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index c0b2c7af5f93..3f92f0b43be6 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -21,8 +21,6 @@
 #define CX_GMU_CBCR_SLEEP_SHIFT		4
 #define CX_GMU_CBCR_WAKE_MASK		0xF
 #define CX_GMU_CBCR_WAKE_SHIFT		8
-#define CLK_DIS_WAIT_SHIFT		12
-#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
 
 enum {
 	P_BI_TCXO,
@@ -160,6 +158,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 static struct gdsc cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait_val = 8,
 	.pd = {
 		.name = "cx_gdsc",
 	},
@@ -242,10 +241,6 @@ static int gpu_cc_sc7180_probe(struct platform_device *pdev)
 	value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	/* Configure clk_dis_wait for gpu_cx_gdsc */
-	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
-						8 << CLK_DIS_WAIT_SHIFT);
-
 	return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
 }
 
-- 
2.39.0

