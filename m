Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6282838ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgJEPD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgJEPDZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:25 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A8EC0613CE;
        Mon,  5 Oct 2020 08:03:25 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t9so1329994wrq.11;
        Mon, 05 Oct 2020 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RG5O/blRX088Gf+ChfJZxqZON6Zi0SmLcrgY0NHzZU=;
        b=eE5U32q4J8OCVWaOdW3/PJpFoCfS6AAVQm9eTgbi93rZR5nbVgvY6jg3wLTVSVzqA9
         lDWl3Mfctfen6dcJAFhpEfB+vyb7XKf/EbbuNTvGn+OFCxUJ/Pe13Q7Wwzq0LT8Mv2eb
         J4NfeYRKR0zn184450Y/uR5sl+HIipqAcK8ZL1j1YIX+ywVpiZ7uXpJQQrfVnDKdUMpZ
         58Dzomy4ER6t4+mB9laQoLcmoKk/WlIImrPWZnCa3GpVrpnpsjLb7obowoR1fAPU7l+J
         m5QIYvPibFXgbybuUtpJQJHY+2lu1oFsUyy+JukLW/rNG21ixCx81bgXO1XTvqhUJhir
         55tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RG5O/blRX088Gf+ChfJZxqZON6Zi0SmLcrgY0NHzZU=;
        b=hZNuPJYiJPWz/vlbvBFoUS7KyTveN1grbnkOqbIMD5HO2NaRN94EJ7YESV6IascsEW
         KLkXECNJ3F0AnMaZ6ASzx3Lu+UlKHAMJrmEz/ESp1uUgKc6j8B7CM7lr1KJlBZmMYO0N
         wFqpSe3h+NpTIsLv9mN/bAp2V0eUwogANSVIDl5z5lfJvAAJAcmT02kZcdm6bWsNM+ZB
         Uoa+bB9XsKaqNxP1bwxFepjNeSinRxymc6ClVVKo4zufeM8HqQRpFbAFQLVAdNNHF0Gu
         W29ZBkwASGiXBqOUvdfsSFNNv5XBAsgM1tmuLToYkp0FPPKgmZ0TXs1tbmCT8uTXnD9B
         tI0Q==
X-Gm-Message-State: AOAM533zrAwokYKgwd6LGgOf0wodCCSUTY7mJ7neMatL2oOxrNLw2P0/
        FaF5B5uHjqqOXfpWYsYHuBg=
X-Google-Smtp-Source: ABdhPJytBOxbYlIVvXxNG0jVtNFycKep6mZQv1jCqxUnOC4v0KiopSbE4QroV2dV4BeZxqPSX/WQFg==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr12104118wrp.310.1601910204126;
        Mon, 05 Oct 2020 08:03:24 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:23 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] arm64: dts: qcom: pm8994: Add VADC node
Date:   Mon,  5 Oct 2020 17:03:01 +0200
Message-Id: <20201005150313.149754-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add VADC note and some of its channels to allow
for voltage/temperature reading.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 36 +++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 7e4f777746cb..ea2a3d53f859 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
-#include <dt-bindings/input/linux-event-codes.h>
 
 &spmi_bus {
 
@@ -35,6 +36,39 @@ pwrkey {
 
 		};
 
+		pm8994_vadc: adc@3100 {
+			compatible = "qcom,spmi-vadc";
+			reg = <0x3100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			adc-chan@7 {
+				reg = <VADC_VSYS>;
+				qcom,pre-scaling = <1 3>;
+				label = "vph_pwr";
+			};
+			adc-chan@8 {
+				reg = <VADC_DIE_TEMP>;
+				label = "die_temp";
+			};
+			adc-chan@9 {
+				reg = <VADC_REF_625MV>;
+				label = "ref_625mv";
+			};
+			adc-chan@a {
+				reg = <VADC_REF_1250MV>;
+				label = "ref_1250mv";
+			};
+			adc-chan@e {
+				reg = <VADC_GND_REF>;
+			};
+			adc-chan@f {
+				reg = <VADC_VDD_VADC>;
+			};
+		};
+
 		pm8994_gpios: gpios@c000 {
 			compatible = "qcom,pm8994-gpio";
 			reg = <0xc000>;
-- 
2.28.0

