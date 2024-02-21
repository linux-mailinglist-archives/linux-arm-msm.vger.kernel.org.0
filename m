Return-Path: <linux-arm-msm+bounces-11979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36B85CF0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 432E1B21E3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6701639FCC;
	Wed, 21 Feb 2024 03:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R++d5Qgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83C3E495
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486976; cv=none; b=AkV1IWMkn/2YuainA1YWI/pjV+/E9e0Tuet9P6mRrHqVXF/1M9133x3RI3HGRW7K86IhSyOd0HIn94q6Z9kNRLVMdzTI0zVIqsuBn4Qb5Z15NzyZIkZL/XM9vd9ws0kUfCxlCGL62EjONrx/gEgPZ+Z2VX85jGC9WeDo1mP5908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486976; c=relaxed/simple;
	bh=ntCfHbJqyHo2IKloDJny626bPqnVLcdHkMXuobbQPMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZ589vmbvAGPyQfG0DRQkFtz3LXB0yuFX/M18S/7rAKTD6iapWvgyETbLTrBzJmR6wr5XMNi9hiQH4IYIT9oiualKHl5YLvgTJ4IRkilr5KlTaE6mbelAXV/7YKa0cApcPp8Uf5IeJbppxOxpgqZJXQ8lIIKSLHXt0vxIoJStNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R++d5Qgh; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcd94fb9e4dso223816276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486974; x=1709091774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Suncx11lO3ECFLV2Hth7On+VVCqpX9h5Kh51+NyuNk8=;
        b=R++d5QghGbCGGtwHzPcZRdNA3X+wkcMhVb/Gsy89tP+lFIltlyCae/SU+tOvOzgZfO
         NqKy0FJNEuJm2207rncC/HaYygJ6sgcShfNYFTKpwfrnAlOioz4oy2o+BSMBPL/O9nko
         RqGYNYD9xbRHK9ou4Kf7oKSTGX06mxmgPYLVVxHC68TqJFfLs/toKx8fa127D1+9RL8h
         O1OTIoTSLETSGk/WH2Dwjh2lhy0Mols1B9Cvrg4YQAy50oNm//pk6MS2rHWvX4fFtgd9
         azn/MjoMbb532dEUv61TB0XU9XZyq5UBjLT1vUPWZMK1lwnK+sFS6g8qfg/j1fagnL4S
         nUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486974; x=1709091774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suncx11lO3ECFLV2Hth7On+VVCqpX9h5Kh51+NyuNk8=;
        b=Zf0tjGezxqzE+0PrEMVsDIpCtudonHam5lvQ7fUKFuMcRCAWYbZ9ZWqp3F0WPMTeFv
         OfIrFZsShchXIP+WiDr5YoohlmI4xkFHTBvxbjcNnBfZNqE/K5vpYnEWcx3SG8lylfcg
         qPgnxkb0OQqFkEf3MxGT80yQtAOobWaRYL3opI3Ce8yE9/voZnEVEE3nKLxPLldpwz8n
         OxRqpMnLYwlDH2mCUkTk76rOXunuIe/luHp4vFrgvTfhzscG+S5lBHCZXL2oY/33Ynbr
         12+gR/LUNw+nwK5F6XumLWJ+aJqwkWnqdpFuSiZvH5XzYF0lYitJhs5kDrKreQuley6b
         WRig==
X-Gm-Message-State: AOJu0Yy5FXggyds0sgwMBmPjCbg22ORXX96tHqzBXlGmHOBv3PBr8GD+
	txn2H8c4f5nM9AYxpRPZ1qKPXsPLtM4V9HIRMlym0bjlL6eP3xRAZeHURl82yQ==
X-Google-Smtp-Source: AGHT+IF/0bdGZzQ42OnqydeusMagmlKeABAfSOtfKGpJYhW/ULtYgnY0pxFeY6MKIE2LezE4V3eQxQ==
X-Received: by 2002:a05:6902:250a:b0:dbe:9f4a:6bb0 with SMTP id dt10-20020a056902250a00b00dbe9f4a6bb0mr18319925ybb.56.1708486973847;
        Tue, 20 Feb 2024 19:42:53 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:53 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:59 +0530
Subject: [PATCH 13/21] arm64: dts: qcom: sc8180x: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-13-6c6df0f9450d@linaro.org>
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ntCfHbJqyHo2IKloDJny626bPqnVLcdHkMXuobbQPMI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEIB2OO7XO/U6sELwLIt1TGK59monBn7moxn
 6dyHg9lzGyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxCAAKCRBVnxHm/pHO
 9XX7B/94Zww9TR1j1Q15e64KFzc/uZLpFwM34IIZB95PjFpVYogq2AQWzgy3naGxRLAyHkl0d7W
 2Bu9uCBLquvDI9nK5DyjS0qvy9Cx7UExTMBgUGfJt1Ix8hzpEc8gAING+JMwnBwjxPEv+msS3X/
 MIyCYPEx9xaJjombvLjqkCkYsqDnwsLNoCWb+rjNNJqaAOb5IIasDG3KVBReN8dqLFOu8sYcPXF
 GSCgIfXGB97dnz2qIxXyF0SQLunP6hKSZZ6qRZBtmW5xwma4NFG3+j9JXowBJJgBnYAhbCBbeLc
 i19l8ti+zudL1i7KbRHEjzmXiTar/3jnKbUCAKAJqSOEgyJi
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 0430d99091e3..a6134f454e53 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1754,6 +1754,16 @@ pcie0: pcie@1c00000 {
 			dma-coherent;
 
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
 
 		pcie0_phy: phy@1c06000 {
@@ -1851,6 +1861,16 @@ pcie3: pcie@1c08000 {
 			dma-coherent;
 
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
 
 		pcie3_phy: phy@1c0c000 {
@@ -1949,6 +1969,16 @@ pcie1: pcie@1c10000 {
 			dma-coherent;
 
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
 
 		pcie1_phy: phy@1c16000 {
@@ -2047,6 +2077,16 @@ pcie2: pcie@1c18000 {
 			dma-coherent;
 
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
 
 		pcie2_phy: phy@1c1c000 {

-- 
2.25.1


