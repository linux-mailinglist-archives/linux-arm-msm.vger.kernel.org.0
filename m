Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D933468F737
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbjBHSi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbjBHSi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:38:28 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F78D522
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:38:27 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qw12so53417663ejc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3EO5siwdhGpkelYPYEIcK9+XxHqnaj+3eHiFrzR7l0=;
        b=WshMmb3W+09KjIoeUP1uAeVHbEeyyAIzdgDymmxrCu+bj0OobG7Sw6/TOt/EYF7L+w
         BVyW+1DPAlXCukjEqeUFdPbHOJ2R0KPIKpFuklmwzStCEPfUhPb160Gf8flLK4TxSfoU
         ae2/whHNQAkpJeXPKeng6lMaxu/VXGDLpuTRhU7HjTfYoc2ESAPhtB4nchgyINRH5UbP
         zaQZiKO9+URY8Ky4UMGoHt+Rk523jXav7k7AEJiL8+uG/DsIPErScpUmX3uNgkDiBvFA
         XUrlLHg1BZNTUclbsaqlwxRsp3Vxub0ImQV47s4y2MGXic2arPsSUQzZaLQLUCQx8vmA
         mMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3EO5siwdhGpkelYPYEIcK9+XxHqnaj+3eHiFrzR7l0=;
        b=3gjBtsiJ0LsY8NJ4/eLnUucY8wRDkk3zFzl6ux71kqC2E4bDj2di+gin5emC/UvZff
         EtGIuj7MRl0geFiaYQZqmJeXecIIC/FFaXgzghZ07sfuObTk6N9YVzj5JUVdHb0AKL26
         jBZ7JOhpXnNi98EX5jxOvPJvG5XKKLGliwucftSdrPrB/ZB1KbZ1/VRvqpoojI+NEmP9
         XhmvH8hoeBEzi/Exhn+nU4vkQpMOo10dgVdS+tkVv3MUYqtfN0E3tbxfdd4hyQ0G8deH
         sVaNCBExkxaTV+XbsDFgPrnkglKXzu2J5CE7Wyc7kCev0SStg/BkWXWQ+6DnDi8BAn5B
         AHQQ==
X-Gm-Message-State: AO0yUKXy9jlqCEsMO8lDhwBd+Qfow0q0XA6zq2cn22DBRJDl2a4wJZYq
        +01Djk283QDnaQSclJEWBmuBLA==
X-Google-Smtp-Source: AK7set+MQnEt0EjwbBUXBv9Max2YvnT4UFCtu7Ky/NgIX32Bwh6SdCSEiaWBlQSub5VYHXJnMcETmw==
X-Received: by 2002:a17:906:2098:b0:889:3d10:ae93 with SMTP id 24-20020a170906209800b008893d10ae93mr8112409ejq.6.1675881506124;
        Wed, 08 Feb 2023 10:38:26 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b004aaa8e65d0esm5179663edj.84.2023.02.08.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:38:25 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: [PATCH v9 11/14] arm64: dts: qcom: sm8250: add description of Qualcomm Crypto Engine IP
Date:   Wed,  8 Feb 2023 20:37:52 +0200
Message-Id: <20230208183755.2907771-12-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add description of QCE and its corresponding BAM DMA IPs on SM8250 SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e59c16f74d17..d8698d18223e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2215,6 +2215,30 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <8>;
+			qcom,num-ees = <2>;
+			iommus = <&apps_smmu 0x586 0x11>,
+				 <&apps_smmu 0x596 0x11>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8250-qce", "qcom,sm8150-qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 6>, <&cryptobam 7>;
+			dma-names = "rx", "tx";
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+			iommus = <&apps_smmu 0x586 0x11>,
+				 <&apps_smmu 0x596 0x11>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.33.0

