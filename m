Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E999E70DEB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237100AbjEWOJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237122AbjEWOJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:12 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4A01702
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:27 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2af29e51722so50213191fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850786; x=1687442786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpWnc1zBcRxuJ08XPjlOy+/0E7QF+n2iCuXt7UnGnk0=;
        b=LJ7X/fjQgggMHQ54N+o8Dg6swYXxPBpx9IS1a1h8jNiREeMNqJZHwhDcLpmWShBzKW
         b1f0NHgS7hl7J388UTT9xr4/GceX1WDd4t3Bl5WuMksjoeDfi4xH7L9wKz16iiAPZ94+
         fUuauTjhCQJM/5DNJxKN+xvjvVo8q0H/54z8PwGJmr1VhLEcrb7jDJMpm0mpGRWYaZ6r
         6eVoJ9TMCI9y5SONdUjnHFrF8ToidLWZ84bMuvgVZF155N6GRxG9N9phx8Qd2/P51+Np
         ZdQbJpdLzcVeEwh7Vpvsc9KXt4Cze09hehQATDv4kt/WuVHTaYCVyvxnZTN3ZkmTHuHP
         Y6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850786; x=1687442786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpWnc1zBcRxuJ08XPjlOy+/0E7QF+n2iCuXt7UnGnk0=;
        b=F4q36hDSpIOp6DMAG8g5GDZhKSGTKY/AAOx9Qxoz/h/M8Z589SLnR4JJub/bb4t6Ua
         2TrXDOiN++dfpMDaUfkwb+cwmgEBcJmBhTN/jv0PmoydT12JaVbraefUKwUxCj0F9QaX
         zgNoxF6OMb8rTkQv+87GdDTLZt4BtceDhKmECKD2HeqgPQwBmD1bwzekvh5wDDZPcFAw
         4xwAcdEcm3XxvYIjXQMJeeYsPyGXcr6z7759Hej+NsS9ba+zysjjZ658y5fQIALk1+Y4
         nQagsZxzc3SbeGgU+unGxT8IE0Wngd4ZqFR+mPbaM7jOS8nQ4qsmXd6kLjJTLlHr0Zsx
         qb+Q==
X-Gm-Message-State: AC+VfDw44ZTytbNYgufkZQrRWirUI1JNmTJH+nN6UgmxgnLYnvc6p2Gh
        D1sUpe6X3JGAiw4X2pJdlsp8rA==
X-Google-Smtp-Source: ACHHUZ4LV/KGts4l2QvOhv+3rEbyYEgXjKiJuXJjmbKGAhx266yOWGurqRP65cQ+JkTumr/r8P9CKw==
X-Received: by 2002:a2e:b209:0:b0:2a7:96bd:9eb3 with SMTP id l9-20020a2eb209000000b002a796bd9eb3mr4853150ljm.3.1684850785959;
        Tue, 23 May 2023 07:06:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:25 -0700 (PDT)
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
Subject: [PATCH v3 03/11] arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:14 +0300
Message-Id: <20230523140622.265692-4-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2b35cb3f5292..2b65c608a57e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -726,9 +726,9 @@ gcc: clock-controller@300000 {
 				 <&pciephy_1>,
 				 <&pciephy_2>,
 				 <&ssusb_phy_0>,
-				 <&ufsphy_lane 0>,
-				 <&ufsphy_lane 1>,
-				 <&ufsphy_lane 2>;
+				 <&ufsphy 0>,
+				 <&ufsphy 1>,
+				 <&ufsphy 2>;
 			clock-names = "cxo",
 				      "cxo2",
 				      "sleep_clk",
@@ -1993,7 +1993,7 @@ ufshc: ufshc@624000 {
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-			phys = <&ufsphy_lane>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 
 			power-domains = <&gcc UFS_GDSC>;
@@ -2046,25 +2046,18 @@ ufshc: ufshc@624000 {
 
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
2.39.2

