Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D096974F2BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbjGKOwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbjGKOwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:52:00 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37064E75
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:59 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso90734501fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087117; x=1691679117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaFM0odHOwyVXlZ7BTzsvnZZXeV4qqjvcQiUQV7DUJQ=;
        b=S5xBfK6yK2/9LXpPSuY18Z7Z0vCW3sMNNOxGj03+AMML2ZrOm8DFWJQWrNCiuwmqpo
         0i+r4R2IsLpqaeUwD4Me+Ar742magH6VyiNZ6gZLvWhpdgpFz5s8dnqmmv308HSD/koC
         +mkCtmx4g8kCATtWGvKiahfaMJsGbhKFeBhNrNs1JrTtyeDczsJ/TCumnZdVsfKH5uEm
         c882G/PoxdlPglT6V9L9MXJVdFeAw6g3NCILnPA9wPbs+2E8tskg3X3jtHq2ZAkO/yjE
         Yl4NLbbO7oOq0DshQPwdMDJr6XnunFjwWazyuqe0DO6ZojD85c8qw4bHpALyolnqLcLt
         n7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087117; x=1691679117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaFM0odHOwyVXlZ7BTzsvnZZXeV4qqjvcQiUQV7DUJQ=;
        b=FXwOKPc8fARov6JAXeie79XZ/G331YIpBrRv7KKkSkw2zRAb3W0mGRRvS31mOyY+9k
         zNxFrLUCw3DEZPlzB3VCPyf7LGvjM0IvOKmviW58968a0MRuPHzeU6k95gZM12BB4V6Y
         glpzyiJ1OnNlX6lXuw3qhemNuY/im13GJyF24EG34ClDPLQ5Slnekg3ZYDwFFQLkX6CR
         F67lwgiVatiNaCdTHvy6LbMbEiIvbvvqO2wCX7WF1V0fPjA1N8H0gUIiaZtgTPn17EY9
         QQ6gXYNu2yovKm7Ksf0Br/ghOlYwife4JtQbuYkNGk5pbT6In2wZ2+/SPYPS7B/KtodU
         tuRQ==
X-Gm-Message-State: ABy/qLZEIWsU3lZxDN+Rmetubv+Ow5wfdR5yJG9ugjwqukgQ4dCEVPd4
        WPFTgD23bJ2R2uWNUR6JgwokJQ==
X-Google-Smtp-Source: APBJJlEIft5+HD6PwdrQ7zbOHbuisJ01W9TvVIPaV+UpZWMIzgZ9GHiwbpqbBe5e5+P7PaxyGHYIOA==
X-Received: by 2002:a05:651c:1034:b0:2b7:a64:6c3d with SMTP id w20-20020a05651c103400b002b70a646c3dmr11813767ljm.44.1689087117535;
        Tue, 11 Jul 2023 07:51:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:51:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 04/11] arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
Date:   Tue, 11 Jul 2023 17:51:46 +0300
Message-Id: <20230711145153.4167820-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
References: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 78867cb00875..31ea64abe4d1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -984,7 +984,7 @@ ufshc: ufshc@1da4000 {
 			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x01da4000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufsphy_lanes>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
@@ -1025,11 +1025,7 @@ ufshc: ufshc@1da4000 {
 
 		ufsphy: phy@1da7000 {
 			compatible = "qcom,msm8998-qmp-ufs-phy";
-			reg = <0x01da7000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			status = "disabled";
-			ranges;
+			reg = <0x01da7000 0x1000>;
 
 			clock-names =
 				"ref",
@@ -1041,14 +1037,8 @@ ufsphy: phy@1da7000 {
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
 
-			ufsphy_lanes: phy@1da7400 {
-				reg = <0x01da7400 0x128>,
-				      <0x01da7600 0x1fc>,
-				      <0x01da7c00 0x1dc>,
-				      <0x01da7800 0x128>,
-				      <0x01da7a00 0x1fc>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2

