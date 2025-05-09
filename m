Return-Path: <linux-arm-msm+bounces-57472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3287AB1883
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190361C45677
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C77F22D78A;
	Fri,  9 May 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6pQFHQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007B22CBE9
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804690; cv=none; b=i/Vc9WGLSMTf7KbKC6vbCE/DoCKHHRxcMFQC7EkY6DTCf7wRETVI+dfg8080OFRynVUTxIECCh56EnxBZvc9YGUbwgBHuO/6w0b8TjR1h+WZGq7LhBH87UlFxQtTtjF5n5gz/gNbrLUpa3Shs5yvO74b7mg2V0gsaRCYcAyAdD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804690; c=relaxed/simple;
	bh=LeyoQy19KwX5w/3s+KN+FjNq3xzGKW8N9LAzi6r0Kzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=be2dOYINUtAmOd81rKUXBfx069u+Apdb8vabNVNXzHZTM/DvwUsywr3XtSedO9+weWJi3XytylEJtJIuOd8r2j/GHeoTBs9pw3nCpjcNPFh5YD7g2EqpQp92Gjrg0UCHDMM0C1+Q1omOpIg4btmGehp71Id3yARTz6V9AHXNktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6pQFHQS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so2008555f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746804686; x=1747409486; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiDLZJcRrTEljd1YBJA3CvaEsLQWz8K9h4SKN5qriDo=;
        b=h6pQFHQS5ybSRd5uK/55ptLxMpMb0fUNCkWZbBmru4euBdLFHdzINhNtSQolLdbGrQ
         llkBE1Oeh4ge/rkJTWKJu9t78xR81TSC0WM4oGgZtrkvtrWZbV0nWfoxQvCqBtavi8TY
         7jXddhra7jp9VM3GASAt0HXcywypUgUJoMJ6Ld31xptmEz5cbYHOO6lVMGhJR552qsX8
         nP1VNSenDRrOb3hV7xdOkImqoi9hDskVm8gwqx6JdfT50XWhoMYCYN5Srg/xVdTVqY+R
         JX8eIWZIKBFGaFbCB6Bnk38bsbAYY1mBb7Hx6tF2Drhlzl55L8tR9l+VTRp41xYgD9ni
         44zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804686; x=1747409486;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiDLZJcRrTEljd1YBJA3CvaEsLQWz8K9h4SKN5qriDo=;
        b=Y11nv4YJuwSW5DgDOFGT+SjOYU4UCb/tvbK0+M1uKORgwBYyEpAJg8t0+lqUggcrzg
         Se+N3tVw2yZiN8ix5Ws9QZXa4b3rrDXw6chLgFL5H+yxiuXXQ6N4uDeKenF3UaN3k8kT
         QTLz266p345TU9fN17NqGfi0zHa8ZcOWGcf+8rJ04MTet26p5g/0ZNk3q4OjNBUxcX0E
         e5QWVyUm/ze9+O2uM0KdFTEEwVVpwYG7F5Szr/2xWnhxalBV2UENgAuQg1dt7kZmqsCf
         1eciIjqDP/AxU7jDiip5206UlRQmEicq4qh/ZASNuvdCFC+u9VY20dleAueymeVAQYXq
         yS7A==
X-Gm-Message-State: AOJu0YyXgWE9S3e8gNh3KnyP7vRudAVdXeJ0oXR30w4kcAJ54374A1LA
	VRHObox1jXt8DU2L/vo5fLmxkYKnS6WdgD/N0L2D6gGo/YcYsvZxwW6L+8GFTRg=
X-Gm-Gg: ASbGncv80REbqnydaCVMmhj5XWG9REIGFS4y5g1LWoTX9xIbjJg19sYXcFnHoC6Qcxe
	XPwSqbfr+X7XBMf8S5ewVFDJsBZ8TezKYcId/Zwg/X8KH3lxYXiHb0LvPlFLnfOWiZ11cI8UMZT
	yk/I3BnTyhG4j58IrYf98MyHddvFZGLyBgvO3KCc1jR7ftVsHbHaen0iY1iGjUXHo1b3WSfQEzs
	DNivGF2/2pynykfsEpNA8Q6Pw3SJutybopnylfhElr/LGMYoVYTAOJ+9kPEBNTxMUA+/9enxEho
	2Fn8EB+BymYNcnkEviiQP/yl12cpvyYFc0EQcazpA9HRTTxOH1cgljXK6mWiUQ==
X-Google-Smtp-Source: AGHT+IFxQZtYDT/4cdnfbZ9+1rwcn+5S/0kQXsA4SYnoPsnyWt96uhiOGnWucMPnfs7HSJj4yEPN+A==
X-Received: by 2002:a05:6000:2011:b0:3a1:f653:26a with SMTP id ffacd0b85a97d-3a1f6530370mr3495793f8f.16.1746804686390;
        Fri, 09 May 2025 08:31:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd53sm3576923f8f.1.2025.05.09.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:31:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 17:31:24 +0200
Subject: [PATCH v4] arm64: dts: qcom: sm8550: add iris DT node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-sm8x50-upstream-iris-8550-dt-v4-1-22ced9179da3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMwfHmgC/5XNTQ6CMBQE4KuYrq0prz8UV97DuGhpgZcIJS0Sj
 OHuVlYaN5pZzSy+eZDkI/pEjrsHiX7GhGHIRex3pO7M0HqKLncCDCQTrKRTGLGmqdeLZPQ2pil
 601OMmKiWeXITBS2UFRX3SgLJ0Bh9g8t2cr7k3mGaQrxvn3PxWv/i54LmNKWxnGneiOp0xcHEc
 AixJS9/hjez0D+ZkM0KCq24MrV17svkbyaIn0y+mY2yqgLrJHyY67o+AVp7RKl9AQAA
X-Change-ID: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5329;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=J3kSbuBtI0TRZiQNDbpRyHUO5yIvq0iEmCWmnEFR3ho=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHh/N08AjjlvyG+fQlqXd6RrGPRD4sV0n7SFha02x
 cShkXLmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB4fzQAKCRB33NvayMhJ0R5uD/
 9AKImk26Np00v/Hj4kNGGDgJ0tC9Aes13L0EWchaI5kQao7FZO/BNCIcOAqE5FnvHbLkudLbWp4v8V
 5T4Q8L31J74N06OmvefNYnDN9b+8wptAT91nY3+PQaMsth3lC+i4qdRwESb8Rs7L2oNjEmMLeAS8Nq
 PFcG1psUEcUJ5it1fsizJZZkaQ7EXO2XiYVOUirFl5c8itnd1wHiiIga0so/qhPH9VpOnijOoi8Pzc
 Wk7K2sMq2CkIWN6Y9ipHGKXyeVczPFhGve3GggIc0+9m9p6ae8TvNGv2ikyy/HXChYKd+3okQ76Y8F
 paoMVybrJTNlk1R0kyFhL8sQeV0XSf1ZWn4k0o+mR4LCUj0cJwxHvv31ssMTuIuTWYHVvJmbnI3H51
 UO8cHNuYhv0R2JV3fuI1PVCF3X99FKhFsTUDaY+WlUcUWl2ua/EsAXUfUfcMzACeVY4Z3df9Spo5K6
 3RkLWztWNg9NeossBRmpQNf7/20q8k1agGkrKNvcgBG49u9mQpcdhqqZ5EnOjjGCCSBlW+uxAC1LYI
 KDfoNeMW+mk1ptU0xkcFY/DvKe8FLnFtoLefEQm+qUD2G3NGJ1iJ0XB4iPMo2Fq7tBUaUdVA27h/j0
 7pwiHkd5En14uVe1eaRYoxnIvtGp19XvITsqVeh79Opw1gW1/ACKcCRCektA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add DT entries for the sm8550 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
publicly distributed.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Make list more pretty
- Make smmu mask more pretty
- Fix required-opps
- Remove comment
- Link to v3: https://lore.kernel.org/r/20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org

Changes in v3:
- remove useless firmware-name
- Link to v2: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8550-dt-v2-1-9218636acbdd@linaro.org

Changes in v2:
- Only enable on qcom dev boards
- Link to v1: https://lore.kernel.org/r/20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 81 +++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..9dfb248f9ab52b354453cf42c09d93bbee99214f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -945,6 +945,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c4bfaf5baa289969898277ee57cef..fdcecd41297d6ebc81c5088472e4731ca0782fcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -672,6 +672,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio17";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 3a6cb279130489168f8d20a6e27808647debdb41..49438a7e77ceaab9506158855b6262206bca94ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -779,6 +779,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index f78d5292c5dd5ec88c8deb0ca6e5078511ac52b7..57c3c92f0f5623c91b37390b340d7777d79c57c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3220,6 +3220,87 @@ opp-202000000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8550-iris";
+
+			reg = <0 0x0aa00000 0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+			dma-coherent;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable in boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8550-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


