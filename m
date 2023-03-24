Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549236C75AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjCXCZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjCXCZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7116511666
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so377102lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atFClGwQ0XMp49bKEj5oSBG6BjGyOFJoG72Sz+GxX2Q=;
        b=ULoQ5y1deT05+5mDkCkFf15Yc4+HSHPctYiBVpmAy0X/RNXR+hpJzyCYRs3kXxQXJ9
         xqkjeMIJ6QL4rQA4yh6R2pbs/ZVf6BxAjKYN/86Dtlj9rzJ/o8M6exZMAEmEHLqb4M9l
         rwNaDjj6Cfw6Js8lvGHG2mhYU4v51NPfS7zm/05jHbv4EEZmRL2yxqXU/jahx6kO0Qrr
         MZuyjxx964hpv0FysOL6zt85jM6cvTv1PCSVAXSvZH0Gy9q+dpFAjNnvMJmXZy3zDROD
         DLfN0fym36nV8oaLNV4SvjqOr9vJgnx8Wy3lzIx8YnZB25ypO+GUiE8b2sJZBgku1ChL
         SlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atFClGwQ0XMp49bKEj5oSBG6BjGyOFJoG72Sz+GxX2Q=;
        b=jzaKMv+yoyb1t2JJkHR34UP/u0CNHUjWQhdQf4J/wXnJa+xc3XSx5snxiOD7wx7Qkn
         DNoquE5dA0SYCVFQa5YS82POSMUxENz/LLe//v96fhPabGLgAHOicKmHtY6IAa3u4Egu
         A4QkzU/QyMVDTgvcw9t5MfMofDmGdVb1Fgahp2cs9CGbE7vSXRka1vZWGrn99a+H2Oyb
         DULtkJsNTP5UNepEUIizpiPaLBtADjs835RyeTJUlXd8AGUTzdtbBIIUusOqXm21H94X
         G7LtWa8+AmBZzqLXIDA2RRPiCGBr60f6qO8bySG+pxhgax11yBs7giIYvHD3N+73x5My
         l4pQ==
X-Gm-Message-State: AAQBX9dVAZ45nF8xPtq4nfOH091fydJIiWZ/mkESaHpiB0ILULnCZXYu
        I61PDECmkDphoMeTP3T9crMHVQ==
X-Google-Smtp-Source: AKy350Z90yTuRq47AwPYRJrJq8LPZkPCzfE2WFPiN9bhDNO3OAeLAO3KDP0ZVsGCPXfzJUkuaE809A==
X-Received: by 2002:ac2:4ac2:0:b0:4ea:f5dd:8aa1 with SMTP id m2-20020ac24ac2000000b004eaf5dd8aa1mr233684lfp.18.1679624739815;
        Thu, 23 Mar 2023 19:25:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 22/41] arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:55 +0300
Message-Id: <20230324022514.1800382-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
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

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a811095fe93a..11e8d5287e6f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -726,9 +726,9 @@ gcc: clock-controller@300000 {
 				 <&pciephy_1>,
 				 <&pciephy_2>,
 				 <&usb3phy>,
-				 <&ufsphy_lane 0>,
-				 <&ufsphy_lane 1>,
-				 <&ufsphy_lane 2>;
+				 <&ufsphy 0>,
+				 <&ufsphy 1>,
+				 <&ufsphy 2>;
 			clock-names = "cxo",
 				      "cxo2",
 				      "sleep_clk",
@@ -1994,7 +1994,7 @@ ufshc: ufshc@624000 {
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-			phys = <&ufsphy_lane>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 
 			power-domains = <&gcc UFS_GDSC>;
@@ -2047,25 +2047,18 @@ ufshc: ufshc@624000 {
 
 		ufsphy: phy@627000 {
 			compatible = "qcom,msm8996-qmp-ufs-phy";
-			reg = <0x00627000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00627000 0x1000>;
 
 			clocks = <&gcc GCC_UFS_CLKREF_CLK>;
 			clock-names = "ref";
 
 			resets = <&ufshc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufsphy_lane: phy@627400 {
-				reg = <0x627400 0x12c>,
-				      <0x627600 0x200>,
-				      <0x627c00 0x1b4>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		camss: camss@a00000 {
-- 
2.30.2

