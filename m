Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECAB27CA1FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjJPIoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 04:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjJPIoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 04:44:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E189BA1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so2714071a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445843; x=1698050643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6dRIr7OBjT8dKVceu+0z45PUl9k0elfoXVmV3iWMc0=;
        b=EgrnO3QIC49K8jiVpylqVIiAcQ3jhzjaVlV6Cpb7S/taAsMordc8/uHMCwLAEf3znJ
         YQAygBiFgB2KF9/C02bQttoTePOuzU+1DKbl/AkkOcxlJhh5SsScNrl8cxxrSKhw9ycJ
         1OfKWAkwRqgc/+eLVwOJ2liEm64Uk/p1tn9EpIkKFV9Rnmob0NuVOnyKTpl4p8a8F7Q6
         IsOApc7WedDjk/HcYDOBEXWo/ewdMfJaC99KzBRBoQ58Op3jKXI24WtUyYhFKFRCMd1O
         EevAaIiCIHTMeZkQTsasNSh4MSKi2O72k67BtEQM2VVKwnCHe7AJYVNsZYcprhtQbxdU
         XABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445843; x=1698050643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6dRIr7OBjT8dKVceu+0z45PUl9k0elfoXVmV3iWMc0=;
        b=G2AdOw50Lw7MVQZuXhwG2+9vIeHg5tG+VfYA1Or7o7pyXsQlgXE2Pd1Z0UMOWvmiRO
         XaaqmU95FUCXVtqO3brIsajGIT5Ue5BWwhKccC78ZlbudYjraNhrzQ9x22cyV1XcfSFT
         25DbyrWUmkBkdJiyG10YdynLHe0+00eZtQ+zdhJ45EYGzMfA+1yCQEsWbxWbJpZvGnUE
         ea9mgD4k/8PDL7etG5LPD0QM5pVT6l6Dh3HgwJx6i/2AdaMo8KhmUpkkPqhvEER2+9G0
         nHPAHQF23adDxeQgsgzjWXWKbTnETRL/ha5UbNc2fDjs1QRJOwxcEhtyGNZNxAosDZW9
         VLfg==
X-Gm-Message-State: AOJu0Yxge6im1wg0ows5MYU8MYJnBGzjx8R/h/5E8yiDweNhZM15XuyK
        LosRz/n5E8cnLjt/c1yOKb3LkU62FH3VizS2vpKXpqgf
X-Google-Smtp-Source: AGHT+IE7QxRS5JEN3oMPpnmVmDGJPtO59JOddu2/BNlZxz2blgyWTl7CmodjcX7f1Qg4p9uzjihOcg==
X-Received: by 2002:a50:c351:0:b0:53e:1434:25c2 with SMTP id q17-20020a50c351000000b0053e143425c2mr8735683edb.6.1697445843394;
        Mon, 16 Oct 2023 01:44:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (i68975BB5.versanet.de. [104.151.91.181])
        by smtp.gmail.com with ESMTPSA id l18-20020a056402029200b0053443c8fd90sm15021814edv.24.2023.10.16.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:44:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 1/2] clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
Date:   Mon, 16 Oct 2023 11:43:55 +0300
Message-ID: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
function to configure the PLL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8550.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 775e0b931923..420dcb27b47d 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -39,8 +39,7 @@ static const struct pll_vco lucid_ole_vco[] = {
 };
 
 static const struct alpha_pll_config gpu_cc_pll0_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x4444000d,
+	.l = 0x0d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -71,8 +70,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 };
 
 static const struct alpha_pll_config gpu_cc_pll1_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x44440016,
+	.l = 0x16,
 	.alpha = 0xeaaa,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -574,8 +572,8 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
 	/*
 	 * Keep clocks always enabled:
-- 
2.42.0

