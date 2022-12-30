Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287DD659671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 09:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbiL3IuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 03:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiL3IuR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 03:50:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0ACC764
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 00:50:16 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so9328311wmk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 00:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GN2FSEX7eS4zfNg7tbkbHXZHA7GmeTgA/fVSW3xN/JY=;
        b=hVm2wH14FZTtEwXm/Y6uEwnchiXQVfFIyb4+gn2gPUnXsnuk2ntRajXqkWTr38OFOf
         pdxZHzWZDFLL5hYdHkgNYun4k+6to9KqUCmA+nwkZTyfgIph/rYHk16jAxfsAXNvlXK1
         2znQxZ+uqXlC4CDjepUnB6fz4EPYqaNyOd/6at+YTh6k6VJA2HMV4i+B95mLDcNjLehM
         VR3fV3H/jUO+/Jst5krZ9Rxrrx1sH1baoU4ayufSAzWm82KO8NbjiyZIXyjyoqCfKb4l
         Myh2nPZVWRu33iKH3vdr1ZttJnp1iRilCKoZCivap6YQ/dUQhZCG759S0zotI1TKOH2M
         vkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN2FSEX7eS4zfNg7tbkbHXZHA7GmeTgA/fVSW3xN/JY=;
        b=z0Upib/1TQUVIvVnG6nWyZtlr8ckXc+hSwCYgX0wi0eWNoyUBDvvjOP4vtK/uovAe5
         RJ5wz65te0+9jy1pP+26KjS5dTbXXLfYyfRo4HCnUQCeOWu9Lqr712FZ8wmkVmMHhYBQ
         /a0YTWQ1Sl9ZE718/9McWe1JDhmVqlGmOW/3V3fzmjXct7FG+91eBYzNrfCv0vy3zabH
         IbsHHW+mtcCjTJbBvf56B++FbT4kjxZolrb7xkV6g6IUZwWCK2JwJNGacMCdQslYiHDe
         GbR5j6NQg/emZO1ToquqLdMgD+bvRaynOEzyK7EiOVVYh6SW52t0VWev9IE4gzcZo6sO
         cYZQ==
X-Gm-Message-State: AFqh2kowTo+xiuzTRM2NmfX8VJc2SmV8lIjng+UTVibOAMFUs3fpBRKk
        1UyXq+4gxnqZDIJHyeXgBf/QqQ==
X-Google-Smtp-Source: AMrXdXtAtbpgehbhllb2eqL7qgGHLL/g07hl5Ik1iLQ1FgXlbDGO9JoRcYhltp/gUmTLAr3ziPqKww==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id be12-20020a05600c1e8c00b003d62952679bmr21963079wmb.34.1672390214913;
        Fri, 30 Dec 2022 00:50:14 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b003cfa81e2eb4sm27599612wmb.38.2022.12.30.00.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 00:50:14 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sc8280xp-x13s: Add RTC support
Date:   Fri, 30 Dec 2022 10:50:10 +0200
Message-Id: <20221230085010.717423-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMK8350 PMIC has an available RTC block. Describe it in
sc8280xp-pmics dtsi and enable it in Lenovo Thinkpad X13s specific dts.
Mark it as wakeup-source to allow waking the system from sleep.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi              | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 568c6be1ceaa..4f6daa3f8cb9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -419,6 +419,10 @@ &pmk8280_pon_resin {
 	status = "okay";
 };
 
+&pmk8280_rtc {
+	status = "okay";
+};
+
 &pmk8280_vadc {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index f2c0b71b5d8e..00b13f9a7af8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -95,6 +95,14 @@ pmk8280_adc_tm: adc-tm@3400 {
 			#thermal-sensor-cells = <1>;
 			status = "disabled";
 		};
+
+		pmk8280_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
 	};
 
 	pmc8280_1: pmic@1 {
-- 
2.34.1

