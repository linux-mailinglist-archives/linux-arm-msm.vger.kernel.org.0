Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E24B56B977
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 14:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238116AbiGHMMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 08:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238108AbiGHMMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 08:12:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599219CE1C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 05:12:01 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id f2so24898176wrr.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gg24pBkx9uxXH81vY9HTkL7j8WN9zHUs35lE66OFcP8=;
        b=Ih0hTP9rMPn+jVmm6pKrQ0rtSfpovEF7rxq/fRMgP2xXhTMMmYKCsnUcJbTMCkLAZ7
         dbBAhO51ANLQ/YJTPZGceJzfKvQlolu9r+mvfrQh22a3lTAAgoIQ1c2RAXXGzBS0dUFc
         ch6aJpNtDLgb7jUJk2KEmwnUQjap8Dgolwl79jierOho5ZKvHs/ZIM8ueRSRqWuEc2to
         8fw5W2oaaQnQ0njyajtnLnoktMptVH0qXxli5ULJ4dfRGKNm7P3vnbju8bwk6l+33QjO
         epWD+37IANDT7T/B2Q6GADqqM1On3+gxPi2iF22w5YLR173RZfY7Fn5EGhfaa2UA34Cs
         sZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gg24pBkx9uxXH81vY9HTkL7j8WN9zHUs35lE66OFcP8=;
        b=T6g6npNWLis4gQi2LluZ/1Fg34MGV5ho31fszZHqh1r74yQiCwl/z87oN9PP3zwqPO
         sOrP0Ahz9x1/cEPwgApaTvIYLSV6NzavtPL6B6A1IsHAr1FT+qXeaxb1e+oJncvMyPHq
         tj+MMnFHw8JXNo6tcH77F4U1l+SQvdKLKMtQ1MieRW1PaGJsTJeh/DAGorCsE2/CgqGl
         Zx3xKrW1+iNPak8UoiPKwcei1JzC8GVZVE3zn7snhUtEINDOlCVX5lZ5QgFqgIG9uLPY
         BipUv/QY0EM7+zBLNQUflcL0zomm66TK5sv2oCvLFx3CBzW7+vG44A/GXD3dq4FYT0if
         6msA==
X-Gm-Message-State: AJIora+DdyVlprTczs+lt+S3Z+UI12Jrx+z7KGQ4yLPGSUArcoGz2Hyf
        58FoCRG2BPliGpYXexcjZkUw6A==
X-Google-Smtp-Source: AGRyM1tkypSoyIzyfVjjSr0ZQtIcf6Lp8Yn3JMLEHIqTxyuMqDgYDsR68IAZOCvbGW+lpGTo6C+ANw==
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id j8-20020a5d6048000000b0021d68e57cf0mr3115494wrt.678.1657282319860;
        Fri, 08 Jul 2022 05:11:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c1d0300b003a03ae64f57sm2030549wms.8.2022.07.08.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 05:11:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, stephan@gerhold.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/3] dt-bindings: opp: opp-v2-kryo-cpu: Fix example binding checks
Date:   Fri,  8 Jul 2022 13:11:54 +0100
Message-Id: <20220708121156.2165250-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
References: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
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

Adding missing compat entries to the cpufreq node
Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml shows up
a dt_binding_check in this file.

opp-v2-kryo-cpu.example.dtb: /: cpus:cpu@0: 'power-domains' is a required property
opp-v2-kryo-cpu.example.dtb: /: cpus:cpu@0: 'power-domain-names' is a required property
opp-v2-kryo-cpu.example.dtb: /: opp-table-0:opp-307200000: 'required-opps' is a required property

Fixes: ec24d1d55469 ("dt-bindings: opp: Convert qcom-nvmem-cpufreq to DT schema")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/opp/opp-v2-kryo-cpu.yaml  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
index 30f7b596d609b..59663e897dae9 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
@@ -98,6 +98,8 @@ examples:
                 capacity-dmips-mhz = <1024>;
                 clocks = <&kryocc 0>;
                 operating-points-v2 = <&cluster0_opp>;
+                power-domains = <&cpr>;
+                power-domain-names = "cpr";
                 #cooling-cells = <2>;
                 next-level-cache = <&L2_0>;
                 L2_0: l2-cache {
@@ -115,6 +117,8 @@ examples:
                 capacity-dmips-mhz = <1024>;
                 clocks = <&kryocc 0>;
                 operating-points-v2 = <&cluster0_opp>;
+                power-domains = <&cpr>;
+                power-domain-names = "cpr";
                 #cooling-cells = <2>;
                 next-level-cache = <&L2_0>;
             };
@@ -128,6 +132,8 @@ examples:
                 capacity-dmips-mhz = <1024>;
                 clocks = <&kryocc 1>;
                 operating-points-v2 = <&cluster1_opp>;
+                power-domains = <&cpr>;
+                power-domain-names = "cpr";
                 #cooling-cells = <2>;
                 next-level-cache = <&L2_1>;
                 L2_1: l2-cache {
@@ -145,6 +151,8 @@ examples:
                 capacity-dmips-mhz = <1024>;
                 clocks = <&kryocc 1>;
                 operating-points-v2 = <&cluster1_opp>;
+                power-domains = <&cpr>;
+                power-domain-names = "cpr";
                 #cooling-cells = <2>;
                 next-level-cache = <&L2_1>;
             };
@@ -182,18 +190,21 @@ examples:
                 opp-microvolt = <905000 905000 1140000>;
                 opp-supported-hw = <0x7>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp1>;
             };
             opp-1401600000 {
                 opp-hz = /bits/ 64 <1401600000>;
                 opp-microvolt = <1140000 905000 1140000>;
                 opp-supported-hw = <0x5>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp2>;
             };
             opp-1593600000 {
                 opp-hz = /bits/ 64 <1593600000>;
                 opp-microvolt = <1140000 905000 1140000>;
                 opp-supported-hw = <0x1>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp3>;
             };
         };
 
@@ -207,24 +218,28 @@ examples:
                 opp-microvolt = <905000 905000 1140000>;
                 opp-supported-hw = <0x7>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp1>;
             };
             opp-1804800000 {
                 opp-hz = /bits/ 64 <1804800000>;
                 opp-microvolt = <1140000 905000 1140000>;
                 opp-supported-hw = <0x6>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp4>;
             };
             opp-1900800000 {
                 opp-hz = /bits/ 64 <1900800000>;
                 opp-microvolt = <1140000 905000 1140000>;
                 opp-supported-hw = <0x4>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp5>;
             };
             opp-2150400000 {
                 opp-hz = /bits/ 64 <2150400000>;
                 opp-microvolt = <1140000 905000 1140000>;
                 opp-supported-hw = <0x1>;
                 clock-latency-ns = <200000>;
+                required-opps = <&cpr_opp6>;
             };
         };
 
-- 
2.36.1

