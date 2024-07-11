Return-Path: <linux-arm-msm+bounces-25930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78792E306
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029331C20FCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 09:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AFC158A29;
	Thu, 11 Jul 2024 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pkm6nrV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29D156962;
	Thu, 11 Jul 2024 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720688620; cv=none; b=MsCJQLNH4QT6dSAWQJaXOT5Z8MCqU+HeLV0Br1YOOS0t4csWVHr9KqUx8LzUL2ejLxEfE5m1k9KgA8+B2EVTHte9vCL0wnRpgPXUBSXxX/cEGNUojfv78EoCnJF7I4gH7yZaexfS/b/Wfh2qAharyvQOG7jULaKqfy8RMMInAYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720688620; c=relaxed/simple;
	bh=0j9C0mA8leOd3/gYl9pkH5HlOMXlezBR9eyJZWtCdSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLvRcBRUmSxfwuGA1DJeX9CbmAmPs7QIJt6LzllFYM7Hyk+Cr5FeXBhzWFjNntfMZNmYtAxL6PNsWE3qWYmxlADEXle45lHdFyXs7ufAf+FdTOP75uCmZDrPZ2RSv64j+O9smUxcTif4nhRqoqWzhMK9MjmE5f+Brt8n0pzmDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pkm6nrV4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9B4C116B1;
	Thu, 11 Jul 2024 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720688620;
	bh=0j9C0mA8leOd3/gYl9pkH5HlOMXlezBR9eyJZWtCdSw=;
	h=From:To:Cc:Subject:Date:From;
	b=Pkm6nrV42Al9oF8Iq/Hhe6ox6VNONX33SxTWhZ3kA+flV5Soh+gqauyFDNCS9k0bD
	 6okQnlj7Vj/hINLPo5OLbn7QxgEDnWYS6zdjH99Ow45azgJlnQxh7f4XDGboAiK98w
	 olgZ5uGiXdgzzQ8lzBBeXOno89BOpK/KoVSTR+phtE42VAUa5GJZNN4QCGaKUpm4To
	 v9GFReyM3Fe8IzuCxruJmR4XoT+bM2gspER/WmVhxI/rqr045xUPwXGIOb2BpfWJt1
	 AvrlUqexk4Fo98XwjrhY5VW+u7wZM0X/U3x71vYc7CQIaxsLScf8mva2fepZCvZPIT
	 UmFM25zRMtAuQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sRpiC-000000005Ql-3Bf3;
	Thu, 11 Jul 2024 11:03:36 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Date: Thu, 11 Jul 2024 11:02:50 +0200
Message-ID: <20240711090250.20827-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DWC PCIe controller can be used with its internal MSI controller or
with an external one such as the GICv3 Interrupt Translation Service
(ITS).

Add the msi-map properties needed to use the GIC ITS. This will also
make Linux switch to the ITS implementation, which allows for assigning
affinity to individual MSIs.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 32a73ff672be..5822ed97ad87 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3114,6 +3114,8 @@ pcie6a: pci@1bf8000 {
 			linux,pci-domain = <7>;
 			num-lanes = <2>;
 
+			msi-map = <0x0 &gic_its 0xe0000 0x10000>;
+
 			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
@@ -3235,6 +3237,8 @@ pcie4: pci@1c08000 {
 			linux,pci-domain = <5>;
 			num-lanes = <2>;
 
+			msi-map = <0x0 &gic_its 0xc0000 0x10000>;
+
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
@@ -5394,8 +5398,6 @@ gic_its: msi-controller@17040000 {
 
 				msi-controller;
 				#msi-cells = <1>;
-
-				status = "disabled";
 			};
 		};
 
-- 
2.44.2


