Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8F66E0CB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjDMLfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjDMLfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:30 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD209760
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:13 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j11so17542931wrd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385694; x=1683977694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ld1lJXBQF2mP2uTbXFQHQN+Mj3BbZpVpPgcFeLCv16E=;
        b=cYPRvpiHZkiRKIxEa+/FmfQDxfMvmxIgAVEYirBHQjpBHcpWQDbO66iXKTRMqBT4KM
         qu2HAWye2d/raXeWbBJ73hs7biKf+97024/lnKY8sFjCrYXx2JMA9igIgtlrIQYYzcj/
         MuzMEqj88hY6C6xn8sHnuo4dcMYPBQLFmirtRe1judeHOU937baMy07vX+MvspZIoKTg
         op7opw2M61/5RH64Oi5E5KPS7LRWVq7xiTvZHaBDyzC6NrYxU1p8Q7rC6HkpecL+LeY5
         Z2tkzddxffvTcWT/Rel/+QupzkLJ1M+QCHAX5fGGJ9STldtuvITGP2NAl2DFPwv7QIy3
         9zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385694; x=1683977694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld1lJXBQF2mP2uTbXFQHQN+Mj3BbZpVpPgcFeLCv16E=;
        b=jdh8rmfjEEM1w3P3dD2tTiSqUtcUc4EAs8wKmq0tIEpkEQaaAFrAZZdSxcrHefLpJM
         sElaz8uktYUAXYoS9LVzoN/wIqFVngm5d+hsUs605WsJI2lJ0TPAJmk0T6Avt9w59NFS
         RUmQHmWutuPvYjP/ggzH3uiaPGsw1BDh0b4rHVSZN6sS7yE0c2InpMzb0//C5xpAvRCu
         GOb9Mu0UBBp1kuGBexC/+fWUR5UnQav6/PivBejcIUMaMTaeCT/8MLO9lHbBYtn27NuI
         mGi556BQ39/dZDayi60jlA+flFT9B/J12hgftfY3MFgPu7A4B5MSzHiG/XJQiSblY1WA
         3B2A==
X-Gm-Message-State: AAQBX9dovfgEkmUs/yIst7MG9e0t6Pvyjp0RSH5VbskchIthsqb64inZ
        jjoxDu6tftC8NfaE1pAayV4+Jw==
X-Google-Smtp-Source: AKy350YV5Gx5WHhCex5gcnvQ0inLJGLZwhx8PeUM7Fs7gqPWEfEOyC3tqVIAFIDcxkvYFdzxKn2R7g==
X-Received: by 2002:a5d:4b05:0:b0:2e4:b4f8:896a with SMTP id v5-20020a5d4b05000000b002e4b4f8896amr1394476wrq.49.1681385694232;
        Thu, 13 Apr 2023 04:34:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 10/14] arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
Date:   Thu, 13 Apr 2023 12:34:34 +0100
Message-Id: <20230413113438.1577658-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch on TCPM for the RB5. Here we declare as a source only not a sink
since qrb5165 doesn't support powering exclusively from the type-c port.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index b326bdeeb7742..1e0b6fd59abc9 100644
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
@@ -1344,3 +1345,19 @@ &pm8150b_vbus {
 	regulator-max-microamp = <3000000>;
 	status = "okay";
 };
+
+&pm8150b_typec {
+	status = "okay";
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

