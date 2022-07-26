Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3094E581525
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 16:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239245AbiGZOXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 10:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239225AbiGZOXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 10:23:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9768027CC6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 07:23:49 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g2so12332452wru.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d/DaB1MeQfCcVXsXcsNp55fP3VpVeZCPmaqIuOK40Ro=;
        b=CaIE3n67npwPmIUSTTREJCaFOKO4dfO/yB4Hxl4RUwLicpFhS0TGVYUHc2hNmZ5OuT
         jd6yh2sdNXQC6OUhbYN1u9FuAVqt5fuhphbsANkFay0YrRMHuewZC0aMIEjZphUgY/Hq
         3ZZjWUFRp42aLiOk/X8PfIhKvYiYRJZHGWnNpuqFq+F6lX9ExLO1Z02b/DonW5iR0L5W
         kTH3m+zMwMoPK31YUjAP1SWddRS5+og5Ujuot6atr9FxArci9p8bxZ9KShwLEOcSc8eN
         4y7QAW8v0bcekk5GTtZvmsBxUIpE4wPMRGEYDOSZ33j6W3pxBMWQ5H0QDIsZnCVE+9PH
         cL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d/DaB1MeQfCcVXsXcsNp55fP3VpVeZCPmaqIuOK40Ro=;
        b=TyXIjruvBTZAD/qUFPq91i8eZMArklVhWbczshQNIsNn8JfOo4iZikrsBhFUqDCymt
         8Kx7dr47KhRO+do0jclY/1y1aIMLwUNhmqUp43HGC36aICxV4WjRiecih98RhXnOEQxR
         eD1s3kNXGip/BfPs+bRDTucxYkQ0ECMw9ihph2OGpF1MVmTg6iEdzy3TBS4YDduItI54
         lAbCbqejTycaFisrCGYeXQ6MDRmyTpwJx/s2Qp3CfApVjfDuVS38e33yN/jPUWLcgify
         WBLsmUa0+FZhUBHoZ+icYn62u5pnANSR9n9QHRjtc1ZanLY1/qhiNbCWDANqYN6uwr93
         f6oA==
X-Gm-Message-State: AJIora9LN6gWsUZmvRImfCNDEHE6nZ1Xio/JF6TMOLJUkDMor802N2Yj
        c145S8LDah/FXgw25yHgL1ofMQ==
X-Google-Smtp-Source: AGRyM1s334bxFNiALfGH3Hjr6LFi66uicKopW4HwaV0+hkQt68enoEaaT0hoOeB+3TX0gp9OEJH+DA==
X-Received: by 2002:a05:6000:15c8:b0:21d:babe:e75c with SMTP id y8-20020a05600015c800b0021dbabee75cmr11898791wry.32.1658845427919;
        Tue, 26 Jul 2022 07:23:47 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003a331c6bffdsm17017119wmi.47.2022.07.26.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:23:47 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 4/9] clk: qcom: alpha-pll: Add macros to collapse definition
Date:   Tue, 26 Jul 2022 17:22:58 +0300
Message-Id: <20220726142303.4126434-5-abel.vesa@linaro.org>
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

Add macros for a visually more compact alpha-pll clocks definition,
one for alpha-pll and one for alpha-pll postdiv. These are only the ones
used by gcc-sdm845 driver. More will be added later on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.h | 61 ++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 447efb82fe59..1bf7a3ecb7f1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -127,6 +127,67 @@ struct alpha_pll_config {
 	u32 vco_mask;
 };
 
+#define __DEFINE_QCOM_CC_CLK_ALPHA_PLL(_name, _offset, _regs,			\
+					_enable_reg, _enable_mask,		\
+					_parent_fw_name, _flags, _ops)		\
+	static struct clk_alpha_pll _name = {					\
+		.offset = _offset,						\
+		.regs = _regs,							\
+		.clkr = {							\
+			.enable_reg = _enable_reg,				\
+			.enable_mask = _enable_mask,				\
+			.hw.init = &(struct clk_init_data){			\
+				.name = #_name,					\
+				.parent_data = &(const struct clk_parent_data){	\
+					.fw_name = _parent_fw_name,		\
+					.name = _parent_fw_name,		\
+				},						\
+				.num_parents = 1,				\
+				.ops = _ops,					\
+				.flags = _flags,				\
+			},							\
+		},								\
+	}
+
+#define __DEFINE_QCOM_CC_CLK_ALPHA_PLL_POSTDIV(_name, _offset,			\
+					_post_div_shift, _post_div_table,	\
+					_width, _regs,				\
+					_parent_hws, _flags, _ops)		\
+	static struct clk_alpha_pll_postdiv _name = {				\
+		.offset = _offset,						\
+		.post_div_shift = _post_div_shift,				\
+		.post_div_table = _post_div_table,				\
+		.num_post_div = ARRAY_SIZE(_post_div_table),			\
+		.width = _width,						\
+		.regs = _regs,							\
+		.clkr.hw.init = &(struct clk_init_data){			\
+			.name = #_name,						\
+			.parent_hws = (const struct clk_hw*[]){			\
+				_parent_hws,					\
+			},							\
+			.num_parents = 1,					\
+			.ops = _ops,						\
+			.flags = _flags,					\
+		},								\
+	}
+
+#define DEFINE_QCOM_CC_CLK_ALPHA_PLL(_name, _offset,				\
+					_enable_reg, _enable_mask,		\
+					_parent_fw_name)			\
+	__DEFINE_QCOM_CC_CLK_ALPHA_PLL(_name, _offset,				\
+				clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],	\
+				_enable_reg, _enable_mask,			\
+				_parent_fw_name, 0,				\
+				&clk_alpha_pll_fixed_fabia_ops)
+
+#define DEFINE_QCOM_CC_CLK_ALPHA_PLL_POSTDIV(_name, _offset,			\
+					_post_div_shift, _post_div_table,	\
+					_width, _parent_hws)			\
+	__DEFINE_QCOM_CC_CLK_ALPHA_PLL_POSTDIV(_name, _offset,			\
+				_post_div_shift, _post_div_table, _width,	\
+				clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],	\
+				_parent_hws, 0,	&clk_alpha_pll_postdiv_fabia_ops)
+
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
-- 
2.34.3

