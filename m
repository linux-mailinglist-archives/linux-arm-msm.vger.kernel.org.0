Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD7AF51A5B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 18:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353543AbiEDQmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353535AbiEDQmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:42:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0292433B9
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 09:38:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id ay11-20020a05600c1e0b00b0038eb92fa965so3556010wmb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=38ClWEkxwOkXXNm+XYK/eFquNVqFN0ERCueF4DUI9W0=;
        b=rXhYjCmjf9bhnUdJNozUrqQTYnR4R2fQno55E4cZ+53s1nH0nJaIKPb3zYa44gijnq
         QriH4xru9Y652IlHoMXQ5qO52z0mvsq9CL9zCpzZS8l6NXtRFyQbFgQ4OZ1HrRSm6HCz
         fLZxf/bBJjF6KD3TNXtCNYhX/3ywc5QQwHzKywJ4riHEpEPtoI/OMWfkpG/GykFS9WXn
         7n+n0+cYaB1O3VEgeOUIwIQb0jgnSAFPqBhFl+20PT99+ir//AZ9QxFOynW5JA9/Qn1f
         aSqvjWwMz7Pbdma9+rv292sTpfI6CmkMGNrXdBKucNdjVQeq82Bwz7Bz37RvuW75bo34
         Bpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=38ClWEkxwOkXXNm+XYK/eFquNVqFN0ERCueF4DUI9W0=;
        b=iwlSmArt+uoowDoinM3qi8njleM5S+GNMd/5HSMXMcN18/Vbj1fIZPojKOaI6x/5+M
         XDqsne+uO9HHVEK3L80qzQNqoWC1FiL8+ZGjdXiUEepFHc6rxPj5HsTmj7pgYwIvey46
         3mMjZ5IHSERs/pO7RRvlPC33OBECbzi6HmGkxXn/9mRlTcvxO/teQ/KdUhsjWTz02R3P
         BW6Sv02GCPo8jE1uW53BktVJeWf9InAFM41f2xtiWf6pm7Wb+DLLiKWK9LfXzwVADG+t
         0Ern94srv4/J61Fpv2UB8kZPnZa2G8VYsqqtyc1T5PMeTPNhOPN3NDkJU1OJVnE2y7M2
         XACA==
X-Gm-Message-State: AOAM532tQ54udM/gwXJbB3l/cYc2SJD5669c7gR7tSo3IHdH2PUxjrO8
        ishpo2DNMFufXkCAR+slRCY0oXIpNqbD0g==
X-Google-Smtp-Source: ABdhPJzsT6sR1T0E6s0s01EryMt2r91p3wfvrzVRSwtjSqrHfVkFznXo4sK66I+uTUGhOokWM1eJEQ==
X-Received: by 2002:a05:600c:3ca3:b0:392:990b:af11 with SMTP id bg35-20020a05600c3ca300b00392990baf11mr204832wmb.173.1651682321181;
        Wed, 04 May 2022 09:38:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 3/4] clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
Date:   Wed,  4 May 2022 17:38:34 +0100
Message-Id: <20220504163835.40130-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8939 has an additional higher operating point for the multi-media
peripherals. The higher throughput MM componets operate off of the
system-mm noc not the system noc.

system_mm_noc_bfdcd_clk_src is the source clock for the higher frequency
capable system noc mm.

Maximum frequency for the MM SNOC is 400 MHz.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 49e4bb87c46a..f27e19035c4f 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -646,6 +646,18 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	},
 };
 
+static struct clk_rcg2 system_mm_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x2600c,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6a_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "system_mm_noc_bfdcd_clk_src",
+		.parent_data = gcc_xo_gpll0_gpll6a_parent_data,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_camss_ahb_clk[] = {
 	F(40000000, P_GPLL0, 10, 1, 2),
 	F(80000000, P_GPLL0, 10, 0, 0),
@@ -3625,6 +3637,7 @@ static struct clk_regmap *gcc_msm8939_clocks[] = {
 	[GPLL2_VOTE] = &gpll2_vote,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
+	[SYSTEM_MM_NOC_BFDCD_CLK_SRC] = &system_mm_noc_bfdcd_clk_src.clkr,
 	[CAMSS_AHB_CLK_SRC] = &camss_ahb_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[CSI0_CLK_SRC] = &csi0_clk_src.clkr,
-- 
2.35.1

