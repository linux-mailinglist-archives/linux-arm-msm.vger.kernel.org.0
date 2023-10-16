Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A952D7CA1FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 10:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjJPIoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 04:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjJPIoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 04:44:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FA3DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:44:06 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53db3811d8fso8726435a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445844; x=1698050644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0rRmLP9fjkilMgxeFjtjmzdH7ixA8dxS/1mEKnbj6c=;
        b=iSq/vkjTALUFrY/gSMgmb6DrdO/bFrClUmM713ttq/AaV0MnrYUEjlzhOgdpv+dA54
         8n3BTlbhV0YWXsGi0lwL8AkxSz5Y0mI5cm4ubpddzJmOyVNpeb6oI7WItHl6i6yPJegl
         SjBnh7CDviyQROMx2/+Td9xFke7kHl3nljEnosLy3+Z+/PeDfXEhtS+mTrg/pnQaA2VS
         NtWQrOW+h5gF40qOVKqTMOqfLcNlQzh+H1eXaoCq46LJpVDLK7tBZ56YfheuQjK1IhCa
         baB8qfqPAtVkaQdlYtJMVwAQfD9xLGVEBGQZfaXUxr6ige+oV4r9iFwT5LCoAhYdUeVd
         EtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445844; x=1698050644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0rRmLP9fjkilMgxeFjtjmzdH7ixA8dxS/1mEKnbj6c=;
        b=YBU9bIe0QRIV3KtAVFWO+03c8zUvwyUnjE8g3w/zSjgDULb/riQcirqh4UT72asICK
         BMqfceWkOuaIKC6L2QNTMS/bBdFzaeXWTFrHf8p8H3b+tPK0PM5OsdnSsQ7PgJHQlXcn
         UJ7B0xpwFWkkdk4SuGVrOCgxqAojBB+gaEmyVT02nUJL+In0kZW4q10vgHbDaoBZa5+l
         YatnUz0sXjjCB0F2Bnkrm8rjjVB6kZCWGxKeAgSQWkKRQy6UY7lDLGLY5huqm/GFv3vH
         dHwzOIFkk8PBGmYh9GxzAAkE/LojpOvSTOIFJZyPXm3trXe4riy9iEUqfS1Yb39MgAjj
         a3Pg==
X-Gm-Message-State: AOJu0Yy/EyhuYlOyuV3LoMlPCaXhyp1Bi/2at9bJ8XQo0sGvmZIeKLBz
        zeYcWc9Vs31wbeGfk1QPxN14Vw==
X-Google-Smtp-Source: AGHT+IHrYWALOoBqZKJ1TG7otqxucdJ1/0uNs2khdKNAQS9zMidfhGYJpoelH+5hCyY6zCqV7rIH5w==
X-Received: by 2002:aa7:d4d5:0:b0:52e:3ce8:e333 with SMTP id t21-20020aa7d4d5000000b0052e3ce8e333mr6876446edr.18.1697445844516;
        Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (i68975BB5.versanet.de. [104.151.91.181])
        by smtp.gmail.com with ESMTPSA id l18-20020a056402029200b0053443c8fd90sm15021814edv.24.2023.10.16.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 2/2] clk: qcom: videocc-sm8550: switch to clk_lucid_ole_pll_configure
Date:   Mon, 16 Oct 2023 11:43:56 +0300
Message-ID: <20231016084356.1301854-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
References: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/clk/qcom/videocc-sm8550.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 3bb136ec31b1..f3c9dfaee968 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -36,8 +36,7 @@ static const struct pll_vco lucid_ole_vco[] = {
 };
 
 static const struct alpha_pll_config video_cc_pll0_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x44440025,
+	.l = 0x25,
 	.alpha = 0x8000,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -68,8 +67,7 @@ static struct clk_alpha_pll video_cc_pll0 = {
 };
 
 static const struct alpha_pll_config video_cc_pll1_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x44440036,
+	.l = 0x36,
 	.alpha = 0xb000,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -427,8 +425,8 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
+	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
+	clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
 
 	/*
 	 * Keep clocks always enabled:
-- 
2.42.0

