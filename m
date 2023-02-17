Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A549369AFFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 16:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjBQP6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 10:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjBQP6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 10:58:48 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B1D5DE19
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 07:58:46 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cn2so5995337edb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 07:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYkwCuqigGfCoKLWcMDTYElj0W4J5moHrJOlJcxcQqo=;
        b=Cy5xpdNu8jAGyMXKMw3pmI3Hl887D2GB5iBSBv4klpb/X79+4aCl+UyrY5aXkE7jxB
         08blWIZpGSuvoBZhvG2VtFCv/cKz3j5htB3McpbBCareoy1un2gWkk848fwlUthfnf4/
         LuVXpCEWkjxreVdc57pZxBZ+Fd3DRdhfIkMlvH4fniN1EhGdj7/JrDRXV0Yqw17s5LfI
         1ViOaiS1PWBdJlSOu5F+qc2DFiWy/pEVCtmwJAzGccsxmcQtnJ0VYvxEfzh+a71n8t/l
         RUQ8PfyPYSvBYQTxtiyv5ahl9mcggirbkvpwMve14frGI6kOJO/cTwjSMejwSzqCu4hR
         QyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYkwCuqigGfCoKLWcMDTYElj0W4J5moHrJOlJcxcQqo=;
        b=iY3hw9liLEXdrvVXuevIkk2RzZADOxeq6+cwBMR1xGttDrZfIB5y+UIlzWsxXZpL7i
         uUq5qGsHL3oQj4+nNcgK+eF3r5XTXvNcP2myTs3ilxTO+l2XxddeTjevsIfZZlsrgJMq
         U5/NjaI2Gp20jWaS0UoajEg1olpEmB8WUdToO80tC1TnU7yHNYIg/wYtkI6WlGHRjUHY
         Pa1QhBSs+WAcaH3hr21RLFfqKuy9JyFGMQg9LN/kDxn606ZuIDZUjdKqVS5GgGQl/WHI
         VjbduTuCq5WBJW4UQDXban5RDvR54vS2DgVnrUSUGW8VOkXykjiTGt7DveE/y1lFMvQ3
         4PVQ==
X-Gm-Message-State: AO0yUKVSS9Iz2dddN7mnqItntxot+JnsG9TGzTaT5wzdD1nIbSxyfq9T
        2J5XK7dmX8QbGdvpLdpQS+U+Xg==
X-Google-Smtp-Source: AK7set8sTy6QcLCsFDFZbGkcAunox6kJ4vp/Xj1tVQsgXo2ftR5DkhQIJTc8kUk8n5DMgr5OXMM/mQ==
X-Received: by 2002:a17:906:4a58:b0:884:930:b014 with SMTP id a24-20020a1709064a5800b008840930b014mr9887865ejv.6.1676649524887;
        Fri, 17 Feb 2023 07:58:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090685cf00b008b1435bd1cbsm2290068ejy.105.2023.02.17.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:58:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sc7180-trogdor-pazquel360: drop incorrect RT5682S VBAT-supply
Date:   Fri, 17 Feb 2023 16:58:36 +0100
Message-Id: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

It seems that the RT5682S codec does not use VBAT-supply:

  sc7180-trogdor-pazquel360-lte.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I don't have access to datasheet. Driver still requests VBAT-supply but
other boards simply remove this property for RT5682S.
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
index bc4f3b6c6634..273e2249f018 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
@@ -12,6 +12,7 @@ &alc5682 {
 	compatible = "realtek,rt5682s";
 	realtek,dmic1-clk-pin = <2>;
 	realtek,dmic-clk-rate-hz = <2048000>;
+	/delete-property/ VBAT-supply;
 };
 
 ap_ts_pen_1v8: &i2c4 {
-- 
2.34.1

