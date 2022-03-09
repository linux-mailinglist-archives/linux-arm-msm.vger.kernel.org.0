Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033FE4D318E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 16:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbiCIPQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 10:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbiCIPQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 10:16:54 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888DA17C400
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 07:15:55 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id kx6-20020a17090b228600b001bf859159bfso5578882pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 07:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/IcWlT+PDOAuKFhHBO22sb+SfpqtrQ61LlKL6Ry12Q=;
        b=t7sc/C5jUWt89kTrhEtmyKtFqcGc5bNY8RrjGzLXl4wr1SmRJfVT0gI4LIKyn8QLDW
         91TbWh95XTGlepNVumZwd+GfBoe27+cmIBINILwepPfBjuuh8bHclLORplrQRXcmJQd5
         mWcPaMBP8ZvmTo4VMVn1Hg7UtP6U6Umx3yEIZHeznMJBZT/WDG3s+eOXFY2q25Vvrzlp
         HDIlFxSWWWTnYtkwHIEK+l1prXbJ3ajK16V317xMfXoHehaY4+utvsIoECK1Bauz8mjd
         moaTLvtlKCQq7ekft3iWrGnG8gD0H+lb28Yxo6CrIL+c7RTxqFM+UDUxqBw5NGKjq5cE
         dpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/IcWlT+PDOAuKFhHBO22sb+SfpqtrQ61LlKL6Ry12Q=;
        b=ajQzShL7SfWA1s01oAx3U5orbeGyW54fB2wf+wcwKlqrvAz4PdENx7HyHIKIcle3JD
         IrP5uZ70Jm4mp7T6GXBaVOrluE8O8U52PhhjpyLc1mcg9OTf0vPVWpu5un8DyhOlijgv
         Cdjf3ggJEZamD8m/R2NNBo/TODiBV65fisSy3GeCj6nBkP2BJYQdHM93an6JV9oMycPV
         Z0j1VemusNqo+QVQK6rNw2khlaJQ1OrKU3awBD3YlRuppWBcqszFjY8DCl9PAmlc7Jnv
         nnoDv/6n/3uXkt3pSKX8UvedACsJJnf7grLIZJp7J4PE9uPPCQvGtiyE4YuwxpgN55Ip
         8XYQ==
X-Gm-Message-State: AOAM533LhcmJgPR9wpZNdSWr9lbu1sR/OTeKcITN4+MVdleGfAlnhb3z
        prnfo7uOqMuKUUV0M+oKm1RO
X-Google-Smtp-Source: ABdhPJwAOG34hjqTjNfdA7pWvCnPSiGY4m4NrhjpikXMG87mhNgOOsYgr4P3RiYYkBNP6WPqd0LBjQ==
X-Received: by 2002:a17:902:dacc:b0:151:c216:2772 with SMTP id q12-20020a170902dacc00b00151c2162772mr23086584plx.107.1646838954708;
        Wed, 09 Mar 2022 07:15:54 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.22])
        by smtp.gmail.com with ESMTPSA id p25-20020a637419000000b0037fa57520adsm2727425pgc.27.2022.03.09.07.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 07:15:54 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hector Yuan <hector.yuan@mediatek.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: dvfs: Use MediaTek CPUFREQ HW as an example
Date:   Wed,  9 Mar 2022 20:45:40 +0530
Message-Id: <20220309151541.139511-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309151541.139511-1-manivannan.sadhasivam@linaro.org>
References: <20220309151541.139511-1-manivannan.sadhasivam@linaro.org>
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

Qcom CPUFREQ HW don't have the support for generic performance domains yet.
So use MediaTek CPUFREQ HW that has the support available in mainline.

This also silences the below dtschema warnings for "cpufreq-qcom-hw.yaml":

Documentation/devicetree/bindings/dvfs/performance-domain.example.dt.yaml: performance-controller@12340000: reg: [[305397760, 4096]] is too short
        From schema: Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
Documentation/devicetree/bindings/dvfs/performance-domain.example.dt.yaml: performance-controller@12340000: 'clocks' is a required property
        From schema: Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
Documentation/devicetree/bindings/dvfs/performance-domain.example.dt.yaml: performance-controller@12340000: 'clock-names' is a required property
        From schema: Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
Documentation/devicetree/bindings/dvfs/performance-domain.example.dt.yaml: performance-controller@12340000: '#freq-domain-cells' is a required property
        From schema: Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
Documentation/devicetree/bindings/dvfs/performance-domain.example.dt.yaml: performance-controller@12340000: '#performance-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml

Cc: Hector Yuan <hector.yuan@mediatek.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/dvfs/performance-domain.yaml          | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dvfs/performance-domain.yaml b/Documentation/devicetree/bindings/dvfs/performance-domain.yaml
index c8b91207f34d..9e0bcf1a89fe 100644
--- a/Documentation/devicetree/bindings/dvfs/performance-domain.yaml
+++ b/Documentation/devicetree/bindings/dvfs/performance-domain.yaml
@@ -52,10 +52,16 @@ additionalProperties: true
 
 examples:
   - |
-    performance: performance-controller@12340000 {
-        compatible = "qcom,cpufreq-hw";
-        reg = <0x12340000 0x1000>;
-        #performance-domain-cells = <1>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        performance: performance-controller@11bc00 {
+            compatible = "mediatek,cpufreq-hw";
+            reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+
+            #performance-domain-cells = <1>;
+        };
     };
 
     // The node above defines a performance controller that is a performance
-- 
2.25.1

