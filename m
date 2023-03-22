Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109DA6C4988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 12:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjCVLq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 07:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjCVLq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 07:46:26 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51CB061AA3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:46:08 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso18846154pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679485567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49XEgaz1wK95phl0NGb6ukHofMpjAnNHJLsVXiISQD4=;
        b=yowy7WlRK5hc22HigoKlwXZgbQ8buRt/BgUGxNx6g5N1KZw+aL7DODseO7mEhddT99
         4ASWA0EjCSTa4URJr9mG/vPAJ3fKSOXXdSiFk/R9O5k5YsU31Wra0yBr/j4MRwqf1H46
         6a8NmIzF2BzgvfRefNQ5XxuDa3/RsqT+lftIql+hLTIuieVlyI3iOpb/TiHoZsFiWVMH
         Anev7hHjwplnDVvI720YgrOd5dPWeiolj1wUfGK8wlIewKPPmid9nZa7IIWaNFOBW8mi
         1OVF87BZCz1gJZvbKqfOhCSMaBCTs7KhDzQ8B/wqnQ8VJOEvklxaMy/VMbgWQ3opMM6J
         g5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49XEgaz1wK95phl0NGb6ukHofMpjAnNHJLsVXiISQD4=;
        b=obHRAx24HiybEpyB35uf3dd2dazhgGrY1HXIPW/mWPUrtN+VGgl2r03tz+DGMq2njq
         l+F+uwJFcfKxOkul+W05+aN8gjzZwZmNrPYXICf2CZ1SKMItL7DcdxeNOMROMy95Ym+r
         rUfIzAAWUXs4lmksa8pTkcbWJXDYma9YqlunNA6AXDO8WQKtt8rjsQnLJBrS0ab7yawr
         c3zN/w3JAPAcKLx6C4Mlc+cba1GxJLzJV2pk6S30p/IqgPBGGbl5v4n5B9pF1fEpQLFL
         10HT86iqQxk4EKRQPFE4Hv6+6sJrsppp9vnor4uMXBjoKHzE3zLDWxGMmWLPD15VTklg
         QGQQ==
X-Gm-Message-State: AO0yUKUSDqM8rF7GL8gHLbemEu7jVMFUsaKhquFl36uUrgL4s/su40WN
        tO1NbhJbTbf3FOKnCcJ4/Z5oP/VIotp7NeeFIYc=
X-Google-Smtp-Source: AK7set+5cLocjBfH5WLntMyyfIutB6JIGXaPcgBSY56tgLik8gG2vBC18ER30dloJn+OmTMhSZCNxQ==
X-Received: by 2002:a17:902:f9c7:b0:19e:839e:49d8 with SMTP id kz7-20020a170902f9c700b0019e839e49d8mr2161408plb.59.1679485567500;
        Wed, 22 Mar 2023 04:46:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id jd1-20020a170903260100b0019b0afc24e8sm10386649plb.250.2023.03.22.04.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:46:07 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v2 07/10] arm64: dts: qcom: sm8150: Add Crypto Engine support
Date:   Wed, 22 Mar 2023 17:15:16 +0530
Message-Id: <20230322114519.3412469-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
References: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm8150.dtsi'.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 662098e85b97..5213e7e3e44b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2082,6 +2082,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.38.1

