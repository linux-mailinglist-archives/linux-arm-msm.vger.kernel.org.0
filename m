Return-Path: <linux-arm-msm+bounces-45141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3EA1253D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EBC5188B0D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432042419FA;
	Wed, 15 Jan 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljaoHBUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29602442F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948654; cv=none; b=BKvI/1ughnjSOxaO66+iYi5xoDl4ZlXMeAXuSFMIvArUdeXTgsGyg+ZgYo0oGcAMxYfNDGyHCCicQJIoX5WLCwgqRqwnDcuFd3q8d5qI3uY+tQ+zRpXFxe/VbohgMstminjojWX3LTUD5j5l/EgdTj3Q5vBwqCnN/KhFITEjQZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948654; c=relaxed/simple;
	bh=UxJJ2vmOkJivP1vF3mBeCHCgN3ZON8eherWl/ihv3Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dX8hbNdv+biniAWTHVvJ1jXG+eRmItArW8vQ/RoLLi19w7dKU1d1VI2EbToHRrqy91Rr7i8YArto41uKco43wQZ5yJhUj/B1THQ5jhmzvtIKMzjeLrf20+k8EGvb4pPRviRZHaqpgh7+m6mRixFzxiNuEpKnehOFzS77SRPtOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljaoHBUQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436249df846so46775255e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948647; x=1737553447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyhSZi+d7zv7QIEL6yrWTJIyhAWTvHF7VFTHAZZHpkI=;
        b=ljaoHBUQkksdVsW26eJGP/n3+MVGwOe6rTVPvfW3SWeFBgRdDDUxnyNEBqzJ3zbu57
         /QvxJhvk6MG/ajBLbbsSQcGNFL8hf5U3d9Soe4ZUgQ5eGCBE9Mq2B785s1iiYUbeuN0O
         u/QQf56ENW1SP5SE3VifbCPv72gyC7DTEfFcQK56cxxxQBMME4VZuRu+8qg3etUnquf/
         1gAafTw7GtOKW+PCmdO2J1n7Idj3NGLyOpUQsmMlGq/11kQ5Gu7skMQDRz1QKvmiDMBO
         YAfMpO3RefLpNA4WDjE1xiBGSBrWYEDnDo6ZyuSMtwH8jXVFUBULpAYuKGRMD/ZEhVyT
         S5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948647; x=1737553447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyhSZi+d7zv7QIEL6yrWTJIyhAWTvHF7VFTHAZZHpkI=;
        b=Y9Rdl47/cv7Vr+zFaq5Cl1jqVxtavBmQkrNtPoo7fYnrSN4XROLdZcuO7ZBz0yyTgK
         X2cXazbHKDo93dQke3HA0/FijIrhIneI90Bnae22aLT1FCR1GwuEaLt/MOMi/XGQjmXC
         DLl9V1C0wCMRp5jg17c+BgcSq9QkCx+SdpV5EGclbh3lQQyLBfKpbZZgWB1IxAo5u/Td
         j684LBtXbjbAhg2FLFtzwTM0lVpr53n23snjwQ/hzjS9ZHpgBrTH/uqz6zs8Ci2UJDbU
         RrEI1P7/DOBixkD6PRG8da42atBW+A9Qxt0O0Y+ioK6Q3cCc0YXRkGTxMUlAdVfmUeYb
         hKww==
X-Gm-Message-State: AOJu0Yz8YN7ELFFvqph48P2n0BKCmjhkgsdm5WmoYSW0QwAkmRZm+7io
	0Dviec1ogtYjzC1zonVGilnvWXjclG1ETbnwwDpbJe/znDeNXANAys1HQ8e5dP8PKmskQ8iKXyV
	8
X-Gm-Gg: ASbGncs5dRVSKXknRQh83xR/QMU/cdC+EKNlwERnjnYcKgafCzDIpq4CVfGxa08tTXR
	VeqJWxXHbhm1RJWi+TSTLLCA1+0A0apFcZqYR36CKKE8x5S8m3bddWeOsrxJudZF/UM0mQGv9JI
	+KK/PFI7ISpSG2atArzxDpwigeEACrTre0rLB111xAmoYH5oj2RI4nSp0TW20W+1CbdW0aGQyMz
	lY28oYfd2GeyqUhQAXteNPl0kHDD6+wzew8hgHsLXSVIlzjuEczBe0XV86VqkHNep+fshcmYFOx
	tw==
X-Google-Smtp-Source: AGHT+IF6I0voTAgOl6SLCV3o6NeGPq6CuKZKQd771UVYJ32yz4lHzjSs7PHgZvrDQLiiezhjo3mZYg==
X-Received: by 2002:a7b:cc14:0:b0:436:e751:e417 with SMTP id 5b1f17b1804b1-436e751e4ddmr258696895e9.7.1736948646966;
        Wed, 15 Jan 2025 05:44:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:44:00 +0100
Subject: [PATCH 08/10] arm64: dts: qcom: sm8650: add OPP table support to
 PCIe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-8-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3609;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UxJJ2vmOkJivP1vF3mBeCHCgN3ZON8eherWl/ihv3Kw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7ue+EB/n83NOVH+e5MD+a2GTuI7GXMZK8MiWxwA
 kbzviRuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7ngAKCRB33NvayMhJ0d6jD/
 4nD4cfnrIs8lSeDJ+79d33odNmnWw3qHlq1crroZk18Gzountj3F/un4s5f/7IBKBQi3+ynTEAAqV4
 xxfh6CrtVjKgFALegOsUcRBG29bA80qMWGJNvYd928k50l55Mn1u8p08RaBo9cDYLTPYzU8SZLF9DP
 8mk6Z8V7miAzBOP2TpcBo/qvU5s4yLdK5nRHbVYYosGD1gvFMF7zaKsscS/R2y5Ovw9KHXMkjjwYrR
 koceQ38YLQndaH4g70Mn7PnD/lNFCgbXXWhmbxSCONYGFg59P6BdNswlOGvZxhpSjc++XjfLr9NiZY
 g6cHp6mO1LpMlk1vRn6/fCG4grJHXuFLLk/ESe7xec4YIMSBUCSY91JD/NJFzgbfrOJLQLxy2Z0kKB
 ERcMdunb/wnjHDQ2U3GDT2s5fsW6TfuCyi0hafTl17UFHK6vfR2O2Te/GLrOD8iPAzcdEWsPuIwGdO
 wR7OxzJCWlaqz7piyJz7p1Mr3iwxTVQGFGGLsgQfRF4RmCxNjylGyiEIGdrlI14RkdJW9cPceV4nco
 Ri+X6ehQqr1hAo3tPX+rEwVZsVzRAaMx5Al+3HUWLAS5IH2PjbxBzi7fAs9NA+TIksCc5S7fQv7u20
 crac3QDCnFueaMVnKgwN0pnHSjE+kK25PyRD/VaO+/O7GFavDvoQoIogktHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PCIe bus interconnect path can be scaled depending on the
PCIe link established, add the OPP table with all the possible
link speeds and the associated power domain level.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5982fd4d66d903d638f0eeaaac221f3007abf68b..737d1901ca10fe0a49ae4685d0363be74cc0668d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2308,6 +2308,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
+			operating-points-v2 = <&pcie0_opp_table>;
+
 			iommu-map = <0     &apps_smmu 0x1400 0x1>,
 				    <0x100 &apps_smmu 0x1401 0x1>;
 
@@ -2338,6 +2340,45 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
+			pcie0_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+				};
+
+				/* GEN 1 x2 and GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+				};
+			};
+
 			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
@@ -2447,6 +2488,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
+			operating-points-v2 = <&pcie1_opp_table>;
+
 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
 				    <0x100 &apps_smmu 0x1481 0x1>;
 
@@ -2477,6 +2520,52 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
+			pcie1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+				};
+
+				/* GEN 1 x2 and GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 and GEN 4 x1 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+				};
+
+				/* GEN 4 x2 */
+				opp-32000000 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <3938000 1>;
+				};
+			};
+
 			pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;

-- 
2.34.1


