Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B5052FF6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345748AbiEUUfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345557AbiEUUf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:35:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2278A393C4
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:28 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so19564753lfg.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C9xhV4604cnunsv0ioP47Wr0e6BQa6QarxevuPKw7QI=;
        b=bh/RvFpmIjS7eRGUbitInRvzx5AOWhesctSMK/+KlRq5EtZL9kx3+w+7lrNTOHevll
         LXqeqyRi24q5RXXkY/oRM9XuKw/vepvdAZ4zPCQv/N3aF1Mmp0vDNQt2qULfEZsxqbQ5
         Yf+S1XHY03sBtdzpZ/4Y+w3yd6WD1r7UPdl3SNZuA4L9ICmdsPF+j+LClcQmNJNrWeYZ
         6ECBoEFla8kmkBfrZgKMIo0rqV5uKyyA6dngWhqXPgf9H4YaMC84tsNrG+9m9BqWnFKW
         Bbxr/8I6A4PiyxmMhgXlu95brdmLuFTIxBONWB9Vz5vbA2ZGI9MZUvhpI2Iw0OQp1Luj
         ya6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9xhV4604cnunsv0ioP47Wr0e6BQa6QarxevuPKw7QI=;
        b=kZj+CiJXVBZhrrtzQnhk14VlDdgeEhgIESf6P7RVcn0m7YqwNN1drh8p5Rhb4yJh0k
         0GU8A0/e4xZESFRQI69baqSXqGPurUKxW9YR732+ngrn7nwLSl7sAX0osF89mGEkfVPv
         AH+iQN8BTJBF/iNZPIwdlYTZewlPCxewpDC67j/dx2YHpnQpAONZXv8UoRRrsaed0Rfo
         oSLprPzHEwsfJVxREUMeIGydlptGQXENOB7ZLyVRgvLZZCsLPVYmfU8obP/7EaOgS8Rk
         JeqUH7n6D5n76TsyyI0Ffk5fpFIznxBP0VRqKrKBtBdBOVFeRju0KkHxs73QYdMJEZE6
         iJ8Q==
X-Gm-Message-State: AOAM530Jo7JnDdY3TwJajj3XlZm/5Mqr6PwZHk6UMn7tBVM3CPeakR0j
        EPYPgT2WWaKHx6XvubHdd4YfYA==
X-Google-Smtp-Source: ABdhPJzT3hNdKmvoNExx+ACfLlWREVnaAuCmUg2q2LiymcqEmrodQ+ehiRP73kKY8Gf9bsR8R/+U8g==
X-Received: by 2002:a05:6512:c1a:b0:478:595c:e2fe with SMTP id z26-20020a0565120c1a00b00478595ce2femr5120276lfu.45.1653165326467;
        Sat, 21 May 2022 13:35:26 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b00477930c48dasm1179729lfr.184.2022.05.21.13.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:35:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sdm630: add device node for the modem PAS
Date:   Sat, 21 May 2022 23:35:19 +0300
Message-Id: <20220521203520.1513565-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
References: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node describing modem device found on the SDM630/SDM660
devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 55de345895e6..25b0067a93af 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1006,6 +1006,65 @@ data {
 			};
 		};
 
+		mss_pil: remoteproc@4080000 {
+			compatible = "qcom,sdm660-mss-pil";
+			reg = <0x04080000 0x408>, <0x04180000 0x48>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended =
+				<&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&gcc GCC_MSS_GPLL0_DIV_CLK>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "iface", "bus", "mem", "gpll0_mss",
+				      "snoc_axi", "mnoc_axi", "xo", "qdss";
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&gcc GCC_MSS_RESTART>;
+			reset-names = "mss_restart";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+
+			power-domains = <&rpmpd SDM660_VDDCX>,
+					<&rpmpd SDM660_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			status = "disabled";
+
+			mba {
+				memory-region = <&mba_region>;
+			};
+
+			mpss {
+				memory-region = <&mpss_region>;
+			};
+
+			glink-edge {
+				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 15>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		adreno_gpu: gpu@5000000 {
 			compatible = "qcom,adreno-508.0", "qcom,adreno";
 
-- 
2.35.1

