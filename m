Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBFBB702E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242071AbjEONhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241672AbjEONhC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:37:02 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628511FD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:58 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3090408e09bso1989665f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157817; x=1686749817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USITxvLm1tGcaHImZMsGsNG5AjtA8MZCeVdVYmxvE4U=;
        b=WROTeU8Xa5lXQPjD+CBjizc0bCNC+EYTMOCRWH0fNhLz/pIc7Al3AI0C9R7ri/h+b0
         Og/wtByaxJHBC3xBLjH3a/GbnH4E/WRNLSejWeuh1HEqe0/qQzr/n0O1oNwvPg4L6lEn
         4YEG1m/mLq4Z7hvlf9pZfGRHC7Kc9eWL4eVBcv2DWh18eEcmoGbRrueWOzKNims+ptAV
         FM3lxZOYB5B/DtWdwb1BOTvsxcsHz0/vqXUspxD95jfSF8YtnfsurG+aDEzqA9mZ9Frg
         yKabh+tdJiLcxe5lvnmoV79VVRVHRpvt+j7UNy1QT3L4yrZPp8IxZ3Tsu8fYbzKTMHd4
         yY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157817; x=1686749817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USITxvLm1tGcaHImZMsGsNG5AjtA8MZCeVdVYmxvE4U=;
        b=FJe14wwVS4zd80xrIEu5KZV44A+151U0t+eEOu8NeIyUDSVt5BRmkD/jyGMFW7ijZI
         WNQM0cdXZ1hH9kvNLqF+/BMLzOLmQ6XXr8ujvqU1bnRG+Fn5nFq3Zk4S0HmMWV0tdglR
         5FDSaybYqF7rfM6K3gyPKpkQck0xqaw93ttTkz4/8Cp8ieli2pOmJc1OQn+sSGrGW5bV
         jMw2Inp/oo9lgGBTGNRhZb5HFYX3+NpMbE+HEOCnBhVPG2dqi9oXn6v6bSrARNnThCyp
         1KqF4gP/5wGk/4kJHsocSgHGi9Is23J4Kz1GV7vb69wLRSRi3c7ScpI0DQ638++G52ib
         DpXg==
X-Gm-Message-State: AC+VfDyj0CY09id1bNAEN/gmlfPF4DpDxEUCTH2oyvIxn9SJUTic/l/u
        UA5MnuNGY9+5Z5IfiHLzfYJxMA==
X-Google-Smtp-Source: ACHHUZ7j66atIuz7y2XFA9yFf3j6UHlYN9jpXXs6+CGQINjTXsENRbzXk4RZKFVIqU3nYmbP8YIUTQ==
X-Received: by 2002:adf:f245:0:b0:306:2d28:d556 with SMTP id b5-20020adff245000000b003062d28d556mr20831036wrp.34.1684157816952;
        Mon, 15 May 2023 06:36:56 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:56 -0700 (PDT)
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
Subject: [PATCH v8 09/11] arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
Date:   Mon, 15 May 2023 14:36:41 +0100
Message-Id: <20230515133643.3621656-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

Switch on TCPM for the RB5. Here we declare as a source only not a sink
since qrb5165 doesn't support powering exclusively from the type-c port.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index b326bdeeb7742..d80a22bff7969 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -1344,3 +1345,22 @@ &pm8150b_vbus {
 	regulator-max-microamp = <3000000>;
 	status = "okay";
 };
+
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 3000,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+	};
+};
-- 
2.39.2

