Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD844D8189
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 12:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239560AbiCNLpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240493AbiCNLoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 07:44:00 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872D82AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so26690041lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=JtXVjONRC3KWeyA0W9y8pWGFjBZ5GEsiaEFFzOsQn8i6PTUuIhLGRJNysZMbp85BuF
         otR+wnAbJO23yfbxkndOgSpU5xugVid4dzHtpz6WLQqNzFEkagp70tWGRsMFHLspFoK6
         50kKsMuiL9Tyqfx0zX1LkCzl8Jk98Cvc4W/ogZE8n0XzGw2Trtlkg/FqrKeNzknC5XxR
         G7xsIUHxanp6SeQklUhXlRucuSAsMQjR4ZaQobCZR8U2ZLOFpFlAkoopAv2lRIH++Vkh
         UmV6+mMjaWdwbco+6pPmcdLgiFviIHUzbpIOHBzftbdcQyyLE6VwhBK/TqZ2TVDrqTsK
         UEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=0I7TgOUKfo6RHY8iNjUNBTq9JwAQzJpfeH0++9rRG2e+svq4tTp+fKRquoLFxMuKXY
         /Oehn7+yX5Y+Yk7I3GYdZxtG2FIYsWPCAlrR1syNdoaEdRh3wXeNZd7duuOJi0l4ca1a
         NqYgEuKfW0K/qtokMWEtsg5/z9a4eH4cJyaG3B/xT2dWMwc6dOdelGdWfz5ITEcatMZy
         xnKSR2C0NMjxboacV52kDTVCaBapDYfDFWBElEk9+WZZkN8GH/uGb4mb3JDRgVMalth4
         QuHOspChUYFLmaQw1JeCzl1RjhPt6PYtNQVVXsDjjAjctPa3zD6f8dIZUDMEFgXccDp+
         gEaw==
X-Gm-Message-State: AOAM53396QGtQPLhpUfBtu3aHUve7+q8KUWG0dtLxEmqansjPl+K6TTV
        Bqcf20AWRoogveTzTn97FnWaWA==
X-Google-Smtp-Source: ABdhPJwVPaWVMTBDDDnp5V2iERwGSt2Sw4zrXJxtxFL5MEXzqBDY7g48kqEKUVTkI7RaaEofuQajBg==
X-Received: by 2002:a05:6512:104f:b0:447:f9b6:9217 with SMTP id c15-20020a056512104f00b00447f9b69217mr13523387lfb.575.1647258167838;
        Mon, 14 Mar 2022 04:42:47 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id b21-20020a196715000000b00448777c07a1sm1964323lfc.134.2022.03.14.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:47 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Mon, 14 Mar 2022 13:42:45 +0200
Message-Id: <20220314114245.1636599-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
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

