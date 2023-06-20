Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1AE736B47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjFTLnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjFTLnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:43:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7639F171F
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:43:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso6121760e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687261409; x=1689853409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RI8zJ2B4Z2X5IcHWBKS5WPAJQqO4aBjX6c2mtTI8B2Q=;
        b=CCTRNsgvR2UPVb1xJXQQZiCUabVKolwzo7UTGIODyexvGu2GPrMRg1g7UxVbFYZYfB
         cP5yDros9mziT2CV7bMqFjA8wdpqFgjHjmUfNaXgECkgjdJbiXMeDZQbbEuA5NiqatIK
         fEJ2j9ZTacjoL+sBLp1nX6WZNveNeZ0AI2MT5pXkTz6zZZ2MR3E2UwoCMhfOvVd4kWxf
         Vjk8E4gSdo04E8YYSvjrDE9ie2YDpNieF449TUUATWR+ayI0uaGb0VZaGDon4i28HAki
         82tLQvVV3CibPCH8uVNDzSPqeRRkak/Wuy/CwEshNRxxSv/cTmy1jYe4Qa36Zj0yPMLk
         LPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687261409; x=1689853409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RI8zJ2B4Z2X5IcHWBKS5WPAJQqO4aBjX6c2mtTI8B2Q=;
        b=I8b3Q9bntUwv8Rs1yvmC1iupfFu/fj+/fu0SnB0COrTArGsRngnrdXcrF2iO21Kun5
         PFKWGfCruaKoyL7m0zM7FQ/vkW2QvAsAAuym1US0XqkXdbqdPph2sPLAeUL+St1z1B8/
         TXP+PQrCiU0qHNwC0mi5gM34dgel+o7czMwuyNstWmLD0m62UzfkDyZBweGLqQhg8e+Y
         EKRsdNweyNUbdo2dm+vk1mFGHqGwKXuO+goBBe7MFy2ytUJGzCy3B91JUo87t5HkclmX
         McGbHw9w4dotUr7EjFCuM1Eeo8JvhWqr7oXJdAn1eLcEU8E64IAZTe7Jk9TeUDKSQSig
         GY4Q==
X-Gm-Message-State: AC+VfDyi8fopn9iwCE+btZMfVCMqvZqcl+KgVSK/ByGZ14533lcpZBu+
        tI159W6QM2OWkiZn6D4oo4yb2sk6xVxLMI4Y4lY=
X-Google-Smtp-Source: ACHHUZ4brkblTOFRd/aUUHxZjq1zHbMhvCCj6HWtCPfsrSx/hxBC/7I663A9U2A8XTdEhYztMwW5oA==
X-Received: by 2002:a19:4350:0:b0:4f8:4919:2dd5 with SMTP id m16-20020a194350000000b004f849192dd5mr6575126lfj.30.1687261409551;
        Tue, 20 Jun 2023 04:43:29 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v17-20020ac25591000000b004f640b0fb04sm324158lfg.212.2023.06.20.04.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:43:29 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 13:43:21 +0200
Subject: [PATCH v2 2/2] drm/msm/dsi: Enable runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-dsiphy_rpm-v2-2-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687261406; l=898;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iR0+YI1D9awhWod+Sc5nGzcONvn3jPDAmrCRI6Yrb7M=;
 b=VXt0CmEZJgqL4MCbC8F8Mojwr2O2qliYJQRqyaxSfqgW8xqo1xrUAiXuEgFa1sXkhE/W9UIrX
 bMwaD2UuaKvCaVzwZHX20kE7AInt4nccV5Tl9zu6jVR+uwOOhLf/b9q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devices power the DSI PHY/PLL through a power rail that we model
as a GENPD. Enable runtime PM to make it suspendable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 2f319e0eb74f..22431e106529 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -689,6 +689,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
 				     "Unable to get ahb clk\n");
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* PLL init will call into clk_register which requires
 	 * register access, so we need to enable power and ahb clock.
 	 */

-- 
2.41.0

