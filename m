Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF34702E5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242391AbjEONhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242011AbjEONhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:37:04 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9501FDB
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:59 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f420618d5bso62874825e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157818; x=1686749818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxfuaO1huHKQXCMzo1kIjQt/GPBP6/klFwtWCLW8SEc=;
        b=MTD7QY5BXtqdHafZQzpFSQ8HhNmH9JGr/TaH1E/691Dh1tgBbwTTL3ADatt+98jq5y
         l1uY8IkQEvyJ0vrRENEse3bm3LynqtvjoUY0749ktP2z2tA7fVqQzybCW1so5fcDbxfb
         gNg/5+nTjfb/XOPROTBVoSqN5uCuShj4n4VGwJ3pEGB/iBR4r2V4melxIdgzxSfLtiiW
         3I7aU3htP7NQCVqKToSKO+rWm5kK9awBcTS3vLX5kmNiv06UuelFuHD7ZiCBEARxBeC5
         wlCD/6rQhxUTf0zG257NbsRDUorjdcCfhCjvMbU83iplBfD80AAISpEGaOaLTHBpGR4z
         QLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157818; x=1686749818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxfuaO1huHKQXCMzo1kIjQt/GPBP6/klFwtWCLW8SEc=;
        b=f6HVXCIlfEAuY5dw1W3SKpDELWuy9FSXP8eQYlVvcaugAqV0/V4hzK696/ML3+Bzu+
         YV/vF2KKofs9JSL8PQMzzhAG67JGTWelUfmohqt7ZQHC06TrIY2DAmP1ghpxXNw4dkPH
         efyOZP1NHDp/ulyBawU9RIaRa+BXKq1y565FxNpLzce7gnRgQSXmB59ZXeQaz1GWb9Po
         FFUUEpTbbjZc5IJdJ0LaF2c0kP0SCDOHAKTJMUallc6IT1TV9FAbdnb449LQ10ymJPVX
         iovhbVMzuX5vEaBUrCkFBRBI3ARGQUocx10qFdsmvnGFm7c+Bn532iupiZCsExxS/00f
         qt0A==
X-Gm-Message-State: AC+VfDxPRouvKcle5qJAIVWSlWL0gmyUn05kmxnUl4ewZlWWKn33pMNg
        IPUoi1Pr8KutUbZzIO1pEhdg7g==
X-Google-Smtp-Source: ACHHUZ6dQ62N4rb6QjZWzK9ObMS6DlOjeGndmXHT4R51yNPY8lJA2vD6CH3syFqHE0J0CjXw+8suiw==
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id k8-20020a056000004800b003077c2ddc79mr23247671wrx.16.1684157818252;
        Mon, 15 May 2023 06:36:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v8 10/11] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
Date:   Mon, 15 May 2023 14:36:42 +0100
Message-Id: <20230515133643.3621656-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

Switch on usb-role-switching for usb_1 via TCPM. We need to declare
usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
which provides the necessary signal.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 ++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d80a22bff7969..580ed63c6fb54 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1273,7 +1273,12 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_role_switch_in {
+	remote-endpoint = <&pm8150b_role_switch_out>;
 };
 
 &usb_1_hsphy {
@@ -1362,5 +1367,17 @@ connector {
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
 					 PDO_FIXED_DATA_SWAP)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm8150b_role_switch_out: endpoint {
+					remote-endpoint = <&usb_1_dwc3_role_switch_in>;
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0bc7486e59e54..b9f55a9ef89f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3740,6 +3740,10 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				port {
+					usb_1_dwc3_role_switch_in: endpoint {};
+				};
 			};
 		};
 
-- 
2.39.2

