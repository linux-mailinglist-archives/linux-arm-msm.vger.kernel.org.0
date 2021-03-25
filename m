Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7850C348EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhCYLMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhCYLL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:58 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489C8C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a1so2607471ljp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oEsz4OBuRIZ0O0Ytb61Eklfea0zi+sro1RS7feofbWM=;
        b=YcNeOZmhAmC324/TYGR6lxX9KqL0sWSyciqVxmt1VvljsX8T26TU7G2f6+ZHcqGkhn
         Ld23/EjAtmMsnVcNdsq2XKTSVhKANINdW58K/qP7pwCRwGJIwg1Ful32JffmIAsTKYf9
         U4JgYj6dDq1EG8tlh8aBEJj2vKZkMj4PGg7Pjc8Dm9B9Li3L+H0/CdSBdYvrISrJ4nZU
         zeZVAxd9gTqmzzXBFTB5obgIUf9Nt2/c9RT0jEgEyHSUGRr1rg/ikOqbWKIOJrMAoTg9
         ivt+IaEcM1iUiZBmkqGGlIip+pwpnPMuGjhCMLHi4exW3CIaJoiv3oOuTKwxdF0e5AsL
         xqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oEsz4OBuRIZ0O0Ytb61Eklfea0zi+sro1RS7feofbWM=;
        b=JGM4ANj/RHm1/4Bp6k9xyWradS2t2KXRD0HVO4IYrmrzxYW+kGYV3DtB3iVYwQmkt9
         7gvstGMY9oRh5jPEKP4XdBNyG99KwgADZDbH7DqTwyImIOzQg+9r+X09lQpTRi8YCy8O
         q+sSrkBmFXpXSrT17Q84knspEOy0eEckn+oU7ACrXe8lat+AE4DUNeyQ7SQaW/feIoPb
         R0qsb9n1Mr8xgVlObPBC2emSCm0Gc6NUSOeUGi7/sH5FdDLDhVDL0BwxRJS3UaIQZnF3
         lLVNvbF1+7UOBi0+biS6oC4ZIVfp+m6PfN4wqQyUj/Xr3SUzfoUEId8TkomhCjr9nXWq
         Iorw==
X-Gm-Message-State: AOAM532/Wtn3a9dsCW95fwRpfO0RuCIdSSA21aRqp9ZofiqcW511tk0y
        lN9Po0fvxFutwBA+HJUWh1ITrQ==
X-Google-Smtp-Source: ABdhPJwoEnwEoQCyY1TDsM6UsR6a1mLp/+FIG735Rg7Zbj4XeP9+tcnShIsMFSH036KQOXX9K4YXCg==
X-Received: by 2002:a2e:8592:: with SMTP id b18mr5282807lji.155.1616670716845;
        Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported clock sources
Date:   Thu, 25 Mar 2021 14:11:42 +0300
Message-Id: <20210325111144.2852594-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

video_pll0_out_even/_odd are not supported neither in the upstream nor
in the downstream kernels, so drop those clock sources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sdm845.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 5d6a7724a194..7153f044504f 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -21,24 +21,18 @@
 enum {
 	P_BI_TCXO,
 	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
-	{ P_VIDEO_PLL0_OUT_ODD, 3 },
 	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const char * const video_cc_parent_names_0[] = {
 	"bi_tcxo",
 	"video_pll0",
-	"video_pll0_out_even",
-	"video_pll0_out_odd",
 	"core_bi_pll_test_se",
 };
 
@@ -79,7 +73,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_names = video_cc_parent_names_0,
-		.num_parents = 5,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.30.2

