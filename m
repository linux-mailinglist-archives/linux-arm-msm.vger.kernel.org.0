Return-Path: <linux-arm-msm+bounces-33724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256A997157
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 18:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5C48283F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6731E1059;
	Wed,  9 Oct 2024 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Evxtcdys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB11991B6;
	Wed,  9 Oct 2024 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490681; cv=none; b=EPCo5dce2m8cqZkcSdkHsWbJmtmNJbd69dCD3QfSiEvE7n97jksJBa7XelV9nb/H9+qtqsblX5ttLjm6dO4Xbe43ApB/qm6beivLUKsFgucuzSVw/HzjuXI7JXhZ8HVhvbRsF4db270jTjVwaHzJQSb1D7R45uXNsSkFa6IIS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490681; c=relaxed/simple;
	bh=7mcya0dQ16YUCdd0MtCNhc87iiZ1eu9QcqUo8uN0tE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjGQds0vj1GGsPVJzERbi+i88dTu97hFMjdghKouEijloBEO0jofBTvHkCz/Pz26kLMbQ40ndsjDKGZhFyLo/ecpHN28Y6y/o5TQ8XXd4nVBMLbBcWVMtk6n1CSfgB15t/qKm87Jum6RxPbJtSb6Mn0pGJ4XmyANZKRiMpmJwOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Evxtcdys; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5E2C4CEC3;
	Wed,  9 Oct 2024 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728490681;
	bh=7mcya0dQ16YUCdd0MtCNhc87iiZ1eu9QcqUo8uN0tE4=;
	h=From:To:Cc:Subject:Date:From;
	b=EvxtcdysIn1KMGFpOHgZ4Hw3oCrCC6DN/ho2eeqCXtgBbHqjBKHVHmI84w+kvAQI+
	 Z6Jz4pnlGGYflOg9jUFjDgC60Nn5uXuXPoyYeVUDywOv70u1B9Doc1k7K24V4WiChv
	 eWJgufDd4ebI4YjoFO1fgjsebuvuuwiKamHcDJq7Taq9A5iwOk+oD7NMUnzTFrfk36
	 qGFeiVQTf6ejtLKIQ9x41v1OXyRZ5sHGQeFPgbHmGD9WFDbSHCGq3pmvo1DX0rDc5i
	 /aj6ZKov50g4bGoAzVWYCY7VSwmlrZxwFcmbtNMOnNHfRLqNSrAmcD0XYfkDVIO8wa
	 SjkRwEFimzB1g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syZO0-000000003uw-21xE;
	Wed, 09 Oct 2024 18:18:05 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Date: Wed,  9 Oct 2024 18:17:15 +0200
Message-ID: <20241009161715.14994-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
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
affinity to individual MSIs. This specifically allows NVMe and Wi-Fi
interrupts to be processed on all cores (and not just on CPU0).

Note that using the GIC ITS on x1e80100 will cause Advanced Error
Reporting (AER) interrupts to be received on errors unlike when using
the internal MSI controller. Consequently, notifications about
(correctable) errors may now be logged for errors that previously went
unnoticed.

Also note that PCIe5 (and PCIe3) can currently only be used with the
internal MSI controller due to a platform (firmware) limitation.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

The PCIe Gen4 stability fixes [1] are now in 6.12-rc1 so that we can enable
the GIC ITS without being flooded with link error notifications [2].

Johan

[1] https://lore.kernel.org/lkml/20240911-pci-qcom-gen4-stability-v7-0-743f5c1fd027@linaro.org/
[2] https://lore.kernel.org/lkml/ZpDnSL8as7km9_0b@hovoldconsulting.com/

Changes in v2
 - amend commit message with comment about PCIe3 and PCIe5 only
   supporting the internal MSI controller


 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 1743fe229ded..4d978fe936e5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2934,6 +2934,8 @@ pcie6a: pci@1bf8000 {
 			linux,pci-domain = <6>;
 			num-lanes = <4>;
 
+			msi-map = <0x0 &gic_its 0xe0000 0x10000>;
+
 			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
@@ -3183,6 +3185,8 @@ pcie4: pci@1c08000 {
 			linux,pci-domain = <4>;
 			num-lanes = <2>;
 
+			msi-map = <0x0 &gic_its 0xc0000 0x10000>;
+
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
@@ -5773,8 +5777,6 @@ gic_its: msi-controller@17040000 {
 
 				msi-controller;
 				#msi-cells = <1>;
-
-				status = "disabled";
 			};
 		};
 
-- 
2.45.2


