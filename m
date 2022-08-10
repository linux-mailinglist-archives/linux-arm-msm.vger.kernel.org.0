Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5921058E85C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 10:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiHJIF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 04:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiHJIF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 04:05:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8618527B29
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 01:05:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x9so11611609ljj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=b288XWNSqBMApoeh+XjyRkXNonxHbmNcMipW3aFN8V0=;
        b=z50SFZcygtyBvQCgqQgd3LYcRf50PshwjIXeeJIdfx/5vjhdUvzLLbHdZ2pE1YNu7T
         BRObKtVX18NmOjhCXalI7i1PwUV8ajDNc8U88xQHqZj0WguMLye56DW1IqQE/UqkxTgU
         xayVaMAdNwVNBGewiKHpSm84Fo5+R7D1XTPL8er/mHMuU68iNGSZ6dbr+kaG84KXAVxz
         HuYUnu5QlhXNWeD7/0LZ3WKZR2z075PhNpfAHmgQWvj8wxgwQDmHFkLCaQJ0wc6CBRl4
         s0wii3TXQFKx0NkI5+O1Ji01swsreUV5aaRhObt/l2MN0yhwN70IXA1j1X9gqSlhsY/3
         MkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=b288XWNSqBMApoeh+XjyRkXNonxHbmNcMipW3aFN8V0=;
        b=Mic+E/0vQYt04WJONjxH7ywl323LIVma+NTdxPWS+w01zKpM+Y9k2zSSWl4QfZ9ZzO
         HrreTliPU8jIQRudXHVjogZXDk2g2mGImlkFa43KC6pnQAjv8PT321hBevcuLfagGHXQ
         UCT6urD8Ud85O0fLgTOUiCcKmx3vuLzUi3dYZrXbTiJAxS5dO7FiQP6PUJtLs79RmaYN
         voTHeC46Foof+ffaN12UY1oWiE2E18N+P3cdCu794sU5XSToMfFYy3NwKMpEoIIw8Wej
         dFBPTTW6n7fHgDW3GPD34dZB11ZqphoQLBgcktRbeB5aZ6qo4+hxWeeWS5N2FdM0SHlf
         TSig==
X-Gm-Message-State: ACgBeo2lfHdb4tQO8KcqEqlyi9EJpX8bFI/wzNdPXjlXiAoOlkCqpYWw
        FWWqYlyQbmRDCa3NMro0DP1tDg==
X-Google-Smtp-Source: AA6agR4pYmCEarPFE/nntgiaSJnKpL5k1y2SHONUiqSR4mVkriKF+WzK37ov/Fn+C9KVMndmIPmQfQ==
X-Received: by 2002:a05:651c:886:b0:25e:3440:9518 with SMTP id d6-20020a05651c088600b0025e34409518mr8855935ljq.248.1660118722926;
        Wed, 10 Aug 2022 01:05:22 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id h12-20020a2ea48c000000b0025e040510e7sm309571lji.74.2022.08.10.01.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:05:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ARM: dts: qcom: msm8660-surf: move fixed regulator out of soc
Date:   Wed, 10 Aug 2022 11:05:16 +0300
Message-Id: <20220810080516.166866-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810080516.166866-1-krzysztof.kozlowski@linaro.org>
References: <20220810080516.166866-1-krzysztof.kozlowski@linaro.org>
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

Fixed regulators, like stub for SDCC Power, are not part of SoC, so they
should be outside of the soc node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660-surf.dts | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom-msm8660-surf.dts
index 63b8f4285ace..be18f1be29a1 100644
--- a/arch/arm/boot/dts/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom-msm8660-surf.dts
@@ -15,15 +15,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	soc {
-		/* Temporary fixed regulator */
-		vsdcc_fixed: vsdcc-regulator {
-			compatible = "regulator-fixed";
-			regulator-name = "SDCC Power";
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-always-on;
-		};
+	/* Temporary fixed regulator */
+	vsdcc_fixed: vsdcc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCC Power";
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-always-on;
 	};
 };
 
-- 
2.34.1

