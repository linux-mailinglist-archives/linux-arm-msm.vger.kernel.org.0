Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106C464184A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiLCR62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiLCR6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:23 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809FFC05
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:21 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b9so8863053ljr.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bEkCdYH+g52Cx6tPELUG+SA1WE0FWtzB4jeU7pJ+4w=;
        b=Givq0ngQamw0YYCd3Qjmlz3R2RJaimAqLfZQyjZjks8757FTa/NkkH//o281aLWwwG
         TjQKmeOLzCyLdPR/kos44j65wI7AT0TacPPro6i36GSUiFvUU5A98gLbS4I3YmJauDhq
         7EtThePitM97XMS3oStZ7vSdHU68As/8oH4lAykVXQGHhrgyVuNRONe/DLKiZwVf7pun
         ySQhphW//VMBkBGEv67GpNkMMDMCwTEGpXBnpy2eGWDLEQbaaX9YO/PvN6pyyQs0CE+X
         cJWmOJ7hS4lFpJ/UZeZB02RzkPw4UgrDuAbWyCYZZTUDpKEhudkGXPnAhN4QFl/pzDKq
         lAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bEkCdYH+g52Cx6tPELUG+SA1WE0FWtzB4jeU7pJ+4w=;
        b=NyWaB+OzlWxRAFf+9rZTqCd4DNCJe/HI4bnTWvJUbJ66EDv5alyMeGUwpADOMXTL3j
         6U7zjFYb70lfAA9eglCbv+M8cchsIuoKkfvdhvnbY1xBsui4LPHWoIj2gBqUNfk+dwv4
         T0aAT2KcIC+Py3KfDrQQVvTUNQy6vkyTEC9p+6VkTwDr+1ZPtMKpha08h7F/EjUTpzrJ
         LmTlVkk6oeDbT6R+//7yopFIs3QcnYPgXRjj5kq08ZzOM//ZlU0aA/2NESPwVL4nIMzH
         nArIhcDLP+NRWA3fJiLc9HkWIHUTw6bpY4UGlmYTBGWWUwS75JyQ+kXkWZcs8Lr3FC9d
         XrKg==
X-Gm-Message-State: ANoB5plAmgl+tzdbuxtZgd02GJ0lnyv+kmdKauiv8iuPPWxqtJRcIVlw
        BZZgUbiPr42ixvr6TUEnNxr/HMdL0wwQlDhKmQNDYg==
X-Google-Smtp-Source: AA0mqf48kJM8y5Gmc12zdyakSCYwknRL2AetYeM0on6cHMSBhVcO1svXItszioGJmiXrAaDxaA72AA==
X-Received: by 2002:a05:651c:1590:b0:279:dfe:897a with SMTP id h16-20020a05651c159000b002790dfe897amr25041228ljq.365.1670090301035;
        Sat, 03 Dec 2022 09:58:21 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 13/16] clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
Date:   Sat,  3 Dec 2022 19:58:05 +0200
Message-Id: <20221203175808.859067-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease distinguishing between branch and non-branch clocks (e.g.
aggre1_noc, aggre2_noc and qdss) add '_branch' to all SMD_RPM_BRANCH*
clocks. The system (and userspace) name of these clocks remains intact.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 98 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 59abc6bf475d..8dcaa63b0623 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -61,15 +61,15 @@
 		},							      \
 	}
 
-#define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
+#define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _prefix, _name, _active, type, r_id,    \
 				    r, key)				      \
-	static struct clk_smd_rpm _platform##_##_active;		      \
-	static struct clk_smd_rpm _platform##_##_name = {		      \
+	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
+	static struct clk_smd_rpm _platform##_##_prefix##_name = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
-		.peer = &_platform##_##_active,				      \
+		.peer = &_platform##_##_prefix##_active,		      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
@@ -81,13 +81,13 @@
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
-	static struct clk_smd_rpm _platform##_##_active = {		      \
+	static struct clk_smd_rpm _platform##_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
-		.peer = &_platform##_##_name,				      \
+		.peer = &_platform##_##_prefix##_name,			      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
@@ -109,11 +109,11 @@
 		QCOM_RPM_SMD_KEY_RATE)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_clk, _name##_a_clk, type,  \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, branch_, _name##_clk, _name##_a_clk, type,  \
 		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a, type,\
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, branch_, _name, _name##_a, type,\
 		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
@@ -121,7 +121,7 @@
 		QCOM_RPM_SMD_KEY_STATE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a,      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, , _name, _name##_a,    \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
@@ -129,7 +129,7 @@
 					     r_id, r)			      \
 		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,		      \
 					     r_id, r);			      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, , _name##_pin,	      \
 		_name##_a##_pin,					      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
@@ -638,8 +638,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 };
 
 static struct clk_smd_rpm *msm8976_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
@@ -672,8 +672,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 static struct clk_smd_rpm *msm8992_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
@@ -706,8 +706,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
-	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
-	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_mss_cfg_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
@@ -730,8 +730,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 };
 
 static struct clk_smd_rpm *msm8994_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
@@ -764,8 +764,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
-	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
-	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_mss_cfg_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
@@ -804,10 +804,10 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_aggre1_noc_clk,
-	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_aggre1_noc_a_clk,
-	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_aggre2_noc_clk,
-	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_aggre2_noc_a_clk,
+	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_branch_aggre1_noc_clk,
+	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_branch_aggre1_noc_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_branch_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_branch_aggre2_noc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
 	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
@@ -870,8 +870,8 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 static struct clk_smd_rpm *msm8998_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
@@ -930,8 +930,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 };
 
 static struct clk_smd_rpm *sdm660_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
@@ -976,8 +976,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static struct clk_smd_rpm *mdm9607_clks[] = {
-	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
@@ -998,8 +998,8 @@ static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
 };
 
 static struct clk_smd_rpm *msm8953_clks[] = {
-	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
@@ -1034,14 +1034,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
 };
 
 static struct clk_smd_rpm *sm6125_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
@@ -1077,14 +1077,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
 
 /* SM6115 */
 static struct clk_smd_rpm *sm6115_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
@@ -1117,14 +1117,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 static struct clk_smd_rpm *sm6375_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
 	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -1145,7 +1145,7 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
 	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
 	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_FREQ_LOG] = &sm6375_bimc_freq_log,
+	[RPM_SMD_BIMC_FREQ_LOG] = &sm6375_branch_bimc_freq_log,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
@@ -1154,14 +1154,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 };
 
 static struct clk_smd_rpm *qcm2290_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
 	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
 	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
-- 
2.35.1

