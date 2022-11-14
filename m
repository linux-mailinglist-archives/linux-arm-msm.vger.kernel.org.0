Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA07627ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbiKNKmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236081AbiKNKmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:42:37 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821E21DDDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:36 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id u11so12550167ljk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDzwDb0dnKoTPgCy4RBfiMpDFetmXY9OEGk9SR/WSLY=;
        b=FhlApcqDxCtCoupJ/TIS0Ykf65afLK30ejNB8v2zhMO/08W/KJGjo+jBHJsNqt10pm
         1GEqKtYy830ohGlIM91yJZR6N3HiLjwX/ldBqlIKM5vXM3kFSN+2IIvvYOj+qJ87LRfI
         dzDH0BAB4MOhdYEyvZ3udJabwEej8WLG14Mgf1O8L/LxHKjVqaxAvZpwi12vdDcBIVpu
         SuIQrLXvLUodif/creo1nAh7wOM3vGtIU/3ALCYbvqgi8SSmbsONxt+v709lJdR5zYEw
         fxJFr0c9PqfemGYKmEEvkXXlRTEeFlBCxfFC6xv+x98BZlO64aBbZ6833hVafWVYTAYD
         0eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDzwDb0dnKoTPgCy4RBfiMpDFetmXY9OEGk9SR/WSLY=;
        b=lnA8m7uvftxaBIaVZdLtBfvPMcypQI9dv0QHgnZy6FqXzf8W6WvUXM9Pb9hDO6l/EI
         3vGmoGB0+wQ6iVHljQlK3oVmvw9iYtkmqKot3Y0nlr6fwsZPdhQelZr23ZlhyBI8Hro3
         TbQmULOsJWtkd5GD3Cad2anE5EFsw8Ttv6ITpfo++8fFj/zftbM3M55FACxRJg6bqavr
         y/1mOZeoqDD47dgCDJVhxgW7oOEw3vUB61uScjEV+04if9it/QiCeo6ciwy9k2L4pgQT
         qU4YIRumbQntHdpkDCjauxbgfkaAcpgkUVDXdhsmcZrFOteT1iCOuishSKygjawuWiye
         NBow==
X-Gm-Message-State: ANoB5plVsCtdwklsyjb44JRIuDWld38y1PZ6WKxcyhqOJLoVbHyLlh2Y
        WPp9Q0d9jLcSpVWvKodOu6AvuYKFoCs+R3Yu
X-Google-Smtp-Source: AA0mqf4qlxiMY3JDejy6a3SVEFC3TJHChXsZGfocnkqWhpRLRNPJLTzvyucW4mkNtj7j0c1yswAz8g==
X-Received: by 2002:a2e:960d:0:b0:277:4f:bd2a with SMTP id v13-20020a2e960d000000b00277004fbd2amr3622765ljh.341.1668422554455;
        Mon, 14 Nov 2022 02:42:34 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c4e922fb2sm1946486ljb.48.2022.11.14.02.42.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:42:34 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: arm-smmu: Allow up to 3 power-domains
Date:   Mon, 14 Nov 2022 11:42:14 +0100
Message-Id: <20221114104222.36329-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114104222.36329-1-konrad.dybcio@linaro.org>
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
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

Some SMMUs require that a vote is held on as much as 3 separate PDs
(hello Qualcomm). Allow it in bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes since v1:
- Add minItems

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 9066e6df1ba1..82bc696de662 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -159,7 +159,8 @@ properties:
           through the TCU's programming interface.
 
   power-domains:
-    maxItems: 1
+    minItems: 0
+    maxItems: 3
 
   nvidia,memory-controller:
     description: |
-- 
2.38.1

