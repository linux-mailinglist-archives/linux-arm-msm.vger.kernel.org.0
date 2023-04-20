Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34D16E8AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 08:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbjDTGxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 02:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbjDTGxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 02:53:24 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F561FE5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:53:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ud9so4025267ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681973601; x=1684565601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkYoVsTX5Ps5onbyblLubXdqS8EVQ7cCRHTddAJTM1Y=;
        b=KJgfVg1SvEzp6uh3JsxZp+E/BlOgD9jso18fN2TJNSy0G3PCiHN2KvJWqRpLkRTDWW
         Collt1BcSpNWF4AufCK1oFK+GXf2zxB2ggcyCnOl/B/QIH0Y0vNb/546GtEsUrIxHcJQ
         vJftaFTzHE1T7sV+9F9N778bUy2HafBsEBpINndIDrniPigsFwSHW6Nz23EIkQuBMMyo
         W9fM8T9q9zVJtO1zQW1RQ6FHQALvPwt29URZZMoIXdTLbFxrjYtlA1Qx8QyFkRANENN/
         41He59VjeEmNkS1pfuExHn4r+wr/Gx6BEVJyMQTfuuEUifbKrXhyh2g/gyJrMjFB3X69
         GwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681973601; x=1684565601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkYoVsTX5Ps5onbyblLubXdqS8EVQ7cCRHTddAJTM1Y=;
        b=eiZS9VXsDlMW2+/pf0mCiLGvKLCTVsQgVL0VAPVI1R7hVPv0c4AGt7mdd5Ia+dmQO5
         IGuXZZmaK7Edv6fPvc8Ccz/K2DD65OVm24lI2Qw9YiAlQqH4YkhCJElB8wjPnYPMaQrO
         apzep/52y01/8S4Pj6AQt1MfZ7u7fV2fjWgIlZXdoulZHbu46m5Ng9TEUb75GtODLDBX
         vQ97WVGIbUQB8AIuQ7/kT80SBkVzNY5eTO7z774lpwiBX74ZzvPnRfgQgEFL2DHOXDJo
         fNb8vFC/STR9e4EH6/VicWx0rzo73y+qiT/4kBiD+rwH5ZibskvO5FR/dNXD7cpISAjA
         EigA==
X-Gm-Message-State: AAQBX9eZbUrYF9aMZWc3kz2bhNqNBHhN6OYzqDEAGnIq15ELHG5ipAmY
        a1W8GmXwqoUWsHOQ6qGDYtPkEw==
X-Google-Smtp-Source: AKy350YoSqdknMNhrLASYa+pxUVsyLX1e35tF5lG0ivYwQUhFLk5O83EFxV71y/GY8iIPtIKQGvBDg==
X-Received: by 2002:a17:906:65a:b0:94a:826c:df57 with SMTP id t26-20020a170906065a00b0094a826cdf57mr389167ejb.39.1681973600910;
        Wed, 19 Apr 2023 23:53:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id o15-20020aa7c7cf000000b005021d210899sm415332eds.23.2023.04.19.23.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:53:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: msm8974: drop unit addresses from USB phys
Date:   Thu, 20 Apr 2023 08:53:18 +0200
Message-Id: <20230420065318.23503-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The ulpi node does not allow children to have unit address:

  Warning (unit_address_vs_reg): /soc/usb@f9a55000/ulpi/phy@a: node has a unit name, but no reg or ranges property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Actual way of fixing it depends on bindings change, so apply only if
bindings got Acked/Reviewed:
https://lore.kernel.org/linux-devicetree/20230420065051.22994-1-krzysztof.kozlowski@linaro.org/T/#u
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 6310f635197f..939449a0c695 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -676,7 +676,7 @@ usb: usb@f9a55000 {
 			#reset-cells = <1>;
 
 			ulpi {
-				usb_hs1_phy: phy@a {
+				usb_hs1_phy: phy-0 {
 					compatible = "qcom,usb-hs-phy-msm8974",
 						     "qcom,usb-hs-phy";
 					#phy-cells = <0>;
@@ -687,7 +687,7 @@ usb_hs1_phy: phy@a {
 					status = "disabled";
 				};
 
-				usb_hs2_phy: phy@b {
+				usb_hs2_phy: phy-1 {
 					compatible = "qcom,usb-hs-phy-msm8974",
 						     "qcom,usb-hs-phy";
 					#phy-cells = <0>;
-- 
2.34.1

