Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D6B1C1F25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 23:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgEAU57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 16:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgEAU56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 16:57:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DD1C061A0C;
        Fri,  1 May 2020 13:57:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so12966522wrb.8;
        Fri, 01 May 2020 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s46Pums7160hDMRHz4lcI0wKlc3rbqTgaKkrnlbOBuA=;
        b=RcG701duKjGztCPmMJi6pENCMoCBn+L6THrkNZymKbb5c/AZsV86c1g9Cgql0yn5DR
         Vmrx7hNpD9vsmBjFQ1yEzNX2u3HquDJOyseNp73KAw2dU9O+g8f7LXp+JZypSOhTpq2b
         I9wvltZuQqln8NgGKbMNoD7iIGG8px/0uKXHDuSmJXYohTjPFvKHCaSYJq0DKcYkD40R
         iqeSLn5UkHMwdpR+Tm0ghr04es9sGH6XsPkUzoPJoK/u1V5YobpuazvL/s1i/mKzBBrv
         VEOCxJQ8I/KDRawTuf9dK/dQeC9DccG+2z5wdQf5krrySQludEdQ4U+lN1bTucamsXRU
         dzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s46Pums7160hDMRHz4lcI0wKlc3rbqTgaKkrnlbOBuA=;
        b=cCffW32u6obbWiKa3vdH0ycNmZRXWsT0QRzvrV6lYycefAhEavmSkpF0z9v5OFmosE
         h1JBbbCiZI6XuVw/ljV52tSDrRR5ZN4+QmIzc5DV3blGofzYCwsJun/Blzl8hgATiSQF
         Jaq5gPuRn6jQir4bmYnVyVJmmYDk2+IOVVfuca449Xv+TqRzmyIVE/YuuTP7fktxGoHJ
         nkhMEnDSrkdIw1HXWz1I2hkHirXz0xr3ynK/tDfm3QZCzhBqeysfhg1p1SGXPFGJEqmb
         Fu/KIvsYu3XzOZnrtpYoxdQYz3aZwEDixS0onpl5etYM6WxJAtBXjRKDWYQj5n8Bl5y0
         NSzg==
X-Gm-Message-State: AGi0Pua1ZkZOqY58d2q/jASZeVytMR0E0ooZ1Zdwf/TTGQICrHT2Go+C
        nN5lW8GHznFvRGLTgCm/am3FLwqKpZdFqg==
X-Google-Smtp-Source: APiQypL6Hwl66LoJR1CXVn0JrzHRhsrU2/hv46W1qXtjdKAn0COb1rqSPWBv+qbJLFAahBi7PD8ucA==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr6361494wrw.207.1588366676984;
        Fri, 01 May 2020 13:57:56 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id k14sm5970446wrp.53.2020.05.01.13.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:57:56 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: qcom: smd: Add support for MSM8936 rpm clocks
Date:   Fri,  1 May 2020 22:57:26 +0200
Message-Id: <20200501205728.152048-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

