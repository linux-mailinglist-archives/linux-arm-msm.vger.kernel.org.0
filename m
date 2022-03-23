Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E191C4E4EA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 09:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242975AbiCWIvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 04:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242952AbiCWIvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 04:51:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9294B7560C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 01:50:14 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q5so870789ljb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 01:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4YgPRcAvYF3LfGXx0EyXE0jQOivxR8ScYIlBmUk0V8=;
        b=qUzO3tCywk5O/ABlZMEE7Tynuwz5v0UY3fw/zHoDLSHx6ImgtWT0T7w/+lpokAziuV
         QTgYEdNMFwbwqBHYGtbXK/LYsIOsZpKrWV7dx/WDvq3t53M6VZKJVRd8ZHjXZPEednJX
         MVypJgvIDNd5GUCN96crTnfISTnamSpwzGu/hc2wdGH1uFP2ucIa+fMUU13C0AfAPFO7
         kKSF71Z1KxOLpXtOfYCGNw3l0X4Clzklc7wWE5tdtHGmxMS0Vnvvc84TyKjQCxj/yjhE
         jm2n0BpolfFwIdast52la5jPJmkcPt9i5BNw0oJGkwGEO7/w6Uy1V6+wVUQywpqoM14B
         ECjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4YgPRcAvYF3LfGXx0EyXE0jQOivxR8ScYIlBmUk0V8=;
        b=mjA+cigPD+QOhufQI8lvyWEUzChma7xdWC6QWyt64zOcppEYgIvS9h3D8Jy3osL3/g
         0LIjT7KIT9Hxfe3MfEwNN03/CqIJbECq36qxXkYtaqmae/VXxz/U7TvaNG7+eayNjZTX
         CheSLS8MOY4E8BiwRfcuJB9+h9DOW/ORgNMlhNJywFQAogfXs1Kajh5dPIc5ens6oJWC
         rlBz/oCR/CvvcPD1PaeHZx+IMySzrxJWJx4Z/fRDfebCIXABzbYYNc4ARVLFFXCZa9L9
         ued1+eIHDk5+OoW5fpoU0G8nnxExMTbjgdHCHdj43BOyfIyrWmyPZPQslEqol4EWvIBc
         G16w==
X-Gm-Message-State: AOAM533HCcEnadwbtHtYWdBoN68ME3EgRSu++zVp+DNIKBArcjTqkg0N
        PYRNvhtcyAvNEFw/SJMzt8f+Eg==
X-Google-Smtp-Source: ABdhPJyf/GCKECSuZ/yMAAFJUOgG8ibserjT0LWHpwQXzjVtoJhsgePiIQBdTUhRQjwlnmTrSytK/g==
X-Received: by 2002:a2e:8496:0:b0:249:7dbc:d81b with SMTP id b22-20020a2e8496000000b002497dbcd81bmr13068756ljh.332.1648025412772;
        Wed, 23 Mar 2022 01:50:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c40-20020a05651223a800b0044a1edf823dsm1376140lfv.150.2022.03.23.01.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 01:50:12 -0700 (PDT)
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
Subject: [PATCH v1 1/5] clk: qcom: regmap-mux: add pipe clk implementation
Date:   Wed, 23 Mar 2022 11:50:06 +0300
Message-Id: <20220323085010.1753493-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
References: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
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

On recent Qualcomm platforms the QMP PIPE clocks feed into a set of
muxes which must be parked to the "safe" source (bi_tcxo) when
corresponding GDSC is turned off and on again. Currently this is
handcoded in the PCIe driver by reparenting the gcc_pipe_N_clk_src
clock. However the same code sequence should be applied in the
pcie-qcom endpoint, USB3 and UFS drivers.

Rather than copying this sequence over and over again, follow the
example of clk_rcg2_shared_ops and implement this parking in the
enable() and disable() clock operations. As we are changing the parent
behind the back of the clock framework, also implement custom
set_parent() and get_parent() operations behaving accroding to the clock
framework expectations (cache the new parent if the clock is in disabled
state, return cached parent).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-regmap-mux.c | 78 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux.h |  3 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index 45d9cca28064..c39ee783ee83 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -49,9 +49,87 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
 	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
 }
 
+static u8 mux_safe_get_parent(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+	unsigned int val;
+
+	if (clk_hw_is_enabled(hw))
+		return mux_get_parent(hw);
+
+	val = mux->stored_parent_cfg;
+
+	if (mux->parent_map)
+		return qcom_find_cfg_index(hw, mux->parent_map, val);
+
+	return val;
+}
+
+static int mux_safe_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+
+	if (clk_hw_is_enabled(hw))
+		return mux_set_parent(hw, index);
+
+	if (mux->parent_map)
+		index = mux->parent_map[index].cfg;
+
+	mux->stored_parent_cfg = index;
+
+	return 0;
+}
+
+static void mux_safe_disable(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
+	unsigned int val;
+
+	regmap_read(clkr->regmap, mux->reg, &val);
+
+	mux->stored_parent_cfg = (val & mask) >> mux->shift;
+
+	val = mux->safe_src_parent;
+	if (mux->parent_map) {
+		int index = qcom_find_src_index(hw, mux->parent_map, val);
+
+		if (WARN_ON(index < 0))
+			return;
+
+		val = mux->parent_map[index].cfg;
+	}
+	val <<= mux->shift;
+
+	regmap_update_bits(clkr->regmap, mux->reg, mask, val);
+}
+
+static int mux_safe_enable(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
+	unsigned int val;
+
+	val = mux->stored_parent_cfg;
+	val <<= mux->shift;
+
+	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
+}
+
 const struct clk_ops clk_regmap_mux_closest_ops = {
 	.get_parent = mux_get_parent,
 	.set_parent = mux_set_parent,
 	.determine_rate = __clk_mux_determine_rate_closest,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_mux_closest_ops);
+
+const struct clk_ops clk_regmap_mux_safe_ops = {
+	.enable = mux_safe_enable,
+	.disable = mux_safe_disable,
+	.get_parent = mux_safe_get_parent,
+	.set_parent = mux_safe_set_parent,
+	.determine_rate = __clk_mux_determine_rate_closest,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_mux_safe_ops);
diff --git a/drivers/clk/qcom/clk-regmap-mux.h b/drivers/clk/qcom/clk-regmap-mux.h
index db6f4cdd9586..f86c674ce139 100644
--- a/drivers/clk/qcom/clk-regmap-mux.h
+++ b/drivers/clk/qcom/clk-regmap-mux.h
@@ -14,10 +14,13 @@ struct clk_regmap_mux {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	u8			safe_src_parent;
+	u8			stored_parent_cfg;
 	const struct parent_map	*parent_map;
 	struct clk_regmap	clkr;
 };
 
 extern const struct clk_ops clk_regmap_mux_closest_ops;
+extern const struct clk_ops clk_regmap_mux_safe_ops;
 
 #endif
-- 
2.35.1

