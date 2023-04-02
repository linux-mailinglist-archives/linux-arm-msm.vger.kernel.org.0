Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB1B6D3703
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 12:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjDBKI7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 06:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbjDBKI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 06:08:29 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4B79005
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 03:08:04 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id bt19so17336798pfb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gaq2pRYkVNQyPJ3XRF2sgEEJ7K2B6BxZF4eeMfjNR0=;
        b=Gpz6VtETaK//avdhCorrlMmSppv7bZNZ05V/38SSYs1jShO+ddJ+H44PZBH4+dhDeK
         O91qo1JzVuicsuTwKStAPsONstVfhAYwUh08ePzXXOF5LnYzFprDXzEFziInIwc1xtwH
         ZWCNms4tHDCF91QMoVtiaIxRQVXHkL3lE13d/kVM7c4CsNbfznhM1gesdrY+BG93AAxc
         OeLDMmURbjO4hvPaQ9EIXD8UWDwWhk28YeWHjL6Hnebf2jfnwgRuCtH5/X1311mytVrV
         tzNagQUZlgWGaWfC0JAnMXn5t9LMlOeRlHPEocecKA1yz8bgRUnuoBzVfMUlsUcj79YN
         AGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gaq2pRYkVNQyPJ3XRF2sgEEJ7K2B6BxZF4eeMfjNR0=;
        b=uL7UhlXcvVJJuljHfwI9q1zVldlW7qM/W5apLvskq6sy+0CDoje7XLwmFD8d/LybBv
         yBA6FexPxAbYbFd923OcsNJ5BL+ATAP1BvJKlU3VIqpIliHAKOFvdakTBNkSf8rOsdoT
         U+8bTGzDFcnCl6Md+Vuc093OtWCmTucdEq1yq2OJzHRhe7mnCf8iUDZleUBvgeGLifhI
         wndHjyZyL0jmSobJygTiusPBByFIkWWxV03Supv/MmC5/wBenMEX5pL0wrStq8P6EbjH
         CNkF82c9uZSUE1jwUjM1JqkiwVU3/znjTFWNJRx7qe99ivOUJaBW2DjbL7zgKz06/8y1
         Gbww==
X-Gm-Message-State: AAQBX9eQYyyW/RpE1qRqVt6b6i6aOhYPK+ov6UL7ir7wjs/Cl/TKkp3T
        9hKzW/KLyVR/1eLPqN3sQxa+vE4F0/MooVvF8Jw=
X-Google-Smtp-Source: AKy350YuxMue21NEafG9PkfCA0rGV2ay1vqXaEXI0PoKX0TC8l2kEObFvVIagv5j+GZ5oEEHBniqtA==
X-Received: by 2002:aa7:8f13:0:b0:626:2ce1:263c with SMTP id x19-20020aa78f13000000b006262ce1263cmr30701528pfr.5.1680430079934;
        Sun, 02 Apr 2023 03:07:59 -0700 (PDT)
Received: from localhost.localdomain ([223.233.66.184])
        by smtp.gmail.com with ESMTPSA id a26-20020a62bd1a000000b0062dba4e4706sm4788739pff.191.2023.04.02.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 03:07:59 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v5 09/11] arm64: dts: qcom: sm8250: Add Crypto Engine support
Date:   Sun,  2 Apr 2023 15:35:07 +0530
Message-Id: <20230402100509.1154220-10-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230402100509.1154220-1-bhupesh.sharma@linaro.org>
References: <20230402100509.1154220-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..2f6b8d4a2d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2222,6 +2222,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8250-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x594 0x0011>,
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

