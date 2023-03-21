Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B38A6C39B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 20:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjCUTB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 15:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjCUTBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 15:01:54 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94D556502
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:46 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso21360534pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679425306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0byJ4vgio8oe6w4cixjPFeMGxbOIjvzLVMg1AcvrT2g=;
        b=eVociNZPk1ihgjTKAYBMNaIVllkWuINxLMgVXNLWbxt0Y5Py9oJIm5t/9ZhgMdxaye
         FHVV/O03SVv3mhVijK+pZSGvOk8ZWCh/mGqIXRz0AUFFzsD/GPVsVvulffsW1KrqI5mb
         aQuWDLxLTd1zF5gak3gQmsND4bbv6J/iy7DEUc+rmhZ775NiVzzAq/XiASJjDTiVTCR7
         yZAqsbaOf61BZ9XH/3Hg3K8oIXEwjTWHZuFzOjFvx+KDBt6JCwavgK2mFTnVFfMSean8
         GstC56VcWwKklCwgwUPosP5e4v5qAecv/TdpTU4FjKcFoG5LyP8BojTapt3b2jP87EPh
         +XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0byJ4vgio8oe6w4cixjPFeMGxbOIjvzLVMg1AcvrT2g=;
        b=YKYKZ1th9YNGaFMXoiN83R0uP2HSBo5z1ojUYN8VsciSX6KICA6J9UtlqffsPisuyq
         53mrHGhZflc9h0GC3IWkBr/owGP/y4cyrPV/DOt93KgdnfPZybtabUxfaZbRxQOfq0RH
         oY5e0OXorsWy4VS5EvqZXK6yQmzXgY4di+iw+0QJcTNthrFV6Az/qwqnqwGXKVU9fXNS
         L61o7if/fGFwmXaqVoHu3lvcTnYvd2kMKJsMn5O+J4ZAH/gx8izD3IY33fn8haSJZ2kQ
         bXEDyfKCLcWM6EQ1I8JeW2zJ5hYDImGldiE0pu8VgCTUHH1DictQs30a5eggbShPCOmH
         01Jw==
X-Gm-Message-State: AO0yUKVe4YgPbpyNV6HTc9eqzjdHdf5+McaiW/3Xbx4XUm1LC1kYjI3r
        WbitqpSbYERv8EzKyYrlPrUlwYvub8EbTL03rug=
X-Google-Smtp-Source: AK7set+JUbJAgx+r7OBgHRusQUNMUpSQk1iNdJ/I/KBXYXlJpaVZ0xQ9m6W9q7U4H7i2XH3dUKwgQg==
X-Received: by 2002:a17:902:d08c:b0:19c:a5dd:fadb with SMTP id v12-20020a170902d08c00b0019ca5ddfadbmr59178plv.54.1679425305897;
        Tue, 21 Mar 2023 12:01:45 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709028d8900b001964c8164aasm9043453plo.129.2023.03.21.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:01:45 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: sm8250: Add Crypto Engine support
Date:   Wed, 22 Mar 2023 00:31:17 +0530
Message-Id: <20230321190118.3327360-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
References: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm8250.dtsi'.

Co-developed-by and Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7ccec48255f0..009e992d2d6e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2223,6 +2223,32 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x584 0x0011>,
+				 <&apps_smmu 0x586 0x0011>,
+				 <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8250-qce", "qcom,sm8150-qce", "qcom,qce";
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
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.38.1

