Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 536AC52DF7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 23:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245286AbiESVmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 17:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245285AbiESVmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 17:42:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE2850B31
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:41:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h29so11313978lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GwIzal5zCvbq2/Nx/4ZMhS9SQRC0VnO569u3ew8qRmI=;
        b=h/qH2ORI8drz1wJuLrVKvauqyS2lARWaJdQPDmKGSuD2qSG6owGgNwhcCtoMl5ouPN
         0hERz7BH5vxnKcuvdtENND2G+0lWjSVTTrBhlUWxefmurIwljMQJ+6LPZC9AMqcFO1nD
         VQ69lMOj3f3U4J+YKoGnMkjrSeMb/EV7ieSrpOvz2kLrZVIzeG6jhddlOo+JzpjocLWf
         641THBR7/IUUI7B8a7rKnPKd3mlVm++X9tk8Yb7TA2eyCUTzfs0dXAxEDCStTM1ZVc+h
         3s50+778HfF+E+QAAS3vtR8Zuu4y45ndBPwSTAXkPFkjc5PU31Snjye7PrjAWfgUKmZH
         CVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GwIzal5zCvbq2/Nx/4ZMhS9SQRC0VnO569u3ew8qRmI=;
        b=FUs+/pjOYAAKPQk3JGcl/Fgxc7A9jmzmPVpcllydX1yhFFt74rGnwj2XCBkEKpjWdO
         TnAmG5HQEcmM4Ig5FDRiEBi8949Pb3i1cGiQvAXiS5VCY13hsy1fMs+iqVE4yULVV30C
         e1P2mw510kdVQeDh/mM+Wfiej6YApry+ze2Zursht/B4fFyI5MAQwO7CjsNhhs1BF4Ru
         LcI6fNvbYAszvpjNgoYQGOG/E2sXJoIS3bEnasDQ4G4/8jgIahjbzjIYe2ysq+M+9oIx
         fdOZcVVTxmi/Se3nyvaitulYrN9EHSSIXdjSI1H6BxeLyB2NEEsPTSLohX0TsWI/QJZl
         uyYg==
X-Gm-Message-State: AOAM5326SIxUYol1GIeVtsvRrf7cbpR+ZEeWm7iHC7/+2jsE8DfaHJjE
        eGz1v7II77Y0ILzOC6M4LZlxng==
X-Google-Smtp-Source: ABdhPJw5780OEGQlcRK+r5COAw1rDrgKZ8PFIZd2mczv+PVaPvq/4f6L+M4rbcm51H1UrJsKUvAshg==
X-Received: by 2002:a05:6512:1382:b0:445:9536:903 with SMTP id p2-20020a056512138200b0044595360903mr4845926lfa.89.1652996504164;
        Thu, 19 May 2022 14:41:44 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e99cc000000b0024f3d1dae9dsm53576ljj.37.2022.05.19.14.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:43 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
Date:   Fri, 20 May 2022 00:41:32 +0300
Message-Id: <20220519214133.1728979-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
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

On SDM845 two found VFE GDSC power domains shall not be operated, if
titan top is turned off, thus the former power domains will be set as
subdomains by a GDSC registration routine.

Fixes: 78412c262004 ("clk: qcom: Add camera clock controller driver for SDM845")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index be3f95326965..27d44188a7ab 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1534,6 +1534,8 @@ static struct clk_branch cam_cc_sys_tmr_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
 	.pd = {
@@ -1567,6 +1569,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1576,6 +1579,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.33.0

