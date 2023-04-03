Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CBD6D4F1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 19:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjDCRgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 13:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbjDCRgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 13:36:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A22B2D71
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 10:36:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g17so39096299lfv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 10:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680543396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex9xMh3gTSM9WsBX8GKkun9yHoiTNR6HSOi61NvUkJ4=;
        b=JDcOz3RDyN2tCPMdsvqcqYbKTyzvtaFqA5GNGQl4FLOh9wKoeIe+R/dZThobD7OW0u
         Dy0JWPoovcTSBlHB6dpbBbCwoVxyfUXbHjeWHt6bXdq7AO2nXkaE86VhKmPv2SkePndg
         kCexQDl2stywhKwASbizHd9WZYg3tsEqqVOjin1KrQPtgbONYK149yyrpdSHZt0JLBIk
         yC22Veeasv49NZTor6oIGkm6KW38SqeC2VLAZgR2Ofml1bP7Glf2EB9sRIrS+yiansPE
         9dMbE8Ye5BvXNoD78GZWFhC4uOw6DWC4+hhjykg6RjABqRJFiBpZhkbf1hZqKu5NMmMU
         USkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680543396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex9xMh3gTSM9WsBX8GKkun9yHoiTNR6HSOi61NvUkJ4=;
        b=iUODiUbXR7DhTyFWfAl+KGG0KOWxB9JoD+Hu+xKMmOJT3PKVlLpNpNDnPBtjc4d2mP
         vxG/PGY8tMn9UNqRJ6n/6kyWKLFORyf2i2tULal752+eYgq3pEwaquZyAObxnIp/hf/O
         MzUtWocB0+Ur2vCfhZItzUSW8rW9zmtYo8kYTNJ9UYnptLPzzbxXvjqmrBr6M9EGAAdW
         /7H/bdinznHXG9IoioAZuO0vrLS7oM2wq/bcs58p1CDZ1VyedmYs+5cMmS57U0EgAHf0
         YXqoBgp2SsBZaL5M4Q/6HC+YoppGqwYzTTdSgvTVYGO5VrlqBU6KIAL1jCcPJNL3quVx
         PfXA==
X-Gm-Message-State: AAQBX9c8ye/KqbFmR/SGw0SxnOZCHittcDjxF0ouWHYMhwxUgSn9S6Di
        A0t4k3B0kzbgIbHmoCwN3yBPjA==
X-Google-Smtp-Source: AKy350YntZxpo3g2emuMEmhY0XXKIE8FpOJQ085+FpDa2adyMwMmJkW8wRwdVN4izo1Rqn+H39eYkA==
X-Received: by 2002:ac2:5fe6:0:b0:4e0:a426:6ddc with SMTP id s6-20020ac25fe6000000b004e0a4266ddcmr8140551lfg.0.1680543395858;
        Mon, 03 Apr 2023 10:36:35 -0700 (PDT)
Received: from [192.168.1.101] (abxj135.neoplus.adsl.tpnet.pl. [83.9.3.135])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512096200b004cc5f44747dsm1871094lft.220.2023.04.03.10.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:36:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Apr 2023 19:36:05 +0200
Subject: [PATCH 7/9] arm64: dts: qcom: qcm2290: Add ADSP & modem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-topic-rb1_qcm-v1-7-ca849b62ba07@linaro.org>
References: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680543384; l=2821;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nI7O0aESNOZQGnI3AVXtPe7EyrGGV5JwTPh0CcsLkO4=;
 b=nydKnQCSIvvJ3+etpcfYj7n3msoWDjHiV9UWtay+QyGjzkZ22zdd4VPoxzP2f4tbQ40ivpQJvDLE
 2YZgfECkDvet1d7VCwKKY44ZpcT/oz3bhDSqrSCRCL+aiAkV5P6n
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add required nodes to support the ADSP and modem found on the QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 73 +++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 228a1d94501b..825623243787 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1013,6 +1013,79 @@ usb_dwc3: usb@4e00000 {
 			};
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,qcm2290-mpss-pas", "qcom,sm6115-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			power-domains = <&rpmpd QCM2290_VDDCX>;
+
+			memory-region = <&pil_modem_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+				label = "mpss";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 12>;
+			};
+		};
+
+		remoteproc_adsp: remoteproc@ab00000 {
+			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
+			reg = <0x0 0x0ab00000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			power-domains = <&rpmpd QCM2290_VDD_LPI_CX>,
+					<&rpmpd QCM2290_VDD_LPI_MX>;
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		apps_smmu: iommu@c600000 {
 			compatible = "qcom,qcm2290-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x0c600000 0x0 0x80000>;

-- 
2.40.0

