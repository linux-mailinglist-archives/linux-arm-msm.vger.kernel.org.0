Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4107B75E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 02:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239117AbjJDAbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 20:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239265AbjJDAbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 20:31:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EF69E
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 17:31:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-503397ee920so1797396e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696379488; x=1696984288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is6O+bR+gqOt2V7xYDfe09jbtEu4FjLn3UWhcpanc7c=;
        b=pz5aWqqm8/eE0citirgXnTrY7w9xmhizNT/Y7b/4OjZluyxdjWAj2eLaqobHLOjsBp
         InC40RuEp0uB1wiZHj0rvn7VdhxR2Nk9Uy7rZLZqzwVrt6fmIt4Z6CTJI9gGg0NlqocK
         yR8ODRljjXeUQdMu9rJyQNaRRn5tdu2g0Hm9WQkChYgwC/0VMzcfkT/dQ0X7CyIJBuzo
         76MceW5smhsudyQTBAv/spU+cdDX2PkFhs7AVq43+vzutG0cPg0a1li3Ul/bAlaMk7Ko
         /unjpL53VWnSwYILBs2q+A++EahvHZpz7QJxrVxsi+DHzr/T+/GDF6qFsXqUT6LeiWbe
         r8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696379488; x=1696984288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is6O+bR+gqOt2V7xYDfe09jbtEu4FjLn3UWhcpanc7c=;
        b=bpz/+QUpsTFzUsmpnmroEkSwacMhDwlxduETK841RnpjfFwZXDjbHijGJ0urR3Iq7a
         Smm8bppg4uh+0Vkzm6B3laj65dyf1TbJNgD1V3YsUhojK83ovr+FbY3UyKVcqoLy1KQ+
         n3TfBxbmwVhbYvNtVepH6XqIe19ohjHOc3R9VMA5mXufj2oU4mYtrC6/Ky4A7yd6ScxB
         Yyt/QxjJRdfvgRzrJ5ZjspXu9tpH15uJe+JWblTrnOzRmYzrIYeVVuc/bQVPMlTw5lMR
         O7LYtHsag+XahHagK0Cls9niIjt6SK5Pey+59aASNKlSSl0vDuHR0xz8clsUMlSFkYs1
         NpBg==
X-Gm-Message-State: AOJu0YwSGOZT9MjfDzjEtEPrFt6hNUjxE8XIFIctBS3+TK7KuVA101jz
        evuN6i4pEShxQjoPHW3728SvRw==
X-Google-Smtp-Source: AGHT+IFAuBVKaO6Sum5+qKmo5IAu9PD21HlBd1YBSGo05czKi+0TFycKFN/e4FROz0HoJtgKloZSVg==
X-Received: by 2002:a05:6512:ba3:b0:4f9:51ac:41eb with SMTP id b35-20020a0565120ba300b004f951ac41ebmr771728lfv.16.1696379487750;
        Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
Date:   Wed,  4 Oct 2023 03:31:24 +0300
Message-Id: <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

clk_rcg2_shared_ops implements support for the case of the RCG which
must not be completely turned off. However its design has one major
drawback: it doesn't allow us to properly implement the is_enabled
callback, which causes different kinds of misbehaviour from the CCF.

Follow the idea behind clk_regmap_phy_mux_ops and implement the new
clk_rcg2_parked_ops. It also targets the clocks which must not be fully
switched off (and shared most of the implementation with
clk_rcg2_shared_ops). The major difference is that it requires that the
parent map doesn't conain the safe (parked) clock source. Instead if the
CFG_REG register points to the safe source, the clock is considered to
be disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6d84c8c7989..9fbbf1251564 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_parked_ops;
 extern const struct clk_ops clk_dp_ops;
 
 struct clk_rcg_dfs_data {
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 5183c74b074f..3f52abf0025e 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/export.h>
@@ -1150,6 +1151,39 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+static int clk_rcg2_park_is_enabled(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 cfg;
+	int ret;
+
+	if (!clk_rcg2_is_enabled(hw))
+		return false;
+
+	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
+}
+
+/*
+ * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
+ * parent_map. This allows us to implement proper is_enabled callback.
+ */
+const struct clk_ops clk_rcg2_parked_ops = {
+	.is_enabled = clk_rcg2_park_is_enabled,
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
+
 /* Common APIs to be used for DFS based RCGR */
 static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
 				       struct freq_tbl *f)
-- 
2.39.2

