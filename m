Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194862F81DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 18:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbhAORMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 12:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387589AbhAORMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 12:12:49 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097B7C061796;
        Fri, 15 Jan 2021 09:11:36 -0800 (PST)
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 001003EA6A;
        Fri, 15 Jan 2021 18:11:33 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: spmi-mpp: Add PM8019 compatible
Date:   Fri, 15 Jan 2021 18:11:14 +0100
Message-Id: <20210115171115.123155-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115171115.123155-1-konrad.dybcio@somainline.org>
References: <20210115171115.123155-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8019 provides 6 MPPs. Add a compatible to support them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index 448d36a85730..0ba07bc96c55 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -8,6 +8,7 @@ of PMIC's from Qualcomm.
 	Value type: <string>
 	Definition: Should contain one of:
 		    "qcom,pm8018-mpp",
+		    "qcom,pm8019-mpp",
 		    "qcom,pm8038-mpp",
 		    "qcom,pm8058-mpp",
 		    "qcom,pm8821-mpp",
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 48602dba4967..3c213f799feb 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -912,6 +912,7 @@ static int pmic_mpp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id pmic_mpp_of_match[] = {
+	{ .compatible = "qcom,pm8019-mpp" },	/* 6 MPP's */
 	{ .compatible = "qcom,pm8841-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8916-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8941-mpp" },	/* 8 MPP's */
-- 
2.29.2

