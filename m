Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA1D45A78B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 17:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhKWQ0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 11:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbhKWQ0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 11:26:31 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574F2C061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 08:23:23 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso34461861otj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 08:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zBuLmrD4RVS18Xj6yhG9KuDHzFKukaIEFbOkTKeiw1I=;
        b=i/R6iuKAymapTKSGTomdwKbvBqToNTT/C28vCvn11DiBlVhMVKCNWZd8m5iIJws870
         5i6M+Uromko5JASpYlf64cnDXfeiRhcXxeMc7SlPTrBT7ppkXhw4RzDn5aDBfyisz5xp
         3BNIDYR0ZR6Vot9zl0CQj/Ff9yxpT+hKjvayZSdQdudMHDnDcLHd9ZHYAnC6ZCob96jL
         sRnXshNLrv7V7KfCjp3REl/ctFWWFYenJLYMNwPzrSjECJ9f8Sz33ozK/nnCjkDQyvRy
         qzFjFRwt+lkK0DQVHKukNwQxKY9Xi19siLuoD9ZUKJr52Y/QZKQAj0UrFMuXtmWCHvmK
         FgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zBuLmrD4RVS18Xj6yhG9KuDHzFKukaIEFbOkTKeiw1I=;
        b=laxbEXwn61lfrsLBFO97vzjcJQpADBzYiAlGhBATIUDdjeQ3khYcsPI+yWhAq/UZ27
         7qx+p0Sg9o1RO2nNiWaU55eIkydt6iSpfdXl8263T+SuxINyn+gubKjZ0xYyzQTXWGp9
         IVQc08l27pCUvjrsKwV/8yya7w4jG08fMynhOfbe+0pDQRuaBpSOP2lbB7cTiMekWlsC
         VhO3wj45z/XPfzbkp8JragP7lJt/J7fZIuRn/ZItr3XNtk9DveGwN05UQJisxEfGY2W3
         rqS/wg7t7BhSJVcg8a8ogAM2Cwf2g+ab958rPc8qI02+Sqgz8VYuMeHluaXwgEj5p7Nf
         rlBg==
X-Gm-Message-State: AOAM532QvU8iWxj9AzGYZfLHXCgLByRuuATK2kQQWGGWm8aYxusIzvfw
        ZW0rxqX2vcG8dUNKxlEC41T7Iw==
X-Google-Smtp-Source: ABdhPJySUDxBc7WKKVZIoc6Yq1tAhOgCYQWNcF8/sGQlcJ5We9CtbA2F63QQnIzKYPDYtxwknNF4oA==
X-Received: by 2002:a05:6830:232e:: with SMTP id q14mr5709355otg.133.1637684602631;
        Tue, 23 Nov 2021 08:23:22 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 111sm2264314otu.55.2021.11.23.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:23:22 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: clk-alpha-pll: Don't reconfigure running Trion
Date:   Tue, 23 Nov 2021 08:25:08 -0800
Message-Id: <20211123162508.153711-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123161630.123222-1-bjorn.andersson@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the event that the bootloader has configured the Trion PLL as source
for the display clocks, e.g. for the continuous splashscreen, then there
will also be RCGs that are clocked by this instance.

Reconfiguring, and in particular disabling the output of, the PLL will
cause issues for these downstream RCGs and has been shown to prevent
them from being re-parented.

Follow downstream and skip configuration if it's determined that the PLL
is already running.

Fixes: 59128c20a6a9 ("clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Forgot to commit the last minute s/pr_dbg/pr_debug/

 drivers/clk/qcom/clk-alpha-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index eaedcceb766f..8f65b9bdafce 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1429,6 +1429,15 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
+	/*
+	 * If the bootloader left the PLL enabled it's likely that there are
+	 * RCGs that will lock up if we disable the PLL below.
+	 */
+	if (trion_pll_is_enabled(pll, regmap)) {
+		pr_debug("Trion PLL is already enabled, skipping configuration\n");
+		return;
+	}
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
 	regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
-- 
2.33.1

