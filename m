Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F2264907D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiLJUEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiLJUEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:04:08 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C693213F8B
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id cf42so12277842lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBRVlbrqRCLQh/hPYQMZj1j2VXHf/Xbb2WuXE+iQo4s=;
        b=OVMoskt21DvWG921R245YlH5xYu83EndxKpsNu/6SOS9yo9CCQi3wHGEMVYI5vTed0
         puCgJbz0X7tScfYkgR20KfO/Yf0tb6IPESJb0xLtaGV1h92nKfnLMVhZnMoTJn9JScJd
         QXPvZMXHQbdT0Im2MBVxm7UWsaov7Jg2ehM6yHAt+huRWeQTnBIOYyqaKGh9m5PI6zQ+
         kmn/6S5tg/Y/CAcKgkab9HEuM6tdkeBm2ZP+VhshFUwNm+gZj+n3NivgcaJdcqihkLFx
         ihlptI/KB3kl6Ohr0MEeVUKX7ZRE7+KyI6OHmhK5mr9Ngd6UmjqYonEVx8qgbmJyyYFi
         RtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBRVlbrqRCLQh/hPYQMZj1j2VXHf/Xbb2WuXE+iQo4s=;
        b=IHj8wH5e0e6HaegnOluabVC7DgcUtKDBpSg2RVA0aTR9Y74eR4LHqJ2FoLytHBo78e
         MfjA6uUe9x2j/VlPHUgLniq/POYClyd7zQXrhWKn3cmy1vh2gPwdMFdQtgxdmoz1+2V0
         GYq1C4vtFEl30dAzmF/MsfcpaTCO5B2vNiNsW+8xC6H2W7ZZHeRbTtk3k6ZE2bwU2pao
         UMfl4RiCvHesVxzHENVU+w05W9WBSKYIW00zUABa1goHr6855MeoZ6XZh1/5UZJQIBlb
         1q+D9/JnHGX0jTGVIOGeAO2yZhSzMyxFwcBLzHryHj4o2crV88rj8zt0MjjrTVUnWKD/
         uGQQ==
X-Gm-Message-State: ANoB5pm7vOoTO45ZSK9OmOjIPO37zKx0Uvdl9uRQjQrYh7+1IzO29y5L
        6w9ds7GcCoqd45rmvr0j/BeKSL60jdMMXHdw
X-Google-Smtp-Source: AA0mqf6Ms8jSQh1Mioo+UobLsSKiXCn3pnnxKj/xfyKNT6+AHp7ldUSx1xBzJkF2v+xrCd+Z7OkHpA==
X-Received: by 2002:a05:6512:340c:b0:4b6:e22f:51a6 with SMTP id i12-20020a056512340c00b004b6e22f51a6mr529683lfr.53.1670702644949;
        Sat, 10 Dec 2022 12:04:04 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004b4f1ea713csm839628lfp.73.2022.12.10.12.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 12:04:04 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
Date:   Sat, 10 Dec 2022 21:03:49 +0100
Message-Id: <20221210200353.418391-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210200353.418391-1-konrad.dybcio@linaro.org>
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
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

MSM8996 A2NoC contains a UFS master, which means the UFS hardware is
accessed every time sync_state is called within the interconnect
framework. It's all good on devices where this clock is already enabled
(most likely from the bootloader), but devices with eMMC storage are
rather unlikely to have it like that. Add the missing 2 clocks to the
binding.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index 4b37aa88a375..5e6be4e79201 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -84,7 +84,6 @@ allOf:
               - qcom,msm8939-pcnoc
               - qcom,msm8939-snoc
               - qcom,msm8996-a1noc
-              - qcom,msm8996-a2noc
               - qcom,msm8996-bimc
               - qcom,msm8996-cnoc
               - qcom,msm8996-pnoc
@@ -186,6 +185,29 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-a2noc
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: bus
+            - const: bus_a
+            - const: aggre2_ufs_axi
+            - const: ufs_axi
+
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Bus A Clock
+            - description: Aggregate2 NoC UFS AXI Clock
+            - description: UFS AXI Clock
+
   - if:
       properties:
         compatible:
-- 
2.38.1

