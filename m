Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB324F560C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbiDFFiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1851343AbiDFDD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 23:03:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767FC35242
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:59:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m3so1176672lfj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mCdnNmVygED4uaOfb8SOUK1cT/+oSB5JmQc20+uJ1II=;
        b=pJI6u/buQZy8snAz4tQC7vRPgL+G+EOaeiqYoD8DnobLWGUhrEKB4VkkkqqJFpfYfl
         VURFeceRN2RvFW3QDrJf/gJuybOG72ott4HQRF6OPzJUay4ofQkU0thgWbSpnbMHkJ3L
         c6x5IV1iWVWg/7zSOyp76GwsFwY0ZnEHXI1RLSjwRHo+l8WOBmbjF5DJrNkT2gIW59tj
         zWMeN7YeJpyaEpBsfW+S/q87I6MbvQS2fUvDBzYKqZPEpwZd+t+qK8FRlpYkCvujYcci
         aGmcmX+wgDWNWRhHK0rq6KE4Vz6zH3dF8wrqdAJvLAsNGQo+5GapuDESy+PD41xPErGM
         61Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mCdnNmVygED4uaOfb8SOUK1cT/+oSB5JmQc20+uJ1II=;
        b=u2+7slSGLDCVddfyEDF9iG4AGlWxZ4yk9Q5uJddn5XJjsFblmNpyhT4NPwKDZvvLrj
         xY+t/GjPzCyub8kIVUeVMU0y2kFqgzw4FSmpJGyGP2qrLUD7kl/X9f73DgsB9IjxqSxC
         PApgzkuCceXlso1fJlgHDZyPYgup9oeY5edkGuSlcZjYJ6Sk82nh3Bh57krGfA7i3/Kl
         sxEJVsqR0iM79S/uGK88W9wyKyzdq/B9gpA7INrnvPcmcfOWyJhlmivlT1QsRS1SH73p
         rBuEpQt7I6/O1y+MgMwGPXIvyX9GWjJUP3Jff94HxvlidHB0s3IHaQuJHvRXdfutTPF1
         Cncw==
X-Gm-Message-State: AOAM533Oy23WOSUrNYGp5/HvbaZQdt45wS3k9uIHFjBbBx3SomdJQqCH
        3TMc97TpzCGHEFhULZJD9HBC5w==
X-Google-Smtp-Source: ABdhPJyXy7UUxdIl/cuvDDnBtF4tCGUStvyyBHag9soJAoWBFTSxiJJZenScrY44qRkHDM67hWT52A==
X-Received: by 2002:a05:6512:3403:b0:448:5f92:7b0c with SMTP id i3-20020a056512340300b004485f927b0cmr4077979lfr.237.1649203154619;
        Tue, 05 Apr 2022 16:59:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w14-20020a0565120b0e00b0044a9b61d2b3sm1646471lfu.221.2022.04.05.16.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:59:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/4] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Wed,  6 Apr 2022 02:59:09 +0300
Message-Id: <20220405235910.373107-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
References: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens device. Don't create
it in case there are child nodes inside the gcc device (which would
include the tsens).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 051745ef99c8..0f2d1a69781b 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3617,7 +3617,6 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
-	struct platform_device *tsens;
 	int ret;
 
 	match = of_match_device(gcc_msm8960_match_table, &pdev->dev);
@@ -3641,12 +3640,16 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 		hfpll_l2.d = &hfpll_l2_8064_data;
 	}
 
-	tsens = platform_device_register_data(&pdev->dev, "qcom-tsens", -1,
-					      NULL, 0);
-	if (IS_ERR(tsens))
-		return PTR_ERR(tsens);
+	if (of_get_available_child_count(pdev->dev.of_node) == 0) {
+		struct platform_device *tsens;
 
-	platform_set_drvdata(pdev, tsens);
+		tsens = platform_device_register_data(&pdev->dev, "qcom-tsens", -1,
+						      NULL, 0);
+		if (IS_ERR(tsens))
+			return PTR_ERR(tsens);
+
+		platform_set_drvdata(pdev, tsens);
+	}
 
 	return 0;
 }
@@ -3655,7 +3658,8 @@ static int gcc_msm8960_remove(struct platform_device *pdev)
 {
 	struct platform_device *tsens = platform_get_drvdata(pdev);
 
-	platform_device_unregister(tsens);
+	if (tsens)
+		platform_device_unregister(tsens);
 
 	return 0;
 }
-- 
2.35.1

