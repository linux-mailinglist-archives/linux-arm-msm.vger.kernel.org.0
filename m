Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7C65B3549
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiIIKbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiIIKbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:31:42 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995A858523
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:31:41 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id p5so1264929ljc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pTtm4yi9EAOEY6vRrWAlext4ChYvlJB9U3YsR0uPxqs=;
        b=jymvIrwLc1eqlShSgxRsUFqij5BkjcjHU/Ky+2nhly1DGx5rCWTDc3NFeXc6qgYBuo
         iJVpIoDwWcxZVceM+OPOE/vYfkebk2ImoIzymDQASwYeqWMW9BwToYX3JljUwfifXDK2
         11B5vV/Q1hnptECsJYWqFiWcYWsrSrfa/eiRLA9EdeyruMAzUF89X+rJ07O1/kz9IwsO
         u2eLuQ3NBIlkNBCATiBSLj3MYlQuppE8GLUXKnkjThSmZM1Uix/5781zx75z4UZU5CkI
         O4Z9bc99D6+Iuv/ECoD1OITGYruiZPOlh/7MSbiD+I+6HlkPsafraOzF9LdL7Dw+Ch5E
         8UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pTtm4yi9EAOEY6vRrWAlext4ChYvlJB9U3YsR0uPxqs=;
        b=EpMCvfmxyAJjlU/dfDzFeTwNRFioYH7ckqaeqYKloyACFuJ/WG2TsYxmksC1NQ54/y
         737dUPCpafVMJQinRfBpKOeLW7ZxnXso58UYBs6KT/c3JxugHhLa2v+MO/0fDXvXWaJF
         FoVnsWD7ivLo7+ym86hxtEAe9c3CpG8lqJ/VLHvHpPThEtXxd+oLuqf2XNiLHNtG43bP
         1BtVOY8eA6YvaBRwms1e68gTsh4XJ2gGrYJ2laS7WHS9ealUdFnaTDaelCORJdUMns3S
         U/b3JoXIX0+NA/ujdhzbZACxdyi+RztDdBoYAtwONRtA1l95PX5mEnAFkwPPdtV4LYYO
         tfRw==
X-Gm-Message-State: ACgBeo3hh3acHqyky881xEQBUD89zkajMbLq4cvci86b09QJwTmcTQQF
        npiCZZfhN7YgYqKUUV9VQAhq3g==
X-Google-Smtp-Source: AA6agR5BAXfTRI7oCh9R193gsTFzhn+8oFs6L/8MSyEW8o8iP4QSyq90OdjfNJAHfw19NSrfg6KplA==
X-Received: by 2002:a2e:9b0e:0:b0:26b:e2dc:c0e4 with SMTP id u14-20020a2e9b0e000000b0026be2dcc0e4mr874995lji.459.1662719500000;
        Fri, 09 Sep 2022 03:31:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a05651236c300b004979ec19380sm19160lfs.285.2022.09.09.03.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:31:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: qcom: a53-pll: convert to use parent_data rather than parent_names
Date:   Fri,  9 Sep 2022 13:31:37 +0300
Message-Id: <20220909103137.3727830-1-dmitry.baryshkov@linaro.org>
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

Change a53-pll driver to use clk_parent_data rather than always looking
up the xo clock in the system clock list.

Note, this change also switches the a53-pll from the global `xo' clock
to the `xo_board', the clock that is specified as the `xo' clock in the
DT file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Added a note regarding xo -> xo_board change (Bjorn)

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

