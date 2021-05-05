Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02BE374AB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234938AbhEEVl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbhEEVlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:41:04 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E0DC061351
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:39:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so1744205pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e3tF0fKUCMUyKii5LLb+0W4Qsi0cFNspuvqMpLYFV6k=;
        b=u/Of22GLFJE2eKTv36F1cFasXy8NMQLIsXpJRN7knibzKd/OCG2Tn+Be3Eug506BmH
         QsIqmIfxFNiewYklKQ6Qf5FpNYkipqYaX8tDPnFVjyw+5d1pT6yhtpPZQANmW/ys1dIr
         ZSG4zRXBXWa2J9QzutqpqxWmVCNwycER67xWzGaRu9AvogRPSieaAY1MSiAb+50vjFsJ
         smIyEZt+PVE8cA5HEVxWQ9RhAp70YQktkUhGJaD8E6w8CoATbrB0coT3LlejBOrJKfm4
         ApaHW6sRHncSgSa8WE6d4TvnZ/YlrKZ2tl47q1qHoKhjA77fNiR9U2XaKwU83VvIcIG0
         vT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3tF0fKUCMUyKii5LLb+0W4Qsi0cFNspuvqMpLYFV6k=;
        b=bbhtBrjJQVdLHQRVrv/Q/qwuRqGLMDpUz5RRtLWyMJ+rHZESMD8i5nQKGE+mWbeiRp
         Tv5kDr8VHgcGUurCkLEs2KBPm5UJAmQ5OwrbZRgSm+k3QZjnvLVC9kH2kpOHrRrLCGbm
         3GQpV9eiAaKx+MCBHxXpiecj2bQznGttC/yXmaRcrBuuDPjFfZUl+Jp6DzOrXu93NOo9
         YSEmFkPzQrqMAk6B5NLXa+CIVJkdtkXa8kWnN+kVGQk6T2V/mSVJlA4G4SapVkO+nTOT
         +VSAbX2Jx4Ad1mt5pddMNBnYRpxtDD+mnVj7p9FirAOo/PVCVjTaLVLfs1klh2i3/cUd
         ypaQ==
X-Gm-Message-State: AOAM530sXQ2WqBjbHTSed2wTSJcebf/Mlg625kbtVZkOcfaT6Hl99x1z
        +0INQ7tTQUbqM9I7BHcxD2xbl91oKczcUw==
X-Google-Smtp-Source: ABdhPJwLoU+W/goJcXpIScKgIuMNJgQX3eUKHlYvuWyhf6SjstywoX+HrXzLPj3YfTKq+WFNQrf4/w==
X-Received: by 2002:a17:90a:4e81:: with SMTP id o1mr13200739pjh.7.1620250789083;
        Wed, 05 May 2021 14:39:49 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:39:48 -0700 (PDT)
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
Subject: [PATCH v2 17/17] arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
Date:   Thu,  6 May 2021 03:07:31 +0530
Message-Id: <20210505213731.538612-18-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
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
2.30.2

