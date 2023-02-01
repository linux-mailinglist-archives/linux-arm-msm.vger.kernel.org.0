Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D082686E1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 19:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjBAShV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 13:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjBAShU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 13:37:20 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BB37FA20
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 10:36:45 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mf7so35400931ejc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXCf2QEFiI/UaJA4L2hQetVotYkWuOmRjSs3LoUx6JE=;
        b=zY3iUDbikuUlCz2+bgIMc1ycTaMuwKI7PI5fZbAZjudVlEaR22XjCYMTGA+E7hjC8v
         O2SBgPtUivnoFg+nNhUMG3sI5EXNtDFpTZsnjwjvkH2BGzGTJvroZ6qmsH6a11/CFGfE
         zPPDU3wG1ScTF+1bUTIZfmH50LFTac7ZDHWttc0UcFJMWfBnBc7GJzrsAMueNSBJTO1h
         Eh0cpDG5s+WKaIh8wgeZopJPtOdJgyKqrVqtTgX6pmK48UwHP9XEUe0DyZ8DQmli8LCM
         Cs8Srlr2GxcP2yRcSl7TUHkm92dcJ8Y4tvGRnpadxRQ9tHVZjFaJGbtSfZyiwyA1ABXB
         IzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXCf2QEFiI/UaJA4L2hQetVotYkWuOmRjSs3LoUx6JE=;
        b=3jx3MBTUF1Dxf/01mlTG+jRGzTh1FnEw1NIzc7m4vwKRx1/Qfm9WNhSxxarEKj5fhH
         ICoSt0MeL+J2Ke9qTNRVeE9Y3Emq0PnpbIttCMIgjH6I33CQHe+7jer6MWSn9o32ko4I
         CEyeYTJxpe6Hkpg32bbHqTNTACeVUOzq6PWnLd70W7x9xF8A8fpye6smeYD6Ki6W6yOd
         Ri70pfNuvGTTkD4/f7SnNsuXxjq3TXU8wyV4BNen8UTff0wN0iVrsV/Mmb+DNAAiAOFx
         HZuGQN5ExbTdxXLmn4XkR9XbcG7whajznEwHvJN2ZW4i7WBatccfmcExiZrYtO8orJSt
         SMWA==
X-Gm-Message-State: AO0yUKV4Dx80AxQzZYFJolx67upFVt7pxy6apdf8UR9trNa67q8tt0xv
        hrDSk3XGzSmYEIfUXaG76SmA5tFYdMz1+AzY
X-Google-Smtp-Source: AK7set+g6R5KH1B7A2ADa+1nbxa2R1ZUk0Ft5BfSO+EbNOnhLHDwVWt+kv+lCXDycCX4VUslNcPeAg==
X-Received: by 2002:a17:906:49da:b0:88a:8e57:f063 with SMTP id w26-20020a17090649da00b0088a8e57f063mr3433423ejv.62.1675276596833;
        Wed, 01 Feb 2023 10:36:36 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t13-20020a50d70d000000b00458b41d9460sm10297508edi.92.2023.02.01.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:36:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/10] clk: qcom: branch: Clean up branch enable registers
Date:   Wed,  1 Feb 2023 19:36:20 +0100
Message-Id: <20230201183626.351211-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201183626.351211-1-konrad.dybcio@linaro.org>
References: <20230201183626.351211-1-konrad.dybcio@linaro.org>
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

Prefix the "branch enable" registers with CBCR_ to be closer to what
they are actually called in Qualcomm terms, use GENMASK instead of
shifting values around and adjust their usage accordingly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v4 -> v5:

- New patch

 drivers/clk/qcom/clk-branch.c | 10 +++++-----
 drivers/clk/qcom/clk-branch.h |  7 +++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index f2b577b07b7e..ca896ebf7e1b 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -44,17 +44,17 @@ static bool clk_branch2_check_halt(const struct clk_branch *br, bool enabling)
 	u32 val;
 	u32 mask;
 
-	mask = BRANCH_NOC_FSM_STATUS_MASK << BRANCH_NOC_FSM_STATUS_SHIFT;
-	mask |= BRANCH_CLK_OFF;
+	mask = CBCR_NOC_FSM_STATUS;
+	mask |= CBCR_CLK_OFF;
 
 	regmap_read(br->clkr.regmap, br->halt_reg, &val);
 
 	if (enabling) {
 		val &= mask;
-		return (val & BRANCH_CLK_OFF) == 0 ||
-			val == BRANCH_NOC_FSM_STATUS_ON;
+		return (val & CBCR_CLK_OFF) == 0 ||
+			FIELD_GET(CBCR_NOC_FSM_STATUS, val) == FSM_STATUS_ON;
 	} else {
-		return val & BRANCH_CLK_OFF;
+		return val & CBCR_CLK_OFF;
 	}
 }
 
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index cff9ed6653b8..43cd41947ef5 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -38,10 +38,9 @@ struct clk_branch {
 };
 
 /* Branch clock common bits for HLOS-owned clocks */
-#define BRANCH_CLK_OFF			BIT(31)
-#define BRANCH_NOC_FSM_STATUS_SHIFT	28
-#define BRANCH_NOC_FSM_STATUS_MASK	0x7
-#define BRANCH_NOC_FSM_STATUS_ON	(0x2 << BRANCH_NOC_FSM_STATUS_SHIFT)
+#define CBCR_CLK_OFF			BIT(31)
+#define CBCR_NOC_FSM_STATUS		GENMASK(30, 28)
+ #define FSM_STATUS_ON			BIT(1)
 #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
 #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
-- 
2.39.1

