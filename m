Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1F23A785E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 09:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhFOHvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 03:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbhFOHvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 03:51:43 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF59C0613A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:39 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t17so10752429pga.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wYJGHXnh3H8tQOjqWO4HvEdpf5WCz791Tw53gEqLggM=;
        b=AXu+qtsCK0LKzXEODE2P/YLl1WjDrf4AOvIT/r4GkRQ3tRLyD71R2ZsksNgwQ/oPZa
         /Sgm0Vvym7B9AkW9c3mwXhrQ/+2nv1IBlj+tKGosuv3mj9IK5bzMNVGPp/lSfjM1MDPP
         PPYOLK0wNtxn3pMa31Kp2ChdUPoOKtU42W3jHo6/TeDQBB+z/ofxoLObFagw1vd2Mxxl
         GH3ucBsyjdLk9vjSDyeyl2ckZl4uZ4Q+kSwVccXSK6lboHOVSdshcvF7E8nQUZrV2A1q
         VUI4xIr25aibpffjADexfl82QXAagpDt07nNPXvn2YhMwYywl1ERkU7RkDjLDW6UgyJw
         0g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wYJGHXnh3H8tQOjqWO4HvEdpf5WCz791Tw53gEqLggM=;
        b=V1I7nEozAI0FMI4jxwClUZhYj9W0nrUdVnDdieFAJRMlI7pQZGuk1BiYPx0iQVXeWX
         SVLPNwrrRt9NOPiTC5eTA31s0glQFJY/K6y8TsWPsJPP7De9Agjx9r0b/1tBZCB3tObz
         b9lkp5JMVnfhtIphGmoCtj/Bg4zU4KI0IHgNX+UjnKANsZdWT2wHyjpnNzahqbQkNIby
         J1XnLuGRqpfLS29NRhab85/w2uln44jqGiKRi1EQPO/LPcRDxTx+UStC202LtLU5L9TW
         VZjHFie9TTgW3pBNIILY2pSswnaXohXS1TkItuNDZ0HjpBeDklCrU2SPUnVqTj7n90ZE
         OLrQ==
X-Gm-Message-State: AOAM530LPTwUy89tLssFgWa7vzVBCpQ7Ygfdqd9IqGVXmW9KK5F4n+Tb
        NnVoiyeJ+H3F7LvuTTIHbMbCnLrDoFK4NA==
X-Google-Smtp-Source: ABdhPJy5TWju/nccMyfcm4kH2XvCTFSTGjeGz7At4Wm/J94FY/5faGmW0IPxuxOqCaLpnrZuWjN+cQ==
X-Received: by 2002:aa7:8392:0:b029:2db:4a7:d866 with SMTP id u18-20020aa783920000b02902db04a7d866mr3318006pfm.66.1623743378994;
        Tue, 15 Jun 2021 00:49:38 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:38 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 05/10] regulator: qcom-rpmh: Cleanup terminator line commas
Date:   Tue, 15 Jun 2021 13:15:38 +0530
Message-Id: <20210615074543.26700-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup the qcom-rpmh regulator driver:
- remove comma(s) at the end of the terminator line.
- add missing terminator in instances of
  pm7325x_vreg_data[] arrays.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 22fec370fa61..af41a517da99 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -811,12 +811,12 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
 	RPMH_VREG("ldo28",  "ldo%s28", &pmic4_pldo,      "vdd-l16-l28"),
 	RPMH_VREG("lvs1",   "vs%s1",   &pmic4_lvs,       "vin-lvs-1-2"),
 	RPMH_VREG("lvs2",   "vs%s2",   &pmic4_lvs,       "vin-lvs-1-2"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pmi8998_vreg_data[] = {
 	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
@@ -824,7 +824,7 @@ static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
 	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
 	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3"),
 	RPMH_VREG("smps4",  "smp%s4",  &pmic4_ftsmps426, "vdd-s4"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
@@ -856,7 +856,7 @@ static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
 	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
 	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
 	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
@@ -880,7 +880,7 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
 	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
 	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
@@ -906,7 +906,7 @@ static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
 	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
 	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
@@ -934,7 +934,7 @@ static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
 	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l1-l12"),
 	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
 	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
@@ -947,7 +947,7 @@ static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
@@ -960,7 +960,7 @@ static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo7",   "ldo%s6",  &pmic5_pldo_lv,   "vdd-l7"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
@@ -988,7 +988,7 @@ static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
 	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
 	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
 	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
@@ -1012,7 +1012,7 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
 	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
 	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
@@ -1039,7 +1039,7 @@ static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
 	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
 	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
 	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l16"),
-	{},
+	{}
 };
 
 static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
@@ -1070,6 +1070,7 @@ static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
 	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
 	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
 	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	{}
 };
 
 static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
@@ -1083,6 +1084,7 @@ static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-bob"),
+	{}
 };
 
 static int rpmh_regulator_probe(struct platform_device *pdev)
-- 
2.31.1

