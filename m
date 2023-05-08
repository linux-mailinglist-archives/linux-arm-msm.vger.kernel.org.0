Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABAC6FB2A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbjEHOXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbjEHOXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379E57A80
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:34 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f415a9015bso26188235e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555813; x=1686147813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG5tzR489Q5zuHE05830FTIX4PfCR2BAkKIO8oRz4PM=;
        b=pwsEK1RexxSKooPrJV7NvaSFYw32hWGFFHQghHEQsOKeyvrFpIPpQsmVgqIlX962KU
         LCarTJPd1onYmqiWSPpObQZCuoAiqHBDP3/WdT4xuYECYJj8TC1Gu7zQatcb+3WFpYJb
         h1nJ26cSjaZBH5OoJ33m6+xq9Nzl1ApExlmR7y1wANMu9kY1iuq2iYZThex7aekwcn+p
         WRb9wlaTG35q8qlM8dEebh+yPZ4i9azA70oAuZPuvR1YSIHSOsW4D7cHc9jzJV+sAMrl
         u/Kvd1T51DTj7aE6hyDn8Z74Gd0/drnxIiWXM4ZQrRf4CO4QcG3NJOxFLZ/A0Inq7Hu3
         DaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555813; x=1686147813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG5tzR489Q5zuHE05830FTIX4PfCR2BAkKIO8oRz4PM=;
        b=jULIeTESFbXBwMO9UHtIsDfIKPIGaj0gKNcNre1IoVsEGq/Y7L8T3yXW4RZlvZ4giQ
         uRDPx/AZDru334ydFbmKyOp5E/3JTHF3VRZ7ZRT6gmI95btKI2+azkbS6T9FAxT4rMrV
         plOY/E/B+ZZxsJ2i6o9bQ1gVXRiJHywHM0dopglMIitipYtpHhKYtP1XvbonsSE8NVzP
         IflDYAjgVFvsZdSUwiVvp6xJ9LEXbmzu6l+w7OLnspnVUboOGkYvTzTqDNIl4bE7zwXk
         ObLTqWUGIz92hqVj2FjCpMLUQCAJ0KOuxAjNhRa0pbtkJ5sAd2QCUf5xdhfBbCKl7jgU
         5wWg==
X-Gm-Message-State: AC+VfDx7W4rp0YzewXRB2DyQvNrU6YaigzTdb2Gio5Hylwpza/cDVkbN
        r4HlajeBHaEKLzY4PB/i4tVtbg==
X-Google-Smtp-Source: ACHHUZ66vbFSmzx7Vv2ZmMD7T7KdPSK8tRKyRDjcHUYLGvxL28gBIcU4HQvr6Udc+x7CsJZTXO6eKw==
X-Received: by 2002:a7b:c4c3:0:b0:3f1:9526:22d4 with SMTP id g3-20020a7bc4c3000000b003f1952622d4mr7302662wmk.21.1683555813601;
        Mon, 08 May 2023 07:23:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:33 -0700 (PDT)
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
Subject: [PATCH v7 11/13] arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
Date:   Mon,  8 May 2023 15:23:06 +0100
Message-Id: <20230508142308.1656410-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index b326bdeeb7742..df7179c7a58f3 100644
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
@@ -1344,3 +1345,20 @@ &pm8150b_vbus {
 	regulator-max-microamp = <3000000>;
 	status = "okay";
 };
+
+&pm8150b_typec {
+	status = "okay";
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

