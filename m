Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 899A1511B32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 16:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbiD0M5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 08:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbiD0M5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 08:57:40 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CAD4B840
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 05:54:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w19so2940338lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 05:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=Pxg4r634EgqMpQNmQmRQwj/PgxWT6DubHm+PbMeiQFU8ift0I422BGZnVitDREI/Mc
         kOmyhDjDAl3PViPt60HmW4zisrVB9BbSFz4bEmV8azUgrAWinyVUXEICugPJqQxajgoj
         A/W1Sot3OwqYlQTH+RbUBpSmQQyox0r5IT99kGjarGjWsqsR8Hg8A2J+/8I3HTXMkBpU
         0629Ogl0TD0T+RnWPcZ0+CazAFwDNsMpptgTAWEVH0A5aB1+xpSaEldmfJVt08QgLOwz
         cHuG2XD6zuRpaY2/EDBZnzXtRbTnCoDg15JcFk4RaAaponxiuraFeiFjMM1wB8tH6srv
         im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=kE1m0TYrPgoX+laa3GmgO6vcYZ8Rn8+eJseg070BB/aTfW2n6rAS1Rn6P/dJrEO1EZ
         Ck83Q9iZ6TrtGhJdpOzdODW4PCzizMS2A0jrX22GuAtV3k14TY+X4jFpTJgkvlulnUEv
         kvxpRBtq9Amr6ovPpoie0z6h7qYRfGAsurK3Mlh/gJR7HmVZVVN/5zF3s5Qkp0mIPu7F
         6V3AEV4dfhlmjfEV4ekhBcMQCwxfKsVuCHmxGHNReKZtbl9ZJx7oJpLNHbdVy9zxWIZ2
         whmJM048Ci2Ozq/x5s+G8SVJZGyrWY0b3fJHtoJPcfdkN+3nkUf7TLtYRqv18Qw434As
         IDVw==
X-Gm-Message-State: AOAM533xUMVGCWjev7y4wb9lQFByE2iWIhKGqN9KgAAdPwuXgHSlAmEE
        qxrf785DK4+SHijT8rA3QMtE6g==
X-Google-Smtp-Source: ABdhPJyfbwTEHwFWwsw3KuFgORrlmVM5yzPoswg1JqF9y5ZRStHmNChlvP9aiEjLIUwTgUEwPl6Uhg==
X-Received: by 2002:a05:6512:2090:b0:472:2764:1f0c with SMTP id t16-20020a056512209000b0047227641f0cmr2893378lfr.482.1651064066142;
        Wed, 27 Apr 2022 05:54:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r9-20020a2e94c9000000b0024b4c2a1346sm1827445ljh.123.2022.04.27.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 05:54:25 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
Subject: [PATCH v5 1/3] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Wed, 27 Apr 2022 15:54:21 +0300
Message-Id: <20220427125423.3166138-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427125423.3166138-1-dmitry.baryshkov@linaro.org>
References: <20220427125423.3166138-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens platform device
manually. It would be better to follow IPQ8064 approach, where tsens
device is defined as gcc's child device in the device tree. If nothing
else, it removes gcc's dependency on QFPROM, thus allowing clock
controller to be probed earlier.

Don't create it in case there are available child nodes (tsens) inside
the gcc's device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 051745ef99c8..a6e13b91e4c8 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3641,6 +3641,9 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 		hfpll_l2.d = &hfpll_l2_8064_data;
 	}
 
+	if (of_get_available_child_count(pdev->dev.of_node) != 0)
+		return devm_of_platform_populate(&pdev->dev);
+
 	tsens = platform_device_register_data(&pdev->dev, "qcom-tsens", -1,
 					      NULL, 0);
 	if (IS_ERR(tsens))
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

