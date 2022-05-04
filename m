Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C19D51A5B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 18:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353538AbiEDQmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236727AbiEDQmS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:42:18 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA9A2E9E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 09:38:41 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q23so2806077wra.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OL4OygVzSjP0XpPxh6rx/xZO5NOzCq2mv5XgMowVSTY=;
        b=oYyGqRl+RkNxCmu3AtrgJ1epuLShDEh2zKmthdd2zyyjh0ny1iy04eQbZsZ9HsO6Yy
         1sOnO4Ey/7rwulblZuqmRNNxaWoFOlsGjv0aFfGS0JOHwMegU264vYleEePMLm0UtTOG
         y/1rPixgniVaVvQLXB+8XPn1mHuPziFoJU31mIIvF9FhhUcNyrvxzXrkAMx39vJJXBsp
         HlcgVBs9HyUqZkdhmagWsJqghrLpchIW4aBTynCDA8/PN3X1tEgvYv145QwcurJxn1+9
         dX9oSyTLTM617a4RdLfkjYlxFGrN7Vx2JovteDVSj+TSE0UppPjy79DGgOb4OcQo3gEm
         TwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OL4OygVzSjP0XpPxh6rx/xZO5NOzCq2mv5XgMowVSTY=;
        b=lu015YcNK4LeBTJIBj9xWlBkBIvb17mipEFYwc6rgrAbsaVlkSWa1mXwR1ET85RbHl
         ZQRJRA1QkejYLt0891kETzH/gVXpSLPfff6nKfz69alSNct3NioZUBT2wljfv/Fvxic5
         fNtpQOxo/xvOZHzU4XpE/hNrw9k/DoLM7tfdXF1HWLkxBEwS29YMrKcyoOzEcvjhrM+0
         C+gTcmCylCe8k8pfgT3oHIRzSUSzBaqGzq97sklA/dhWFpTj8mugNODE4rw5j2nzikSN
         FF7Q9cfBwk272ncbcQJepQEHGpJu6ZO+Zi2IcSeHn8VqeXQUdQzd6Ca7eHgVgrubgfjg
         m44A==
X-Gm-Message-State: AOAM531uxBletukvWyPMrqxg31UkBHY/wJerGMm23qmj76LwIExPTFkf
        5GvE5za02BfgR/H3uDAdR23qQQ==
X-Google-Smtp-Source: ABdhPJwQdjfgZsZ7V7FETHh2ZyzPmf5rJmM/DrOREnvSlLwPjMdu5PdVgQeoKPRuTaeQgZhKp8bFeA==
X-Received: by 2002:adf:ed03:0:b0:20c:4c8b:8e07 with SMTP id a3-20020adfed03000000b0020c4c8b8e07mr16843933wro.423.1651682319843;
        Wed, 04 May 2022 09:38:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 2/4] clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
Date:   Wed,  4 May 2022 17:38:33 +0100
Message-Id: <20220504163835.40130-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing qcom docs for the 8939 we can see the command rcgr is pointing to
the wrong address. bimc_ddr_clk_src_rcgr is @ 0x01832024 not 0x01832004.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 40c20745a024..49e4bb87c46a 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -634,7 +634,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 };
 
 static struct clk_rcg2 bimc_ddr_clk_src = {
-	.cmd_rcgr = 0x32004,
+	.cmd_rcgr = 0x32024,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_bimc_map,
 	.clkr.hw.init = &(struct clk_init_data){
-- 
2.35.1

