Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D463C7010EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 23:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240413AbjELVSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 17:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240415AbjELVSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 17:18:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66086A58
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f24ceae142so8375714e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926254; x=1686518254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jRSMDMTdVsO/Mdr/Nh2wzZ9KeAk9092DrEdnm9Eu+w=;
        b=mf3PaYco+DpaF01U4rDJ9rt8vQUHMMmeTpVsiyAksnKb/njT/oeHW3PPI/9ti2+Lua
         JS60kOSqDYvc413omBRFQnKmdz4zj3eXbG1zW6pWei6a/oB+9xOdB93ArrDHQauwv5qm
         U/vFb8FXp1SGxxTzTPsk0lhaUayslf6yL+wjDQmyzqDmZNZjR3owi4cJQtMYvTOR33Xj
         RAPcnOoJgtDOqiuB8OenHfnTAP4SufD/49DMCfnE7jcY6S0BHozr8+93RziNRZNLm3iU
         aOQLrXZ+QaK5JJAdICFQo9ORsTurJUks0jiqBVh3WFlFJknDaWctv6Z0lHxiEwRjoL+R
         Ukzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926254; x=1686518254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jRSMDMTdVsO/Mdr/Nh2wzZ9KeAk9092DrEdnm9Eu+w=;
        b=lxa97k/4Rvx5s2bEZOWFplv1+docwl/FvOPAcar12l/xSkZj6zegkkLnfs5g9HWKKC
         YNYVp512QOdUN8PfvOCuRtn7L8T6gQ0PyihZNtk7V0UQygzSelbFopJyVAGRC9GQjd4K
         EAsTTDtDaJPTDOd+tB6Zaf5Uvi+JjT8yBRfXku+OrcEHMJbHiQMAh6z/gPmUpFSSO/pg
         dmHNidD2MiAhzLLdyBzjyzoB/tmQGd7VMGiAY8r3WFPOG6D49VbzBvfTz+wMLyU9pcpu
         Vvkxdiyl+Y/Acb0I6i45rB+InzHB+PxJGUacaKdLcV/KI96v7RyYeOMJxRiiw+eyA7Fe
         3Cag==
X-Gm-Message-State: AC+VfDxX7i2WJokU2keA0n9vCAZSbux15O6pTZxI7j1wNz4Nxwkbb63l
        QliDRMkAkuLp2mUjhjT04atoQQ==
X-Google-Smtp-Source: ACHHUZ5IEJY9kAsL0eTI8ki6vW4Iu59o90dwpHcWrBo3xLSAErD4WdXPiBXEG2hFvOtNEOHkQcCnDw==
X-Received: by 2002:ac2:48b5:0:b0:4e8:c81b:1a11 with SMTP id u21-20020ac248b5000000b004e8c81b1a11mr4646961lfg.49.1683926253816;
        Fri, 12 May 2023 14:17:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:33 -0700 (PDT)
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
        devicetree@vger.kernel.org, stable@kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 06/10] clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
Date:   Sat, 13 May 2023 00:17:23 +0300
Message-Id: <20230512211727.3445575-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
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

The pll0_vote clock definitely should have pll0 as a parent (instead of
pll8).

Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
Cc: stable@kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index fb5c1244fb97..2f921891008d 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll0_vote",
-		.parent_names = (const char *[]){ "pll8" },
+		.parent_names = (const char *[]){ "pll0" },
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
-- 
2.39.2

