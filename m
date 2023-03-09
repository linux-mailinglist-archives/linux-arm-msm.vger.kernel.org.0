Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54A06B219E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 11:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjCIKiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 05:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjCIKiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 05:38:04 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9532513D48
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 02:38:03 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id g3so1367147wri.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678358281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XIMBXfDU/R4FYmgYxRTe35TNzbPerUdpZusJBGj0r4=;
        b=XcvVtUvAXAab+67J6assIe04iklARgy53+JNhGztFB4px7cQUfi03AqeyjoOqDSUnF
         j02LjX+r8/XlMJp/smV+XJh9ZTbCSV8RqU6LK3AWcqDtgzYSJdbgM/JeRIMaZZbZC5G9
         iRXc9d79SV8ZnFh7ku9RiBDQo/qaZKJv42m21aAgfT132BN5Fh9xs5GiHxrFYCAEmaRT
         CAzoTP0fq1qFy3Os2JXF/enSH6XPap7S3tU0OKuppqd3ZbkwUQIu1ntCmjNfnL6HtZdV
         FOKaZB29gBgDMJwplXgTDFHtYOT91DOCRi0sNgH/0+JkW89WaTfq61ffPOZxsQ+5fKF2
         81zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XIMBXfDU/R4FYmgYxRTe35TNzbPerUdpZusJBGj0r4=;
        b=ICzZylOUpERRv+HtHn/QpYKhcwulfJ+O5+SKRIKUlqFZhbvsE9eDzofRUW08jwVWl9
         kD6k3zamfedndLKJKcDwQwWMIlZcy1jF5sU+tUr6cMrcI6W1CWlWSRV/odpX2lg09Ylo
         3gtwLUy++mbVHs6vkY5/PiILQQk3DSRboh/sSTDlA/aiNapOIS8p4ypnS5ifeIQtWZ/D
         0/Vvr0auEWmN3POQr/GqO+Qrk5eahpzj59wk6mOqdPCcUNHXHDhxn06oSzLlSTHviV+e
         9ou9Lr3W3qbZXCSWh7NOK3gjJS8wqMkPvO04KYJDTd5leKFERObSJ7W6D4qTpc8dCFVW
         7TRg==
X-Gm-Message-State: AO0yUKVFBYbRCnE2IjRLPdM0Ke2vxl/N76uzCjV0en/vI6x9ILV/w38G
        qNHd80jtGsUTpne5qJSEccOIRA==
X-Google-Smtp-Source: AK7set8uWnSnvxULh/ZDR7WHL9V5onQdJgIMIaHOX+yxdQi9syjET3ReP96/tiA8eR0/U5evBo6B2A==
X-Received: by 2002:adf:fd07:0:b0:2c9:8a3c:9fc5 with SMTP id e7-20020adffd07000000b002c98a3c9fc5mr14347426wrr.41.1678358281742;
        Thu, 09 Mar 2023 02:38:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d58e2000000b002c56af32e8csm17638119wrd.35.2023.03.09.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:38:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 6/9] arm64: dts: qcom: sa8775p-ride: enable the SPI node
Date:   Thu,  9 Mar 2023 11:37:49 +0100
Message-Id: <20230309103752.173541-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230309103752.173541-1-brgl@bgdev.pl>
References: <20230309103752.173541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the SPI interface exposed on the sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 5fdce8279537..d01ca3a9ee37 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart10;
 		i2c18 = &i2c18;
+		spi16 = &spi16;
 	};
 
 	chosen {
@@ -40,12 +41,25 @@ &sleep_clk {
 	clock-frequency = <32764>;
 };
 
+&spi16 {
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &tlmm {
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
 
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	qup_i2c18_default: qup-i2c18-state {
 		pins = "gpio95", "gpio96";
 		function = "qup2_se4";
-- 
2.37.2

