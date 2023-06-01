Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B5B7199F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 12:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjFAKie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 06:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbjFAKid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 06:38:33 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2686EFC
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 03:38:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so730545e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685615908; x=1688207908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpSv9l53PjEtQRLkIxBG42do2AGdWpb+x9tdN2ngo3s=;
        b=oN63DFjS5mHVv8CfmEvxgkpA7dlK6AO6hOTpdYY2WmCn222R87NCqrKxUHgyXn/7P7
         6v6Wl6gVsyJobkQ23tskYdi4Zv9QFRkXf4Je8MbeZiKam+jOm/GiU+N2b3+RXz4eXSRa
         ir53JsTo/vt4rc6dIG2Z5Ra7u8k99tGbbcjs2+yRC+wmTaT1IDYoncn8pdGobp8NWsNe
         cZ7DjD/XU4ygOJQ/3uUANcuyiVORz90NwxuyucE+UyY7G31l9qQgoznWNim79esQTIfL
         R5tI2oaw8nh/l/tEjZDLVSGFYs3fyvST0pHw7P9T6bQgAAQQRx6/EaK/L28jMpLRtylg
         51xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685615908; x=1688207908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpSv9l53PjEtQRLkIxBG42do2AGdWpb+x9tdN2ngo3s=;
        b=IDQYb2X0WbwAx8CAed0akiykspIi9ND7rbsw2gBCh3thN9p6sKXBAdONu7RFPFwZez
         2XzjX0KWd1q8sn01d1UzP07dy3dBry6xME1drsPWz6u+GMLU+JVsnC/6aFIvXnXdM9nH
         nvAMEI0zTzWer7ebVOk7eB80qW5jTvmiNaaNlF3thtwS7+YAdE16bwNjRVWeYt3+wtw9
         nQpk/cfVcBSFtGirm4pU6+Yc4QHC3Uny9XplykcKaKVHg3Vd+IYOOf8BmOxJSbonO7tO
         scWoq058GJaCv3kgrW2XlghGDZil1td0qMZo43r0eDJ4EVFqHSihp4+IWyFktvTXWrTe
         90pQ==
X-Gm-Message-State: AC+VfDwUCYG2lYDJPC/v9IjhOQCm66orqf/Y989SMHwTK2rCrJbzl3UJ
        NPjwIZP778qaTkUsLX3AleQzzg==
X-Google-Smtp-Source: ACHHUZ7u9iDSVLdDPn8Xv1CJ8KQ7K+84gZV3FB2KPckKFiYe6WYkBW3C1F+CR4cVvUH3epTrrzuNrg==
X-Received: by 2002:ac2:54a9:0:b0:4f4:b3a6:4135 with SMTP id w9-20020ac254a9000000b004f4b3a64135mr961086lfk.55.1685615908394;
        Thu, 01 Jun 2023 03:38:28 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id h11-20020a1ccc0b000000b003f423dfc686sm1855975wmb.45.2023.06.01.03.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 03:38:27 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sm8550: Add missing interconnect path to USB HC
Date:   Thu,  1 Jun 2023 13:38:17 +0300
Message-Id: <20230601103817.4066446-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The USB HC node is missing the interconnect paths, so add them.

Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 75cd374943eb..4991b2e962d1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2793,6 +2793,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			status = "disabled";
 
 			usb_1_dwc3: usb@a600000 {
-- 
2.34.1

