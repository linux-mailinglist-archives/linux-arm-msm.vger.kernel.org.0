Return-Path: <linux-arm-msm+bounces-14727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0F885803
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FC97B234B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18C65FDB0;
	Thu, 21 Mar 2024 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kk+WC3Jy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8765FDA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019846; cv=none; b=JjomanuJDSiaAnevDdkefqLdfYhaex/NENBQ2/tZJ/NRowNbY1L6WKv33ppg2vykOZxBk757Vt81r5X+SkFQMfQMO6i1fRQtXIy/ChijQLHIbMbYZg7pHNdcYCollg2ljpIgKhizCp1xGE4z4l4UPAiJXYuQTgHTa/tjE+tjQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019846; c=relaxed/simple;
	bh=UmDY1BVPTp1/kgo+u0eHUZOrGPi6ZKwi5IzgeMVn8QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbtB7vt3Z7cztafYeLu6J25IYv9A8mbtC34JytPhXrqkolYH7wwxMtDcbXd5+ypzYfYKg1sJSlMkrA77kjNEA8ROL8Isq1jJxxuHkYt2SLyhbKd4EIKzjwZFT0dYvS6BrdoCo5WQxbG1ZdLPx8Tm0Ar6dPnHyMWdGZNf44DlbRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kk+WC3Jy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso745035b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019844; x=1711624644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlPAp/QQeZG64P1+razPyn8LLnkmxtSTU9s11wHagNc=;
        b=Kk+WC3Jy5oIHWirIZ2rOb/73+Zh3pNlnsSdCRiDYS7EIzJjQ8AHcOABpMQQoUgMEGJ
         WxRrJqWOn9L6/7MJTId+WBmV0MOdPUIr5D8V0HuVxI5D5KMaxxsUuU5+VOdMC9l4nNjT
         uun2phGxO3engQ0WbBbjkyaE+52RLJxLOIuTrxUdy5KsZ1RK2kt+Z8KlsVo1BMUrFQEk
         F9i43J8DtDEjdt74iM+w6rTDAzbNvCnB77uiI5X2ChIuSjLToeuav11r4zQQDzehp8t8
         yYIRrM14weHzb96BUqAe+uZ7Ui/5ZO0pVWfDT2NYIxXEXhc0r1LU3Hyb1dSNMpiVqjRF
         rh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019844; x=1711624644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlPAp/QQeZG64P1+razPyn8LLnkmxtSTU9s11wHagNc=;
        b=CjEv2nGsiMiLmT7RoshIswFR+BJE24lRnS5xsDvzTrcwaTNq1TzfB+gyCg/aqRqytI
         KyNUfpS5PTskuCdmB2MZTXmVIygJBTQOLqKsSloSNkxOIHVbWkzas/bWe5md5+VFngc/
         BeFteA+1uzvpiA0Xne8vutXpg/p4+ttDpY2N/4d9G+gGC5eONoWC0NB9DDcq2MkBKDcm
         BdH8rgyk33btZuo6X8mvRgkknTLrFC4OjzrJ7mVlu1WMHM8tH24cEy22lzYQstKxPnxs
         aCB3pv8r6S0g0uY+09NO2sbt8D+WkCfYnlE5jJA/E7WC3Z9Y43aX/Womaz1V/MG5wk6G
         Pacw==
X-Gm-Message-State: AOJu0YxUpzoRzuS7v4+CA5wNgqw+0fzE1CXcMW6Rw4Wxcgr40NC+7Qy/
	L3vx7K27h/nHMtDesVfJkpqHfBvVNMxOErX7p3t/TbslFukm6rUVtWqhbKz99Q==
X-Google-Smtp-Source: AGHT+IGM6IyQwubICSVG4VjIssu++Jwb6MsLShg4SwPokzB/hmmoP+U+sHR34a8F5/TgWEOPOLifhg==
X-Received: by 2002:a05:6a00:3d42:b0:6e6:b778:fb4f with SMTP id lp2-20020a056a003d4200b006e6b778fb4fmr5616215pfb.26.1711019844499;
        Thu, 21 Mar 2024 04:17:24 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:24 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:31 +0530
Subject: [PATCH v2 11/21] arm64: dts: qcom: sc7280: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-11-1eb790c53e43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=UmDY1BVPTp1/kgo+u0eHUZOrGPi6ZKwi5IzgeMVn8QQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcL7drBwCTEJ1i/WNtp3+bDVfCHRkZUf3eau
 oD61ZQ0feSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCwAKCRBVnxHm/pHO
 9aJaB/sHqfjPoMHw71m0kcXY9FNpCnbyzxxjaaKQ+s/rPDNAEd0EgSQQDyjMRd9qSBb04lJo+Dq
 hfdTCFAWUJcxzj0gj34W3n7xnZPBBbDL97ZzI7BIV30LdYCc7TQkuZiJ6RQNuQ5R3X5R9MOuFj1
 gbO4Ber6OFc20h/sKJB+s09g+I/iw0ehEGJ7RUZD+jVyfO9FNm3Ccch9sCuBTWRjYBkLHrJQliF
 +KmfETqoAJAKf6jGIc7IGUhFBqs7uOGEyvgBhowv7jMm+w2+LT0jGV9ocyT8n8XWMqxbO8Eg4PZ
 ObjYgjNvDQj7Cfqukyl2ppF60hMM1gMRW99Q8cHsB7nR/NeL
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 7e7f0f0fb41b..3ed6cc50b18d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2273,6 +2273,16 @@ pcie1: pcie@1c08000 {
 				    <0x100 &apps_smmu 0x1c81 0x1>;
 
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
 
 		pcie1_phy: phy@1c0e000 {

-- 
2.25.1


