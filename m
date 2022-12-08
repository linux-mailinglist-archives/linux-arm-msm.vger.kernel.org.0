Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D85E647174
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 15:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiLHOTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 09:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiLHOTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 09:19:17 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1793183E97
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 06:19:16 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id n1so1705038ljg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO1TEW6mwkKcKD4IayGIVkWwiVVV46OKlU5ps43+4is=;
        b=CsAofK6OyYMnXAgeApqUg2MPrmmMY8eJTIFtvEBb4YEUkaOxW7/zf8lXvpdOo1VYXi
         aevlFgn34zjY4w9jln7EYTuYyovC1yo+FDEUSKRYl2VkoM5meWj+fC2n3lOqKPdQNoqn
         zYYAoAzFHt4z42k2x6CY561BlByCt/y0UZFk9PUEV1SdgIivYiSNRBQtz/oYP7YPWhxB
         Zx2EkLDn/JD9733uLZC1/9VEXT3u2SrZWJ8LbYIs20uMbLVbEe+EJvSQ1qYQQ8oYK6zI
         cSNn6LGtgK2aSIPTkyCFgA3j3GgAYTmcvyAzdtNU6+GIYrvWe/tc+c3Tz7zZja9eJrGW
         6k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO1TEW6mwkKcKD4IayGIVkWwiVVV46OKlU5ps43+4is=;
        b=TVPvcLX13t2oQeVTrxywXlexw62l8ZJ1EipKF+d6kBMMLWzTB11dT6CAmA4zUrkDb7
         HNoKVn7bsptRyKTmY0GxNGNU5ht9Efcz/i3tjJq61ej+fmsWHPJQFV2vW5pX3vPM+Aeu
         8YFAM9er1Rbj+j6td14sf9asIaFLwS0dqx0gibAcFqoNJ+HGcrPEztUvkb4/Ku7BKZoV
         R5iAnozKuR5kzs1Uo6vHmBash1FSbg1m5D87U0GOhddj6+mNzFq7gvval74J5mbY46tl
         4cWhC7yOI1SbiK/eycsfDxQMvUY6B2ynYV8V6fo8YYNdB1wea/ZPhLZD5hSLoxATGE19
         /K9Q==
X-Gm-Message-State: ANoB5pnzEPNwrg9VXhD4iEbu0+tZC3UbsnjNlQPZgSasMB8K8zbD/PUs
        +mMB7D7hGAJ8miGfza1yuLF4KA==
X-Google-Smtp-Source: AA0mqf5cqqRQF2vMLl6TY3qA+zMpUnQwHPaRKivsk1a5Zaht2c0oLsos3/D0YTg+i5H0e3N+jZI8uA==
X-Received: by 2002:a2e:b6c5:0:b0:279:d61b:181 with SMTP id m5-20020a2eb6c5000000b00279d61b0181mr9519245ljo.166.1670509154435;
        Thu, 08 Dec 2022 06:19:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512203100b004b578e52d81sm1514692lfs.176.2022.12.08.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:19:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/3] clk: qcom: gcc-sm6375: use parent_hws for gcc_disp_gpll0_div_clk_src
Date:   Thu,  8 Dec 2022 17:19:11 +0300
Message-Id: <20221208141912.47262-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
References: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change gpll0 to use parent_hws isntead of parent_names for
gcc_disp_gpll0_div_clk_src clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm6375.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 89a1cc90b145..6d75f735a7a6 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -2330,8 +2330,9 @@ static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_disp_gpll0_clk_src",
-		.parent_names =
-			(const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
 	},
-- 
2.30.2

