Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711B4177D12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbgCCRM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37364 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730715AbgCCRMO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:14 -0500
Received: by mail-wm1-f68.google.com with SMTP id a141so3660126wme.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PHpjS/lc5wpshcEGSNTL9SwnayzHi0kkEetfF+T5EmY=;
        b=G86Iby+Jb3bBD7EzhxvgK5FwG1NVGSxkoaEYNX6m4BwDBCLsPBb2YYioavUAyW5GUO
         rk7FvMLW7K2W+GdFAZDuUl42+OVFLJZNXWrj3YGYxkcCS+qmxPxL4Zrdiupfub1icPzW
         19nTG1cueNZqzoWbSgk3aIapizXuG10YumvMrguo4c2VLM3Hi/icNrV6pbCjZvocrTTA
         oPRcSXEIA1UCplsOZtp7mE1IdEVRHTxV3fyqYanaWcrHJZ0iGHA/8FHe3mlNQhqbPhYb
         6vWk459Eo63uUIqn9iMogGmM6IDZb5LjWbyIML+k+kOb5GLBuMf/zIkmcSVqEO7TF9/G
         OFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PHpjS/lc5wpshcEGSNTL9SwnayzHi0kkEetfF+T5EmY=;
        b=VAE4kY9GEudJ9Kb4AgVEv69/Xv3OkqXsLlD9ZxkuNprqWZSHWU2OZwnUqq9Nyw5FcY
         QNxvM+BiZMJ3IeYYSKEkjGFEGwkm9jji692ODV4v75rb4NGg2o56EGDUlqMOMoVj5myA
         Dsu+bKpr3tn3IMjEAN91ZtgL8samLARR4iqz/FzSxpEPjmM209EiF6/KyfiAF1IJOPWj
         lvauMr1gfpYyk89tuys6nJDj6qifMAVPJUkGWZTTJM99Tt54+w2cCW7F6CzvCMTSt0dQ
         2RacHpBprTFIyGoI3v5CkGdRPZ+jkKnv0LIPMALMln10QIsg960lVFREGwXx6G8zYADB
         uLoA==
X-Gm-Message-State: ANhLgQ0B1GdWQo22AJVVHF2z/izKtedc+xPZQCaya3vTqchra4/J3TGv
        EGVkEiq9RiA2/D6Y3wW8AFbiwbEVUUU=
X-Google-Smtp-Source: ADFU+vsq7HDMk5KccTeWATobi7lcFmVMLelRRn3BaWvYtpZDS2dkrQMYuQ26yM4cZWoJU4MCvd0ouQ==
X-Received: by 2002:a1c:9646:: with SMTP id y67mr5070304wmd.42.1583255532278;
        Tue, 03 Mar 2020 09:12:12 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 16/18] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Tue,  3 Mar 2020 17:11:57 +0000
Message-Id: <20200303171159.246992-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
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
index cb893ca76901..4b529a6077d2 100644
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
2.25.1

