Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369BD63BDB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 11:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbiK2KMY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 05:12:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiK2KLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 05:11:50 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402BD60EA0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:32 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id r12so21747326lfp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo9GFUnaG+OLf3jlfMFp4lSsJHfGSgrFNr0OU6zZytg=;
        b=Uf/oKrMP+5rBqyZXIHavrNhMuhi1JwjuCBdT7YWOPQ2NQTAZaO4djy9q06/SUkRUlb
         xRn2opzrpP7Qe1p+g91IUf7Kb8laZowZd2s2zTYeDpoPUcMPRm6RInIud9cOcYJQwgOS
         JHWJxAB0Zi1ixPuJORhrfCeYgHkmWrQeU3Mq/ulGz8mC3rrWf09ajnTkkBsl68AqGkLj
         Q4nJsWPyGmzeNtzQPmUV8Y+ZaPHA/Yq5DXY6593GORPuIp9Sf4WUxZsEXFvEzl+xu0HZ
         fKnHKL8jNdqxwwzZTgFEU+7/mB5dp3CVQuoBYbcdrRTLSxuDzT1sDbN2xY6JqNsyQOjK
         Na1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo9GFUnaG+OLf3jlfMFp4lSsJHfGSgrFNr0OU6zZytg=;
        b=szUVPTEHjunKWhNXBa0ludoeUt6XY13xlKZQVFa9U4Yh+sEGGi3f8/XpDujItazpr6
         DQGAv0KNcRAVGHYURTaYC7BTxWkLYPz8ND4PKhUfwLnKWDBIMAsKS/1/4kHf4i+XHYZM
         39TeiEnHEyCM1TPnSqDcicJaK6eG5bnk9dwxFkiL4fhZgaEtMUm9r5miT34xcUwj+iNj
         R1kL7mFb+X0mVSGdOeNaMKcidocLTPIwwRaRaOi7nfPYSzo2qpq/8lbQXKTS1+OpoV5o
         c/0cpKTAg7IdYid0vHfrWcx5ppIxOIY9FFnD2kiMh6tlzXDeOmFF127bLwFvWI+hjUYs
         i6sg==
X-Gm-Message-State: ANoB5pkOdxrGUfMGS1I2XRpUCpaHH5B7sd+NePvVyM8Ei4RSTFgHA2ip
        IQquNRV4mlt6anKNHQTZbxATYg==
X-Google-Smtp-Source: AA0mqf60lLi1nlZnadLMDVWkIkRsZPdmEDgw0HmStTK+ArUcbzXYR7whww9IN3tIHMHri8TmluWb7Q==
X-Received: by 2002:a05:6512:2a98:b0:4b1:4612:6d06 with SMTP id dt24-20020a0565122a9800b004b146126d06mr17917703lfb.683.1669716630311;
        Tue, 29 Nov 2022 02:10:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020ac25e6c000000b004b0a1e77cb2sm2146642lfr.137.2022.11.29.02.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 02:10:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 4/4] clk: qcom: rpm: drop the platform from clock definitions
Date:   Tue, 29 Nov 2022 12:10:25 +0200
Message-Id: <20221129101025.960110-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
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

A single clock definition can be used on different platforms. Thus the
platform part of the clock name is not correct (and can be misleading).

Remove the platform-specific part of the defined clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 194 +++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 105 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 747c473b0b5e..bcab76776571 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -31,11 +31,11 @@ static const struct clk_parent_data gcc_cxo[] = {
 	{ .fw_name = "cxo", .name = "cxo_board" },
 };
 
-#define DEFINE_CLK_RPM(_platform, _name, _active, r_id)			      \
-	static struct clk_rpm _platform##_##_active;			      \
-	static struct clk_rpm _platform##_##_name = {			      \
+#define DEFINE_CLK_RPM(_name, _active, r_id)				      \
+	static struct clk_rpm clk_rpm_##_active;			      \
+	static struct clk_rpm clk_rpm_##_name = {			      \
 		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_active,				      \
+		.peer = &clk_rpm_##_active,				      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_rpm_ops,				      \
@@ -44,9 +44,9 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
 		},							      \
 	};								      \
-	static struct clk_rpm _platform##_##_active = {			      \
+	static struct clk_rpm clk_rpm_##_active = {			      \
 		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_name,				      \
+		.peer = &clk_rpm_##_name,				      \
 		.active_only = true,					      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
@@ -57,20 +57,20 @@ static const struct clk_parent_data gcc_cxo[] = {
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, _active, offset)	      \
-	static struct clk_rpm _platform##_##_name = {			      \
+#define DEFINE_CLK_RPM_XO_BUFFER(_name, _active, offset)		      \
+	static struct clk_rpm clk_rpm_##_name = {			      \
 		.rpm_clk_id = QCOM_RPM_CXO_BUFFERS,			      \
 		.xo_offset = (offset),					      \
 		.hw.init = &(struct clk_init_data){			      \
-			.ops = &clk_rpm_xo_ops,			      \
+			.ops = &clk_rpm_xo_ops,				      \
 			.name = #_name,					      \
 			.parent_data = gcc_cxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_cxo),		      \
 		},							      \
 	}
 
-#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
-	static struct clk_rpm _platform##_##_name = {			      \
+#define DEFINE_CLK_RPM_FIXED(_name, _active, r_id, r)			      \
+	static struct clk_rpm clk_rpm_##_name = {			      \
 		.rpm_clk_id = (r_id),					      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
@@ -403,37 +403,47 @@ static const struct clk_ops clk_rpm_ops = {
 };
 
 /* MSM8660/APQ8060 */
-DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(msm8660, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
-DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
-DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
+DEFINE_CLK_RPM(afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
+DEFINE_CLK_RPM(daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
+DEFINE_CLK_RPM(smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
+DEFINE_CLK_RPM(ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
+DEFINE_CLK_RPM(qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
+DEFINE_CLK_RPM(nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
+DEFINE_CLK_RPM(nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
+
+DEFINE_CLK_RPM_FIXED(pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
+
+DEFINE_CLK_RPM_XO_BUFFER(xo_d0_clk, xo_d0_a_clk, 0);
+DEFINE_CLK_RPM_XO_BUFFER(xo_d1_clk, xo_d1_a_clk, 8);
+DEFINE_CLK_RPM_XO_BUFFER(xo_a0_clk, xo_a0_a_clk, 16);
+DEFINE_CLK_RPM_XO_BUFFER(xo_a1_clk, xo_a1_a_clk, 24);
+DEFINE_CLK_RPM_XO_BUFFER(xo_a2_clk, xo_a2_a_clk, 28);
 
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
-DEFINE_CLK_RPM(apq8064, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(apq8064, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM(apq8064, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
-DEFINE_CLK_RPM(apq8064, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(apq8064, qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, xo_d0_a_clk, 0);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, xo_d1_a_clk, 8);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, xo_a0_a_clk, 16);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, xo_a1_a_clk, 24);
-DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, xo_a2_a_clk, 28);
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
-DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
-DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
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

