Return-Path: <linux-arm-msm+bounces-14732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB950885811
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65B002817A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69F05FB9C;
	Thu, 21 Mar 2024 11:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbqy8Mva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4685FB81
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019879; cv=none; b=VIY/675BEvFKYk7Ed8DSrwo63xNifoU3/dNj9GS0GmLb/7qEuFBpq5IOc39Ro9K8ISYpoULhf5vXyvpjUp8ueLQLLBrWUzlZZ7LMim1Hyw1475GbAkIO91f3NJ3tiQj+FXy/y9rBBC1DV9ekgjE9oiKe87MMXYABu7q/rcEEgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019879; c=relaxed/simple;
	bh=txKBxasirrzr4D0MifccwdFxGLZgzc3driHUspG/zXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtTmpPuJSTAlRSo+TcAnjxluX8VdUoRY16hRiuDOH4xs3L91ql0ipzAgtsdLfRA8f0YUgGSMa/Koqr6E2J3s1iK+EdP7Y8Nfi4GFgG2UtuFZGIEEET4SrkawlNpgYdziZo916TxgzfHMwEoJAaa6Caw9jnJlDsKvGY0b24PumCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbqy8Mva; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso745386b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019878; x=1711624678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwWQb2wVJ/yqhRj+ZXhsK7LleZ0QdLeCzsPtWZNhY0I=;
        b=sbqy8MvaBAzfXNmkD3Qwab8XHLBDLz2LP8YSHnOfVswlipAQchmlxyrDA9RGKCqrEN
         YpYhlOV1PJTg8rF10PGEec+AAU2T5E8NY/BXA30jL453Qz0oTiure1Vum7kSgJPFOhOu
         abb3o8y+NQ5L+Ia8v4SYrsCgZwu6TEIBtsLpDWwTB3Rg0H4ak46EWIMDWpdyWAhO3gMk
         6SlKiwCtwvKdNz9B4AcSCFPZObpcu428E2Ngs8HwPCqPYD665czwbe1IWnshe78xz93J
         2anT8APkCcrdn2SG4jWflXPgquPd+FTYVk6PxGnslnDw93C0TlBoziCGWlf8riS5a2b5
         a1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019878; x=1711624678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwWQb2wVJ/yqhRj+ZXhsK7LleZ0QdLeCzsPtWZNhY0I=;
        b=hpKLDVaHg6sMta9N17xfDkoNvWsHb5ntbEicbnl7wdX7mK5Lbi+J99hEZkDLJDfT+b
         ljPyVLdCCtoo6I97DsYXb/cENms2RFDRFyjGmkLXq6G0VagUcofH0jGnPdSkUB0dpYYR
         Vmr6lVriIafEHZCHaVLua78WlWVwHbSjuAOgJkHTuf0O+AXxYjcYweaRekH+H3t6UK2S
         5dG6XxqSeqeEek3AwLbQ6x+0AlKFF4olJvK+dnkuaX+YyxLDSVyKt7OFK5qDaEaJdLfJ
         Soem33K5r8g/63/nnoW0/XIOugrU52MXrByArSEp0NhsFAw4Kb6zczFcEEiNUqvYEZYp
         d+ow==
X-Gm-Message-State: AOJu0YyCyCPnTZ+o55a3jI/02GSZuMaryV7u1xB4GuSxHMr6y+0VJ+Dw
	PGOZK3ROPMJ/NTvSHkqJ2milSGDExfG/Ak9lm0LaEmycvk5CwgMaT3Ib8E0VnGfQlmQVKKRi/oE
	=
X-Google-Smtp-Source: AGHT+IFkiC8jFoHRqNloR/yzbipGq6Hi2spXDBAHQFM0t54XlfpF6Eenc4b6HhszrxEbJiCZ3my//Q==
X-Received: by 2002:a05:6a00:8685:b0:6e8:5b99:8f64 with SMTP id hh5-20020a056a00868500b006e85b998f64mr3099663pfb.8.1711019877712;
        Thu, 21 Mar 2024 04:17:57 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:39 +0530
Subject: [PATCH v2 19/21] ARM: dts: qcom: apq8064: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-19-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=955;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=txKBxasirrzr4D0MifccwdFxGLZgzc3driHUspG/zXE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcNTKMazMiuUsD2/RfXWQCyqIAQ+vyqHa8/K
 veBvEwYid2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXDQAKCRBVnxHm/pHO
 9by1B/9W0lAn32YKBWoq2n81C3x/sYmpGXZ8X3TkQmijLwLztRg8NR+UcSAyvO4WKmb0hau72is
 UE+YeRoo99JTfgxs/vMohkKTbTzansYr2f0thOSaIcvDUECZnAwN2DA0YTrlRDPdww5mnW4PlyJ
 mSCrO1YmBWxlISUIZo5Nuvq94ianlpatjXxQdkPCMZCnO9Tiyks/SNUhG7kIIf1NoZOrIO1m07n
 LDpiPnW97kIwyTGRX6u1lrufcNnSgRstJJx5a5Y3P1BoJvEF4OxwQYcbxw/We2pqpwTp43Jju0P
 6zm8hmI6UQ27REOlVGVOSW6+DdTTttegMwA6suiLrt0zbTE5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 9a5ba978775a..dbe0ae2c8770 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1334,6 +1334,16 @@ pcie: pcie@1b500000 {
 				 <&gcc PCIE_PHY_RESET>;
 			reset-names = "axi", "ahb", "por", "pci", "phy";
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		hdmi: hdmi-tx@4a00000 {

-- 
2.25.1


