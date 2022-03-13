Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBE24D71B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Mar 2022 01:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiCMAJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Mar 2022 19:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiCMAJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Mar 2022 19:09:41 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D656C27CCF
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Mar 2022 16:08:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id w7so21201659lfd.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Mar 2022 16:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilP1+7AJBfMYUe+DIgXYKmiO0YJG2g/CKFahuOfrV4A=;
        b=Xc787rxs/LHKDJgjytEJLtfctTPySfcsW8AxhPxc/5IiO6k7sCcUi+b02tE7woCGvA
         svqVxxduaihMYw9P+YSFjLHiNcqW0WUdCUGt/wfcNJ1njqWt8AUAUjmMFNriMml/X5ax
         8Hsc55cB3pDjmG7FMguD+1wT0LPDnartSzAqIpEToKXcj2QSopPQnLVPFAxrbP7UBc6Q
         6esj0BV9HUmewxQW1uat+0GvKoz6oaPkOTL3P3Nl+gTMvv9TAZpwevO2+fv/eozP+N71
         9+PON/v4bE07uGqxk5xQ+cMpgPxfujnwak6G2CytYGUy1w7jqISMrWGUx7u0SeZP7ROL
         5m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilP1+7AJBfMYUe+DIgXYKmiO0YJG2g/CKFahuOfrV4A=;
        b=WxPDrodzzcgYJp4/kXdjMkzLuPQV5d5cBJURaSYtXJmJnUg4iPSxuvyDQrqIpbq0/2
         bnr3zULFZM4duJ5CQSXrPew/ZIu1YUebnLNAmuANXQi80r9FCWjbyBXhLEDbyAzxGU3d
         5EmK47Nm4wB8Qqt1+g4xWi6kWChLhuvQ+9aGbQNuptnlA2+zdNgBghCD5qv7CodYv+nL
         GTP3zDcXFi+8y2TPpo9Ms5EvtjiIKoFxj0NjTpIDmGUZzPpN5VwzfIPcJSX27CQxTzw7
         TUWD77KXwSkAWfn7PUFYZNAc8fLcZ7OWRpxyr4Jdsmmb0byDXvo18P+f1IZ1xMPmAtx/
         c09w==
X-Gm-Message-State: AOAM5308jcZZfqp6rlWhIlVTpcMIXTPv4vLaZqVN9iQ7M+DsdTNuCHDx
        gZ+1LEa8UoJynbkvNvQVrtS/kQ==
X-Google-Smtp-Source: ABdhPJzZwqHpMHPefLQgpDDrd1S3uzIXmdVF2PK8PIRtbX07ge4OD7PSEj8zxykljoRWpRYFEwwK3g==
X-Received: by 2002:ac2:5b4d:0:b0:448:205c:ed0a with SMTP id i13-20020ac25b4d000000b00448205ced0amr10112626lfp.514.1647130113179;
        Sat, 12 Mar 2022 16:08:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (pppoe.178-66-158-48.dynamic.avangarddsl.ru. [178.66.158.48])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b00247dbb3e476sm2776017ljp.40.2022.03.12.16.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 16:08:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [RFC PATCH 2/5] clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Sun, 13 Mar 2022 03:08:21 +0300
Message-Id: <20220313000824.229405-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
References: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
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

Use newly defined clk_regmap_mux_safe_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 593a195467ff..a5323d20bc0d 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -243,13 +243,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
+	.safe_src_index = 2,
 	.parent_map = gcc_parent_map_4,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_4,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
@@ -273,13 +274,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
+	.safe_src_index = 2,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
-- 
2.34.1

