Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE535550E4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 03:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237536AbiFTBGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 21:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237527AbiFTBGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 21:06:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB2BB7F6
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:06:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i29so14866536lfp.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w1X6XioIFHIGc0TtSEX6Dx3KO+/cL3K9i4MVkunJFy4=;
        b=DyXGCMJbP7c0vygmEbAY8WRyg5LC3BsJwQ0yUsgNd7R7rPWrnIYVsPUYQmWsqdfEXP
         h8/4yGchzDIv3u34VdI5rpPJZl1IHNNtDITHQxBvG36EBx3+sYw5qp5HM17o52+VoL8p
         /vgF05PQmDBwt6Xqnj7bPiqIQ76FVhDWmRH2CKc3LgoTR9EihiHlzXDwtazhpfgDbQq6
         /SIkPoqt94nLCw998pok7+jQk74R6pEPK5yNJEvJ6SElfTiij9ss9aRyibvxGQkxJr6b
         NXa7HEdKxzQpO5+oy4L8zI0tSpSSo4vBLxwsgIYmYr5tmcX3nkBc0NncOTFdAG5wzVOl
         i2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w1X6XioIFHIGc0TtSEX6Dx3KO+/cL3K9i4MVkunJFy4=;
        b=r479mCg2AIPhZI5ykRhBWDGmLAyJRYpgg2VW9Y1z4gvVVLr/IELuCzogtT5HsKIiGY
         y5GqbaOC2Rc+tGxQwqgOYpbQj00fAnWsENR5yMcLW9LIhOeYYi1pldnXo28NHwxcMEfC
         hprQgmvOYVesiUNsOvoAHtsreU8FXuGAZ2EQbyMdqOQ4nk9xdzMf5AAEtsiHFqVrYUjP
         PJ/UQwwgtEqWno6f50btVhRuNuBG9oE45EIoJeBnKaa7DoJsRSQaoswUpTurtqctuLQm
         zFPDUGaZ49NQOlGS+OXqW+nErP4uXc1vuAJbJ2WX7sCQzkWbMFE+ScGRzjgloqW9oo5i
         hrwQ==
X-Gm-Message-State: AJIora+4mSVrfVp9MfYSq4BlYuNzkx4pWeYk+xstK149oevRmBGw4TPU
        ESyUCBoKBwMrfAXaUb5S6TjHU8llmbhw2Ghe
X-Google-Smtp-Source: AGRyM1vrimmMqrGWgTjIp7tmlXbBPHZGqQVyCPChg9hk70SjCo3/qUklLGVFvXsfjKpyUU7nld211g==
X-Received: by 2002:a05:6512:2627:b0:47f:750f:f93c with SMTP id bt39-20020a056512262700b0047f750ff93cmr209123lfb.409.1655687204036;
        Sun, 19 Jun 2022 18:06:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f27-20020a19dc5b000000b0047255d211c2sm1543891lfj.241.2022.06.19.18.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 18:06:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: a53-pll: convert to use parent_data rather than parent_names
Date:   Mon, 20 Jun 2022 04:06:43 +0300
Message-Id: <20220620010643.1533531-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change a53-pll driver to use clk_parent_data rather than always looking
up the xo clock in the system clock list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 329d2c5356d8..f9c5e296dba2 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -127,7 +127,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	if (!init.name)
 		return -ENOMEM;
 
-	init.parent_names = (const char *[]){ "xo" };
+	init.parent_data = &(const struct clk_parent_data){
+		.fw_name = "xo", .name = "xo_board",
+	};
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
 	pll->clkr.hw.init = &init;
-- 
2.35.1

