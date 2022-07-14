Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9420E5749FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbiGNKEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237725AbiGNKD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:03:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5595E6259
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u13so1971790lfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JTKBL6Aor4zd0gi9+YpsM0tS+Wh8c3Pxgu/O7VusGAc=;
        b=XSP18C8zz0oix63kSQznFfQcyuoXYYWwuSlLN7U2taqc6gNNJA2Akk295PvVJrUFLI
         PvF5aU+Ardnwb0jXkCd26K062PKDvC/MhXCWuGfr3HQ3dZY0Ny9oe/2jHvNxZ3xRY/ry
         nfhn+eSKy77dIO+TrXCvq8Fj6txV4LIJMkSeIvv9H54vWSPHvoPXd084ISjTn555DS6k
         w/74DnRfX7RSicmZiadRQ5bDq1c+5prRL3rt+tGzA8egyHB5UNvAd44Fud1N0TfkhDSf
         K0ID+CAXsRNZ6Zsx/8TuuNSyP6rk6JGEwVnk+M0UFPwRMJA8tx5wwAnUqOD5aS2c0YLp
         P7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JTKBL6Aor4zd0gi9+YpsM0tS+Wh8c3Pxgu/O7VusGAc=;
        b=cwFEZHh1z86x7QZqQ7hjSxF52BMqnWjuVHvF5DJQCfrP1/GyrovmtvNWGmNtwUFZOT
         MaPq2qx5yGD8cvVidB6/ZWEaN4p20JY7Y4pd4xMv9eW7DqwDUPWSHMsTIPI1McrJ0HEu
         5j70iPyJBYUC+GSEcyUqTyBpdqu3z2lihoVChvDGfHdNd5FUWfoHVA+/XKII6tKcnrV7
         gL/vbTSCEGI2B7iwdtWNns+EgY8IuHEIz6so3aFpW0p4jILFeDiRlNCH2pEbTyCuMNnl
         MZuvvCQcFS1hBNN0ReOVH6jbVvI07NI+vOuWuBdBjnN0/jzSVJ7fA5c8WssJmWWf5YO2
         q+rA==
X-Gm-Message-State: AJIora8W3FXNHz1n3PPvZM06sHUS8Sn08DXMk7uO9pyvAQdqA5D09YwD
        4J+55AYp/L0tKjWMhhAxd9/VlQ==
X-Google-Smtp-Source: AGRyM1uxX9d1GQ16nOwzfxzni70OBrd8AJiy3hVmto0DyaAUNXDchl1mlionWd+uV2qy9epbN9i60g==
X-Received: by 2002:a05:6512:2610:b0:47f:74dc:3205 with SMTP id bt16-20020a056512261000b0047f74dc3205mr4497506lfb.429.1657793034742;
        Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 2/6] clk: qcom: cpu-8996: switch to devm_clk_notifier_register
Date:   Thu, 14 Jul 2022 13:03:47 +0300
Message-Id: <20220714100351.1834711-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using devres-managed version of clk_notifier_register(). This
allows us to drop driver's remove() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 708a8ad0c933..ff90cd5b4fba 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -425,27 +425,12 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
 	clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
 
-	clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
-	clk_notifier_register(perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
+	devm_clk_notifier_register(dev, pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
+	devm_clk_notifier_register(dev, perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
 
 	return ret;
 }
 
-static int qcom_cpu_clk_msm8996_unregister_clks(void)
-{
-	int ret = 0;
-
-	ret = clk_notifier_unregister(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
-	if (ret)
-		return ret;
-
-	ret = clk_notifier_unregister(perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 #define CPU_AFINITY_MASK 0xFFF
 #define PWRCL_CPU_REG_MASK 0x3
 #define PERFCL_CPU_REG_MASK 0x103
@@ -544,11 +529,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
 }
 
-static int qcom_cpu_clk_msm8996_driver_remove(struct platform_device *pdev)
-{
-	return qcom_cpu_clk_msm8996_unregister_clks();
-}
-
 static const struct of_device_id qcom_cpu_clk_msm8996_match_table[] = {
 	{ .compatible = "qcom,msm8996-apcc" },
 	{}
@@ -557,7 +537,6 @@ MODULE_DEVICE_TABLE(of, qcom_cpu_clk_msm8996_match_table);
 
 static struct platform_driver qcom_cpu_clk_msm8996_driver = {
 	.probe = qcom_cpu_clk_msm8996_driver_probe,
-	.remove = qcom_cpu_clk_msm8996_driver_remove,
 	.driver = {
 		.name = "qcom-msm8996-apcc",
 		.of_match_table = qcom_cpu_clk_msm8996_match_table,
-- 
2.35.1

