Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5D76400E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 08:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbiLBHIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 02:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbiLBHIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 02:08:20 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159197BC3D
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 23:08:19 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id z24so4456489ljn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 23:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf/94/IRrdAudDjZI3zzt0f5PtOfSt5XYvPkpdLjxNs=;
        b=DwokZ1eyYBNC/MzDOmY+dvjBqV7F/qiyfv/6c/zbze0+Z4h1JJbTar+LeaYgymkjgD
         i4CQhUV4Ugveq2oXEWdjIHGvOwN9sEGR+DUtyphafOFrrbcxErumculk9588jX5rnmwN
         RqS51Mq/aLzBhSBXz/IFCeCf8FOC99zv426Pf/Y/OQN7ZNSOOlJRT3B+BdLrmPYZlY1M
         6SMbtWR5RQ/kHWoWjf/8SclqfTaHU8T7COql4vZIt1rDleD7rGb7yNIetFNhjS4/+xFV
         LE30cWonZ00+xrAEnLMeuWnrwmBrETMWFbkTmJVqu9+9hBRsYe7sNZl8evTTOg1IMTdv
         i6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf/94/IRrdAudDjZI3zzt0f5PtOfSt5XYvPkpdLjxNs=;
        b=s2e5cQWRDsUPobro9zCw8vkayp+m9NNwD9/VhYSad1K55/sRAcj0T+5wwCYI7CZVrP
         55/Q+o5DddPcuNBAG7wJO7+8l2BRrKpPdvM9kivJBnHV5JSflLZeYg6BhPozpNlo6Gqp
         wlVVWoy4qaU7kmjVQmCTzccHW58mG91+OG6Ld1OU0RTKX7tU5lUU38qzHGwNbDXxX0na
         riREOYZYPctvKZ+hLoFA6Nqq6fOp9+41pwYz3kRz9FUqiV9ADCBvsrG6xBubXD03h25A
         sWJT4o/8FSsf4gTi6mzgnCz+edTvYKqfsdMFxDmepqu2Yfy3z51aPizd8R49nqC0Bo7e
         a6OQ==
X-Gm-Message-State: ANoB5pkWmaI7Q5oOV73LyyKnQSyjpgzA1gDnbNqduxy0yCU4ql7cZyTD
        6wK47UqZ5hKlghC2WDQKa8UnYw==
X-Google-Smtp-Source: AA0mqf6wR2s3OH1jFpcyU6reo+frM6UtbLImN/4RvyvM08fCXUyxZupovxOW0jlBPPIVv6rr5TXx3w==
X-Received: by 2002:a05:651c:10bb:b0:279:737f:aeff with SMTP id k27-20020a05651c10bb00b00279737faeffmr15003150ljn.524.1669964897438;
        Thu, 01 Dec 2022 23:08:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a2-20020a19ca02000000b004946a1e045fsm913097lfg.197.2022.12.01.23.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 23:08:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 2/4] clk: qcom: rpm: drop separate active-only names
Date:   Fri,  2 Dec 2022 09:08:12 +0200
Message-Id: <20221202070814.482470-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
References: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
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

To simplify code reviews remove duplication between normal and
active-only clock names. Get a single clock name and generate both names
internally.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 68 +++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 7fee957bc44f..ca96f4bf7b2d 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -31,27 +31,27 @@ static const struct clk_parent_data gcc_cxo[] = {
 	{ .fw_name = "cxo", .name = "cxo_board" },
 };
 
-#define DEFINE_CLK_RPM(_platform, _name, _active, r_id)			      \
-	static struct clk_rpm _platform##_##_active;			      \
-	static struct clk_rpm _platform##_##_name = {			      \
+#define DEFINE_CLK_RPM(_platform, _name, r_id)				      \
+	static struct clk_rpm _platform##_##_name##_a_clk;		      \
+	static struct clk_rpm _platform##_##_name##_clk = {		      \
 		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_active,				      \
+		.peer = &_platform##_##_name##_a_clk,			      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_rpm_ops,				      \
-			.name = #_name,					      \
+			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
 		},							      \
 	};								      \
-	static struct clk_rpm _platform##_##_active = {			      \
+	static struct clk_rpm _platform##_##_name##_a_clk = {		      \
 		.rpm_clk_id = (r_id),					      \
-		.peer = &_platform##_##_name,				      \
+		.peer = &_platform##_##_name##_clk,			      \
 		.active_only = true,					      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_rpm_ops,				      \
-			.name = #_active,				      \
+			.name = #_name "_a_clk",			      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
 		},							      \
@@ -403,15 +403,15 @@ static const struct clk_ops clk_rpm_ops = {
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
+DEFINE_CLK_RPM(msm8660, afab, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, sfab, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, mmfab, QCOM_RPM_MM_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(msm8660, sfpb, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(msm8660, cfpb, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(msm8660, mmfpb, QCOM_RPM_MMFPB_CLK);
+DEFINE_CLK_RPM(msm8660, smi, QCOM_RPM_SMI_CLK);
+DEFINE_CLK_RPM(msm8660, ebi1, QCOM_RPM_EBI1_CLK);
 DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, QCOM_RPM_PLL_4, 540672000);
 
 static struct clk_rpm *msm8660_clks[] = {
@@ -442,15 +442,15 @@ static const struct rpm_clk_desc rpm_clk_msm8660 = {
 };
 
 /* apq8064 */
-DEFINE_CLK_RPM(apq8064, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(apq8064, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM(apq8064, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
-DEFINE_CLK_RPM(apq8064, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(apq8064, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(apq8064, qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
+DEFINE_CLK_RPM(apq8064, afab, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, cfpb, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(apq8064, daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, ebi1, QCOM_RPM_EBI1_CLK);
+DEFINE_CLK_RPM(apq8064, mmfab, QCOM_RPM_MM_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, mmfpb, QCOM_RPM_MMFPB_CLK);
+DEFINE_CLK_RPM(apq8064, sfab, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, sfpb, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(apq8064, qdss, QCOM_RPM_QDSS_CLK);
 DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, 0);
 DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, 8);
 DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, 16);
@@ -489,14 +489,14 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
 };
 
 /* ipq806x */
-DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
-DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
-DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
-DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
-DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
-DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
+DEFINE_CLK_RPM(ipq806x, afab, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(ipq806x, cfpb, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(ipq806x, daytona, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(ipq806x, ebi1, QCOM_RPM_EBI1_CLK);
+DEFINE_CLK_RPM(ipq806x, sfab, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(ipq806x, sfpb, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(ipq806x, nss_fabric_0, QCOM_RPM_NSS_FABRIC_0_CLK);
+DEFINE_CLK_RPM(ipq806x, nss_fabric_1, QCOM_RPM_NSS_FABRIC_1_CLK);
 
 static struct clk_rpm *ipq806x_clks[] = {
 	[RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
-- 
2.35.1

