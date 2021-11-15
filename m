Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92F745282C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241780AbhKPDH1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240950AbhKPDHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:07:05 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99115C10C144
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:34:10 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e7so24453126ljq.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWr1EeMoYrDdPrgeNpLvZbaGnBGlvAW/pRNybJFkHXs=;
        b=J0i+SahCYqbmr4ANgWbIyy/o6gvr1f+8IirIQR5/2L5SGuiG4W23PFc1i5S3mZJ0MV
         wAoxGgAQPehkpmLtzg91C2iyVABzhhreYdHud0xIb1mziO0VLPmPbvAAQm6IfPYOoErd
         OkkL7cD/JRceo/C9AnX3etGOrapU5smB/LTHhGoQ9ynRRaqM7oB+YSLWxbPpQAXmE0/t
         FsoQgDCEC1myzqkCNO1nb1SJAB7fKKTo+W17Xn15NuTmKxdfFcVu3YvTMEv3emz2Wta9
         HhTukKN7NGoBeDDbn6qQCuLt6nF7IweOXp3fzvQO3NRK/xIV5KOMEymIQvx0B8dXgenG
         vyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWr1EeMoYrDdPrgeNpLvZbaGnBGlvAW/pRNybJFkHXs=;
        b=vNBpKCxC+h9E1/pI25AaCki0n/PA2AsEixNaMOMeqHKT4QJDzSWwBOVdvO15QHWsKy
         jUWTqnUuQDNVfRQruSmVrzJSl7u2DnLtcSQ1BfH7I1tupzSGOY5nLA1RlD+UTIU+zl1J
         ta2oMVcKGnNehQccaEKlz9BpgrVYHSAgUrBVHS/wq/ieZ4nWsjsM3/78FBPrOtOME3bJ
         de03jubjb1KKjtjyqc1BY4FCo8WmL+wS2FpuS9QDtoVL2Gm7d5q4f/hyYUWyz64VUIoj
         IjBPJNJ1/QJzh3OcUcYPCgFGS+3WO2vcIGJ7byc0SAvH/MMbsZbxvboFMSPSf0rl/BXz
         0ZaA==
X-Gm-Message-State: AOAM530xf8Ob0Qlb4w/2nNig1pf51ZJ/XBbJ1vKP2KhcauUQ+2TVQ0qb
        3xaL4tzNKw4c10bbx4navsPDuA==
X-Google-Smtp-Source: ABdhPJymjFNYZZVb2r0qB7SgT5nPMJPemVYUG9zIXHI5oUIwaIh3DPr23dbyX01Lc0aSVLseJKRTgA==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr2477990ljn.336.1637019248681;
        Mon, 15 Nov 2021 15:34:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27sm1566546lfp.268.2021.11.15.15.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 15:34:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] clk: qcom: regmap-mux: fix parent clock lookup
Date:   Tue, 16 Nov 2021 02:34:07 +0300
Message-Id: <20211115233407.1046179-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function mux_get_parent() uses qcom_find_src_index() to find the
parent clock index, which is incorrect: qcom_find_src_index() uses src
enum for the lookup, while mux_get_parent() should use cfg field (which
corresponds to the register value). Add qcom_find_cfg_index() function
doing this kind of lookup and use it for mux parent lookup.

Fixes: df964016490b ("clk: qcom: add parent map for regmap mux")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-regmap-mux.c |  2 +-
 drivers/clk/qcom/common.c         | 12 ++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index b2d00b451963..45d9cca28064 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -28,7 +28,7 @@ static u8 mux_get_parent(struct clk_hw *hw)
 	val &= mask;
 
 	if (mux->parent_map)
-		return qcom_find_src_index(hw, mux->parent_map, val);
+		return qcom_find_cfg_index(hw, mux->parent_map, val);
 
 	return val;
 }
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..2af04fc4abfa 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -69,6 +69,18 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 }
 EXPORT_SYMBOL_GPL(qcom_find_src_index);
 
+int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map, u8 cfg)
+{
+	int i, num_parents = clk_hw_get_num_parents(hw);
+
+	for (i = 0; i < num_parents; i++)
+		if (cfg == map[i].cfg)
+			return i;
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(qcom_find_cfg_index);
+
 struct regmap *
 qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index bb39a7e106d8..9c8f7b798d9f 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -49,6 +49,8 @@ extern void
 qcom_pll_set_fsm_mode(struct regmap *m, u32 reg, u8 bias_count, u8 lock_count);
 extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
+extern int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map,
+			       u8 cfg);
 
 extern int qcom_cc_register_board_clk(struct device *dev, const char *path,
 				      const char *name, unsigned long rate);
-- 
2.33.0

