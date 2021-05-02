Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D78370B81
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 14:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbhEBMVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 08:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbhEBMVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 08:21:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711D5C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 05:20:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id t4so3868842ejo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ya5wMfdEkx9QjeJilhrqhBrRqFB0sVhXi8RtY/gF6qQ=;
        b=jxWpdUwoiSrJ1AI4PDLcYPV6mjHb6JsrQNILNXt07NYoelSSnUxIBnfzQvymFnAhsf
         EOyX2TJxNLmAbo8Umukg12B9bMUd1pNaZnXIth6PmmAp/POUqPntZZaa6tbvuN8Qzfcu
         XCZdvmkZ/lB16iRTEFG2REQs5C9ngLvB2T94K6hJTyHaPtDpJpl48VSKGzQLaZj46wWl
         zviSEmHzgJgezVPkTZU33jBHOVgfabZWzK3KkVlTllB1UebHJdRTG6ACwseUR5JFiCPG
         n18k3FE/ICoNnozofmHEQTg4DlvupeG+2M+7++/45c7oMuVUjAq41jTqzZPZF/hdA6vJ
         kSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ya5wMfdEkx9QjeJilhrqhBrRqFB0sVhXi8RtY/gF6qQ=;
        b=aricAwMAbAX5RyUfJLX6pXlDuxWQQ/WaB0BH7unHse3D4SDc0+G3IVcHna0tITOQdG
         RpB+ilrMzwdRcp8+uOO5Pzo4ydfGprsqheD/BRtuvqJLTbQZfoQ2tTuLSJlKR7QiU+3/
         zaQId74mxSH9b9tzEQeWbmIfm/wkWd8wtjRwXpT5GC0cYkgOUwNW93ZEdYDxejiCXMKv
         4Q8lQjVOqlbpz82Ki+91ATI4lXXfORLWmVwePdRVLipPbgZBJMFog7XzpEOid1ApBNdh
         TLYCx5JCnaZ7UPyXLkexUlFJY2LFEnkiNmteYzcZtBUB53tVTWkPzFWk4EToDEVHHb32
         SMlw==
X-Gm-Message-State: AOAM531kCDKIBh8j84kvTAlKro33T/0a83u/o5QO6NpAdtG4gGMLUT+h
        t2vIp64EkgrA4andEi+TGVrgLDcMUC0mgcAs
X-Google-Smtp-Source: ABdhPJzUTQSM5bIfVnbb47T7ek9zbvta3E2+1hJuIqQJH78A5aee/BfJ2E8BLgt03+Q9LC2M89mQCA==
X-Received: by 2002:a17:907:100e:: with SMTP id ox14mr12683839ejb.484.1619958051180;
        Sun, 02 May 2021 05:20:51 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id p21sm10064085edw.18.2021.05.02.05.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:20:50 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 7e88a667;
        Sun, 2 May 2021 12:20:32 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 4/4] clk: qcom: smd-rpm: Add support for MSM8226 RPM clocks
Date:   Sun,  2 May 2021 14:20:27 +0200
Message-Id: <20210502122027.9351-5-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rmp smd clocks, PMIC and bus clocks which are required on MSM8226
for clients to vote on.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/clk/qcom/clk-smd-rpm.c | 74 ++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa8948..bf73942e86 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -406,6 +406,79 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 };
 
+/* msm8226 */
+DEFINE_CLK_SMD_RPM(msm8226, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8226, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8226, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8226, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM(msm8226, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8226, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8226, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(msm8226, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, cxo_d0, cxo_d0_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, cxo_d1, cxo_d1_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, cxo_a0, cxo_a0_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, cxo_a1, cxo_a1_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, cxo_a2, cxo_a2_a, 6);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, diff_clk, diff_a_clk, 7);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, div_clk1, div_a_clk1, 11);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8226, div_clk2, div_a_clk2, 12);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8226, cxo_d0_pin, cxo_d0_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8226, cxo_d1_pin, cxo_d1_a_pin, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8226, cxo_a0_pin, cxo_a0_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8226, cxo_a1_pin, cxo_a1_a_pin, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8226, cxo_a2_pin, cxo_a2_a_pin, 6);
+
+static struct clk_smd_rpm *msm8226_clks[] = {
+	[RPM_SMD_PNOC_CLK]		= &msm8226_pnoc_clk,
+	[RPM_SMD_PNOC_A_CLK]		= &msm8226_pnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8226_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8226_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK]		= &msm8226_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK]		= &msm8226_cnoc_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8226_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8226_mmssnoc_ahb_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8226_bimc_clk,
+	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8226_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8226_gfx3d_a_clk_src,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8226_bimc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK]		= &msm8226_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8226_ocmemgx_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &msm8226_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8226_qdss_a_clk,
+	[RPM_SMD_CXO_D0]		= &msm8226_cxo_d0,
+	[RPM_SMD_CXO_D0_A]		= &msm8226_cxo_d0_a,
+	[RPM_SMD_CXO_D1]		= &msm8226_cxo_d1,
+	[RPM_SMD_CXO_D1_A]		= &msm8226_cxo_d1_a,
+	[RPM_SMD_CXO_A0]		= &msm8226_cxo_a0,
+	[RPM_SMD_CXO_A0_A]		= &msm8226_cxo_a0_a,
+	[RPM_SMD_CXO_A1]		= &msm8226_cxo_a1,
+	[RPM_SMD_CXO_A1_A]		= &msm8226_cxo_a1_a,
+	[RPM_SMD_CXO_A2]		= &msm8226_cxo_a2,
+	[RPM_SMD_CXO_A2_A]		= &msm8226_cxo_a2_a,
+	[RPM_SMD_DIFF_CLK]		= &msm8226_diff_clk,
+	[RPM_SMD_DIFF_A_CLK]		= &msm8226_diff_a_clk,
+	[RPM_SMD_DIV_CLK1]		= &msm8226_div_clk1,
+	[RPM_SMD_DIV_A_CLK1]		= &msm8226_div_a_clk1,
+	[RPM_SMD_DIV_CLK2]		= &msm8226_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8226_div_a_clk2,
+	[RPM_SMD_CXO_D0_PIN]		= &msm8226_cxo_d0_pin,
+	[RPM_SMD_CXO_D0_A_PIN]		= &msm8226_cxo_d0_a_pin,
+	[RPM_SMD_CXO_D1_PIN]		= &msm8226_cxo_d1_pin,
+	[RPM_SMD_CXO_D1_A_PIN]		= &msm8226_cxo_d1_a_pin,
+	[RPM_SMD_CXO_A0_PIN]		= &msm8226_cxo_a0_pin,
+	[RPM_SMD_CXO_A0_A_PIN]		= &msm8226_cxo_a0_a_pin,
+	[RPM_SMD_CXO_A1_PIN]		= &msm8226_cxo_a1_pin,
+	[RPM_SMD_CXO_A1_A_PIN]		= &msm8226_cxo_a1_a_pin,
+	[RPM_SMD_CXO_A2_PIN]		= &msm8226_cxo_a2_pin,
+	[RPM_SMD_CXO_A2_A_PIN]		= &msm8226_cxo_a2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8226 = {
+	.clks = msm8226_clks,
+	.num_clks = ARRAY_SIZE(msm8226_clks),
+};
+
 /* msm8916 */
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -1060,6 +1133,7 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8226 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
-- 
2.25.1

