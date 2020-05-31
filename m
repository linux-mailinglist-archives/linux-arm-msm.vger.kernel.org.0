Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E5D1E9961
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgEaR2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbgEaR20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:26 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55641C061A0E;
        Sun, 31 May 2020 10:28:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e1so9194670wrt.5;
        Sun, 31 May 2020 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CuUDkzk04+Vds/ska8iBgPJHuw8KUNz3Pdi/MWzYJxE=;
        b=XDa600+LMgO6nNGULD41HeQBuRAEqZ5UUhFaGxTiD9ZRE/6Gj6xTjKr5RcXY0WY6LD
         gDRrWj1eBaR3p1yrAARHreh3h9z7QvXae/nzXueNJN820tgovsU5sfECTYUBjmpvFS6T
         cFg0gHIsDNwIjcEDN3IDUJHIrMaChpxA+JO5PHeaqOHWAJHSWLBi/z0RCqZ1+41uw9E+
         95et+QlvydRA4CsJ6tTpaPfTPnYX4EutW9o2SezRYNCepXxe8aUFDNKSJzdlZt5QlqXF
         AKkVkOktcSpCuTrMDVvRHCbIHv3qBLMTASpACf81wFOx1GHMlBxZhiaIYL30LTP8qVhR
         mDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CuUDkzk04+Vds/ska8iBgPJHuw8KUNz3Pdi/MWzYJxE=;
        b=snWPlMdCL3amysNgix5YExQIOoCYSLQJSFrlEUXrG1tIvEcn/4Vruop75Ewv+Tm1P6
         liL/PD7OGmBaFogarrZYCYRft9Vb60ZZVH9IkVyBAGqhGS7Hk+sZBXv35ZS5ilWK8D0h
         A+m6CEIfS6xxgqHSiYwRl2hBWQsW8R2smozrVD6IyerYSFFmRby/xxBNvyL23CUXBzFQ
         JSfSWQxAVARjHZ+RNh1ftDUdlXLGkCZBa1bYOlCQI6CvJ2QjlofoGFxRXOwcY0NowJ5l
         Aihr4ViBjxJpLrK5tUvaY0cJhmR0zavqiJ/H/2V2Lso3O31ODYaXdgTe/wtYZJKxwwRV
         6bgQ==
X-Gm-Message-State: AOAM53170R4lxDByQ3nMqkE1QQg30Ice/+2mqo7qFk3GooASdPGSNGAx
        SJRJlUS0Etsxjj93OQJuf7XttHYJ
X-Google-Smtp-Source: ABdhPJwWqBGBawivSaiMupOAUzTmAHrPF7zS7duJh+Ox7AGjuy3DY08wFok5TGyuPWz/L/skdArXBQ==
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr18389278wrp.370.1590946105057;
        Sun, 31 May 2020 10:28:25 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:24 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] arm64: dts: msm8992: Add a BLSP I2C6 node
Date:   Sun, 31 May 2020 19:27:59 +0200
Message-Id: <20200531172804.256335-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the sixth I2C interface
on msm8992.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 395f4c325c2f..ef95f5ee83db 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -348,6 +348,21 @@ blsp_i2c2: i2c@f9924000 {
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		blsp_i2c6: i2c@f9928000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9928000 0x500>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c6_default>;
+			pinctrl-1 = <&i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "ok";
+		};
 	};
 
 	memory {
-- 
2.26.2

