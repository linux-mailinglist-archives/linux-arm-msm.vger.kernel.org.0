Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEEB52FF6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345810AbiEUUf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345750AbiEUUf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:35:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB30393CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id l13so12893338lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xU1pY7ZmHzq1qWB+fNbq08vc5F06jzd4+OCKJVFnSMg=;
        b=PUqGn2M/XUSc8dj832XHXodX2asafqhCmEPRhoaWB/Mtl0lP722i12dydMjkSblNsJ
         WeoO2rpnfk959g0/uDsbO7VEeb1fRZ4g7lj3UT8vIj80rSGE3sRkP5SIzg1TwdRA4bQP
         4lk6vD65t4Myg/xfyz2zRZe4Q8MW+XV8FpUf8KuKueecxH+VUl+fZILZh+tJmKaMbh2g
         lMtFHPW+YDty+2UN7IpmOtrbSUmhsovOVwhRvqHy4HqkhBolG9g7J5V0HNOWiUoxJqg4
         zeJjVjOGvSXfGyrxA3V68Sya//d9PlL4f8bDNUmRRVLa12Vcqh8QwIA1zazoD7sRqkQs
         5nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xU1pY7ZmHzq1qWB+fNbq08vc5F06jzd4+OCKJVFnSMg=;
        b=AbwgQ3zHKZSvCK9bMEU1coArXDrZTihKXw2VcUsUzFbKALXF4eK80pt1RdjvpqCclo
         PAsu0TkidhzZbqNm70z5CO9/8G8zruRvM2rWj+XCXA7pDKLpYrDCNbdddnhQzRsCadPD
         DysjM0hf33cJmUip4iZ2mo9yyHzWzoZGyP0PSfMA+10ZzTYmjkgzVrxGZTOT5VMNAWuP
         pUTsng1HrTE5uAWBhIjO8t1wIOzl9LGWUTOgP97e7vnZsnKJ3SshrQNs2wbPX+DQzkXm
         RGzgnuA+ZOrPs6x9XcrI6V5T7UhhhOgJ/D+FODRibWL4WV83uvSs8jbGqdk3g1jqSkil
         othA==
X-Gm-Message-State: AOAM531TGhqPWblzWhcMp5oISF2BDn/oD6ei00NkFLmxS02ZEd63PBCU
        S+aWrw0vzuo9H6KNbFPoEYELTQ==
X-Google-Smtp-Source: ABdhPJwB0tI2NwiWmPCLCvUQQhXiaVp8RrpMpOO9wEKt0phUVGGKZhUdWjibOURZpk5njS72Gy59mw==
X-Received: by 2002:a05:6512:752:b0:474:40ca:b0b with SMTP id c18-20020a056512075200b0047440ca0b0bmr11462140lfs.633.1653165324927;
        Sat, 21 May 2022 13:35:24 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b00477930c48dasm1179729lfr.184.2022.05.21.13.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:35:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/4] arm64: dts: qcom: sdm660: add device node for the compute PAS
Date:   Sat, 21 May 2022 23:35:18 +0300
Message-Id: <20220521203520.1513565-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
References: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node describing CDSP device found on the SDM660 (but not
on SDM630) platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index f51f5b27819f..1869eeaff066 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -16,6 +16,74 @@
  * enabled upstream.
  */
 
+/ {
+	reserved-memory {
+		/delete-node/ tzbuffer@94a00000;
+
+		cdsp_region: cdsp@94a00000 {
+			reg = <0x0 0x94a00000 0x0 0x600000>;
+			no-map;
+		};
+
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts = <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apcs_glb 30>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	soc {
+		cdsp_pil: remoteproc@1a300000 {
+			compatible = "qcom,sdm660-cdsp-pas";
+			reg = <0x1a300000 0x4040>;
+
+			interrupts-extended =
+				<&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
+				<&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&cdsp_region>;
+			power-domains = <&rpmpd SDM660_VDDCX>;
+			power-domain-names = "cx";
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			glink-edge {
+				interrupts = <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>;
+
+				label = "turing";
+				mboxes = <&apcs_glb 29>;
+				qcom,remote-pid = <5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
 &adreno_gpu {
 	compatible = "qcom,adreno-512.0", "qcom,adreno";
 	/* Adreno 512 shares the frequency table with 509 */
-- 
2.35.1

