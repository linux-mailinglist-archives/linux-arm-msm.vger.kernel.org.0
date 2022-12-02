Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480636400E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 08:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbiLBHIY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 02:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiLBHIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 02:08:22 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913857DA5F
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 23:08:20 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id z24so4456544ljn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 23:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldtHVKqDvTw/Fdodb0r46HIF+8/i/zAN80U3tPlJdfo=;
        b=shfBWFowgGorIXCnnTxhBSGKJFqWTmfzcK0tqXUxv939ORxGJuFYnDNg7QFwHSrqWV
         dgrxSQWkwZ4h9QmluuUhljKF03U+AdLir1wUmkzN2GAPo9holylP964/iz34P8meLeEJ
         Nu4EjP0oF8hkaVmM5DRAbyllkrDfljGlDc18Ut+XaxOsBk66ICx6GP2XI3+dKPkRpDm/
         fMs7nfbLQuqMmmVjSaB+t7EM9sIQ97jDnckKPUCqSeb0IskDq52ad8Fqcwu1EQFCGpa1
         YnHGS1AzRyMB498ka/sUtZg1938LvAhcQqdtlUagVxAmXBeC+Sdc/3owtW2qaihMOV6H
         KJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldtHVKqDvTw/Fdodb0r46HIF+8/i/zAN80U3tPlJdfo=;
        b=41uNrmCgIUlylpcXvb7aSSd91f0N0HcScOLbdpzrICk4cFUNsA6qzoVFpBDOwDxTVZ
         DAOgjKIp/MUqkAAGrmFNBr7Q14AzLhRPYQNotSx460Unsfmbvq/ClE2fijBa6L3J3uwe
         cXrwOdemFyCiIME4JR9f6+TfCVq3vMH/yIlPjKhqVi10blTMNKOgdTFmF+yxMrvEvw1x
         5tGUdXL6wSjE2zc0vgRSVyks3Jr+0UBksiD+z9QiyxCKeRshGoErDdmoCCen9yXsdnSB
         FCmLTCuS1elTKtFccKD3y8+WGBISqlRnwwv9j4P/iCYdXgYcg/wCdycWPSUSV/ZEqDCH
         mFWw==
X-Gm-Message-State: ANoB5pmmrWortOvwUU5ahmvvScbni7p4ZeRRy9YnEPOFAKrQpgk/ZE3/
        5xIPx2zRqZ62HxkKVFjl5bRu6A==
X-Google-Smtp-Source: AA0mqf5OJlsGpTgdUiTCywg+XsW0a3Afj5+NLdCZw8xRvyi3g/PA7MmOGVcAs82dO04tqhcjKaKqrQ==
X-Received: by 2002:a2e:b4a7:0:b0:277:792:c406 with SMTP id q7-20020a2eb4a7000000b002770792c406mr22673072ljm.126.1669964898934;
        Thu, 01 Dec 2022 23:08:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a2-20020a19ca02000000b004946a1e045fsm913097lfg.197.2022.12.01.23.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 23:08:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 4/4] clk: qcom: rpm: drop the platform from clock definitions
Date:   Fri,  2 Dec 2022 09:08:14 +0200
Message-Id: <20221202070814.482470-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
References: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
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

A single clock definition can be used on different platforms. Thus the
platform part of the clock name is not correct (and can be misleading).

Remove the platform-specific part of the defined clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 194 +++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 105 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 74a94e858920..b1be5b664bf3 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -31,11 +31,11 @@ static const struct clk_parent_data gcc_cxo[] = {
 	{ .fw_name = "cxo", .name = "cxo_board" },
 };
 
-#define DEFINE_CLK_RPM(_platform, _name, r_id)				      \
-	static struct clk_rpm _platform##_##_name##_a_clk;		      \
-	static struct clk_rpm _platform##_##_name##_clk = {		      \
+#define DEFINE_CLK_RPM(_name, r_id)					      \
+	static struct clk_rpm clk_rpm_##_name##_a_clk;			      \
+	static struct clk_rpm clk_rpm_##_name##_clk = {			      \
 		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_name##_a_clk,			      \
+		.peer = &clk_rpm_##_name##_a_clk,			      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_rpm_ops,				      \
@@ -44,9 +44,9 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
 		},							      \
 	};								      \
-	static struct clk_rpm _platform##_##_name##_a_clk = {		      \
+	static struct clk_rpm clk_rpm_##_name##_a_clk = {		      \
 		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_name##_clk,			      \
+		.peer = &clk_rpm_##_name##_clk,				      \
 		.active_only = true,					      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
@@ -57,8 +57,8 @@ static const struct clk_parent_data gcc_cxo[] = {
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, offset)		      \
-	static struct clk_rpm _platform##_##_name##_clk = {		      \
+#define DEFINE_CLK_RPM_XO_BUFFER(_name, offset)				      \
+	static struct clk_rpm clk_rpm_##_name##_clk = {			      \
 		.rpm_clk_id = QCOM_RPM_CXO_BUFFERS,			      \
 		.xo_offset = (offset),					      \
 		.hw.init = &(struct clk_init_data){			      \
@@ -69,8 +69,8 @@ static const struct clk_parent_data gcc_cxo[] = {
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_FIXED(_platform, _name, r_id, r)			      \
-	static struct clk_rpm _platform##_##_name##_clk = {		      \
+#define DEFINE_CLK_RPM_FIXED(_name, r_id, r)				      \
+	static struct clk_rpm clk_rpm_##_name##_clk = {			      \
 		.rpm_clk_id = (r_id),					      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
@@ -402,38 +402,48 @@ static const struct clk_ops clk_rpm_ops = {
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
-/* MSM8660/APQ8060 */
-DEFINE_CLK_RPM(msm8660, afab, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, sfab, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, mmfab, QCOM_RPM_MM_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, sfpb, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(msm8660, cfpb, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(msm8660, mmfpb, QCOM_RPM_MMFPB_CLK);
-DEFINE_CLK_RPM(msm8660, smi, QCOM_RPM_SMI_CLK);
-DEFINE_CLK_RPM(msm8660, ebi1, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM_FIXED(msm8660, pll4, QCOM_RPM_PLL_4, 540672000);
+DEFINE_CLK_RPM(afab, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(sfab, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(mmfab, QCOM_RPM_MM_FABRIC_CLK);
+DEFINE_CLK_RPM(daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(sfpb, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(cfpb, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(mmfpb, QCOM_RPM_MMFPB_CLK);
+DEFINE_CLK_RPM(smi, QCOM_RPM_SMI_CLK);
+DEFINE_CLK_RPM(ebi1, QCOM_RPM_EBI1_CLK);
+
+DEFINE_CLK_RPM(qdss, QCOM_RPM_QDSS_CLK);
+DEFINE_CLK_RPM(nss_fabric_0, QCOM_RPM_NSS_FABRIC_0_CLK);
+DEFINE_CLK_RPM(nss_fabric_1, QCOM_RPM_NSS_FABRIC_1_CLK);
+
+DEFINE_CLK_RPM_FIXED(pll4, QCOM_RPM_PLL_4, 540672000);
+
+DEFINE_CLK_RPM_XO_BUFFER(xo_d0, 0);
+DEFINE_CLK_RPM_XO_BUFFER(xo_d1, 8);
+DEFINE_CLK_RPM_XO_BUFFER(xo_a0, 16);
+DEFINE_CLK_RPM_XO_BUFFER(xo_a1, 24);
+DEFINE_CLK_RPM_XO_BUFFER(xo_a2, 28);
 
 static struct clk_rpm *msm8660_clks[] = {
-	[RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
-	[RPM_APPS_FABRIC_A_CLK] = &msm8660_afab_a_clk,
-	[RPM_SYS_FABRIC_CLK] = &msm8660_sfab_clk,
-	[RPM_SYS_FABRIC_A_CLK] = &msm8660_sfab_a_clk,
-	[RPM_MM_FABRIC_CLK] = &msm8660_mmfab_clk,
-	[RPM_MM_FABRIC_A_CLK] = &msm8660_mmfab_a_clk,
-	[RPM_DAYTONA_FABRIC_CLK] = &msm8660_daytona_clk,
-	[RPM_DAYTONA_FABRIC_A_CLK] = &msm8660_daytona_a_clk,
-	[RPM_SFPB_CLK] = &msm8660_sfpb_clk,
-	[RPM_SFPB_A_CLK] = &msm8660_sfpb_a_clk,
-	[RPM_CFPB_CLK] = &msm8660_cfpb_clk,
-	[RPM_CFPB_A_CLK] = &msm8660_cfpb_a_clk,
-	[RPM_MMFPB_CLK] = &msm8660_mmfpb_clk,
-	[RPM_MMFPB_A_CLK] = &msm8660_mmfpb_a_clk,
-	[RPM_SMI_CLK] = &msm8660_smi_clk,
-	[RPM_SMI_A_CLK] = &msm8660_smi_a_clk,
-	[RPM_EBI1_CLK] = &msm8660_ebi1_clk,
-	[RPM_EBI1_A_CLK] = &msm8660_ebi1_a_clk,
-	[RPM_PLL4_CLK] = &msm8660_pll4_clk,
+	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
+	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
+	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
+	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
+	[RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
+	[RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
+	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
+	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
+	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
+	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
+	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
+	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
+	[RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
+	[RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
+	[RPM_SMI_CLK] = &clk_rpm_smi_clk,
+	[RPM_SMI_A_CLK] = &clk_rpm_smi_a_clk,
+	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
+	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
+	[RPM_PLL4_CLK] = &clk_rpm_pll4_clk,
 };
 
 static const struct rpm_clk_desc rpm_clk_msm8660 = {
@@ -441,46 +451,30 @@ static const struct rpm_clk_desc rpm_clk_msm8660 = {
 	.num_clks = ARRAY_SIZE(msm8660_clks),
 };
 
-/* apq8064 */
-DEFINE_CLK_RPM(apq8064, afab, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, cfpb, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(apq8064, daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, ebi1, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM(apq8064, mmfab, QCOM_RPM_MM_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, mmfpb, QCOM_RPM_MMFPB_CLK);
-DEFINE_CLK_RPM(apq8064, sfab, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, sfpb, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(apq8064, qdss, QCOM_RPM_QDSS_CLK);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0, 0);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1, 8);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0, 16);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1, 24);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2, 28);
-
 static struct clk_rpm *apq8064_clks[] = {
-	[RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
-	[RPM_APPS_FABRIC_A_CLK] = &apq8064_afab_a_clk,
-	[RPM_CFPB_CLK] = &apq8064_cfpb_clk,
-	[RPM_CFPB_A_CLK] = &apq8064_cfpb_a_clk,
-	[RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
-	[RPM_DAYTONA_FABRIC_A_CLK] = &apq8064_daytona_a_clk,
-	[RPM_EBI1_CLK] = &apq8064_ebi1_clk,
-	[RPM_EBI1_A_CLK] = &apq8064_ebi1_a_clk,
-	[RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
-	[RPM_MM_FABRIC_A_CLK] = &apq8064_mmfab_a_clk,
-	[RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
-	[RPM_MMFPB_A_CLK] = &apq8064_mmfpb_a_clk,
-	[RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
-	[RPM_SYS_FABRIC_A_CLK] = &apq8064_sfab_a_clk,
-	[RPM_SFPB_CLK] = &apq8064_sfpb_clk,
-	[RPM_SFPB_A_CLK] = &apq8064_sfpb_a_clk,
-	[RPM_QDSS_CLK] = &apq8064_qdss_clk,
-	[RPM_QDSS_A_CLK] = &apq8064_qdss_a_clk,
-	[RPM_XO_D0] = &apq8064_xo_d0_clk,
-	[RPM_XO_D1] = &apq8064_xo_d1_clk,
-	[RPM_XO_A0] = &apq8064_xo_a0_clk,
-	[RPM_XO_A1] = &apq8064_xo_a1_clk,
-	[RPM_XO_A2] = &apq8064_xo_a2_clk,
+	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
+	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
+	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
+	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
+	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
+	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
+	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
+	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
+	[RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
+	[RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
+	[RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
+	[RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
+	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
+	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
+	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
+	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
+	[RPM_QDSS_CLK] = &clk_rpm_qdss_clk,
+	[RPM_QDSS_A_CLK] = &clk_rpm_qdss_a_clk,
+	[RPM_XO_D0] = &clk_rpm_xo_d0_clk,
+	[RPM_XO_D1] = &clk_rpm_xo_d1_clk,
+	[RPM_XO_A0] = &clk_rpm_xo_a0_clk,
+	[RPM_XO_A1] = &clk_rpm_xo_a1_clk,
+	[RPM_XO_A2] = &clk_rpm_xo_a2_clk,
 };
 
 static const struct rpm_clk_desc rpm_clk_apq8064 = {
@@ -488,33 +482,23 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
 	.num_clks = ARRAY_SIZE(apq8064_clks),
 };
 
-/* ipq806x */
-DEFINE_CLK_RPM(ipq806x, afab, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, cfpb, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(ipq806x, daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, ebi1, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM(ipq806x, sfab, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, sfpb, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(ipq806x, nss_fabric_0, QCOM_RPM_NSS_FABRIC_0_CLK);
-DEFINE_CLK_RPM(ipq806x, nss_fabric_1, QCOM_RPM_NSS_FABRIC_1_CLK);
-
 static struct clk_rpm *ipq806x_clks[] = {
-	[RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
-	[RPM_APPS_FABRIC_A_CLK] = &ipq806x_afab_a_clk,
-	[RPM_CFPB_CLK] = &ipq806x_cfpb_clk,
-	[RPM_CFPB_A_CLK] = &ipq806x_cfpb_a_clk,
-	[RPM_DAYTONA_FABRIC_CLK] = &ipq806x_daytona_clk,
-	[RPM_DAYTONA_FABRIC_A_CLK] = &ipq806x_daytona_a_clk,
-	[RPM_EBI1_CLK] = &ipq806x_ebi1_clk,
-	[RPM_EBI1_A_CLK] = &ipq806x_ebi1_a_clk,
-	[RPM_SYS_FABRIC_CLK] = &ipq806x_sfab_clk,
-	[RPM_SYS_FABRIC_A_CLK] = &ipq806x_sfab_a_clk,
-	[RPM_SFPB_CLK] = &ipq806x_sfpb_clk,
-	[RPM_SFPB_A_CLK] = &ipq806x_sfpb_a_clk,
-	[RPM_NSS_FABRIC_0_CLK] = &ipq806x_nss_fabric_0_clk,
-	[RPM_NSS_FABRIC_0_A_CLK] = &ipq806x_nss_fabric_0_a_clk,
-	[RPM_NSS_FABRIC_1_CLK] = &ipq806x_nss_fabric_1_clk,
-	[RPM_NSS_FABRIC_1_A_CLK] = &ipq806x_nss_fabric_1_a_clk,
+	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
+	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
+	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
+	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
+	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
+	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
+	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
+	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
+	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
+	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
+	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
+	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
+	[RPM_NSS_FABRIC_0_CLK] = &clk_rpm_nss_fabric_0_clk,
+	[RPM_NSS_FABRIC_0_A_CLK] = &clk_rpm_nss_fabric_0_a_clk,
+	[RPM_NSS_FABRIC_1_CLK] = &clk_rpm_nss_fabric_1_clk,
+	[RPM_NSS_FABRIC_1_A_CLK] = &clk_rpm_nss_fabric_1_a_clk,
 };
 
 static const struct rpm_clk_desc rpm_clk_ipq806x = {
-- 
2.35.1

