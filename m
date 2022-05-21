Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7BF52F715
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 02:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354268AbiEUAx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 20:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354261AbiEUAxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 20:53:55 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F491AD5B0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 17:53:54 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a23so11259954ljd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 17:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RGgCjrjOEbLbfHEEFuHyMmpO24+VFgBBynfKXgtyIM=;
        b=aYFIaFNqXOHKeGpn8CCECW50lTWmPbPsNo50ceqPkNhm6W7SxZ/sDYFwn2XvjpTNsw
         WbVj/nQy3nnqmlzTlUbfskR09m0Ryq3CkuqAxLUPB8YY4P2BGU7c8rHTxqCR66nQEl9x
         LN1ldQpNmWwUQiDoLX63dyEBkvf6TNEkVwcPCRIc2ZXQTrF+98KcNsZaPHU0ojp9G3Y4
         /4ITMxYHfAwEBop2+2WTYyl8yO+9GdHERUHWvksaZ/rc4jZRg6DoT6haHTqqKVkZn7cE
         k6+WiYXEU5FAgSNdAcw+xAv3QzLSd8HM99OOYRiFQ+SD5yi7GpwbyXWH0Z8D5qJn6UwG
         22Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RGgCjrjOEbLbfHEEFuHyMmpO24+VFgBBynfKXgtyIM=;
        b=hZRbeLeF0l78Q0UtAIdK0o3qPt6PaUkxfFnQVrv3UfN0xKl8s4srI7f+PTIKaJ7v+s
         Yl4mDD++Y9Qu+UiDnLjsycrTiogL2bE5z5/mY3dAsZYIBCikf8kHlviZfUgYg/QDpwI2
         buPyn2nZuSME7f+nqPv7w0XsQSp82R45txJOyCn1iJ1Z9P4nczn8VLV/8l4YqTmfi09A
         qqOT0SxnFfxPYFXsItpGJj8PsMX7g4wjFBTvEP0yfG5fbRwrDcQHwLJ9n1VUjek41FDi
         4MR6w+YSEaKkzoLZZgOup727aS9FaJJX4d1SXT8Cs5cNT6lRUufvfhOvhmFoJMOa+Qtn
         D2FA==
X-Gm-Message-State: AOAM531l9TKL4IUsDfbWcO+NawO6PKUZoAi5/nbRxMimVFcGkGqyESW5
        zmZA5L6wqynr80Jgn7adtXPAfkGBim3O/A==
X-Google-Smtp-Source: ABdhPJxCiyHYeH4fovqCoF/55SAXj3vj2ykToH0c4BQ/dbKIUwNUQYjiqEb56ZYRjdpgsRFKIT2+3Q==
X-Received: by 2002:a2e:9019:0:b0:250:8205:dfb4 with SMTP id h25-20020a2e9019000000b002508205dfb4mr6782491ljg.396.1653094432506;
        Fri, 20 May 2022 17:53:52 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id u14-20020a056512094e00b0047255d21187sm844559lft.182.2022.05.20.17.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 17:53:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v7 3/8] Revert "clk: qcom: regmap-mux: add pipe clk implementation"
Date:   Sat, 21 May 2022 03:53:38 +0300
Message-Id: <20220521005343.1429642-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
References: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
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

Johan Hovold has pointed out that there are several deficiencies and a
race condition in the regmap_mux_safe ops that were merged. Pipe clocks
has been updated to use newer and simpler clk_regmap_phy_mux_ops. Drop
the regmap-mux-safe clock ops now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-regmap-mux.c | 78 -------------------------------
 drivers/clk/qcom/clk-regmap-mux.h |  3 --
 2 files changed, 81 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index c39ee783ee83..45d9cca28064 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -49,87 +49,9 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
 	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
 }
 
-static u8 mux_safe_get_parent(struct clk_hw *hw)
-{
-	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
-	unsigned int val;
-
-	if (clk_hw_is_enabled(hw))
-		return mux_get_parent(hw);
-
-	val = mux->stored_parent_cfg;
-
-	if (mux->parent_map)
-		return qcom_find_cfg_index(hw, mux->parent_map, val);
-
-	return val;
-}
-
-static int mux_safe_set_parent(struct clk_hw *hw, u8 index)
-{
-	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
-
-	if (clk_hw_is_enabled(hw))
-		return mux_set_parent(hw, index);
-
-	if (mux->parent_map)
-		index = mux->parent_map[index].cfg;
-
-	mux->stored_parent_cfg = index;
-
-	return 0;
-}
-
-static void mux_safe_disable(struct clk_hw *hw)
-{
-	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
-	struct clk_regmap *clkr = to_clk_regmap(hw);
-	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
-	unsigned int val;
-
-	regmap_read(clkr->regmap, mux->reg, &val);
-
-	mux->stored_parent_cfg = (val & mask) >> mux->shift;
-
-	val = mux->safe_src_parent;
-	if (mux->parent_map) {
-		int index = qcom_find_src_index(hw, mux->parent_map, val);
-
-		if (WARN_ON(index < 0))
-			return;
-
-		val = mux->parent_map[index].cfg;
-	}
-	val <<= mux->shift;
-
-	regmap_update_bits(clkr->regmap, mux->reg, mask, val);
-}
-
-static int mux_safe_enable(struct clk_hw *hw)
-{
-	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
-	struct clk_regmap *clkr = to_clk_regmap(hw);
-	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
-	unsigned int val;
-
-	val = mux->stored_parent_cfg;
-	val <<= mux->shift;
-
-	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
-}
-
 const struct clk_ops clk_regmap_mux_closest_ops = {
 	.get_parent = mux_get_parent,
 	.set_parent = mux_set_parent,
 	.determine_rate = __clk_mux_determine_rate_closest,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_mux_closest_ops);
-
-const struct clk_ops clk_regmap_mux_safe_ops = {
-	.enable = mux_safe_enable,
-	.disable = mux_safe_disable,
-	.get_parent = mux_safe_get_parent,
-	.set_parent = mux_safe_set_parent,
-	.determine_rate = __clk_mux_determine_rate_closest,
-};
-EXPORT_SYMBOL_GPL(clk_regmap_mux_safe_ops);
diff --git a/drivers/clk/qcom/clk-regmap-mux.h b/drivers/clk/qcom/clk-regmap-mux.h
index f86c674ce139..db6f4cdd9586 100644
--- a/drivers/clk/qcom/clk-regmap-mux.h
+++ b/drivers/clk/qcom/clk-regmap-mux.h
@@ -14,13 +14,10 @@ struct clk_regmap_mux {
 	u32			reg;
 	u32			shift;
 	u32			width;
-	u8			safe_src_parent;
-	u8			stored_parent_cfg;
 	const struct parent_map	*parent_map;
 	struct clk_regmap	clkr;
 };
 
 extern const struct clk_ops clk_regmap_mux_closest_ops;
-extern const struct clk_ops clk_regmap_mux_safe_ops;
 
 #endif
-- 
2.35.1

