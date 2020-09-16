Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13CB26C918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgIPTDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbgIPRsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:35 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2187C061A28;
        Wed, 16 Sep 2020 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254281;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gViQdkst0VwAdrFW9lTsn+0Gd5Ffp1iW1Mb+zknUlnY=;
        b=TSC1fLneDjnJi/tg8RASnh8doafU2b87wNNOp20q3qn/jrtfJ/8q3tfieRvV2kc9EM
        R2/oAHPOQIp3NhowOA5Kdv0jl90h8scVjeLWb9ZHOEJ1XlanPhUb4UACHtc5lIK8MRp1
        jq4O1kMsmd2wVHYJSdwEq2rbM+wCWP+Ahl/vBcxAiFBFhpTHM/7eDSnnGH1x+9Fi2Quw
        EvozqLiBfEr56Y/0LmrR9yH2Dca4uNPnd9MWgYTE+ehqN60nTKScMkiI8IoCE3M/Vyv9
        JbCkjblESVceuWEDUqNLxzROxfbzjpGcRnisUi7P+TWnDOvzCUvwSrql6dPG/XknuchO
        UPVA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfqzlT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 06/10] remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains
Date:   Wed, 16 Sep 2020 12:41:31 +0200
Message-Id: <20200916104135.25085-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer platforms vote for necessary power domains through the power
domain subsystem. For historical reasons older platforms like MSM8916
or MSM8974 still control these as regulators.

Managing them as power domains is preferred since that allows us
to vote for corners instead of raw voltages.

Make it possible for MSM8916 and MSM8974 to manage these as power
domains. For compatibility with old device trees we still need to
support falling back to the regulators when necessary.

The way this is implemented here is that the deprecated regulators
are defined as "fallback_proxy_supply". Only if attaching the power
domains fails because they are not specified (-ENODATA) we request
and manage the fallback regulators instead.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 68 ++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c401bcc263fa..98bf4230d8f4 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -132,6 +132,7 @@ struct qcom_mss_reg_res {
 struct rproc_hexagon_res {
 	const char *hexagon_mba_image;
 	struct qcom_mss_reg_res *proxy_supply;
+	struct qcom_mss_reg_res *fallback_proxy_supply;
 	struct qcom_mss_reg_res *active_supply;
 	char **proxy_clk_names;
 	char **reset_clk_names;
@@ -177,9 +178,11 @@ struct q6v5 {
 	int proxy_pd_count;
 
 	struct reg_info active_regs[1];
-	struct reg_info proxy_regs[3];
+	struct reg_info proxy_regs[1];
+	struct reg_info fallback_proxy_regs[2];
 	int active_reg_count;
 	int proxy_reg_count;
+	int fallback_proxy_reg_count;
 
 	bool dump_mba_loaded;
 	size_t current_dump_size;
@@ -890,11 +893,18 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 		goto disable_active_pds;
 	}
 
+	ret = q6v5_regulator_enable(qproc, qproc->fallback_proxy_regs,
+				    qproc->fallback_proxy_reg_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable fallback proxy supplies\n");
+		goto disable_proxy_pds;
+	}
+
 	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
 				    qproc->proxy_reg_count);
 	if (ret) {
 		dev_err(qproc->dev, "failed to enable proxy supplies\n");
-		goto disable_proxy_pds;
+		goto disable_fallback_proxy_reg;
 	}
 
 	ret = q6v5_clk_enable(qproc->dev, qproc->proxy_clks,
@@ -997,6 +1007,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 disable_proxy_reg:
 	q6v5_regulator_disable(qproc, qproc->proxy_regs,
 			       qproc->proxy_reg_count);
+disable_fallback_proxy_reg:
+	q6v5_regulator_disable(qproc, qproc->fallback_proxy_regs,
+			       qproc->fallback_proxy_reg_count);
 disable_proxy_pds:
 	q6v5_pds_disable(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 disable_active_pds:
@@ -1052,6 +1065,8 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 				 qproc->proxy_pd_count);
 		q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
 				 qproc->proxy_clk_count);
+		q6v5_regulator_disable(qproc, qproc->fallback_proxy_regs,
+				       qproc->fallback_proxy_reg_count);
 		q6v5_regulator_disable(qproc, qproc->proxy_regs,
 				       qproc->proxy_reg_count);
 	}
@@ -1413,6 +1428,8 @@ static void qcom_msa_handover(struct qcom_q6v5 *q6v5)
 			 qproc->proxy_clk_count);
 	q6v5_regulator_disable(qproc, qproc->proxy_regs,
 			       qproc->proxy_reg_count);
+	q6v5_regulator_disable(qproc, qproc->fallback_proxy_regs,
+			       qproc->fallback_proxy_reg_count);
 	q6v5_pds_disable(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 }
 
@@ -1707,11 +1724,22 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	ret = q6v5_pds_attach(&pdev->dev, qproc->proxy_pds,
 			      desc->proxy_pd_names);
-	if (ret < 0) {
+	/* Fallback to regulators for old device trees */
+	if (ret == -ENODATA && desc->fallback_proxy_supply) {
+		ret = q6v5_regulator_init(&pdev->dev,
+					  qproc->fallback_proxy_regs,
+					  desc->fallback_proxy_supply);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "Failed to get fallback proxy regulators.\n");
+			goto detach_active_pds;
+		}
+		qproc->fallback_proxy_reg_count = ret;
+	} else if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to init power domains\n");
 		goto detach_active_pds;
+	} else {
+		qproc->proxy_pd_count = ret;
 	}
-	qproc->proxy_pd_count = ret;
 
 	qproc->has_alt_reset = desc->has_alt_reset;
 	ret = q6v5_init_reset(qproc);
@@ -1912,6 +1940,13 @@ static const struct rproc_hexagon_res msm8996_mss = {
 static const struct rproc_hexagon_res msm8916_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{}
+	},
+	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
 		{
 			.supply = "mx",
 			.uV = 1050000,
@@ -1920,10 +1955,6 @@ static const struct rproc_hexagon_res msm8916_mss = {
 			.supply = "cx",
 			.uA = 100000,
 		},
-		{
-			.supply = "pll",
-			.uA = 100000,
-		},
 		{}
 	},
 	.proxy_clk_names = (char*[]){
@@ -1936,6 +1967,11 @@ static const struct rproc_hexagon_res msm8916_mss = {
 		"mem",
 		NULL
 	},
+	.proxy_pd_names = (char*[]){
+		"mx",
+		"cx",
+		NULL
+	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
@@ -1946,6 +1982,13 @@ static const struct rproc_hexagon_res msm8916_mss = {
 static const struct rproc_hexagon_res msm8974_mss = {
 	.hexagon_mba_image = "mba.b00",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{}
+	},
+	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
 		{
 			.supply = "mx",
 			.uV = 1050000,
@@ -1954,10 +1997,6 @@ static const struct rproc_hexagon_res msm8974_mss = {
 			.supply = "cx",
 			.uA = 100000,
 		},
-		{
-			.supply = "pll",
-			.uA = 100000,
-		},
 		{}
 	},
 	.active_supply = (struct qcom_mss_reg_res[]) {
@@ -1978,6 +2017,11 @@ static const struct rproc_hexagon_res msm8974_mss = {
 		"mem",
 		NULL
 	},
+	.proxy_pd_names = (char*[]){
+		"mx",
+		"cx",
+		NULL
+	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
-- 
2.28.0

