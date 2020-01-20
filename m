Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23AFC142FD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 17:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbgATQbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 11:31:46 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54107 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729598AbgATQbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 11:31:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id m24so204769wmc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=BJEfEYsP7dkNBq/ZXZrw1WeIwoHH6Y3/6fejM2G4jDVOeGOjUzz72jCC3ygm2JNOJI
         +D3smzukgxj94czG8PmnpA1mWLB9sI6JPgNinHewmz7ixadliLPaaPQJ5ZQinzr0WXpP
         n5xeJux1cMoRwISVE3kF1ASnAhB+OHzo1mm+Tyvfkvxx1AQCddfpiz2NblPJ+HNWdj80
         nLy1pfaFu8DTkiuXJQc4CiOS2XUQO5cRd2bFrVFKsO936nKcfO7AfJ7aLIX1011+OlD/
         GmRCmS5r5LQBtjmJ7RCJrf+giRcYZqPFtk0Ux3/kdruh7iFGuUNoQ8QaWcD5c+NfXEEC
         2fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=U4w8vcJWPJUrF47N7s2exug/yjEzwjU/5PR9kVu4uO2Z78FKCHGENzHopJHpYDGm+E
         N1Zjb6z6YvX80IzkSjl4jz+Uokw7YcA6vmiqkkZ4xXO/Nh+fYtJhhZbdNfWaZSK/rc5A
         ebDtH1sjMqYVHsB1Fb1tpbWXPZblmJgX9ZKRX/mwXclmU3VfkUEXOcKMSg7Na9YpwnCf
         WBQkxOlUAL36pB6WjTa/aLTxe04oaRqr4Hi4tl3slbbqIfj0V1jBOlLejRDJy9LSro4F
         taHgOYShvk41cYlQi/rAb2Iw68oxr+Db9y5ydwYtXLcGdtqdBiEt3CdGg1IhzeT2Wg92
         +p/A==
X-Gm-Message-State: APjAAAX67sQKRMkcaL0vdr+WqCQvth3jX89T+vJCn7WQyUBjb0RBfnlm
        kHhWNHo5/j9FXyw9UsL8Rj4JHtaTILk=
X-Google-Smtp-Source: APXvYqz2a6qywCQBwkVN/qFSGZFQdZm3WG2wfjnhvelokq7ZMbtdhUeKnYqDBngNRoafomEDfzXuWQ==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr168184wmb.41.1579537866357;
        Mon, 20 Jan 2020 08:31:06 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 16/19] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Mon, 20 Jan 2020 16:31:13 +0000
Message-Id: <20200120163116.1197682-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBUS is supplied by an external regulator controlled by a GPIO pin. This
patch models the regulator as regulator-usb3-vbus.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index abfb2a9a37e9..01ef59e8e5b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -33,6 +33,18 @@ vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus_reg: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_BOOST_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pms405_gpios 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_boost_pin>;
+		vin-supply = <&vph_pwr>;
+		enable-active-high;
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.0

