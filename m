Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080D717A83A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 15:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgCEOyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 09:54:02 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]:54976 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgCEOx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 09:53:59 -0500
Received: by mail-wm1-f45.google.com with SMTP id i9so6650834wml.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T64BhDY4P7BH6N7mZRt4GHgX2fhw+FmEfAXfzxtpWvY=;
        b=Z9wWJeabu7EJefkYOIj+P/cmEeY6RWiE6YqVxMZi4GNu94+Mbb9b2IkoPnTfUwsoat
         quh3gQkHQOZdIjhgNEd9yM6khogubrKHLuhC7t6TMOY7PtIYhqfXw4Sahg28TStP/qMY
         mx67UfasNptCEM0BEC/m2D58vRYmvMhy1rKzZSUrki8g4fPIarXoGgjnwa9LaI/ANJgf
         yoqmwRLtqZ4Rzt5zrrKlMu8KCUFCDdVqPI6lXvPw33+oUQ5t58pwZVqTdgtKHzaIJq8O
         Y80w55laQFy5YKsO8rIWZBb8eF/D16vbIWL/ySmJwMshGj8HQZ3YEPfD7X/VN99U/+QP
         lcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T64BhDY4P7BH6N7mZRt4GHgX2fhw+FmEfAXfzxtpWvY=;
        b=Wqx/ztfuDKNWghn34AZ1RHHtKw22zGT7elyIXAWw6oAfqaruARZ3MULruOal7tTdoN
         3MLcDh/j4N5at6DmwtdjOtreka3G7rfJlzxPaD5P8zaotS2fOsio46ZJUUQ8Tu+TzzX/
         DdrfHaTJJT3t+IXLRABdh8edUDj4lvH0elo7S9bqyJOdysRZacCK8brAQhmQAeG/x2gQ
         IfTybtnxVWi611aR3S5xoF9Ea+qT8D/bsuBefGX3Xgtq8ENDFqbiiaflcztQq0NR1hoz
         tc6jUUAYCW2YaMKfz/oBN+0mjN3b/8fjGWRZUl56TAgiJXBtbNnR30zRLEyg2ivQ4F+X
         V8WQ==
X-Gm-Message-State: ANhLgQ1Qaw2Uf5Wdz2r3SCDA7tbhp6BAAN10A9G+SjIf6zb7TRogDUQI
        2qT/UZqt/uAMavCIrjV3u3DfUw==
X-Google-Smtp-Source: ADFU+vvXZ5YJeHGJlIdkbo9OsuH2BSu5AF9PVb9/sLJ1fMQHgVzp5lUXGtexk8eiFBfudPbWoHdilQ==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr9833114wmj.70.1583420036777;
        Thu, 05 Mar 2020 06:53:56 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f16sm35785985wrx.25.2020.03.05.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 06:53:56 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes
Date:   Thu,  5 Mar 2020 14:53:44 +0000
Message-Id: <20200305145344.14670-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
References: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support UART0, I2C0, I2C1 and SPI0 available
on Low Speed expansion connector.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 350d3ea60235..fd2bdf10a4d9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -434,6 +434,24 @@
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&i2c11 {
+	/* On Low speed expansion */
+	label = "LS-I2C1";
+	status = "okay";
+};
+
+&i2c14 {
+	/* On Low speed expansion */
+	label = "LS-I2C0";
+	status = "okay";
+};
+
+&spi2 {
+	/* On Low speed expansion */
+	label = "LS-SPI0";
+	status = "okay";
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
@@ -574,6 +592,11 @@
 	};
 };
 
+&uart3 {
+	label = "LS-UART0";
+	status = "disabled";
+};
+
 &uart6 {
 	status = "okay";
 
@@ -589,6 +612,7 @@
 };
 
 &uart9 {
+	label = "LS-UART1";
 	status = "okay";
 };
 
@@ -674,6 +698,16 @@
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
+&qup_spi2_default {
+	drive-strength = <16>;
+};
+
+&qup_uart3_default{
+	pinmux {
+		pins = "gpio41", "gpio42", "gpio43", "gpio44";
+		function = "qup3";
+	};
+};
 
 &qup_uart6_default {
 	pinmux {
-- 
2.21.0

