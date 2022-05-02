Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0835174AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 18:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386321AbiEBQqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 12:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386324AbiEBQqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 12:46:49 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35669FF0
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 09:43:19 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-e2442907a1so14787764fac.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+aAmktrhHjAvWVorgG3HkK53F/Z1E5yTUMK0PKA93c=;
        b=jCqteN1q3mTZAX7ZLV7IR9r4xFQBqwSuYHj5TiDLt0Ibat8Bdh1Zq9Cse71ct/arPp
         qndAtu1y3HImmRCGMKiYysaHdmd9ctLYyw+zB5IIX34rOv44uIaW1oQ4AUE1mlM/EtTP
         gGnyLn/fN65RNc4KrMS1h54pCq9x1rwt5yo159Idhjn0Wd0Q44b0QBfnbn+yva2pWvEp
         M6+hzRxjHBhhibqheEP2WNdSZNxhz7wAiXdBwQ/zG2ypIhQbGCOcVSZz7H+Ipd6ZXTDm
         VxoTqsNXS4dQXXzsLv01dKuEMcyUylfGOYxAqDAdGbRal5ChLubmbZoeHmSX6cLIWEt8
         7mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+aAmktrhHjAvWVorgG3HkK53F/Z1E5yTUMK0PKA93c=;
        b=RyxEaft5DHoPUwU5eVOXB4Uc8E+W6GaWG1Z8NcB/1DIrkUALdMsBn47rXkUCR67G4F
         UFjvq50v3N7FwiW6ywxH8DfhU5qGZKvrdW8caTI1fRAcKCK2vDqkmylrNcEFind87PQf
         WC1/tlPWy2+AZfgbHLWm8Sl2+q73aeBoUsLsEnesCpIf49EF6FzmweYLwB3d4GRbox7i
         QphlWXw7O3VIed1XEe0iM6Xy6KOW4QemMt109m7cCIY0/2Eytg0mdq7MV4Rmzu7moFKa
         5MPYv+sg2d6T9jArhZg+WdrW74Ye5JJe2ex9WkTDzEI7GOhZ7bqZ8zAVk29pnECSdXZC
         TCpw==
X-Gm-Message-State: AOAM530xELQBGmKvWZv+VO25bJpNYGPaNT0mIt2GCXtzRxthh/18H5fk
        P0HQB5qV4pPdz0sZdTlY3Jv9kg==
X-Google-Smtp-Source: ABdhPJylGLGMM5RJS9kZI/ssSmqpYEetSRGQTQyROGceaGmcbZtqhrS/OxqIn22r+my6dGgm5Pv8qw==
X-Received: by 2002:a05:6871:92:b0:d9:abe2:936e with SMTP id u18-20020a056871009200b000d9abe2936emr4933689oaa.83.1651509799097;
        Mon, 02 May 2022 09:43:19 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id dx4-20020a056870768400b000e686d13897sm6012889oab.49.2022.05.02.09.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:43:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] thermal/drivers/qcom/lmh: Add sc8180x compatible
Date:   Mon,  2 May 2022 09:45:03 -0700
Message-Id: <20220502164504.3972938-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The LMh instances in the Qualcomm SC8180X platform looks to behave
similar to those in SM8150, add additional compatibles to allow
platform specific behavior to be added if needed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/thermal/qcom/lmh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index c7f91cbdccc7..d3d9b9fa49e8 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -220,6 +220,7 @@ static int lmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", },
 	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
 	{ .compatible = "qcom,sm8150-lmh", },
 	{}
-- 
2.35.1

