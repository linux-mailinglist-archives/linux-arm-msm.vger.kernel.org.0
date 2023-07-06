Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584A8749E9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 16:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbjGFOI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 10:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjGFOI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 10:08:56 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3FA171A
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 07:08:53 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-262fa79e97fso422175a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688652533; x=1691244533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGfM/yd2eeNog37kmGdYUSawTbJfVWvJuEmuS/r9kdQ=;
        b=QyHYAWKjSRUqnEtohZsI6HWp+QFi4B36rz0mjzUObkR4jje3etuSC0hqmIiPoisKdU
         OrEEFqjbPx8Jb9o3eTqY4SJ1MNEzoyh7MamWkqiZLScosHfmmNh0fd0RgneSboh5ZLOU
         drWe4j+PM6/CV61jbApjN5rjVVmUZQzXMiD7T/+Twpa7BbgUE6YgSKRilEl7xzSzEJOP
         J8ww1NWqPyCBnTLZAn5VzcYSf3p/O2FogpLQDAmx7lKSXKywB+1D5UkJUWp0SQDUzh9A
         oLcbuQs3oUhHDf7gdcmT1HS3k+SHFGwAimK/FQ6hi0lddJBFhsX7iQvpD6mOAju6w2CA
         uMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688652533; x=1691244533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGfM/yd2eeNog37kmGdYUSawTbJfVWvJuEmuS/r9kdQ=;
        b=JO2HjFYQzA7xc8iqMcO899+YM5sTXcy2VlzSzlzaUEmZA/mMnzEWemzkB4R86QRrQN
         NFGp0d6jg5L1uogg1gMbSNUAQwMYy6q6M4CdZc7APs1eteVvVx5zoEmeFUgPEj4FWxYN
         Fb2jlF+BbWggPI1zJBVVUzyAO6Oncb7GPG5/duT1Ll6R2V+jREuX3f71dPPk3oDAuqs7
         V9nUXCWklCcw9U+XFHm8REwRPUJZmm9Dk2KvhjQdPkLo12I1Y+7a+RzqSbT8NIe0DtA2
         5c6zfUAXDCStS2egOaQvp2WVVi8I/LdkcKjfkcnXKWC7va87lBaxkE0MGFqGt4Ghbtd1
         FrWw==
X-Gm-Message-State: ABy/qLYwB5W+Q4zqNdIcKarITM4ueohJfaLCBREvZnyKFzIfEXkRY1SI
        192G6nvziy2+fNC6eQIL4eRuc65ql6wzTw02eA==
X-Google-Smtp-Source: APBJJlFOvKiFoT7+IHEw7FZVS7hfzVpYVJOmP7sE7vhUL+FPT9qqTjJ++W389w0FzoL0paB+3Q8H4A==
X-Received: by 2002:a17:90a:6505:b0:262:e49b:12d0 with SMTP id i5-20020a17090a650500b00262e49b12d0mr1199514pjj.48.1688652533355;
        Thu, 06 Jul 2023 07:08:53 -0700 (PDT)
Received: from localhost.localdomain ([117.216.120.100])
        by smtp.gmail.com with ESMTPSA id s28-20020a63af5c000000b00528db73ed70sm1396609pgo.3.2023.07.06.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 07:08:52 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc:     konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] clk: qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state
Date:   Thu,  6 Jul 2023 19:38:42 +0530
Message-Id: <20230706140842.18059-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

With the minimal system suspend support in place for the PCIe driver that
keeps the interconnect path voted, the ALWAYS_ON flag can now be dropped.

Also, the PWRSTS_RET_ON flag should be used to allow the GDSCs to enter the
retention state when the parent domain get's turned off during system
suspend.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Changed the patch from simple revert to changing the ALWAYS_ON flag to
  PWRSTS_RET_ON.

 drivers/clk/qcom/gcc-sc8280xp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 04a99dbaa57e..c59b0f91c87d 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6786,7 +6786,7 @@ static struct gdsc pcie_2a_gdsc = {
 		.name = "pcie_2a_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie_2b_gdsc = {
@@ -6797,7 +6797,7 @@ static struct gdsc pcie_2b_gdsc = {
 		.name = "pcie_2b_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie_3a_gdsc = {
@@ -6808,7 +6808,7 @@ static struct gdsc pcie_3a_gdsc = {
 		.name = "pcie_3a_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie_3b_gdsc = {
@@ -6819,7 +6819,7 @@ static struct gdsc pcie_3b_gdsc = {
 		.name = "pcie_3b_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie_4_gdsc = {
@@ -6830,7 +6830,7 @@ static struct gdsc pcie_4_gdsc = {
 		.name = "pcie_4_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | ALWAYS_ON,
+	.flags = VOTABLE | PWRSTS_RET_ON,
 };
 
 static struct gdsc ufs_card_gdsc = {
-- 
2.25.1

