Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672E75600EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbiF2NDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 09:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbiF2NDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 09:03:10 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F819F3A
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:08 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so7014407wmi.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qibmwPgHDVec7acMg5rfS5jztxRq7kDuVLmasAHGZko=;
        b=Rc3YWvgUukvUoANmf2wehXexmFktltGeRorBZdmH4dAWkhiABvECjZmUOl8kKlUBxb
         iHx1gM1PnaMoHJ46X8LXQ3gdJFLpYmXOc+85YGdhYVjkzFUgcQL9myBuMMktCjelHE2B
         nG69KdDck5K7bN74bBaFW5bExVw1vcBO/uTJSbqVl96I+7Mk8mUiZ0C8FlHDIYDEy/1x
         QYNoMKpuMoN0xbID8tbmzn8P4LhFt4ZQKUm7tz9aQVkqxiFGZWj3VlawxNBO32pXeDQ7
         Yvdj9exV51xCRD4ST1VANicjDFOY8fYNfcAlUtZLSqCSAZPwxRgeccDpnlV0f48kRJ/D
         6IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qibmwPgHDVec7acMg5rfS5jztxRq7kDuVLmasAHGZko=;
        b=Fhkx7BTXHCQcFi0eNWMcUsQkhiOJZv8AJ9dBYuvojF2RTjgpBNt4rN8bfwUdmJdGDV
         6acycXrQ9uI1G39yXALeNCpDQGNnLQYzZ7jPHHCXHoUx0A/QulyossYthINb1CvPCvjQ
         S1rg67dHtO3OsDO/RZn19wZN+NNlJ6kWk3znIY55kQ4kfEBIfX7ksnV41vHjsBhbTaD8
         IOZ3NvQWDG5BvEZChlg5KtElMD7x72dGJNyBgaz3BD6p+17P/iSx3Z1ukCLBBJxvQWUM
         jf2O9MqVTF9t1XcIX9MaQlfBf17KHCECdc66jgpOaW19uglmV8ikWLP71C/RBFYa7aeH
         z63g==
X-Gm-Message-State: AJIora/uuKwRoPQIDEkUDIuiZrlSigkxU6PefrCaFlP5g5Ff8Ci/y486
        fDRcBqjcBWnJ3PqJNOHOvOJRrw==
X-Google-Smtp-Source: AGRyM1v49tOEh+yYktWC3g10o9aHtzdquBbdLd8lpTZFwYrhpLKm0+3FZtHeIKgV4yjwtFMKO3MPSw==
X-Received: by 2002:a05:600c:358c:b0:39c:97ed:baa5 with SMTP id p12-20020a05600c358c00b0039c97edbaa5mr5625925wmq.77.1656507786690;
        Wed, 29 Jun 2022 06:03:06 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g1-20020adffc81000000b00213ba3384aesm17056979wrr.35.2022.06.29.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 06:03:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [RESEND PATCH 1/5] dt-bindings: opp: Add missing compat devices
Date:   Wed, 29 Jun 2022 14:02:59 +0100
Message-Id: <20220629130303.3288306-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
References: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
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

A number of devices listed in drivers/cpufreq/qcom-cpufreq-nvmem.c appear
to be missing from the compatible list.

Cc: ilia.lin@kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index a9a776da55056..5eb1dba13fe2b 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -22,6 +22,12 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,apq8064
+          - qcom,apq8096
+          - qcom,ipq8064
+          - qcom,msm8960
+          - qcom,msm8974
+          - qcom,msm8996
           - qcom,qcs404
   required:
     - compatible
-- 
2.36.1

