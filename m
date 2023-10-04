Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD6C7B763C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 03:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239688AbjJDBXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 21:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239384AbjJDBXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 21:23:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E0FB4
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 18:23:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-503397ee920so1834333e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 18:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696382591; x=1696987391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8nMy2Ua0dMe4E3qoi97ow6eQsKaFDMIJZ59LvlI8UU=;
        b=AS8zqWv5xUOABZGvQ4M/yI8vwAixol1DGWFVajtQbuVKc2NTfzLrHZg8gwfvYnG0l4
         C4L7MmaK++GoBHwO6nS5yhmkISX43AA7GjXEr6Q7lKlqR4pJvvaN84rTY+1GSphwvsxM
         EjgRvIlEs53n0zFu0b1p5AtZQ6zJl+j1z8BIO7m7+ZWMBkB6ClylC1S5FFawZsMzyDmP
         egAHn8fNDhwkpukZE/YF0BOcUJGpg06hk6vVGWLGSt652MDeIs9ZyVO9HMaJR1nFKvZY
         kRUiroVWMbgrVRmuJ25pl+VI3MOj7LKd90j5kRN+h6rbdbFr6v4sRNfxTNZKs/VNUTAB
         DLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696382591; x=1696987391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8nMy2Ua0dMe4E3qoi97ow6eQsKaFDMIJZ59LvlI8UU=;
        b=kMMmlMB9qzWHkN8UGwzHQRatjZPOp+fAq84Fa46osYvqo+ywQeF7l9Prib4pAD3QuL
         ckBCEpWWnxp7P6ZAVzsanSKvQ9CxVjOJMn7uZF9Xl9l/ylx8A/N/6Qnksp6pfihb4Cb5
         J8//zHpBROZAq55af65713Oi3ebusvBBOdxNpOJ9nXsYsLPkoavX6nd5AfknXx8C2Fhn
         fGxyGc4XE0PnNuhJAC5GvJekwz7RbLbauZZ2hur0/ONE/9Kqf0acwvk5m+Ix3pvHiDcx
         90z42TOxaTJpFch4HIK4k8qo/XYR8yGBImY9IHOmU5o5ew2yMXMJRTsgQNOYsyiIHCiZ
         msOg==
X-Gm-Message-State: AOJu0Ywnm0KO74/4REwxDlhLY4rje7NO1EGc5CKoRq3TbgQBmQG1htdL
        2aJxbLXsqXSPj/szM+cNCiXguQ==
X-Google-Smtp-Source: AGHT+IGrMVAgJOswDrZabmipY2B9acE5xUsoI7JUR/sxnZzwwYQ88lelFyFe56gO3YPkjb/6sAR9Kw==
X-Received: by 2002:a05:6512:250c:b0:503:1b83:e352 with SMTP id be12-20020a056512250c00b005031b83e352mr941181lfb.52.1696382591051;
        Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 18:23:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH v2 1/3] clk: qcom: add helper to map parent source to cfg value
Date:   Wed,  4 Oct 2023 04:23:06 +0300
Message-Id: <20231004012308.2305273-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qcom_find_src_cfg(), a helper that maps P_something (src) to the
register value (cfg).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 12 ++++++++++++
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..63097b5b2f54 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -81,6 +81,18 @@ int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map, u8 cfg)
 }
 EXPORT_SYMBOL_GPL(qcom_find_cfg_index);
 
+int qcom_find_src_cfg(struct clk_hw *hw, const struct parent_map *map, u8 src)
+{
+	int i, num_parents = clk_hw_get_num_parents(hw);
+
+	for (i = 0; i < num_parents; i++)
+		if (src == map[i].src)
+			return map[i].cfg;
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(qcom_find_src_cfg);
+
 struct regmap *
 qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9c8f7b798d9f..1d02c7d61477 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -51,6 +51,8 @@ extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
 extern int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 cfg);
+extern int qcom_find_src_cfg(struct clk_hw *hw, const struct parent_map *map,
+			     u8 src);
 
 extern int qcom_cc_register_board_clk(struct device *dev, const char *path,
 				      const char *name, unsigned long rate);
-- 
2.39.2

