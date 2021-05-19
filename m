Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A86389192
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354555AbhESOlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241769AbhESOlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:41:15 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD96C06134C
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:39:19 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id k19so10043993pfu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ha/LaDJaWqJqGFUOZ/CIIY7Ny0kkYMvLA61pIJyDFZ0=;
        b=WLOYc+Zws2OfLaWguoyIkyA1m4y1KdTsBz7yZ364G202kFhg5Cz8wae1i/DUrnQHh1
         HBeM5YDGHk7LZ98IXVwaHuqR6OYbgMNOt9yY43rqwglS9/2svFr72RgIxvfI7HyIe0vc
         gBjIwofSIcAXXCjfK7daf+hKjL/Ov9zRgQVvNfI+sW2xNj+oUyJk2cHZDPRxC9d7PyLj
         AjUBTsoIlgPuTpoNBp/SqFHUBY4G59V5KiNlfdFPX2sWdvG/ykFt3dJY4iHLokwCDR4T
         VGAL6RoKhXBZn6TUmJxWyNrcHT2Nsxa/gVWl+XiW3yAWyOwzHT03zZTVDjnTVJUYKxxW
         ez+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ha/LaDJaWqJqGFUOZ/CIIY7Ny0kkYMvLA61pIJyDFZ0=;
        b=eGF+JKCysYtprGv/jSxa2MH9pFjt4DFFoOfVh8euQf4Ouh4dUyBl78MVza32xA5Egw
         LIX0N/beqNy/336N2VokUrVKMdMXh/GM3xNmAs3kYwtdNws01dHusrh+IsFH+4J1RxKV
         6Lm6j/ZtgIkFFv7wEdXrJqAHKrYpzdDcjI+e7ctvfGTdyDCsLBARBLLTkPflAcX4eQWX
         4tBzDkePsXgnRFudW7HYTfpkdA15juM3YBd9Ffa77h1WcGAjmbg54u5DVXvC4BiAEZjH
         HDAMojmn10yl0cqAT8fjQHyJLuav+TUXxYogw0v98zWARHdVrS0cc3WKC2C/5RVMjuel
         qR1g==
X-Gm-Message-State: AOAM532IwB8gd/8zFO1gzsHosBjPzksUTziyFZbd5J4/O89AItNvlBvf
        OFVpHkgpXB8JFNx+CNO0W+9B+HsqwNackw==
X-Google-Smtp-Source: ABdhPJy6oYXhdskz+Yn8nt3Y0Tv5dRWI5TVs9gHJNz0N7OYXa/C/ddOSJ9Mb0VgSbzLMrAfiYCZtuQ==
X-Received: by 2002:aa7:8588:0:b029:28e:dfa1:e31a with SMTP id w8-20020aa785880000b029028edfa1e31amr10952488pfn.77.1621435158778;
        Wed, 19 May 2021 07:39:18 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:39:18 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH v3 17/17] arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
Date:   Wed, 19 May 2021 20:07:00 +0530
Message-Id: <20210519143700.27392-18-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
"sm8250.dtsi".

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..6700d609a7b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3796,6 +3796,34 @@ cpufreq_hw: cpufreq@18591000 {
 
 			#freq-domain-cells = <1>;
 		};
+
+		cryptobam: dma@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely = <1>;
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x586 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8250-qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x586 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
 	};
 
 	timer {
-- 
2.31.1

