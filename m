Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC96629D6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 16:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiKOP3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 10:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbiKOP2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 10:28:09 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37812DAAA
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:50 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id x102so7142001ede.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tczgVkko34uNNjGCJDRlpeQPz9HaugPUNs3BO6M1w28=;
        b=m2gDNZOwfzRyfwFpjIL+h89qb5vBHcJTyTpxhG1o9BXJPeLfFGmAWM4BDldrEAr8wQ
         F4CZoXDWgXGS6SSMfuIokf4K8owq4CNlzFo5EeqhhtnaKfDK+/YDjN+XtR8drMP3ZJkB
         O22DrH1G35Fa39PJXQHXEbxxG4VFnG9A77/xFvO5JfEAI+S2btlm+Hx5uiPuZkCb7Ysv
         OCHpqlC8MZUYn4IHfusF//Bq7t9iThUSF2hG/FuyO60R2eYIvDR5c8Pn8voVg+jEBrFs
         jA/wLHbWk7oNKVEQbQ8sydC+HFkKjfnzGarP//Gjt8QwdyRIHz+xM1R8SvIHdMaVtlKb
         95nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tczgVkko34uNNjGCJDRlpeQPz9HaugPUNs3BO6M1w28=;
        b=U01ESamVxfF99+U3Bw6XAryM8/Ejr4rXZXFhJuhycbeYYXbZcG59/843WGXsLLkTQN
         mOF3zUVyPiNmCzZjku0yY/tr9KMdmf1tO0at3WlyZZk8PaDnRtsDuSTMF+tSJjCMAw8f
         P8vxDXkG6vhR0UHOW+FPPSUrXgoPvV4iRagVM4qSQJOqevB0dzVwwAp9/6x0VIPxMo3L
         iDbMEXeYg0u7rye2HE1HrFdQFFeTAabcpDl1FDTcVd1StsMXzPIc/Lr2+U3b0r/2K498
         6JKFTNPr8+rkvoprnbTtvVbxPYE79bXab7QVxkwQdBcxQOO1MfStdjMpxV0wXO4ZWVkk
         chAw==
X-Gm-Message-State: ANoB5pnVopEEfqTApXwhNAjj6Jrlyi2Lme+AjB4gpt0PvHjzfcAAZSjd
        SZIqr7JhbyM1AvHTbHScz8DQ3s2gc9joYB5V
X-Google-Smtp-Source: AA0mqf4erJrOY2wpFpDSx+j8j7JX2M+fk5u4BVtsN38AgY3Cgkb21lGhz+IjdjY8cW7aTSvQcplirQ==
X-Received: by 2002:aa7:cf11:0:b0:468:4cd4:f133 with SMTP id a17-20020aa7cf11000000b004684cd4f133mr2247707edy.18.1668526069015;
        Tue, 15 Nov 2022 07:27:49 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id ku21-20020a170907789500b007ae1ab8f887sm5750679ejc.14.2022.11.15.07.27.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Nov 2022 07:27:48 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
Date:   Tue, 15 Nov 2022 16:27:25 +0100
Message-Id: <20221115152727.9736-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221115152727.9736-1-konrad.dybcio@linaro.org>
References: <20221115152727.9736-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add and enable PMIC peripherals for PM6125, PMR735a and PMK8350 on
the Xperia 10 IV.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
index 6a0f4c0bf7ad..c830124cb483 100644
--- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -5,10 +5,18 @@
 
 /dts-v1/;
 
+/* PMK8350 is configured to use SID6 instead of 0 */
+#define PMK8350_SID 6
+
 #include <dt-bindings/gpio/gpio.h>
 #include "sm6375.dtsi"
+#include "pm6125.dtsi"
+#include "pmk8350.dtsi"
 #include "pmr735a.dtsi"
 
+/* PM6125 PON is used and we can't have duplicate labels */
+/delete-node/ &pmk8350_pon;
+
 / {
 	model = "Sony Xperia 10 IV";
 	compatible = "sony,pdx225", "qcom,sm6375";
@@ -73,6 +81,23 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&pmk8350_adc_tm {
+	status = "okay";
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEUP>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.38.1

