Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD1B71FA01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 08:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbjFBGUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 02:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbjFBGUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 02:20:31 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013551A8
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 23:20:28 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so16437045e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685686827; x=1688278827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk7AcLH40bwRoPuu3w6H//B9z6ymjBrVk4u8ny9PuUQ=;
        b=tsqGz91YGyPP9bZzBDcRFITWNqjnBQl72UqM0QtfJTsxZyNE1LfGwu2ovQe8l48w2C
         FqeeWPhI9gSleVZoxp4YHhKED+VpmQgVx4WvDobtViLyXC+2KQfQ3Zhjpxz2h1tLCQ8q
         WEoC+0I4qOpAhKPWKDHKsFr5R7Gi7Oa9vnqD3vxbxO+OnxTrQdenloD4bOxMoXJFRC4K
         AWaKDCcX3UWWm9x0jFP5URtdY9lwFrHvw1t4i2ExApu1nGhKhcRbYSeO78VTBT/UrVsh
         shyCMC7b3cBqtZB/xRb8H58hKtGOJDUU8Orchnn/+p6zSk3+tOyM9PHgopzMp94C2xHg
         EM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685686827; x=1688278827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk7AcLH40bwRoPuu3w6H//B9z6ymjBrVk4u8ny9PuUQ=;
        b=Z19H3ATL+XIemiWnu+gpY4MFot07usOzmaKxQzhiW69L2xC5BRGTspM1/D7bicTTRG
         QP0NMverwF5aTtKFSHqGRD/m6PAZxOmOzNqZhd0GHW2RmrcKbdYZvggVD7xGWTYDBzpZ
         xTh5x7KLB79FUDxMH2xBouZo7qJyFdNVza60H2gxE8YxgrbD1kAtDYeysxeY3He7/aoo
         icoDiSixrfuCwhmHuotpi/rGlLflEUfFVne0SXttYm8HubRMSEHNgf846kITuba+y0QX
         Y7H0J0RChoY/Ihnbz363au9u6BSMYgVw9hyemlB64oNqktCuDm9EjJVglFIAQw+d8D4+
         NOOg==
X-Gm-Message-State: AC+VfDz6VKX+sQFIdC4C8pM5nqMj26OrEVAz8s/7CLUKu1Gh4OWJ+Mf5
        0MgAtL52tXyGFVpVXcc9wSpETA==
X-Google-Smtp-Source: ACHHUZ4bgaMGzZp9AUtRDJsdbjaUmGj2oHv8ALSu55VqdPyzQOHPtfJ5wC5QM1TOsVTiuSAqqCNgfA==
X-Received: by 2002:a5d:6408:0:b0:307:a77c:c16a with SMTP id z8-20020a5d6408000000b00307a77cc16amr3588468wru.29.1685686827600;
        Thu, 01 Jun 2023 23:20:27 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c229700b003f42894ebe2sm4388213wmf.23.2023.06.01.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:20:27 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8250: Add missing interconnect paths to USB HCs
Date:   Fri,  2 Jun 2023 09:20:14 +0300
Message-Id: <20230602062016.1883171-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602062016.1883171-1-abel.vesa@linaro.org>
References: <20230602062016.1883171-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB HCs nodes are missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v1:
 * None.

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c5787489b05c..08ea6396d364 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3750,6 +3750,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -3810,6 +3814,10 @@ usb_2: usb@a8f8800 {
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
2.34.1

