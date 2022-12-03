Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF926641842
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiLCR6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiLCR6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:19 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CD0DFD1
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:18 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f21so11347822lfm.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeP2DccMMVYC1y/WvPjOzeWptfFAXcXnrOG2ucrRPlI=;
        b=sywSQUGYj6PWZSHi8bsDb3YTqingBx8quYMIvVg1oE8/3m0OuPBe94U09nCNu1qmR1
         iMMm+Sz8QtXYDR440GvuMTjCH6KLIfKN+vuguGfwYeU8cZvkNu7Lxhe5qNTwtqPXkdR7
         3qHrnhgcxbsawlgPqm2f42gAX9qrrBjEVMCS/ZwB1s7LPxHGbV2rpXtSwZV2M+BKyzEZ
         /nTs0FrIM+BwsYpnoUPgINokQQ5AhwO1+F0ZgxML3OsZrxsL4lJKHC7b6gfMTWiB2Szj
         nZgN16OFTArVUX3twxBp1mA96Vo03FXyzmoCMc/VVPSsSmAysRSBFZlrvOOj39UEI74G
         0gMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeP2DccMMVYC1y/WvPjOzeWptfFAXcXnrOG2ucrRPlI=;
        b=HINaIDJ4T3iB0mKoZYtd7fjobO9fopAfloSNy9ndQ77X1DDyG9iK4SbbYINsxSvtsl
         WoGNf/gYDjkS6fuwLMg9LDSaLGNZ6mLBX1DtAnRp8FWkH9t1vCnnt4JJz8NiLVDen9yO
         9ARTSSOs+a7UG8eBKXMQYeBHh0lXBr5a8w9AaiebtitbJyg7zAm+1/KkdD6WducCQvxf
         govdVVZ3Kfgcpay00X/R6hFlHfB3oivXv5ZnuEVGhh5pJN61TV5+TDYNOHdYmLSARt12
         /JQ5EyJ8U60JqGBoVuiOzx+rSq6BqcgDQuuH7URNyH6StqQNXzc9PJKGNcUJBMbiA/CW
         nIYA==
X-Gm-Message-State: ANoB5pmgF5fE+TRekaWFvv4+nNXNZeF1Mkk+ZLqP7/aOOuAOjwjDydFP
        R2YSMuoF2A7OMvlyTJ2zNDDG9g==
X-Google-Smtp-Source: AA0mqf6yhWragNRm4KZqwbLCZFas1Qdvs8IkUOUWykvfe6+HP5Zn2/JsMcqZsWLtGdTFIUo6ZPF5xg==
X-Received: by 2002:a19:6546:0:b0:4ae:aa99:849c with SMTP id c6-20020a196546000000b004aeaa99849cmr28148973lfj.592.1670090296682;
        Sat, 03 Dec 2022 09:58:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 08/16] clk: qcom: smd-rpm: drop the rpm_status_id field
Date:   Sat,  3 Dec 2022 19:58:00 +0200
Message-Id: <20221203175808.859067-9-dmitry.baryshkov@linaro.org>
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

The rpm_status_id field is a leftover from the non-SMD clocks. It is of
no use for the SMD-RPM clock driver and is always equal to zero. Drop it
completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index e52e0e242294..828cae6769f9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -25,13 +25,11 @@
 #define QCOM_RPM_SMD_KEY_STATE				0x54415453
 #define QCOM_RPM_SCALING_ENABLE_ID			0x2
 
-#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, stat_id,  \
-			     key)					      \
+#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.rpm_key = (key),					      \
 		.peer = &_platform##_##_active,				      \
 		.rate = INT_MAX,					      \
@@ -48,7 +46,6 @@
 	static struct clk_smd_rpm _platform##_##_active = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.peer = &_platform##_##_name,				      \
@@ -65,12 +62,11 @@
 	}
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    stat_id, r, key)			      \
+				    r, key)			      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
 		.peer = &_platform##_##_active,				      \
@@ -88,7 +84,6 @@
 	static struct clk_smd_rpm _platform##_##_active = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
@@ -107,19 +102,19 @@
 
 #define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
-		0, QCOM_RPM_SMD_KEY_RATE)
+		QCOM_RPM_SMD_KEY_RATE)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
-		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
+		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
-		0, QCOM_RPM_SMD_KEY_STATE)
+		QCOM_RPM_SMD_KEY_STATE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
-		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
@@ -128,7 +123,7 @@
 					     r_id, r);			      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
 		_active##_pin,						      \
-		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
 
 #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
@@ -137,7 +132,6 @@ struct clk_smd_rpm {
 	const int rpm_res_type;
 	const int rpm_key;
 	const int rpm_clk_id;
-	const int rpm_status_id;
 	const bool active_only;
 	bool enabled;
 	bool branch;
-- 
2.35.1

