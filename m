Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53507581513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 16:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239273AbiGZOX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 10:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239258AbiGZOXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 10:23:55 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B570F28E2B
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 07:23:50 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f24-20020a1cc918000000b003a30178c022so11444416wmb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OSrcXnJfHzhwKJjJl+U4MAYIm6nBO0IqHmqhGl3wldI=;
        b=CKmZ109iQ162s+LaenSICml4pKgBEzGs8KCJbpcXYWNnzUqMSspwS1sG9aijpVlILC
         350dnVPqu2NTfGGg+ZbqtPLSsrmY61fixBtMdO4xswS++XLl6xhhpzi7KaVnDxhLk0hb
         wu0JvyhQeYNemSOjOFF4SO/mIvycz3zrFp6X8e29Gww9g+Lkf1BnO8umOUNvQFGELsU6
         Czb52mQBUeB3Lxt8aE7reqhbjQrr68iPajL7Xd4jou0itOxYYpoXraF0mtUjMkqSBID7
         kscont4URikvKXgxAN4A23Kav8dPxtv6736XFD1rfH7alaWj18F9SQ4R6NNvLNb6FKX2
         b8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSrcXnJfHzhwKJjJl+U4MAYIm6nBO0IqHmqhGl3wldI=;
        b=PQm1nFigXatRFJfiXrrERgQskl+yOsVTSLcDrX8VwlbzuGPAZpQOCmzizE4DWJxtBl
         KuOuAc1ppZZYu8bi7lDaHCtJtwCYd4dvPw2+xL2Sn+pfP1DnM/K6Uy60JnHYaoEk9odI
         prz5TuHzoAP9fubiWxKXAoxN5eZdrDYv3mBxPfUWWj8u+0UGNhGFQsr+RcPx4d6z9x8h
         YFAI/dh4TJ+4sNClFkRLwrwa9u1U2rTQUKIyPAEZiHZRyScJ51EBHMZ1i2VNdmvTXonA
         P/CHRjr2U2+x/mXSJTd9/qQdcCVkT2B8Deg4f2i5dT6bk38HL78zevgSZ5hWgL640TuB
         v21Q==
X-Gm-Message-State: AJIora/ooLdYVoHrhydsuS0GunHlC2kHqgm6tWFruFYuzmSdM3IBTl62
        QDs4vJvBYipsmmJQL11a0HF01Q==
X-Google-Smtp-Source: AGRyM1tT+feG5Xze4IBB1D09ANInme4UPIocOFV7shXbNiRJu95FQULeMRrR+cqSsAGbih0OeGzrsA==
X-Received: by 2002:a05:600c:3845:b0:3a3:227d:c1c6 with SMTP id s5-20020a05600c384500b003a3227dc1c6mr25541673wmr.9.1658845429291;
        Tue, 26 Jul 2022 07:23:49 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003a331c6bffdsm17017119wmi.47.2022.07.26.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:23:48 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 5/9] clk: qcom: branch: Add macros to collapse definition
Date:   Tue, 26 Jul 2022 17:22:59 +0300
Message-Id: <20220726142303.4126434-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220726142303.4126434-1-abel.vesa@linaro.org>
References: <20220726142303.4126434-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add macros for a visually more compact branch clocks definition,
one for the common branch and one for branch_aon. They differ
from ops point of view, like their name suggest. There are also
three different macros to define the clk.hw.init depending on the
number and type of parent passed on as argument. Also, the macros
added here are only the ones used by gcc-sdm845 driver.
More will be added later on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 82 +++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 17a58119165e..a12ffebf0e5f 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -37,6 +37,88 @@ struct clk_branch {
 	struct clk_regmap clkr;
 };
 
+#define INIT_QCOM_CC_CLKR_HW_2(_name, _flags, _ops, _fw_name)		\
+	{								\
+		.name = #_name,						\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = _fw_name,				\
+			.name = _fw_name,				\
+		},							\
+		.num_parents = 1,					\
+		.flags = _flags,					\
+		.ops = _ops,						\
+	}
+
+#define INIT_QCOM_CC_CLKR_HW_1(_name, _flags, _ops, _parent_hw)		\
+	{								\
+		.name = #_name,						\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.hw = _parent_hw,				\
+		},							\
+		.num_parents = 1,					\
+		.flags = _flags,					\
+		.ops = _ops,						\
+	}
+
+#define INIT_QCOM_CC_CLKR_HW_0(_name, _flags, _ops, ...)		\
+	{								\
+		.name = #_name,						\
+		.flags = _flags,					\
+		.ops = _ops,						\
+	}
+
+#define INIT_QCOM_CC_CLKR(_num_parents, _enable_reg, _enable_mask,	\
+				_name, _flags, _ops, ...)		\
+	{								\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.hw.init = &(struct clk_init_data)		\
+			INIT_QCOM_CC_CLKR_HW_##_num_parents(_name,	\
+						_flags,			\
+						_ops, __VA_ARGS__),	\
+	}
+
+#define __DEFINE_QCOM_CC_CLK_BRANCH(_halt_check, _name, _num_parents,	\
+					_halt_reg,			\
+					_hwcg_reg, _hwcg_bit,		\
+					_enable_reg, _enable_mask,	\
+					_flags, _ops, ...)		\
+	static struct clk_branch _name = {				\
+		.halt_reg = _halt_reg,					\
+		.halt_check = BRANCH_##_halt_check,			\
+		.hwcg_reg = _hwcg_reg,					\
+		.hwcg_bit = _hwcg_bit,					\
+		.clkr = INIT_QCOM_CC_CLKR(_num_parents, _enable_reg,	\
+					_enable_mask,			\
+					_name, _flags,			\
+					_ops, __VA_ARGS__),		\
+	}
+
+#define DEFINE_QCOM_CC_CLK_BRANCH(_halt_check, _name, _num_parents,	\
+					_halt_reg,			\
+					_hwcg_reg, _hwcg_bit,		\
+					_enable_reg, _enable_mask,	\
+					_flags, ...)			\
+	__DEFINE_QCOM_CC_CLK_BRANCH(_halt_check, _name, _num_parents,	\
+					_halt_reg,			\
+					_hwcg_reg, _hwcg_bit,		\
+					_enable_reg, _enable_mask,	\
+					_flags,				\
+					&clk_branch2_ops, __VA_ARGS__)
+
+#define DEFINE_QCOM_CC_CLK_BRANCH_AON(_halt_check, _name, _num_parents,	\
+					_halt_reg,			\
+					_hwcg_reg, _hwcg_bit,		\
+					_enable_reg, _enable_mask,	\
+					_flags, ...)			\
+	__DEFINE_QCOM_CC_CLK_BRANCH(_halt_check, _name, _num_parents,	\
+					_halt_reg,			\
+					_hwcg_reg, _hwcg_bit,		\
+					_enable_reg, _enable_mask,	\
+					_flags,				\
+					&clk_branch2_aon_ops,		\
+					__VA_ARGS__)
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.34.3

