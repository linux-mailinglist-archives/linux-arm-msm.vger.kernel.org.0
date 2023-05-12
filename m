Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA0ED6FFE07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239662AbjELAcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239676AbjELAco (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:32:44 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB0961B3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:39 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac80da3443so102159851fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851558; x=1686443558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWMNT07qFC9FaIB+soq8G5lluprlR23tOWvaEOZLetQ=;
        b=RIJl/RoSn1hgNANW4OSXQfHEwWlT3wAkwlrAUGo5WUyWPaioEq+QUER3H1BuTRwSg/
         W+bX8RnzlEbOLDn62vyeLE9jVHut67k3yG7t7Ph8uucV89470+DdwtND5sq2G+osYC7N
         dQrxeGw1xQTOoIRrrQeJVppIBocilvWEDtdOWSJhioziJvSGe2G6ssllx2o5Bmn5EZTU
         rNoxTJozuaj/siRFG99uwTLuYhCDq+UEglMfEJRlnbU7u3QtJge0WwWcOGG5UO7t9IjN
         OeCthprpkp+x6JxPjbxCXtC7GGucrVklmm8BLoNBPJD0m3+TGSU2RQC3AFyDoDJrS/Pf
         NnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851558; x=1686443558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWMNT07qFC9FaIB+soq8G5lluprlR23tOWvaEOZLetQ=;
        b=MzYhjcENq3XSyZnCp3tVdOUmfA7lRVLqcH2brQkCepBFuXXe5kcaXFne/0pdfUdCnm
         WL6NxPw3LwY+T4VbSEqLjcHsFnxb0npNyThOXatTs1y8XDC+nkzRFcYRGgZjmdwbG+fO
         AmyGWPeyZdbx1b4KaiqusisGA26odhZR0AavcQGnV56N34ETTSAf+Kle3hfjh771coEu
         zN8ZspOsYj1Bq2SPJTmkjVrWr5LDAgsgNxs5IQZVW/k6/0cRh16QHpn2zvulxjYHfNoj
         j2swQzm+sGQZ7sWva5HmZG+0tmBOHDsrYf22x0VR0kbA4sc2EXGCDAdbApv2JnxLq7HW
         qPGQ==
X-Gm-Message-State: AC+VfDzxWOdZnzwkVkzGteL4wwmhqGa1thCAA6J6iMyTLqRFJQnWkajG
        qioLYUn8bWzVD8n1ob0Y34ZBmQ==
X-Google-Smtp-Source: ACHHUZ6cozUwWbiYPWLtcoaCkI3dBWgD6myULjkApQfsanzYbfL4ngZcAR6MTLUFXTmwB5LsvUVORA==
X-Received: by 2002:a2e:9456:0:b0:2a8:d335:350c with SMTP id o22-20020a2e9456000000b002a8d335350cmr3382059ljh.36.1683851557578;
        Thu, 11 May 2023 17:32:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Date:   Fri, 12 May 2023 03:32:28 +0300
Message-Id: <20230512003230.3043284-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gcc and lcc devices have been switched to the DT-defined cxo_board
clock. Now we can drop the manually defined cxo clock.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index 458c18b639db..64d4f508e43a 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -26,17 +26,6 @@
 #include "clk-branch.h"
 #include "reset.h"
 
-static struct clk_fixed_factor cxo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "cxo",
-		.parent_names = (const char *[]){ "cxo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 enum {
 	DT_CXO,
 	DT_PLL4,
@@ -1623,10 +1612,6 @@ static struct clk_branch ebi2_aon_clk = {
 	},
 };
 
-static struct clk_hw *gcc_mdm9615_hws[] = {
-	&cxo.hw,
-};
-
 static struct clk_regmap *gcc_mdm9615_clks[] = {
 	[PLL0] = &pll0.clkr,
 	[PLL0_VOTE] = &pll0_vote,
@@ -1736,8 +1721,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
 	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
 	.resets = gcc_mdm9615_resets,
 	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
-	.clk_hws = gcc_mdm9615_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
 };
 
 static const struct of_device_id gcc_mdm9615_match_table[] = {
-- 
2.39.2

