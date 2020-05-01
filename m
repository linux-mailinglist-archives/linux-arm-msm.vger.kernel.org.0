Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504AA1C20B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 00:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgEAWdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 18:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEAWdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 18:33:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82096C061A0C;
        Fri,  1 May 2020 15:33:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g13so13381240wrb.8;
        Fri, 01 May 2020 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s46Pums7160hDMRHz4lcI0wKlc3rbqTgaKkrnlbOBuA=;
        b=aPZtx49puuwMGWWts50qZOBKnnID+5lgpn6sq2AgFMKTTC45PqhyJ0nbiXMI2YiCIY
         o8b9N8grpKwMDDP5R58ZUpShctT4P82yPm/sD2/6xSHGuaOGh21nwxayaGrPVgMVfDw8
         SvQHDPwU7RanE+yawsFE3zaPiv6YRgZVW6KsmhDpU/ae7xvmfEUnT5+t/tT3L1WKzySo
         GKF8Q3ethbEqlrXXjLr6n3iOy32n36IRSZ3otE1W/mwP8tWG36AEZhj/z0yqab4FpzPM
         mGm+tEvErmi/C8VkvRzt73MoLUZqbcn6FlTin20j5vMDOd2ueMVcGkrWGzSNnwi9suB/
         MdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s46Pums7160hDMRHz4lcI0wKlc3rbqTgaKkrnlbOBuA=;
        b=Y37jvP3brb49WbqymYNbADOJZfunmCr67Vn2aI7nAVu3XbvR8vKfFc+dtIeHAjd7up
         mVfpJZ8Wv31SCFRbe9yNitvJbFY8wh/VRpTOLsSaZQE7E7TtCR9ok68uxK26wx+C1xBI
         dgjxYMIWMdTELu9F9Fb5ob5ZlVpnRYqfk+bNLTvYjYcIK5eyijSg3R09uxjpTo+xfki7
         y60leYrufBOuF05UciuEvX1V017Bc5c6XOZrijWppIG5FxjXhGteAg8FrqsWs0PM8vTZ
         wxRuzdQlCODCS9yqZots/EJr1jwEV3r9aLy0TC5vmyGVFccwLorW1TOh5HokvfSHGTig
         /fRg==
X-Gm-Message-State: AGi0PuZS1QJyxlcelzcMY336ZIDjXRSAyAqEhLtXgcsYD9LjtZujXuNm
        z9gk46AIjF1lEsYHy9Outj8KEtBBkd2B3g==
X-Google-Smtp-Source: APiQypL4MaiMlQFcX9hzI+6tDUAdmeO0Oqxm4mym8TPaG8C9vTmyMTxfwmWWIgCm81egi4OLCMeukA==
X-Received: by 2002:a5d:6188:: with SMTP id j8mr6043745wru.119.1588372384298;
        Fri, 01 May 2020 15:33:04 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id n9sm6237750wrx.61.2020.05.01.15.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 15:33:03 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>
Subject: [PATCH 1/4] clk: qcom: smd: Add support for MSM8936 rpm clocks
Date:   Sat,  2 May 2020 00:32:29 +0200
Message-Id: <20200501223232.275800-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501223232.275800-1-konradybcio@gmail.com>
References: <20200501223232.275800-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 52f63ad787ba9..4ac80d8ac6c25 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -452,6 +452,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 	.num_clks = ARRAY_SIZE(msm8916_clks),
 };
 
+/* msm8936 */
+DEFINE_CLK_SMD_RPM(msm8936, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8936, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8936, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(msm8936, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, bb_clk2_pin, bb_clk2_a_pin, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+static struct clk_smd_rpm *msm8936_clks[] = {
+		[RPM_SMD_PCNOC_CLK]		     = &msm8936_pcnoc_clk,
+		[RPM_SMD_PCNOC_A_CLK]		   = &msm8936_pcnoc_a_clk,
+		[RPM_SMD_SNOC_CLK]		      = &msm8936_snoc_clk,
+		[RPM_SMD_SNOC_A_CLK]		    = &msm8936_snoc_a_clk,
+		[RPM_SMD_BIMC_CLK]		      = &msm8936_bimc_clk,
+		[RPM_SMD_BIMC_A_CLK]		    = &msm8936_bimc_a_clk,
+		[RPM_SMD_SYSMMNOC_CLK]		  = &msm8936_sysmmnoc_clk,
+		[RPM_SMD_SYSMMNOC_A_CLK]		= &msm8936_sysmmnoc_a_clk,
+		[RPM_SMD_QDSS_CLK]		      = &msm8936_qdss_clk,
+		[RPM_SMD_QDSS_A_CLK]		    = &msm8936_qdss_a_clk,
+		[RPM_SMD_BB_CLK1]		       = &msm8936_bb_clk1,
+		[RPM_SMD_BB_CLK1_A]		     = &msm8936_bb_clk1_a,
+		[RPM_SMD_BB_CLK2]		       = &msm8936_bb_clk2,
+		[RPM_SMD_BB_CLK2_A]		     = &msm8936_bb_clk2_a,
+		[RPM_SMD_RF_CLK1]		       = &msm8936_rf_clk1,
+		[RPM_SMD_RF_CLK1_A]		     = &msm8936_rf_clk1_a,
+		[RPM_SMD_RF_CLK2]		       = &msm8936_rf_clk2,
+		[RPM_SMD_RF_CLK2_A]		     = &msm8936_rf_clk2_a,
+		[RPM_SMD_BB_CLK1_PIN]		   = &msm8936_bb_clk1_pin,
+		[RPM_SMD_BB_CLK1_A_PIN]		 = &msm8936_bb_clk1_a_pin,
+		[RPM_SMD_BB_CLK2_PIN]		   = &msm8936_bb_clk2_pin,
+		[RPM_SMD_BB_CLK2_A_PIN]		 = &msm8936_bb_clk2_a_pin,
+		[RPM_SMD_RF_CLK1_PIN]		   = &msm8936_rf_clk1_pin,
+		[RPM_SMD_RF_CLK1_A_PIN]		 = &msm8936_rf_clk1_a_pin,
+		[RPM_SMD_RF_CLK2_PIN]		   = &msm8936_rf_clk2_pin,
+		[RPM_SMD_RF_CLK2_A_PIN]		 = &msm8936_rf_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
+		.clks = msm8936_clks,
+		.num_clks = ARRAY_SIZE(msm8936_clks),
+};
+
 /* msm8974 */
 DEFINE_CLK_SMD_RPM(msm8974, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8974, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -768,6 +817,7 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
+	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
-- 
2.26.1

