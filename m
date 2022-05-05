Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DE151BEFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 14:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355895AbiEEMRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 08:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350017AbiEEMQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 08:16:58 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3227648
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 05:13:18 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 17so5337288lji.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=iPZEkRw4cANYpzZSKcf0MjB2+jb1+GiE9rcWq2x4uy9Wj7+suHV2wEJkeG1cAX9kE0
         v4zM/obWqZi/L36Dnca1uf83qecwrppCepNn/6LcbSpj+jndxsYCl/gG9Tpe7p706Uu0
         6YLGokkSU9OajuJ8/k2r90jPSeDJc7Aoeab95hteMGqbUVaSX+dOO2dbxiZIt6tPj/vt
         b+8PF45o1cJSp5vYsO23PHVTG3u7anOIy/KzYoYlSENxKkVt6mnhxbd1KfQ6WurYBL/a
         1w7zpDCa9BhVae3xdB35CK88U7Lu9UQKZ5fRiVfS/rteomYT/wEmAhWz39bNqITvUUZV
         2wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=OVuaB38fe0Jr8vIk0ibqHAA8bnUupW/GDHae4Rhy1VG8F/1D3zuVj85DlQe61FPt98
         0Hyu9StI4RwDCUGTvxSshRJ2XYa61/kXbD+hK9mwQT0rWvJr1OGt5R/ZeECMe0q4w0Qc
         JWy+niHJqr30OQuU5BktcB2TfPHJMuaVuYXnYpmBa6ROB7iSo0vuyUVTRkZvwtbSx7B8
         VrQhY/OirhGpRazcBg/417N69M92rN4Vhp4MrTzeTTqYkV2LXaad+d41Rzm1HAOJew7z
         UAJiXlQHIur6HN5AyarEpwLqvi5ItZtc0OSAb/MkF7NvMqrk9it1ayQ+vLbcRaH5baNs
         +dBA==
X-Gm-Message-State: AOAM533UfmQj3jrx4c7cPLjEJSitWt8/YDTAs9EN18E9Twgu6Nxh2jza
        AfZhQLGdiwCmsTX9UBgT4T7b4Q==
X-Google-Smtp-Source: ABdhPJx02Mwod76TYs9SpDMNS6DnPUSLPt5cGYXLv9Ho4/lHzJn895Lq2i2Sx5fp4CbrjZnBsQUHOA==
X-Received: by 2002:a05:651c:2115:b0:24f:f52e:16a0 with SMTP id a21-20020a05651c211500b0024ff52e16a0mr12088112ljq.362.1651752796994;
        Thu, 05 May 2022 05:13:16 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id b5-20020a056512304500b0047255d2115dsm193441lfb.140.2022.05.05.05.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 05:13:16 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Thu,  5 May 2022 15:13:13 +0300
Message-Id: <20220505121313.4121829-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
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

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

