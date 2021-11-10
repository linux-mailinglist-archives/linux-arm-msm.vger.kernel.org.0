Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCABF44BFC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhKJLFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhKJLFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:05:10 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5761EC0432D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:33 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id e65so1931734pgc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jxo26PM+v+FavVwWJDiflViEe+y1rULkr8xHn7NoreQ=;
        b=zhftXFPYnO12H4n30/cgoywIiLqysx+A7rPrWK22HI7wvhzbJwGLfp2YaFIpdBKxZ2
         C2uHrfQ7YgTL+K6kIkFJigdyw9jy0vE5FwcIWmfEde4bswYdI40yrRBaxRprUOmjKrwv
         zSlF/X1iO+sJ0SBudjcl7j9ud4HCBdOvjeOJl+cnHrzWMidplmYiEs6KPsUBYgUBbeOv
         7y4uVSUUnRsDh42AVPrB+5cnc5lTxjBURJ2jJv0poNUmsPyOjTjLPi+2Gn0pgdRwXcVU
         XsV6RwYTs1SHUlm0GNWE744r1IgXycmFobSd/alnPxDfZQiTq/haljbfWNGu1vSxF1B4
         iCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jxo26PM+v+FavVwWJDiflViEe+y1rULkr8xHn7NoreQ=;
        b=BWj5d26g8fWNzNdaXJR/DF4+ldREeMZ8KVfth+myTgGUowlANSZTY0VDpobXvGX/Zj
         be3CNI3GGfPzgJmyxl4JFG8ZguA0rB3w/6JM3OICIiHaJYm+6KalcIz0/x7IYCnFuLCP
         dyoK3THTbcpD5PWfm2VPqJBx4GnlMiw/2/RhOImKce4aw8++iB2NWU+Jxpfo1K7fk+2/
         /cN6LDUCmohK1TAhHMBPgCPu1jnS6dEUGf4LqhmPbdgVKa/teu+QB0kZd6M4LIU0H85l
         t8Us3zJPtVjrLctHHrNR8uKU3CdjE/h9/RcIu/lHK+BOO0AAqNnKOucGJLMNDCMMct63
         FIdw==
X-Gm-Message-State: AOAM530dMnCbp3hBEseG73Nvn3KB4YZzN6cUAeKYi5d4HQs5g+VT3CRI
        OGEI9/IHOQtZ0STumu1bm9xz64YwrLtIMA==
X-Google-Smtp-Source: ABdhPJwfrC9ZDNHn68Fi6Mn1jXishCHGAfMAf6ZHJ5MivI8p6rLke2bsknx/eSpwXFD+wj09yjYriw==
X-Received: by 2002:a05:6a00:168c:b0:44c:dc5a:7ee0 with SMTP id k12-20020a056a00168c00b0044cdc5a7ee0mr15974796pfc.40.1636542092668;
        Wed, 10 Nov 2021 03:01:32 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:01:32 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 22/22] arm64/dts: qcom: sm8150: Add dt entries to support crypto engine.
Date:   Wed, 10 Nov 2021 16:29:22 +0530
Message-Id: <20211110105922.217895-23-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
"sm8150.dtsi".

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 81b4ff2cc4cd..2af74a11da69 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3672,6 +3672,34 @@ wifi: wifi@18800000 {
 			iommus = <&apps_smmu 0x0640 0x1>;
 			status = "disabled";
 		};
+
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x504 0x0011>,
+				 <&apps_smmu 0x506 0x0011>,
+				 <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8150-qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x504 0x0011>,
+				 <&apps_smmu 0x506 0x0011>,
+				 <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
 	};
 
 	timer {
-- 
2.31.1

