Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7850F661B7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbjAIA3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbjAIA3p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:29:45 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA95C74D
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:29:44 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id n5so6812753ljc.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ill0/wzsh4ASoh+xaOta7TBlS3WIkzNzN32uocpWXo=;
        b=eZENN3I5enwcHwCbXdOHRIuoEXmcV1MREqEVSZTflP5Tx3cy3jzi1kmIeDLn8RraJV
         pUyU5a040IB7fsOiv5i3G2fbrctSz/nVk1R52IrnwPqYJlxdCRvQpFO8ba8u+aAeqipY
         etHrKuBSyX1fL6YfRSyZAADa3hz5WZS4vREX4ZD/Zi/f0w6rfeRfmQ8AxPVZjRrZ6Bfw
         1WMZ24EtKTomYFbmfCdUMDmBKpP1cqineDaYf7SdY6wrJdvWjEIqMIHLio+VBBINcEhm
         hyvQv3Llh3ozuEAIUXc7My/F1NihiwYzB03jI+Le8CerMt4QMQKqXDgqKct/hGI9NgGd
         u4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ill0/wzsh4ASoh+xaOta7TBlS3WIkzNzN32uocpWXo=;
        b=m0KE75g9sQIYY0aStJxd4x1QEUOq07GUnwY/9ivN2T70pXYrG35s/k5BZZG18MA/GI
         rRVDSg0lC1sw0EBP2HgsoM6eIOGV363dCPzlaP9JBvSNduLiM3YOLcZH30ICxqHrnVrA
         VQl61OIus2eWg1lebngZhZ93uOVBVEJUvN4hPQqd3HD9nWUYV6I8os8IUxkhRRbpbzBf
         zJXL+SxtABeLn1UIkE7YZWV0dRxnlYTdM7s7u6tfRncEbTAVb4HIt7tVGpnL+GwzrMgJ
         DopzAtFnDv61z3DR+sUIYHy3Zdj8m/1YsxcQlblrHCc+dKdGtO/4hpSNTo2zVvRRrUYJ
         slyA==
X-Gm-Message-State: AFqh2kqr6EJi0emIlGBU6n6X3AOB6ARquHxtlHhXGCueBuQh7IyKjwcA
        Cv4as56fzFRzxUp01X7ZNlOHig==
X-Google-Smtp-Source: AMrXdXtIfGxqnu7zYdAZ2BE3KLYicm32ZiuR9yeqT4DaQXss4luraFunUQ4Oa/Tz10yvip2y71KYdQ==
X-Received: by 2002:a2e:9dcb:0:b0:27f:bf5c:30c6 with SMTP id x11-20020a2e9dcb000000b0027fbf5c30c6mr17906403ljj.43.1673224182626;
        Sun, 08 Jan 2023 16:29:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 07/12] interconnect: qcom: sc8280xp: Drop IP0 interconnects
Date:   Mon,  9 Jan 2023 02:29:30 +0200
Message-Id: <20230109002935.244320-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Similar to the sdx55 and sc7180, let's drop the MASTER_IPA_CORE and
SLAVE_IPA_CORE interconnects for this platofm. There are no actual users
of this intercoonect. The IP0 resource will be handled by clk-rpmh
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sc8280xp.c | 25 -------------------------
 drivers/interconnect/qcom/sc8280xp.h |  4 ++--
 2 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index 507fe5f89791..e56df893ec3e 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -284,15 +284,6 @@ static struct qcom_icc_node xm_ufs_card = {
 	.links = { SC8280XP_SLAVE_A2NOC_SNOC },
 };
 
-static struct qcom_icc_node ipa_core_master = {
-	.name = "ipa_core_master",
-	.id = SC8280XP_MASTER_IPA_CORE,
-	.channels = 1,
-	.buswidth = 8,
-	.num_links = 1,
-	.links = { SC8280XP_SLAVE_IPA_CORE },
-};
-
 static struct qcom_icc_node qup0_core_master = {
 	.name = "qup0_core_master",
 	.id = SC8280XP_MASTER_QUP_CORE_0,
@@ -882,13 +873,6 @@ static struct qcom_icc_node srvc_aggre2_noc = {
 	.buswidth = 4,
 };
 
-static struct qcom_icc_node ipa_core_slave = {
-	.name = "ipa_core_slave",
-	.id = SC8280XP_SLAVE_IPA_CORE,
-	.channels = 1,
-	.buswidth = 8,
-};
-
 static struct qcom_icc_node qup0_core_slave = {
 	.name = "qup0_core_slave",
 	.id = SC8280XP_SLAVE_QUP_CORE_0,
@@ -1845,12 +1829,6 @@ static struct qcom_icc_bcm bcm_cn3 = {
 	},
 };
 
-static struct qcom_icc_bcm bcm_ip0 = {
-	.name = "IP0",
-	.num_nodes = 1,
-	.nodes = { &ipa_core_slave },
-};
-
 static struct qcom_icc_bcm bcm_mc0 = {
 	.name = "MC0",
 	.keepalive = true,
@@ -2077,18 +2055,15 @@ static const struct qcom_icc_desc sc8280xp_aggre2_noc = {
 };
 
 static struct qcom_icc_bcm * const clk_virt_bcms[] = {
-	&bcm_ip0,
 	&bcm_qup0,
 	&bcm_qup1,
 	&bcm_qup2,
 };
 
 static struct qcom_icc_node * const clk_virt_nodes[] = {
-	[MASTER_IPA_CORE] = &ipa_core_master,
 	[MASTER_QUP_CORE_0] = &qup0_core_master,
 	[MASTER_QUP_CORE_1] = &qup1_core_master,
 	[MASTER_QUP_CORE_2] = &qup2_core_master,
-	[SLAVE_IPA_CORE] = &ipa_core_slave,
 	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
 	[SLAVE_QUP_CORE_1] = &qup1_core_slave,
 	[SLAVE_QUP_CORE_2] = &qup2_core_slave,
diff --git a/drivers/interconnect/qcom/sc8280xp.h b/drivers/interconnect/qcom/sc8280xp.h
index 74d8fa412d65..c5c410fd5ec3 100644
--- a/drivers/interconnect/qcom/sc8280xp.h
+++ b/drivers/interconnect/qcom/sc8280xp.h
@@ -10,7 +10,7 @@
 #define SC8280XP_MASTER_PCIE_TCU			1
 #define SC8280XP_MASTER_SYS_TCU				2
 #define SC8280XP_MASTER_APPSS_PROC			3
-#define SC8280XP_MASTER_IPA_CORE			4
+/* 4 was used by SLAVE_IPA_CORE, now represented as RPMh clock */
 #define SC8280XP_MASTER_LLCC				5
 #define SC8280XP_MASTER_CNOC_LPASS_AG_NOC		6
 #define SC8280XP_MASTER_CDSP_NOC_CFG			7
@@ -84,7 +84,7 @@
 #define SC8280XP_MASTER_USB4_0				75
 #define SC8280XP_MASTER_USB4_1				76
 #define SC8280XP_SLAVE_EBI1				512
-#define SC8280XP_SLAVE_IPA_CORE				513
+/* 513 was used by SLAVE_IPA_CORE, now represented as RPMh clock */
 #define SC8280XP_SLAVE_AHB2PHY_0			514
 #define SC8280XP_SLAVE_AHB2PHY_1			515
 #define SC8280XP_SLAVE_AHB2PHY_2			516
-- 
2.39.0

