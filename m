Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA22685C7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 02:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjBABA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 20:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBABA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 20:00:27 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FD145887;
        Tue, 31 Jan 2023 17:00:26 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id w3so6759424qts.7;
        Tue, 31 Jan 2023 17:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nl3hebvu97Sc6AotaN5mnlxEGHk3XxwLDIsUEhk49g=;
        b=N6S/hExvGYquI0/MVCRHFBSkbwlfLJlmpUEU8QaXlIDtzFl38WzoJA8flRJOrjv5SA
         UdOQOr7Q2owxFezoSZkxIKvzxb9A3PmXSbEG/dBgw0lirzCGL5qyzRTDTmyWTJVj1Aki
         Cpv+/vl/vvl8fiZh8M8BrAQ/vLLEsDSMm+FydtGYUAw1hOcNYbLF5fVY6K3gp2FMc2sm
         9Q+O1uOJuvGTtFQ8Xbff8hg5pOJR+oeWgueevUHCRy/7QrxSxQRAo0Xdc1hO4Gr6Nxdj
         PPkE+9mg6xF/1g3n5SeBfVEaDUVF6Jdq4mWsfbmqJDnyU9xuIpQvdntX4eXYOIDlaglt
         RgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nl3hebvu97Sc6AotaN5mnlxEGHk3XxwLDIsUEhk49g=;
        b=k5C6MT8teSlkMC1AbWxkOJiVKbRNra7hPZIJjKNnXEepukgGwnEpGsVIvHx/CP8BYe
         UZyxDWE9n0RZZ40X+5+ZuNpD8ZNiDoI/FcYHhBuzUg2g5ZBRXIQK1FBwv2ZFoWas5Guw
         99NK6KL3OUmTG5e2aBceU6atLKR0xSyM9zF/uzFsi8vgfRGNlWTiajUaMNbKlv9eEZAU
         ZLudAV9c1bx38TV6tU25UVuiOtgwPwXC6p9/onFY+rE2UevllStPt5BKkqqcJlQoy6J9
         F6lRRYAnjCEQxSxJaPZqoV2QE/OMiDNbqwS4GkJDN8f4m2tnsapMtD3OEX8/cxnK05tL
         OE1g==
X-Gm-Message-State: AO0yUKVSpQ7BSZmAqA4/pSF7FCiUboR2JQbsiXuPPOz96XQkVAO02NEl
        8JkA/WKsUh44nMbTRFHQ3nAn1ukYefRmYw==
X-Google-Smtp-Source: AK7set/DzE/yeC66brxtNuFrXrNNEBbDzI1TwdoSKjOYiAJ46TpBRb3RbDrfj/GVdNoaK0uIAi96mw==
X-Received: by 2002:ac8:7f08:0:b0:3b6:4731:1d0b with SMTP id f8-20020ac87f08000000b003b647311d0bmr179631qtk.16.1675213226286;
        Tue, 31 Jan 2023 17:00:26 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::2e4f])
        by smtp.gmail.com with ESMTPSA id g22-20020ac85816000000b003b9b41a32b7sm1616413qtg.81.2023.01.31.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 17:00:25 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: sdm670: add interconnects
Date:   Tue, 31 Jan 2023 20:00:19 -0500
Message-Id: <20230201010020.84586-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201010020.84586-1-mailingradian@gmail.com>
References: <20230201010020.84586-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interconnects for Snapdragon 670 can be controlled. Add their
corresponding nodes in the device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index ec9946e5f08d..02f14692dd9d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -788,6 +788,55 @@ i2c15: i2c@a9c000 {
 			};
 		};
 
+		mem_noc: interconnect@1380000 {
+			compatible = "qcom,sdm670-mem-noc";
+			reg = <0 0x01380000 0 0x27200>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		dc_noc: interconnect@14e0000 {
+			compatible = "qcom,sdm670-dc-noc";
+			reg = <0 0x014e0000 0 0x400>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sdm670-config-noc";
+			reg = <0 0x01500000 0 0x5080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1620000 {
+			compatible = "qcom,sdm670-system-noc";
+			reg = <0 0x01620000 0 0x18080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,sdm670-aggre1-noc";
+			reg = <0 0x016e0000 0 0x15080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sdm670-aggre2-noc";
+			reg = <0 0x01700000 0 0x1f300>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			compatible = "qcom,sdm670-mmss-noc";
+			reg = <0 0x01740000 0 0x1c100>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		tlmm: pinctrl@3400000 {
 			compatible = "qcom,sdm670-tlmm";
 			reg = <0 0x03400000 0 0xc00000>;
@@ -1083,6 +1132,13 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		gladiator_noc: interconnect@17900000 {
+			compatible = "qcom,sdm670-gladiator-noc";
+			reg = <0 0x17900000 0 0xd080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		apps_rsc: rsc@179c0000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
-- 
2.39.1

