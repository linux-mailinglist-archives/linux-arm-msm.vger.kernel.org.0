Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A2568EAD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 10:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjBHJPq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 04:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjBHJPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 04:15:13 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BA54609E
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 01:13:52 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id lu11so49614631ejb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 01:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTdx2dHITQV8+kA5/WdkyW36pw2cffdM7pRJVj161AE=;
        b=i9BwVLLxEYfhVLyfIsJbZ2f4Lr7Ad8D8Nuv1j3FMdcPPvprsat3CNcwwzsVQtUZnS6
         /L93kwaplEDymkqEbUSjCMtxAoJf4zWjW1X45zN0omBFgrbM970kypYmcca6bg6dZO9T
         u9L0W0bq3xfb1LjnTfrN1OqHjPEkgZ2d4yjuwY7Qq/MxE4Ck9FTdlHTD2lf2i59B1k5V
         jky6LmB4SsdOuIE0Xr5wi2FM/djikHrCbMgJzKyphgCwxawd34EZIT1hs0Tg0w+EOFGp
         qc+/xPhQYIixKNATSp0aGrv9uAv5Z7sah4TjKehXEWNcUuyQKVLosrbWcqgX+2ua7vZt
         Z1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTdx2dHITQV8+kA5/WdkyW36pw2cffdM7pRJVj161AE=;
        b=FKSIHhLLJ1cardm6RZqw6VLGR7TUXL70mcBQ0q/G1KpmBCYWGuTLHhOX6HESm/SkNM
         x+EtSEkHn4OgZ83MK8ahsPj+Ju68+k8aDUAQxU4bWe4O3kUC1TVSkBKtoVwJVSF8dZSL
         f+3rijqfgIiTcs/QoC+eDVeDZcT1oDKrz083FW29DfNDu4gg7cxC4pdtpGsE8Ipgdppb
         NcsN1P1HTeUr2A+E451gOMD+TsA/c/pZAxrxPThoVh/TyFk6prnu9CRtCN7ylgLwJ6cQ
         0DjqqmczHwHwR/WR/WJYvhIlvdrtDxS++SpxCqwJRvKvvemYRiJhKdefH6D/LwoliOXD
         Tu1Q==
X-Gm-Message-State: AO0yUKVT/arMJcfT0CcJmVaX3XBSF0VhVDcVeH2u2koTbj1IZNkYQkfF
        3UzlzR0LdndihvDfXALAtfVN839px8lJvZPf
X-Google-Smtp-Source: AK7set8cYKfY1jOTs0IzfGLi0MhS7aIjaoYiPCkXJeZQdSUvAuobOhlo4dc2WQY1Is0HLtt3dTil3A==
X-Received: by 2002:a17:906:f6cd:b0:8a9:8047:a5c with SMTP id jo13-20020a170906f6cd00b008a980470a5cmr6281123ejb.7.1675847628975;
        Wed, 08 Feb 2023 01:13:48 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709064e0200b00887a23bab85sm7987279eju.220.2023.02.08.01.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:13:48 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/10] clk: qcom: branch: Move CBCR bits definitions to the header file
Date:   Wed,  8 Feb 2023 10:13:33 +0100
Message-Id: <20230208091340.124641-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091340.124641-1-konrad.dybcio@linaro.org>
References: <20230208091340.124641-1-konrad.dybcio@linaro.org>
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

Move the definitions of CBCR bits to the branch header file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.c | 5 -----
 drivers/clk/qcom/clk-branch.h | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index f869fc6aaed6..f2b577b07b7e 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -39,11 +39,6 @@ static bool clk_branch_check_halt(const struct clk_branch *br, bool enabling)
 	return !!val == !enabling;
 }
 
-#define BRANCH_CLK_OFF			BIT(31)
-#define BRANCH_NOC_FSM_STATUS_SHIFT	28
-#define BRANCH_NOC_FSM_STATUS_MASK	0x7
-#define BRANCH_NOC_FSM_STATUS_ON	(0x2 << BRANCH_NOC_FSM_STATUS_SHIFT)
-
 static bool clk_branch2_check_halt(const struct clk_branch *br, bool enabling)
 {
 	u32 val;
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index b325f943c3e0..9bec563ab4ee 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -39,6 +39,10 @@ struct clk_branch {
 };
 
 /* Branch clock common bits for HLOS-owned clocks */
+#define BRANCH_CLK_OFF			BIT(31)
+#define BRANCH_NOC_FSM_STATUS_SHIFT	28
+#define BRANCH_NOC_FSM_STATUS_MASK	0x7
+#define BRANCH_NOC_FSM_STATUS_ON	(0x2 << BRANCH_NOC_FSM_STATUS_SHIFT)
 #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
 #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
-- 
2.39.1

