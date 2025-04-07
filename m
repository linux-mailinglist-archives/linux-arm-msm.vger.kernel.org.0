Return-Path: <linux-arm-msm+bounces-53372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0FFA7DE72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 15:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1846E188B050
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 13:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28B92512C6;
	Mon,  7 Apr 2025 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9Qg/bNE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450722DF8D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031019; cv=none; b=QhsaFPcxQ2wlJLu2u8K1JO7BEDhHbn0TgfaFOP+j8soFYYXCuM/qKSuYY8h5A2qiBZ1vLdyWa9bCxpcSfFJ8NxTDdYHjiEB+NUaIEVjvF4RemZTlDvm+XyHWpERhqhH2BNu8clnuRTM4lxj2ecHXcHXhGy9/sS9Cp4XtW6Qme7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031019; c=relaxed/simple;
	bh=wpl/vPTJcLkrNzhp1xfRr6rd+jBzkVczwVjNbI+aCoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZuFzwZkq4bMKm2umfCUVFCb0QogSGsAM9HLFR+lt1rSCJrsTFpkePdUyJQayPVkOZ9Oak0vrKuHfcDlTK8N4AnjIQy3KAtq4JYy501CG0rspniK/TYOVOkMC0Aph/dzk+CkwSYzH7nQS792eBRQqavXqcRxddiuVfL+CojhrvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9Qg/bNE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so29426865e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744031015; x=1744635815; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nSsCIjvR/DpqlZr0dy0a5YzR+QYHTqH+auQ/wAPHhtA=;
        b=s9Qg/bNEC1zsYHUP7WTkNbEyjWTFjmO3PhdNFGkrF6aWyg86zC1VmP82bRN4P6p8+0
         141XYcjeOjSI+h/6i2B1mHiq6ckV4s3d6W5xPMjCLe4T96kZcfVk40BzhtbcvWVei7Mb
         rakpH85gSfmNNQwHTSq9BCBlhQulGFBKfDxO9ZfxHTHsx597xKu0cR+UNRskcvDFP4+p
         HR1Pdf10eG4mPFGd0dVtXUTaw6RSfGjKDDJXAHVyYl0LcG7u56J/Kwd1BwaNYUMOZyzT
         a8UHNJDlknqtWOD0xz3iH9EdnlBAR9/oiRo7KWgm4ErUCPjbaQn4U+l0yRoC0fWXmmCX
         SmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031015; x=1744635815;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSsCIjvR/DpqlZr0dy0a5YzR+QYHTqH+auQ/wAPHhtA=;
        b=IXuT0chDDsDQPfUjuu49yu2PbyEkSnauwvYHVO5lt5RAC85a8Etqa5a4Dq/cex1jgW
         x/F3leDe59yHnhP60BjdLkSfSCDfYFf4Hej90lp4yhmsyonPGq1jYzWCmJzdgPXuEZ13
         47IbkalO9kt8x7akY6cndt54IzMBDKche0NyFo7lz+Tws1fnwmPLIe9WPxtCMemU+/Wo
         fQDD6UssnF0PxoGNacr5/qcbdU+i4GuGQ7c6/v41t3g+jaGDV0fYB8yTigwY4LY+w+rV
         4QY5mwzRYhaJ2Pu0sWkM6UyCNVB4ttEGhxqQAFEcI2TveM3ebPu9tcz2IkUNXMIh5Mgr
         YN5w==
X-Gm-Message-State: AOJu0YyFuYa17oO/NoRFXSv/IB0lAMHSZzMMFG/5I80Q/vEoBWRPgg7N
	jK3BhTy6LaWgQdXaYK1pgPpGDr+9lXpxp9boiIxtPICVBknFQ2PiqZRglmY20yM=
X-Gm-Gg: ASbGncuvJ3DSzT+2NoMJJnBRr7KO1i7pNd7Dqz19PUB/kPn8q9OApU7xvmL1YEysmol
	9ZrdELC6nFQU81briyiRE6ASFinTDkbZN8mv9VfRQpS+ROnAEx6e8JpFD6quFLHim6nEQwLGSG6
	foiGI+QdOxiFrMzUxi3aC+nSdLzKwfKaPpDz/1PcxqyolNtabFEL5VwGZxsXUzAdkiUmOQ1mfMm
	bYZWt0NQN9YJWBQfn0VERqulcGC32VKiqfFKlJZM2pVu+9hazqdbkR7HM1bnuyJiwSdUT3HvuR0
	uFhNjfbNYaxJr26HgmLeAYnybRxEbxbCBCCBrqWM11HuOr1XEJOv7A/lQvJRpwNEd+FcrFEUpYp
	p
X-Google-Smtp-Source: AGHT+IFZFK3wlUpqJmXsUYZAFYQdGzjNd2OpaoMVWxUm3lsHacq8ir6Y2bAW4zwcoS+f8h+LqzPWpg==
X-Received: by 2002:a05:600c:4f0e:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43ecf9c3224mr92276095e9.25.1744031014549;
        Mon, 07 Apr 2025 06:03:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36691b3sm131378805e9.34.2025.04.07.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:03:33 -0700 (PDT)
From: neil.armstrong@linaro.org
Date: Mon, 07 Apr 2025 15:03:33 +0200
Subject: [PATCH] arm64: dts: qcom: sm8550: add iris DT node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org>
X-B4-Tracking: v=1; b=H4sIACTN82cC/x2Nuw6DMAwAfwV5xlIaEpryKxUDD0M9AJGdIiTEv
 xMx3g13JygJk0JTnCC0s/K2ZniVBQy/bp0JecwM1lhvnHlj2iIPqEs4vMF/1CTULcjCisFnNSa
 0wdW9+1RUews5FIUmPp7Jt72uGxxmO3l0AAAA
X-Change-ID: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l3nK4t1N1vFrdEqqSpqgF3jrixKbP18uRVCFWMPfPcM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn880lawvXbf94lmICeZiwP1vz1AnoHVwVXBSiW5KJ
 pejden2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PNJQAKCRB33NvayMhJ0RwDD/
 9FsCB7SMM2Gf2eXR6KHOzE6Cw8f7vmaM2JSjzmPcXiw/KIJNhQszWBmjC9JvhI33+FUOLPG21Oj0eU
 0+wpslo+x8AchcY+onkXEXsp5hQCxpab49dPF3MYtjmgTcqejcYSj3XjQ593jmCYxoVs4chyJsZN1N
 MtddWUTq5/lX281sjKwpnX/t/j4jlTKY3aCNxN9OScc1K0Um0xxEWG4O7L8r/Aqd9bEg6fniYsnOis
 qHqVlNz5l2XzT5+b2ZrToIR71AWWmuQrKKLcs75EwWr+UrZjhMeH0TqrrbI9RG9QkM4SoBgvrM6vIS
 aB0k0mdYZfkVWrYfwFzM9J95k9TfMn//wYVNwPxe+O98xHiT3O3QHy5ydS9lLXrOGUVwFSwa74zXyE
 ic0PrXrsEDcbwZPkFMEckP5KWBXGf5b3TNF0EYY6RJ39ZUn3J/cTx8ep7CyJrIu0xkS17RyexgCQH/
 2HtMU88UM0i7tzZbM+KaRTXDPslk7z9Qz+6GHdLuAXlIs3qh0W8w3mipmtJt29Q1WcdBKmSpSoaNUe
 V/cLUch7CiCNmOcgI2QPQaeclrukQ/AG18EqJz7IDqnur9m7q61AjNYoi6U+QCbDwBtskMr5wsbeLn
 XAaRUqLhPTGTFOEdz5XRS3DA8gj4yQfWJbwQtXZyLtg5UEW9MuJq3Odtj+8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add DT entries for the sm8550 iris decoder.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index f78d5292c5dd5ec88c8deb0ca6e5078511ac52b7..ab49329a435d87107a4ff20cb7b9eeacbaf63247 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3220,6 +3220,75 @@ opp-202000000 {
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
+			power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface", "core", "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg", "video-mem";
+
+			/* FW load region */
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0x0000>,
+				 <&apps_smmu 0x1947 0x0000>;
+			dma-coherent;
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
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_turbo_l1>,
+							<&rpmhpd_opp_turbo_l1>;
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


