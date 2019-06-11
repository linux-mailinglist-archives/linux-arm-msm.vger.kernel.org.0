Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C63523D6A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 21:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407533AbfFKTVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 15:21:21 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33642 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407527AbfFKTVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:21 -0400
Received: by mail-pl1-f196.google.com with SMTP id g21so5548523plq.0;
        Tue, 11 Jun 2019 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VyKAAyyKF/StTl6Cc7Bhi0hP4Fbpr1Wnyb227vQxupA=;
        b=XL0AUogKv6Cxj1o55F+H/u/jeXLI0x8/C754Uw2qjM+DoJhR91Fi3mcEZ68gY4v+kq
         NlInBqn0UHjxqmEKlFK3dYtwZQc+TKSPXvD0uOvoJ8iuNUQNCax008E5a0DXfzKHpxBN
         pTDcvpwV5W0HCPMLiEwX33vLLaEIBiWx0rB16luo9rM2PPahYhMYGFFYiHP555AcOif/
         0RH+eQDsztBx+jbLeCw5tJp+sdNXoRgX5KaUHqK60vPDIZ3JUAuED/Nqok7rmxI6DYht
         dntc/LH7EsxfsFex9bPNJU3k1D7VAlhJHTlnN06/ZSnEIM5lB08KL4a0Xk6JixyQjdBi
         6DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VyKAAyyKF/StTl6Cc7Bhi0hP4Fbpr1Wnyb227vQxupA=;
        b=nuctAf7lyTp08CPfv9YwjxQdEBVyKOOCxpMINwk17kc7shZywA8ajT6DxBSJqlD9Fg
         vJJt3C517PfaRdwqxnpGlRuHP8khXsy+L61YCE2tEsF5SUigMaS4f9YcryFTLBCS4yxn
         /VAEU5SLsOIk0IG/kOHdw7krsIqjK40wxa/7v7dlMf78zxkg0hVweXt1JZznE6uNvF3N
         Elhx1axGN227BGPYP/T+F4va8/tsbaRWV9QsBtSK1TtWliUst+NcYqMO+ya9fP1F6rJB
         E+VyT4bC2uSq8GH3otlKp9dV01eLwvxUiy13iaNFgz0f++E69uKZsOfQ3YS43mrAmvgg
         bjHA==
X-Gm-Message-State: APjAAAUPJD7ScX0UtpmaftNjQXtK2EMc2DSBvhgwVzmHA6EDc71WLgcU
        hc9RNfW7fFI3SVSnPUuQIvg=
X-Google-Smtp-Source: APXvYqxM45D6ih9NPop4Jnwxqresrp36WK7FBsVW0XTK9ysiGJzlc2i43YN/D1Vc1OShKwnlvGlETg==
X-Received: by 2002:a17:902:b58f:: with SMTP id a15mr76885535pls.201.1560280880449;
        Tue, 11 Jun 2019 12:21:20 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id z32sm14669727pgk.25.2019.06.11.12.21.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 12:21:19 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: msm8998: Add gpucc node
Date:   Tue, 11 Jun 2019 12:21:16 -0700
Message-Id: <20190611192116.15009-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611191949.14906-1-jeffrey.l.hugo@gmail.com>
References: <20190611191949.14906-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 GPU Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 574be78a936e..cf00bfeec6b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -763,6 +764,20 @@
 			reg = <0x1f40000 0x20000>;
 		};
 
+		gpucc: clock-controller@5065000 {
+			compatible = "qcom,gpucc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x05065000 0x9000>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>;
+			clock-names = "xo",
+				      "gpll0";
+		};
+
+
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.17.1

