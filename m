Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C140070DEC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbjEWOJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237158AbjEWOJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:15 -0400
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B211712
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:31 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2af2db78b38so42881331fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850790; x=1687442790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbhUdnSFaWMvybH+cNQBC0oxk1+YlDY8cdWgqgMPCAU=;
        b=wvK3DxHcXZII1gHRR1sjKY8Nwqg4X5VZIDbYMQvKjTxsOIQ6pU0kYN2Te/UkzQN3tz
         QpfuwfnuGHZhqL2HG1SXRBzO4bYmEy0QW9m48JJlfng+AUkLJgVOJ/JL0/WSiMnhz3v7
         eYUl4Utk7mxlAvKgvUWCJrxMR9f3g3ow9tbSbFPJNOcx2hQLW71ch0PQ3+pj5iF92zcB
         eESncaNx9SRBI+mBNDC6XQnCyhf1x2wmSbjIOimKGl97/x6FOfieACcDxKUyOk6VzZyB
         1SnIMIn/UQhHs4MF7qEcJsuI96Mp9lS7A4IPzB9SNaS+1bayqufTqZiqK+j+e1tjB6rl
         5UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850790; x=1687442790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbhUdnSFaWMvybH+cNQBC0oxk1+YlDY8cdWgqgMPCAU=;
        b=hFtTuYK61uVcbH1l0Hk1MM86eLyNfYERJNdrpwlrbAWZJA76XYztOpsEyJGWO+FoOc
         TSFgizdbW9gjU/uiSeUNNckoKHgZIhIllCS6MQ1gBUS2sNK5J4VfvenCy06+8jc8O2yu
         cV09UQnkNco0ufNI9CoakfvzHAY8YA26/dAaIP5CCVeQytxjgvCTLLdI1fKy6Y3MoX0F
         5TDIYfMAzMyfqL41wvaIMYQY7QBLpGLTVVtf1mp+GwzmZhu5d55sXtGyqwWuEZiA4RUh
         zKVtuQjkKKdRmWjfiT02Y8nB3RgOF9Nto3esf5Adk6Vc8xnOSP/VQrP5pcYhvcdgcgDH
         GgOA==
X-Gm-Message-State: AC+VfDxFq1wkrOoYUW8CdwHTWDFbOXNG6Le2IdqKyEF48u7LN1kELyYF
        jxNCz5Si9lLASOAYay6tA57HDg==
X-Google-Smtp-Source: ACHHUZ4t9zbq1AowdI1VJlQJfVLmnxGhvv6Kg9WaqN5wCiP7a/BG0wMq04FbbIdNtMMPfT+jku8Svg==
X-Received: by 2002:a2e:a318:0:b0:2a8:a6a9:4303 with SMTP id l24-20020a2ea318000000b002a8a6a94303mr5053654lje.8.1684850789906;
        Tue, 23 May 2023 07:06:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 08/11] arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:19 +0300
Message-Id: <20230523140622.265692-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2273fa571988..628f3cead829 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2018,7 +2018,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2063,10 +2063,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2076,16 +2074,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2

