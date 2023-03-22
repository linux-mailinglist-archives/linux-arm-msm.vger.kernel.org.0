Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAFA26C498D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 12:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjCVLrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 07:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjCVLqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 07:46:37 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A9E62876
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:46:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q102so3744154pjq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679485572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBzdk5jveeS/JKT+9yyCQAyTFFXN6rxWCWlR5xuiXEk=;
        b=FQ4oEfEfKyutywrwUKaGClssESWA9XhPfdAqpLdcQ+aSTIQXXEB5QQo2CDKo5Ewsz+
         SUfqfgHA+Ah11eXEgJnZOtfl81edD7qHdIvq5PS8q9hGt3a3FPmDSqr46riXzNZ3rAeG
         4wpVWlHcwjo7VqMFiEWuVV9Uw2Rc8gJ8I/Y6EaMYXpmDnEHT7ASChXBnNyx2mlgxK5Kg
         QIq1K/kPfKSLJ9tn+WJZ17iIXw7h2SLdOx/U3P/KeouXvL2VEumyqPdnvbC0E5niTz53
         YrJuZcc7HWHDszcwD/uOaAjJbn53lWZI5qFs58oeCQCKYJtdoCWo7eLgw/SuBSVA5sz0
         zGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBzdk5jveeS/JKT+9yyCQAyTFFXN6rxWCWlR5xuiXEk=;
        b=zsZJFn4OdxQLyq37TJaL3bQqbDpadEXCmazGVsJjlB1v7JbIHey4gXVwtx5ZyKJAS+
         KPpyPBOZePwPEGu2p0R/sLHV0jqanxFwdKm2E754cQr+0rv1vll6jJpNU6a9xwhGgJAe
         zt4VEUDHcoDyx3JnVdxR1XoPCGEiU/C+j601fd/199HvF4Vpij3P4zkMVKccYQj+D+rC
         bsnT8LO1CEff1YpJxMYK0NMRa658leJIX01cbBQKdx1yID4uXHg2FNzCoEL+CoXc7FYL
         WaWshaNuuMLA4iomGpr0sCGFc4RrU/X9IO0IZYdgOkUS3jRb9U/jukbEI5HuWZaBLlZf
         GccA==
X-Gm-Message-State: AO0yUKWKKdPTEg+e2HDzLXgDeg5Ye6y8tY5RFRjS/k6koclc31KFM5dP
        9xsGq8sSDiZbCjThU7n+yQyRXl6YgFQxcoSgOWk=
X-Google-Smtp-Source: AK7set+CvrUqHkML+6AI9HfZ/fpLkUht5e6QoAHzaL9sYOhcFv2PW3L43Nv4rhqFQKyMWv7AtPBv7Q==
X-Received: by 2002:a17:902:d4c3:b0:1a1:dbaf:ae31 with SMTP id o3-20020a170902d4c300b001a1dbafae31mr3431138plg.1.1679485572317;
        Wed, 22 Mar 2023 04:46:12 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id jd1-20020a170903260100b0019b0afc24e8sm10386649plb.250.2023.03.22.04.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:46:12 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v2 08/10] arm64: dts: qcom: sm8250: Add Crypto Engine support
Date:   Wed, 22 Mar 2023 17:15:17 +0530
Message-Id: <20230322114519.3412469-9-bhupesh.sharma@linaro.org>
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
'sm8250.dtsi'.

Co-developed-by and Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7ccec48255f0..d0fe17d0790b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2223,6 +2223,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
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

