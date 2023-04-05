Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863936D742C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 08:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237031AbjDEGJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 02:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237037AbjDEGJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 02:09:16 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D86746B7
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 23:09:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i5so138583187eda.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 23:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680674950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKOHZ4MQMBlECxVqPXJNUiZJCuFcQs1gN16XzuqrzEY=;
        b=yNEfCEn0/n/8B7NkqBFQygLxdzqnz/fbMOTtrwt4TH/R23jQlDVm9oDnhwh9Zbho3z
         P2phrnLIDJHfkK0/P6T4cPWQaJE0vRRzKA5oMuCyeLniTllCBnxq+TFNM8AQFBhKssfo
         REwGZCKyk9joh56zuFHieqQbtqb4mR7DcpYbgC+mMBgvif5592JW6Qom9ez0NYd1hC53
         AXwKbLHrkNHSjtPx+Y0wcIxSEOa+YrtFQFLxLrFZspBIHGUdQAUWmDrBHa1Wr72hQ1Jj
         EKiG10siewoBgmBJT052eOfZVPFUgSxYtlNGH7LmFvd/BE+FxgnCSEmXxmYywgD6C8eJ
         hW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680674950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKOHZ4MQMBlECxVqPXJNUiZJCuFcQs1gN16XzuqrzEY=;
        b=d6qXunUqWRi0nqnyV93wKsd65bPh1gPDSwAGeuDasOSMGsW+6BKNxLEVBMFQmgFIlL
         hmaA1PXObvLIdCZVPgNOqu52IMKrSJUc3DGOoCt8HXgkguuG/sSz/216osdSn5wY/mks
         7lsMMKyPjOAOXvVFvBRTEiMQ6+zdA3JoG+rOCGu3k6OC5wiSOxA0HCJlzJ4v+xxAzFLi
         IE/XBSTUylilIDQ8/EWKhQF3mte3qt8sjLJDY3Nm7hJ8jYE8I+9O6nwVBZtQzACrRf0+
         ja/H452R3T3iR24v7ThtME1xmZLfg7esrXCVQDftHv8oYi81O62L3cwBX8eIg6F2Ozzl
         jkCA==
X-Gm-Message-State: AAQBX9dHwJEdY+C+RBduOFLm3f9yEYTk16FRAmk8sSN2Xpupm8nCadGj
        R9oUAD1UnAjEVEgE/nGDjgumyA==
X-Google-Smtp-Source: AKy350ZimhW6RQ6HhnrHDs2rDfxf+6UVUWygtJG0UZXftN8/0bZ4Wl8yqS5wDIXQeAbaI9Km3l5RgA==
X-Received: by 2002:a17:906:bc46:b0:884:9217:4536 with SMTP id s6-20020a170906bc4600b0088492174536mr1680572ejv.64.1680674950011;
        Tue, 04 Apr 2023 23:09:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709064e0c00b00882f9130eafsm6784643eju.26.2023.04.04.23.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:09:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: qcom: sc8280xp: label the Soundwire nodes
Date:   Wed,  5 Apr 2023 08:09:02 +0200
Message-Id: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use labels, instead of comments, for Soundwire controllers.  Naming them
is useful, because they are specialized and have also naming in
datasheet/programming guide.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cd38320dafda..c195a57fd180 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2497,7 +2497,6 @@ rxmacro: rxmacro@3200000 {
 			status = "disabled";
 		};
 
-		/* RX */
 		swr1: soundwire-controller@3210000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03210000 0 0x2000>;
@@ -2572,13 +2571,13 @@ wsamacro: codec@3240000 {
 			status = "disabled";
 		};
 
-		/* WSA */
 		swr0: soundwire-controller@3250000 {
 			reg = <0 0x03250000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.6.0";
 			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&wsamacro>;
 			clock-names = "iface";
+			label = "WSA";
 
 			qcom,din-ports = <2>;
 			qcom,dout-ports = <6>;
@@ -2600,7 +2599,6 @@ swr0: soundwire-controller@3250000 {
 			status = "disabled";
 		};
 
-		/* TX */
 		swr2: soundwire-controller@3330000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03330000 0 0x2000>;
-- 
2.34.1

