Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD3F760F031
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbiJ0Gaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbiJ0Gab (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:30:31 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78302148F76
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:27 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so557558pjd.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3veF0RIHpX0CdQbsLknhlqADPUiDaLKaJ5CbIGVoTs=;
        b=CsBIoRyaa1kU6iBMEFjS7eCHWONqP6iN1FpzYEopNunqPoDvyOXSxP16LZdEjxuMTj
         NpARwVLwH6Ej3QLtKbveyUL5lK6aSHXWxCIouNJV9izmS/QKMHzpGLGZC3DpZtkBb7t0
         SoytUn2/CW77RR8CMCVy8BlTtW/xrEfqeXSbhoJPlEDi/uyWea2Iy7SJ0WupQ7U+oyCM
         iWTXGAW9rpVbYIHQPk0CyT374E5q8Zab3b0O9Pxsvn1U9CZpoAHUW4iXPTWcvBuJwSS6
         yiRWnifksAVLbToc3vItxSUHx+gbAwJqIxy+cYbHrm3H73NebR+QAr9ciUW7Kozvj+0p
         tFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3veF0RIHpX0CdQbsLknhlqADPUiDaLKaJ5CbIGVoTs=;
        b=WYZiALLBbZ/A07Zc44iFIY1CsydJ/gjD/RIzER7y9UkqtjQWZzVsuIyJF1bMUkqWnn
         hrzQEbo48JQ4OJ5YetBviN4p5axmohEKzUohraU3SvUV+dtT+a7Pz6nzhZNCsrX9aKTZ
         jpIK81DWJZkfRRrGJbrpglT70fYQ3SMfkdgLrKynJQRz1JPFwqnDs69etuSVChpzZoM1
         SvNphbDbpfLP99Cr4dzjaqUoE8O1zHHH5HxT4Oiz85U/hjos2oG0/aWnE7rm1U1Xj6xP
         0JMU6ikPtDTAD/dHrgkvDiwYEi7jIcciJOc7MBUWBYuQMG7BMdxhx5951LnAMYzMpbX7
         YKkw==
X-Gm-Message-State: ACrzQf1mqICc5b4y7Dtx8A+pJTXg6/pwcbnbEfvSBJ79ZqXWJ6fMxvUI
        au4HOA6GXBVRgU8jft/keTRC
X-Google-Smtp-Source: AMsMyM5BSUuR5Rzg77E8Ngf6ndyBIcTYv9rzutWs+pQlgZXKlthM8QZI1RCuUWSgSmmQXdGigK8h+Q==
X-Received: by 2002:a17:90b:4d0d:b0:1fb:a86d:e752 with SMTP id mw13-20020a17090b4d0d00b001fba86de752mr8458855pjb.120.1666852226569;
        Wed, 26 Oct 2022 23:30:26 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:30:25 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/11] arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2} PMICs
Date:   Thu, 27 Oct 2022 11:59:57 +0530
Message-Id: <20221027063006.9056-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

Add support for temperature alarm feature in the PM8280_{1/2} PMICs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 24836b6b9bbc..5de47b1434a4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -33,6 +33,13 @@ pmc8280_1: pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8280_1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280_1_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -78,6 +85,13 @@ pmc8280_2: pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8280_2_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280_2_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
-- 
2.25.1

