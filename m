Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C651E63D651
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235564AbiK3NKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:10:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiK3NKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:10:09 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387C26C709
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:08 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f13so26848995lfa.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2oMs5vaEGLYORCmKlXIqTDD4xJk1CYYtug6Dlff+bM=;
        b=i2oUKn98CeeGvXLJieXBiUcBhSxE/qkoB8WRVu9fwTdnNmYlQEyvZOU23qUsxVGurE
         rRQq9UQOvY9WqibZk+xi2AoP5nsgX4oHP8bYBO5UG3sG10udMnLuJY1AQPAwdiWVHcKa
         yugPeoNkRnHOjhqTHIw4ePtUWecA6EF7vMf1atst6RuVm+RtzgfiyRNbhFlypkZVufA3
         JCGuMyzUzaDAcdUTphj3dnZPXIs0c4ZHnRrVMz7zUNyNvpYVfR54BLyFJG/nxRqwWjbS
         2Xzpcg3g3S5Xfjm/6kfDNW8NaDpMQ72uRfai/odyPSUXW91BJ9GHGugl7cGCM1CgDNtl
         /6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2oMs5vaEGLYORCmKlXIqTDD4xJk1CYYtug6Dlff+bM=;
        b=TysSH8qNpujxYsXSSp4UJ0FjeIrcgFZS7KHDaJlwQuy6Ybfnhyou3unu+UG2mXMixA
         yFtLI6Suwz5VDxKWnaKVNhdxbdf1wpW0PjKHQyk/4EgvliGaUsl1/uZ8X5MKdn0eqDsv
         MzQoGtsHc8OtZAe1vXbbQSRnkDsYPW1sleIBnY7wnqfmvhPiKiW37/aWxTcBQerXpL7Z
         O73CTjeiN2axBPolWh0sQG/J9sjjdRmTHsxU9s6WCIrpIZ1TID84M9fRiS1Y9Dazlti3
         J6gsHFDRiayvpvpyUnoe38yIvIYQqD4OKeVuX7xAJw7JbmiPdqGYECH9z3exVE8un49c
         w02g==
X-Gm-Message-State: ANoB5pkXwDy4LDwHL/1pJMjjDQM545DPXtCKdQkZ8d2ElSepuqx+vZcW
        W9iC7pFBsXojQ1lBoAqhp7IEnw==
X-Google-Smtp-Source: AA0mqf4xkkMJQioApK7ZQzY7KQkvPtLL42MdNghy8YBLJN6TAmAAxwxZORuCzi7WlgpBVZkG/Pg2pw==
X-Received: by 2002:a05:6512:234c:b0:4b5:26e0:9d8d with SMTP id p12-20020a056512234c00b004b526e09d8dmr2661551lfu.165.1669813806515;
        Wed, 30 Nov 2022 05:10:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 3/8] clk: qcom: rpmh: drop all _ao names
Date:   Wed, 30 Nov 2022 15:09:56 +0200
Message-Id: <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
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

In preparation for the further cleanup, remove the active only names,
they can be easily generated from the standard ones.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 62 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index c4852bbd00bf..00c0c8f851bd 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_name_active;		\
+	static struct clk_rpmh _platform##_##_name##_ao;		\
 	static struct clk_rpmh _platform##_##_name = {			\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name_active,			\
+		.peer = &_platform##_##_name##_ao,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,7 +92,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_name_active = {		\
+	static struct clk_rpmh _platform##_##_name##_ao= {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
@@ -102,7 +102,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_ops,				\
-			.name = #_name_active,				\
+			.name = #_name "_ao",				\
 			.parent_data =  &(const struct clk_parent_data){ \
 					.fw_name = "xo",		\
 					.name = "xo_board",		\
@@ -111,14 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		},							\
 	}
 
-#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
-			    _res_on, _div)				\
-	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
+	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
-#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
-				_div)					\
-	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
+	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
@@ -342,33 +340,33 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 };
 
 /* Resource name must match resource id present in cmd-db */
-DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
-DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
-DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
-DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, "xo.lvl", 0x3, 1);
+DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
+DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
 
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
 
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
-- 
2.35.1

