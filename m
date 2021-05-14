Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791D83807B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhENKvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:51:20 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:19118 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbhENKvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:51:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620989044; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gjQ2/L5ziGQ1O0H4xYQGGoRY55UDXqWHZgaTvEDSEBo95mkN8MgFC/Zinba5sn30Pl
    h+MJcbk6jdK6/YMyQBwZ+6lM0YpJljLl57KLYJ2DFdQKH2pcfqxihFeJyzgD7el5OUwr
    jFIcRWQ3Y6e2yOwdFiJC8rzgBnbPTwwzLa6ajX2SeVvoLe3iJx/XDt5MRpX3PVRDsDEN
    xl48+/huMzh1NMLOPn3I0RwUUPJ0Io2oFA40swtBPHWU/VqH/fOzWB/AqoCEPsxiMN0v
    Tz0jt9UGzzlMpp0xf32+C8SDHCOWB+V8wi2/dMPZSXvN5r+3Hf/51J/wn/ju7oT0dXri
    z3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989044;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=99IYwNg54dmBzr49xTRAglezUv8789iToQiSeRNiiQI=;
    b=kEWQnfkBFGmCle6lOCxD5ttIQcXdVb9D4zkaCkzd05oPNrUKqqFjuTprTr1fJkWIhR
    OLfEAZ1efH+rtJ5vB7RrLVS6aM0/VvqIjX97VA18Ymxieuy+NWswhoQ9qqOqIpXizNTi
    VdHtDSqUx9/MT5x8O28JgyQWchhbmeys6m2mhhYbodK43E6lMiReYZCKwsRnqMrXqv0x
    7PUVXGp9zh011xQebINMRNc0Zm12xwwc4IWaFlPuGYdvX3NW8iGKh8PsxWPBptEHxwcA
    oU3q9di8pukyE/8owH4hAoBYhxzy66DTYW8q8ZSsh3j9P5SedO/fwqHpMPPAy2qOPXsm
    djLg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989044;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=99IYwNg54dmBzr49xTRAglezUv8789iToQiSeRNiiQI=;
    b=XAgDp5CKJALlxz5DSqk5OO2CLbY7xhmUgazOmKk22dvJLizDMDiShHXfOpItzW1/mE
    n46yPcH00CdBLpk/SczcGkIEYtSBqLJ+qGZix6SN5lgXFd/V7PDoxZVSie6pLU9igD/w
    xCu+6ZAFaGzmUSZx+qF5BlZ9F1Of0eh2NqVa1n+d2/yGQdFj/hwkPXxnKBKhGe9FCw4C
    2bFh1XDEuE74xgZVddOx+IjLm/ykJM1cuc+YGL21tQO+XV9V5NydbCK0uqTlKkXXDcbT
    +4gpsyKMLvJoTuBjJHJAR+8sKh6zMKJLispG9OmLb2iy1doTA7793UTC4GQ4PJWodAGh
    yFFg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6OWA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.7 SBL|AUTH)
    with ESMTPSA id j06c13x4EAi4Fyn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 14 May 2021 12:44:04 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/5] arm64: dts: qcom: msm8916-huawei-g7: Add display regulator
Date:   Fri, 14 May 2021 12:43:27 +0200
Message-Id: <20210514104328.18756-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514104328.18756-1-stephan@gerhold.net>
References: <20210514104328.18756-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The display on the Huawei Ascend G7 is supplied by a TI TPS65132
regulator. The panel needs a driver in mainline first, but the
TPS65132 is already supported in mainline by the tps65132 driver.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index 3b558dc9e90f..5ad4e921b110 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -135,6 +135,30 @@ proximity@39 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&prox_irq_default>;
 	};
+
+	regulator@3e {
+		compatible = "ti,tps65132";
+		reg = <0x3e>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&reg_lcd_en_default>;
+
+		reg_lcd_pos: outp {
+			regulator-name = "outp";
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5400000>;
+			enable-gpios = <&msmgpio 97 GPIO_ACTIVE_HIGH>;
+			regulator-active-discharge = <1>;
+		};
+
+		reg_lcd_neg: outn {
+			regulator-name = "outn";
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5400000>;
+			enable-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+			regulator-active-discharge = <1>;
+		};
+	};
 };
 
 &blsp_i2c5 {
@@ -370,6 +394,14 @@ prox_irq_default: prox-irq-default {
 		bias-disable;
 	};
 
+	reg_lcd_en_default: reg-lcd-en-default {
+		pins = "gpio32", "gpio97";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdhc2_cd_default: sdhc2-cd-default {
 		pins = "gpio56";
 		function = "gpio";
-- 
2.31.1

