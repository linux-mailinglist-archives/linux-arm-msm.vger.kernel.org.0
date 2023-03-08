Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C2F6B13FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 22:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCHVfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 16:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjCHVfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 16:35:48 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B87D13C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 13:35:41 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g17so23135234lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 13:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOECaGmGmUJLrulLw8TRNrQNT4lkSkMI20VbWaQaVaY=;
        b=o2v3nZSRV6jX/ICAGftZdATJ2s6wCtxca6GFrbERkhh9MKuTWUSGF+BS2bz0fruDeY
         p6Tz9BBV0QTw44vdXR6hLNpREOYFMDUoklZE9yGtUmec+0noRMW7rU86LKQJHZYsyI2a
         rypoiclDLhzo2+DkRr9+/YTCI5syEXb71RRCosKKjs54FLmsTDaH0iBjFv2Egd7iMgqd
         9RA59HOR0gQyDikhy8X/zS/Ehx+jPhm/A4bWv6UzHb4emXNMH9bxcYnDf2Hwd8N+KYcv
         N1kGQBANwqL8cVLv6yaMyeXFcLvUvCBlTm7c5+xOhgTnqD+cQH9f7oDL4Tpzb06icVfu
         4lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOECaGmGmUJLrulLw8TRNrQNT4lkSkMI20VbWaQaVaY=;
        b=NEXn/ToB22QWCZCYY/jEfZFuOeYhHfYYQNZFGYNwAfPKmwmr8pTLZk0uiCBhMASI8s
         JSCEKk7v9N44Ko94hoc3DyuUUaMrRmqrfD1NYffcwoRxDapTSmvMAJWc+Y7kHAw7kqUk
         OoxGzBj5ZL6VwoTu/MlyEGu5EnIi2t4OetDi2OWPtAfo9yDTHfGe597IxV4bsvS94XDG
         n4Hs13fdxnjpXJHpxAeDJ9VgytRGaGHDEJoJ9Z/J5nBYuXkijuSL+SI9QnPXSFa7VQaN
         YvgCzXYFRlE8jlrBHZ2aYxW2TXFOC1UUx0aWZbCBBu3QHDWTomndHv8TNKuCGmVQNrhk
         ug8g==
X-Gm-Message-State: AO0yUKXRxafO2v1M6wpkv6QbRDmg+rEX/Vqsk4Opg1pABYftqf/DvrYT
        SGOqnKsNJY/7a1hk7rj2pVrZSQ==
X-Google-Smtp-Source: AK7set+DhSpnXnr9I8EDcOc3nQqFLUuF9k/Txcs+BH+Z+yUwfbbNUk8TN5SUvxdNTY58WT65NosnFw==
X-Received: by 2002:ac2:46c9:0:b0:4db:1bee:c with SMTP id p9-20020ac246c9000000b004db1bee000cmr4952816lfo.44.1678311339444;
        Wed, 08 Mar 2023 13:35:39 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:38 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:18 +0100
Subject: [PATCH RFT v2 02/14] clk: qcom: smd-rpm: Add .is_enabled hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-2-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=1448;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DkAvY529UR+RwkQzY1FO48/jck/x44pR7ssps7xiA3g=;
 b=bMTX86MhRue6/CH4CAoR6mX0UhkJTn6HwQaKXt995jwdXJIOSTvZ4jiIt70kDOEqeCI115aI/A1n
 ZdtbcESyAwGjcxMnj2Cdm9vW5rThMJ5JfMdD6oFC26GRd42RhZeu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

The RPM clock enabling state can be found with 'enabled' in struct
clk_smd_rpm.  Add .is_enabled hook so that clk_summary in debugfs can
show a correct enabling state for RPM clocks.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
[Konrad: rebase]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 198886c1b6c8..ecacfbc4a16c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -424,18 +424,27 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
 	return 0;
 }
 
+static int clk_smd_rpm_is_enabled(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	return r->enabled;
+}
+
 static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
 	.round_rate	= clk_smd_rpm_round_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
+	.is_enabled	= clk_smd_rpm_is_enabled,
 };
 
 static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
+	.is_enabled	= clk_smd_rpm_is_enabled,
 };
 
 DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);

-- 
2.39.2

