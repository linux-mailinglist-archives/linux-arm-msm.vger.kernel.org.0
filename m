Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4193C5526BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 23:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242451AbiFTVvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 17:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiFTVvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 17:51:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED581A064
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:51:52 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id j22so6731389ljg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5VB+OjNM0FgonA9OHE0Kg6JQZj4dnCquoYDOQxZe7mo=;
        b=cSQ/oyUJ0l8bbipEuGZvIJbKdKDyUZMNlwVg8LRafAdPRUa9D0djloP235lZUMRwDw
         jkwaAYtU8t3g8YuYJdS2FZQrwcyVIJgxS6yZ227PYhN3yWad1AqT6BpZ1YFeqRIM+ASv
         1DyE29iwPK17YCir+i3cl2T8kumxk9VIfX8hsMl7YD9PrMWrXB+5n36815k+usCQFwsJ
         MthIcOk+TC8tuata+ssCePg0xWkbggqN7EJ8Ejj55/4XDWNwPN/jNXD0BDjXMJByJCLY
         jXzIABNP1yLrVbVaDiEU2LdU0UiWWtfRM0gypEMQaFl3sqsi5eRICLOqzKzgcLoUo2sU
         yZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5VB+OjNM0FgonA9OHE0Kg6JQZj4dnCquoYDOQxZe7mo=;
        b=MyufGT7mspAvxYjbSIC3eTbaUa0QQflxvwZn4/JZPUI93RFmtMgyz/cyCn0+K+SFzO
         xXRLQZxE3MK/+8ECxVQdeXfMfAoN8ZoLDPUdAUJJqkN1js8VYpGHhKyc9f89/F9cedFi
         0l7CDlfeHPw/0BoSrF5x8QHVNf32D0Cr3f7yDTuzPOWqmbr8Y8k16AEXqxDk2eieXG52
         BYJomGC+bCOj0t4mqpOaJkdEMqaXGRDuJnETtX1mOHXCvqqUo/JhIIzpm2U7WKJBy7hs
         PdYL9i+UZ0sK9RO/8PGc5UOLCVbz05PVAd/U3+WLgUSkLBFEmLdHG7xFL+lgXTmpwbe0
         tYKA==
X-Gm-Message-State: AJIora8t4sAk0qtJRaWk/gKAC6p2taWTBAeNlgotmuW92L2Ku70mnhpU
        EMh/OSxa6lBAkr4c1RkFx9i+nA==
X-Google-Smtp-Source: AGRyM1vMoxB1T2TWeP+vflMBzhmgPmXF5Lj32pDYPWXE9f/D85wvLBD/f/9hzHWJX5L/IGNQX5slig==
X-Received: by 2002:a2e:bf02:0:b0:25a:6348:95c6 with SMTP id c2-20020a2ebf02000000b0025a634895c6mr6553256ljr.183.1655761911351;
        Mon, 20 Jun 2022 14:51:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s30-20020a195e1e000000b00479307e4a1bsm1897989lfb.135.2022.06.20.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 14:51:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
Date:   Tue, 21 Jun 2022 00:51:50 +0300
Message-Id: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Use parent_data for the last remaining entry (pll4). This clock is
provided by the lcc device.

Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 718de17a1e60..6447f3e81b55 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll4_vote",
-		.parent_names = (const char *[]){ "pll4" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pll4", .name = "pll4",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
-- 
2.35.1

