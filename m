Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A724598AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 00:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhKVX4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 18:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhKVX4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 18:56:06 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1D5C061574;
        Mon, 22 Nov 2021 15:52:58 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id t83so20010781qke.8;
        Mon, 22 Nov 2021 15:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+22fnE4fQO1oe+IUf0KBJAkDTa43sSHUAiOtLCuN04=;
        b=ZpFKLxIgDDVIo5Ey86wsczzOh5HA8zo9DAEXrdZorXpKrx5N21doMG5ItCnxszHn4S
         oEJq25tzV854hzx34ou8C4PQ2HyB81SX5L0NWo1/K3YhSdoqzDYB2gQC1v3djdC1Sj6+
         Gf8BnenuCrFAjIC8yWv2IQG0IHiCGhK2fXC18LumeqEavDmMoihuiUblTXalOv5g4LSQ
         EyxumgGszN2XlKPlFKXJZVyLWQyJ5BNtpBEOWgXH7y+W3DacoIlka27DpYWZldt3Q5HE
         nXHR+aeayGdwb1g8+zE/IQddg+IE1ZtyF7vBQDUqrSnLh02k8yLq8+PSYWHA6kwd4sJr
         1w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+22fnE4fQO1oe+IUf0KBJAkDTa43sSHUAiOtLCuN04=;
        b=nV/MdXQHfVhi1EHjTdJeC5fJqnfmwlDIu8IBY0zQF04rwDEr0JPzcYucLOEsfEjx8z
         u1toRREFmIZc0xElSO0wLqp6txaMkgo8vCDQTCI2P2kHusmqMj+RuUGZXZY8Z0BX3LEz
         01/ZZw31XX0Jswds9JR88+xZeDnbeAGBuITa+svwCYmJsjlpWb8os9jPFbqw+usqLhzu
         s6/Ao0RMvYt/M7rmFN4iJOidLSr4FbCPrIdk5V9Ye7phA/p/96zAI2eun6MRT0fRdDiW
         J0Ch17eD76COBPJW59onZO8yzv/hAWHdzkqjh5Z9krekUsMAQrB+/eg1gRPflz/KulqU
         VpvQ==
X-Gm-Message-State: AOAM532Azfmq4zjFMIdgj240NhPzRiHCuMCmADsHQAX5KzPzbZ4g0Crp
        jikgjuuoTiEhIMhox/6wy42ZGOVHuSeHAA==
X-Google-Smtp-Source: ABdhPJw2MlFCB7fIZA2douty9HAepf6JsFPg9mzXr4G1r7qabvIF8WhwdEdhRBi2yxlXCRgzvfe10g==
X-Received: by 2002:a05:620a:1301:: with SMTP id o1mr684150qkj.441.1637625177811;
        Mon, 22 Nov 2021 15:52:57 -0800 (PST)
Received: from lumia-dev.localdomain. (pool-96-225-98-253.nwrknj.fios.verizon.net. [96.225.98.253])
        by smtp.googlemail.com with ESMTPSA id de40sm5315524qkb.99.2021.11.22.15.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 15:52:57 -0800 (PST)
From:   Jack Matthews <jm5112356@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     luca@z3ntu.xyz, bartosz.dudziak@snejp.pl,
        Jack Matthews <jm5112356@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: pm8226: Add PON node
Date:   Mon, 22 Nov 2021 23:52:30 +0000
Message-Id: <20211122235230.2467246-1-jm5112356@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PON node with pwrkey and resin as child nodes.
Also adds resin, and additional properties to pwrkey.

Signed-off-by: Jack Matthews <jm5112356@gmail.com>
---
 arch/arm/boot/dts/qcom-pm8226.dtsi | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
index 666bc6350c50..63f3026c25bf 100644
--- a/arch/arm/boot/dts/qcom-pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
 
 &spmi_bus {
@@ -9,12 +10,26 @@ pm8226_0: pm8226@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pwrkey@800 {
-			compatible = "qcom,pm8941-pwrkey";
-			reg = <0x800>;
-			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
+		pon: power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+
+			pm8226_pwrkey: pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+
+			pm8226_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+
+				status = "disabled";
+			};
 		};
 
 		smbb: charger@1000 {
-- 
2.25.1

