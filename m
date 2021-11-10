Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D57C44BFBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhKJLFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbhKJLFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:05:05 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D106C0432D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:28 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so102209pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rsJUSeawRggU7HvC1GGQkny+erynvmNA844erz8yhy4=;
        b=OyyzqvHEGotpRlMylxG78FbvLVcDXUkQRB9SZR2k3eQPQ6grpX3VL05W0fngsblcif
         mFKJMzJt3T3SGWco6pXk7UOsCfYx8193kD5pyUN+bRj5S3BJbJAFw1z56sNPQhvxcS+M
         bDpMr877A1sPN45e4frzLakQHBWZWm7pIzNOXlZsowU5vG8ZHhj8q6UzZ0GuZ4KTD/Pb
         nFBMFLA1FCdNkgS70sGl+kOPcYjbair6Hhn8GzkE4+In8y7nVXUV6TeVLi89IFfhpthR
         SkQ6mqZ7uWjbcHs0BIOtlLj3OllyKOWgjSI5Ek8RpdXQqRMd1mCJtWYvh+8WNCaMiXV4
         w+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rsJUSeawRggU7HvC1GGQkny+erynvmNA844erz8yhy4=;
        b=OOR+VbzJliofI91/4O7Y0Vm1c3KEjDQGvOO9PytiSuYBACula9pQRWuPhtOOyLDzdk
         96iRPKHv92z3B1JpbQ9cmgBwx1m1lUHgkqpRmJzQF13s0P9CBEmjw2+gj+4bttIPbcJw
         xOJ+rbdyJKo1ArkkwaEa6BfJJQvQSQ/nockALTNXA99g4FzKGRSf4MYKgYxlNobDDCO2
         DGygVOgSUnlswgD2uQ6kdOqcJMTxCtP+RUA92Fv9c+4Uu+7kV9ZHnIrUaThi6nUjhBjQ
         simmkjJwd5TIyJ7NS1bLsh1doH5K5tI/S9+6mLtrhoqZqZv/pcsobLx0irncs8nqTRyS
         jtYA==
X-Gm-Message-State: AOAM5333hTaWPekzK5ZHEu2UerWyg1PiTm/ufV0dXUgQl2MO7vzPfVSM
        Cad18d5ArvVKbGle3Qa52LihP/pXNKj+GQ==
X-Google-Smtp-Source: ABdhPJy7vzX+EY24OxB4TyLtpk5RbdKef/4eabLR0cRiecJSxnS2mbbv6xg1MFUEyNQZdrgavNUJNA==
X-Received: by 2002:a17:90a:bb84:: with SMTP id v4mr16003228pjr.4.1636542087735;
        Wed, 10 Nov 2021 03:01:27 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:01:27 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 21/22] arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
Date:   Wed, 10 Nov 2021 16:29:21 +0530
Message-Id: <20211110105922.217895-22-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
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
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 6f6129b39c9c..691c28066cec 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4104,6 +4104,34 @@ cpufreq_hw: cpufreq@18591000 {
 
 			#freq-domain-cells = <1>;
 		};
+
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
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

