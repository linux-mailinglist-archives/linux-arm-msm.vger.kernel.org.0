Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 014AD6F30C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbjEAMLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjEAMLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:11:34 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BFF171F
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:11:29 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so14085525e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943087; x=1685535087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ld1lJXBQF2mP2uTbXFQHQN+Mj3BbZpVpPgcFeLCv16E=;
        b=pdbqbjH7ipXYXKmVtsphxt9WuuUa4wG2VGFzgt0rgW8eW89RZYW9fjGbta7P12W8rt
         B27ZbBnTRuuCrgGULzqc+NwPMkKP4z9mPY0oq46jJy4HhhlRtMEP/4e9heuoDNUxsR3h
         Cu3Qx8ps19y5jQWc+7BkLUvAwqbwAFylJhaKXEMlNjLh972CpPj8ilx9S3GZg5kh0Cv2
         NByeq9jy5jcL7poyg4veenYCkgD+IkxJ8UpwiwvxqhuKpawoM6J8jSW0k1aOqxYbWYVe
         i5ctqUV7NFjb0iPDouwfNyJpIsUjsH/7Tr2d1MTGepnlGVE+gK1cqCWFhmWGOaZu1pZz
         EtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943087; x=1685535087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld1lJXBQF2mP2uTbXFQHQN+Mj3BbZpVpPgcFeLCv16E=;
        b=dty8exn5SvgJGabto+bUCPxU/3jBeLJhWIpWi7jTC5Tx/CBF98eQhUU+edHpvBd683
         qXN9O4VfOweE9sxby1ezeKjwxq+8+RAy9Xe35ZEQJfm+UHP8+Rwl664eBPaFB0kVXyJK
         apPO6VsUzaOLZrjKgi0+bqiMkAM4qHHQcebPSk7hDrxZYy78vtqyjyvq7E2NqfBXS1Yv
         0zWJjj4qvwPQnUMNtfYqIFcI5Ygd4jhNHB9d+1N8qCf5hjGPFwq0nF0QK9bz3hMU41HW
         T8XkTdM+d5ZUpLFL2JJux+MsPgVPYI1WO+IphxAnjzZ5TQpnz8fY8xgF+fePkomagW7R
         8tGw==
X-Gm-Message-State: AC+VfDyh1V/8hgjT/10rgArQGF6Xf7iZa6uKolJeRs0V/gNjBtR91C3G
        4rFLnkCdbmekgMpE1DKDRyDZYA==
X-Google-Smtp-Source: ACHHUZ4TXtmc8ACU/flHPI2yHzYlfetC4dY3+slyL6ZiFnTzsktAU221bdWqI8RTPoOAOtqieRTfAA==
X-Received: by 2002:a05:600c:d7:b0:3f1:93c2:4df6 with SMTP id u23-20020a05600c00d700b003f193c24df6mr9254248wmm.12.1682943087414;
        Mon, 01 May 2023 05:11:27 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 11/13] arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
Date:   Mon,  1 May 2023 13:11:09 +0100
Message-Id: <20230501121111.1058190-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

