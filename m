Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8D574F26A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbjGKOgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbjGKOfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:35:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6F61738
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:35:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so8598322e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689086122; x=1691678122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsIqWYC9/diWISQr1ELVqdM7UPfiMlya6fflWvKUqUc=;
        b=C9HzQSY7qbYF7DQrVuV45BdThQ1q7mr6ajP4SxckGWTD0eWJ+QSt+I0Fv/eEFc8XVe
         VW9bt2f04Bcim7GKBHcXOEevpWjaqZa8X8vhAGaIlARtDX55Ac7XRpHXqCMbO9wnO3jq
         o8w8l6Vmabu9PBVWHH7DaIvIyZ96KwN3fKG35lccrxL2LZKuonKvrZ12wPxpzMjrMzM1
         SQfPLL+3DhtimYBTWJO4qOT/LcwFWYXUjOA1pru7wtc7Wn9Qx1ktPHgpqaSR1MxzDvR+
         sFTDcTfIaggOYegxgW8fsa05dIwLR1i1dMZ92GicSU8vKbQWBF24y6gpvNdEJBhMPjMO
         dW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689086122; x=1691678122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsIqWYC9/diWISQr1ELVqdM7UPfiMlya6fflWvKUqUc=;
        b=Hjcfo5ItiC3EriIK3IN1rUdcTz7IYwqukqt6fPoXQKthPbOTGOzwPJ9PeezP3O4Qlm
         fTQFU6XevaOWsLM05rfMg3hsP2AtURKRjiH9DLyQCAoS3p5CsAPZcwrvmziUA0XzRe/B
         i3lpCeknbgT9oNwoKmIFjuxmG2zXPK5idYGH/S+sXETaHZFru8MWBZuzdIGY5nQ9mBVP
         pdvu8vKdBxgMUlL7Ji33DIwdH/kWACQfNy1ku9SLyKQ+MoLj4fbANFbni89m16X0QDh4
         5Gr45x/BrSmzsMGAzApAdDT23TG6fn5+2V53ehzEW5rDu2MuaJseSfn7W/5BLkKJH+Gi
         7vbA==
X-Gm-Message-State: ABy/qLarzFb720EuhD3NTBDkLlgaJvP7Y/x21D00JxZcBpVtJz4PqyWU
        AXwUupviAkl/IRAc4//8BNC2TA==
X-Google-Smtp-Source: APBJJlHMrPzRYvNus54mewrCEndyYiWMbpP50sNu4jQM87SbQ5c2iO3a0v5YJmfbwRuMml6nyEau2A==
X-Received: by 2002:a2e:7c1a:0:b0:2b6:f85a:20af with SMTP id x26-20020a2e7c1a000000b002b6f85a20afmr6512049ljc.4.1689086121846;
        Tue, 11 Jul 2023 07:35:21 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e90cb000000b002b71c128ea0sm484221ljg.117.2023.07.11.07.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:35:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 16:35:16 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm6350: Add BWMONs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-topic-sm638250_bwmon-v1-4-bd4bb96b0673@linaro.org>
References: <20230711-topic-sm638250_bwmon-v1-0-bd4bb96b0673@linaro.org>
In-Reply-To: <20230711-topic-sm638250_bwmon-v1-0-bd4bb96b0673@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689086115; l=2717;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0XE3+DwbePvBDrBAILTBPGuFKg1IJ0tvtE/4fmfHL3g=;
 b=Q1Ph6t4Tb0bPztBcT/QeOqbjmwx1KKiJJz4quBT8sWaMCl4zkOn81Q9Au3JxmbebyjiRSxBFU
 LwH7Ic5riwzA7p80kIXPOIMHQUT3c1Gcop6wzfXssnCfhrH1P3LjOao
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CPU and LLC BWMONs (skip the NPU ones for now) on sm6350.

There are 3 more NPU BWMONs, but these are skipped for now.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 97 ++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index c2b5d56ba242..8f66306d1de3 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1723,6 +1723,103 @@ npu_noc: interconnect@9990000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		pmu@90b6300 {
+			compatible = "qcom,sm6350-llcc-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x090b6300 0x0 0x600>;
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+
+			operating-points-v2 = <&llcc_bwmon_opp_table>;
+			interconnects = <&clk_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			llcc_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <2288000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <4577000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <7110000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <9155000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <12298000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <14236000>;
+				};
+
+			};
+		};
+
+		pmu@90cd000 {
+			compatible = "qcom,sm6350-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x090cd000 0x0 0x1000>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <762000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <1144000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <1720000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <2086000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <2597000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <2929000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <3879000>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <5161000>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <5931000>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <6881000>;
+				};
+
+				opp-10 {
+					opp-peak-kBps = <7980000>;
+				};
+			};
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm6350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;

-- 
2.41.0

