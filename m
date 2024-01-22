Return-Path: <linux-arm-msm+bounces-7823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1E836BEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2CBB1F2499F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 16:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DF546457;
	Mon, 22 Jan 2024 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6KeyaG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682846450
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937334; cv=none; b=lQNwNjqTHS6EjGTDeIInCUAJe0xxQno6DUWdCMvRJ2jk8u0XC11dhHuVqQ3rFPlKGWA6L4i+u5s1gWrqMF3t6s+b6WkktAKmcAxPycCu3a5tXeyzM67zSSMnz9/JM+urp25yv8iHg2F6QSHLUzq7zmsaoCMeKP+pFH54j4zpeCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937334; c=relaxed/simple;
	bh=l8DqD788iInGk6LnlOXtjCiSFZvQVgCM8sX5J6AWk68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tB+Wk4MFv1xt7CE1tvHTqRuJ4mr5ZgE72ZFJM53KqIm1LZT015lYzPLixf1C8plJzkTdPuXrl+LPK2q61Pe39clrGb8tRPyM1v6NVnJHEnDTgaIA4f3BrJ2rwGv5aM0AR0iZMavhJTYZgiWu3nhE9b4e6D4M1T3cQfWONEb+RzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6KeyaG6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so3300386f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 07:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705937331; x=1706542131; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wbn9IuYcAeVOqjLgKES/xOH3myWCWw+mtzvjZ2nN6Fo=;
        b=b6KeyaG6U+ubhxB8zNNtwHXiukyQQ5hjz+Tl9OpdZdCdjMokuGIWpHGPACLPN7QDDe
         S26akOk7RH1zEXiZEnaeyoV3ZEGyujURe5rLi3Oqz3JKPiMIyjiJ5urEpgwZrph2iDh7
         1R3Q1H8B3fNJhtJq5eM/cHxaIxpu2/m6/yBElvpKk4sH6FDDiyKt0YuhGKzaxW4pOoue
         JFTQ9iLMMI7b8O0zMVlr+HpYycYEDr6xO1F/W8EOtyms1j5XMZbXxRc0Ex/yxQy+HA5V
         JAQhmtTQ3q9cir9/S3o5k6L7hAvoMzmHOJnt4nwTIQ+PQ0VkahlHACEwFvjN0/NJmFHF
         LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937331; x=1706542131;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbn9IuYcAeVOqjLgKES/xOH3myWCWw+mtzvjZ2nN6Fo=;
        b=FEk1eASYnzvRGJp/O4BgqNo3HvBks8qjuvicHypa5jn9QepK/ZYQIM1965/4H+SAu2
         KlM2j8CklwAbpgr/iAwGFBjuXY47ViceONzl3gafVetdclrIqPbhihjM2FSbK/aO7HqL
         mTQnDzAxlaZMzY+zibcuFi+pbvolMf5NnVDUfVPDE57gVzLnnvh8KZHEnbePuPokp8Qg
         3o4/BMF97KH1esWQ8BeMA0KT9UvEc1WyOxswLaLK7ICD4cT6eNKzpDZjZX2H9gkTYiE3
         k7jgRuSq6pPfBjIZ/N5avvwNuhbKJM9YUQOQLDTQITEFbKCHLwYXU7mxyWsFZnJ/Cw67
         N66A==
X-Gm-Message-State: AOJu0YwEvYAlgsb/X6BKBTiA4+cVU8y8BQLDfucBim+AdcbW61urY8x5
	T+Nkgjf4syjpLj/PS/d9qFz2AaImXsrLryoXtdYUHcmEbsJDVc+42IEQCl49N54=
X-Google-Smtp-Source: AGHT+IGbwuFVheg49B4s7Ohhr7Jj9Z6GGxO1mWJtMWP4da+qoLRh0C9OaYmBjCdzUfa7bKeSPCCXiQ==
X-Received: by 2002:adf:f84c:0:b0:336:7674:dbbe with SMTP id d12-20020adff84c000000b003367674dbbemr2553185wrq.74.1705937330748;
        Mon, 22 Jan 2024 07:28:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f11-20020adff98b000000b00337d5cd0d8asm10954160wrr.90.2024.01.22.07.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:28:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 22 Jan 2024 16:28:46 +0100
Subject: [PATCH] arm64: dts: qcom: sm8550: Use GIC-ITS for PCIe0 and PCIe1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-topic-sm8550-upstream-pcie-its-v1-1-aff5d0d7d6dd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK2JrmUC/x2NQQqAIBAAvxJ7bkGlovpKdChdaw+VuBZB9Pek4
 8Aw84BQZBLoiwciXSx87Bl0WYBdp30hZJcZjDKV0sZgOgJblK2ta4VnkBRp2jBYzmYSVI2v5kY
 7T52DHAmRPN//YBjf9wMQcz25cAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5184;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l8DqD788iInGk6LnlOXtjCiSFZvQVgCM8sX5J6AWk68=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlromxqTTwupaHyZuUAOE1ffIOaXSfxkXJa8vp8OeK
 bswjWXOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZa6JsQAKCRB33NvayMhJ0ZuhD/
 9l84hzVJz7HL18IPmn83XOuk7laeNZ9A9HBRiFN9uyuxM2MCrdGkej9qUWZor4gM23jwWAuEOszQMb
 5NqpaFkQG3yUB/1IZRCnu+NumBvvuME/yRRA1FGkx9+oxnHXQVsqoWBD3QQQg/x7x5XZb8e76hNIxZ
 h0HMiea5j+QzW4nNsH4BYCW5OfCHxxb3EEuW5/lQfZQJxUSxxiP/MAHn0bBUYvjmq9TczsoS7Vqu7L
 FbsA8L0/B/dc3GBAzyKgEs0D46oBtu2mP5EPOR2NB+36JIQSMtlfopORG2tduhZU3bQM+bUbM8Zx2t
 NBBLiRhp1aqlkt+PS8GwgNwpRXmEcOb7+ZiTzOwb9Ol1fI3ERKq5+FSxnodzmXIkHCxg2sTbUi+cYn
 4tXf5GhO8lm+Vu4JLT+sDAYh6gt1k2Cjhj2A3z5BkpLStbK7sK4ztewkOMMpbTVfdph5MQ5xpHGrKO
 FkbT6OorIBvKyMJ7eJfkQueBcgbMFHh0ijKNrV45svEZNfvg/6agaL0IxPihopC0aOCBf2bh3U1K1A
 /DwDWCZiX4K38Ff1s+KXlPI2NU6/AWH9gTxd7YGqPnDKLM1J0gN3eVxHUqbjlZyeVx3NSovCLk6Lra
 ppmx2ZNJ+AcNisTMkcs3bVHSZPJT7lHigapN38YJszH+8tx2M8fm+7dTVt/g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Both PCIe0 and PCIe1 controllers are capable of signalling the MSIs
received from endpoint devices to the CPU using GIC-ITS MSI controller.
Add support for it.

Currently, BDF (0:0.0) and BDF (1:0.0) are enabled and with the
msi-map-mask of 0xff00, all the 32 devices under these two busses can
share the same Device ID.

The GIC-ITS MSI implementation provides an advantage over internal MSI
implementation using Locality-specific Peripheral Interrupts (LPI) that
would allow MSIs to be targeted for each CPU core.

Like SM8450, the IDs are swapped, but works fine on PCIe0 and PCIe1.

WiFi PCIe Device on SM8550-QRD using GIC-ITS:
218:          0          4          0          0          0          0          0          0   ITS-MSI 524288 Edge      bhi
219:          0          0          5          0          0          0          0          0   ITS-MSI 524289 Edge      mhi
220:          0          0          0         33          0          0          0          0   ITS-MSI 524290 Edge      mhi
221:          0          0          0          0          3          0          0          0   ITS-MSI 524291 Edge      ce0
222:          0          0          0          0          0          1          0          0   ITS-MSI 524292 Edge      ce1
223:          0          0          0          0          0          0         38          0   ITS-MSI 524293 Edge      ce2
224:          0          0          0          0          0          0          0         31   ITS-MSI 524294 Edge      ce3
225:          0          0          0          0          0          0          0          0   ITS-MSI 524295 Edge      ce5
226:          0          0          0          0          0          0          0          0   ITS-MSI 524296 Edge      DP_EXT_IRQ
227:          0          0          0          0          0          0          0          0   ITS-MSI 524297 Edge      DP_EXT_IRQ
228:          0          0          0          0          0          0          0          0   ITS-MSI 524298 Edge      DP_EXT_IRQ
229:          0          0          0          0          0          0          0          0   ITS-MSI 524299 Edge      DP_EXT_IRQ
230:          0          0          0          0          0          0          0          0   ITS-MSI 524300 Edge      DP_EXT_IRQ
231:          0          0          0          0          0          0          0          0   ITS-MSI 524301 Edge      DP_EXT_IRQ
232:          0          0          0          0          0          0          0          0   ITS-MSI 524302 Edge      DP_EXT_IRQ

NVMe in SM8550-HDK M.2 Slot using GIC-ITS:
212:          0          0         22          0          0          0          0          0   ITS-MSI 134742016 Edge      nvme0q0
213:     133098          0          0          0          0          0          0          0   ITS-MSI 134742017 Edge      nvme0q1
214:          0     139450          0          0          0          0          0          0   ITS-MSI 134742018 Edge      nvme0q2
215:          0          0     139476          0          0          0          0          0   ITS-MSI 134742019 Edge      nvme0q3
216:          0          0          0      69767          0          0          0          0   ITS-MSI 134742020 Edge      nvme0q4
217:          0          0          0          0      80368          0          0          0   ITS-MSI 134742021 Edge      nvme0q5
218:          0          0          0          0          0      77315          0          0   ITS-MSI 134742022 Edge      nvme0q6
219:          0          0          0          0          0          0      73022          0   ITS-MSI 134742023 Edge      nvme0q7
220:          0          0          0          0          0          0          0     329993   ITS-MSI 134742024 Edge      nvme0q8

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ee1ba5a8c8fc..9860bda3be1d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1742,6 +1742,9 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
+			/* Entries are reversed due to the unusual ITS DeviceID encoding */
+			msi-map = <0x0 &gic_its 0x1401 0x1>,
+				  <0x100 &gic_its 0x1400 0x1>;
 			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
 				    <0x100 &apps_smmu 0x1401 0x1>;
 
@@ -1838,6 +1841,9 @@ pcie1: pcie@1c08000 {
 					<&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
+			/* Entries are reversed due to the unusual ITS DeviceID encoding */
+			msi-map = <0x0 &gic_its 0x1481 0x1>,
+				  <0x100 &gic_its 0x1480 0x1>;
 			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
 				    <0x100 &apps_smmu 0x1481 0x1>;
 

---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240122-topic-sm8550-upstream-pcie-its-06f4b61dfe9d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


