Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAF26484AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 16:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiLIPIe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 10:08:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiLIPIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 10:08:06 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB86B70B96
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 07:08:04 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b13so7481691lfo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 07:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHsbFWG8VGfSFHxz3J5zcYdNhYft8cDHvZVuoaK7gTI=;
        b=SHj5xUS38pmlYs4MHhz+rCpnhS0aSA1eDs0B2Xz0nI7TeqxyK49qa6XIhFefPs5L7G
         YBkhhVMupwYCULFJd9G309qVX4hbVHkAaFvtP+CblRTbxWwA5kMHyK7MFK1R9y10ccRc
         A8X7ZOaa+SxnJiAinjbEthKHllOsgKgMs0DzNr8ilhJioXQEF3RMCWgqMfxxD3FOaXHh
         2T7hCj575qTXya1iVgpvnJJ3vpu/+amF4tbxs5jsKqweE5f7gesj/e7wgQhX/4oPp3G7
         p8oCGZx1LWdpeh+0iDR4fXEoBKMOYijJqdeKzxPHxCOlMTPLk+o6ZDZEgFgnPFYowoF0
         R+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHsbFWG8VGfSFHxz3J5zcYdNhYft8cDHvZVuoaK7gTI=;
        b=eHJu5GL1ct7KWcx+JWwWIXr/x58C2j7l9YWCMp3GfEaqmpT6c3H4FvHXgxyyvOiVkB
         7SZjNmJSwwySt4Wfa4oaXRllIrjag4Xp6rrtG7j7NXiyXOiBhRirwsS2KBPCI2bPLmcz
         A/4V4fRuVjj9V5R6Gbjx3hLVJ1n264DPRang7KkIwe408MVCyQhirgW93KnfOBDl2QQb
         eEq25jtK6h9oPAxyW7UyPJCS1pqMvbAYBGtecUnCTDkxDVAyohgAxmrGaKf+HwmnxXdC
         /sdu5oWUtYzTR/rSoVJwgrMVkpUT9qzOYUu5Wq6ggaO4kWbP+vWzxS+ParS3Oks4J58m
         r6Rg==
X-Gm-Message-State: ANoB5pno/kz+HhVj5ISF+qwPTF/Hcl1bOPHO+9h2Kb3Liggwuk6tdXkc
        0N9zDmLPtF3Tfi4SQyAGD62czvuiWJs5t6rr
X-Google-Smtp-Source: AA0mqf6/6y3zfT68FyCfvmjzCCC/sY99Qr6ncKEdxeDRuQDQMp+3y3UEm6hcVbrytRyRuJJVD0hTmA==
X-Received: by 2002:a05:6512:3d01:b0:4b5:ab93:bb1a with SMTP id d1-20020a0565123d0100b004b5ab93bb1amr1724395lfv.24.1670598482958;
        Fri, 09 Dec 2022 07:08:02 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id m20-20020a05651202f400b004994117b0fdsm290509lfq.281.2022.12.09.07.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:08:02 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-hw: Fix reading "reg" with address/size-cells != 2
Date:   Fri,  9 Dec 2022 16:07:58 +0100
Message-Id: <20221209150759.396255-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Commit 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during
probe") assumed that every reg variable is 4*u32 wide (as most new qcom
SoCs set #address- and #size-cells to <2>. That is not the case for all of
them though. Check the cells values dynamically to ensure the proper
region of the DTB is being read.

Fixes: 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 340fed35e45d..22f48f789557 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -649,9 +649,10 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
 	struct device *dev = &pdev->dev;
+	struct device_node *soc_node;
 	struct device *cpu_dev;
 	struct clk *clk;
-	int ret, i, num_domains;
+	int ret, i, num_domains, reg_sz;
 
 	clk = clk_get(dev, "xo");
 	if (IS_ERR(clk))
@@ -679,7 +680,22 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Allocate qcom_cpufreq_data based on the available frequency domains in DT */
-	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * 4);
+	soc_node = of_get_parent(dev->of_node);
+	if (!soc_node)
+		return -EINVAL;
+
+	ret = of_property_read_u32(soc_node, "#address-cells", &reg_sz);
+	if (ret)
+		return ret;
+
+	/* Reuse 'i', as it's only used later in the loop */
+	ret = of_property_read_u32(soc_node, "#size-cells", &i);
+	if (ret)
+		return ret;
+
+	reg_sz += i;
+
+	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * reg_sz);
 	if (num_domains <= 0)
 		return num_domains;
 
-- 
2.38.1

