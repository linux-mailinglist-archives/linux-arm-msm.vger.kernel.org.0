Return-Path: <linux-arm-msm+bounces-23380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9591094B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984CD282700
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0F51AF6AA;
	Thu, 20 Jun 2024 15:08:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD51AE0B3;
	Thu, 20 Jun 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896093; cv=none; b=o4GZDzZZoToKrYS5kaGF7hOazQHOefBIomio1gbq/LO2WviS8XbJo4gK8v1eJ9ZOiIUhWtx4xe/37Lipt3M22mRoqsnbK/DmXjP8s1StsaWhviL1SNDdHjW20xyGoEGdIKDRoNCrDy2ZMsq3MeyZhn4GIzo+NkEyMbTlG+Qdq+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896093; c=relaxed/simple;
	bh=dtZS1nqbMa7AxnJyQXkJh7FKWj9JKPPVoDyNUOyqAEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e2nEEunJp1NecyizXgARP3BTxtihN7KkS2qpk2r5yHTdpwx7mCKBL6edm3mlWtK8UHTiBIUjySEFOKc3t/clhzsiZz5RfW9GPxdI2UwfPA/dhmGcmGznM/JYp8m4dmuut1pv7I2diyzObtJ05RX9t1lXFD7QoMQ2Mj8HNg99Fmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c01:9890:db34:2f44:25db:ea3c])
	by smtp.qiye.163.com (Hmail) with ESMTPA id A37A97E01B5;
	Thu, 20 Jun 2024 23:01:33 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v6 2/2] arm64: dts: qcom: ipq6018: add sdhci node
Date: Thu, 20 Jun 2024 23:01:22 +0800
Message-Id: <20240620150122.1406631-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0gaVh5ISB1CGB8fHhlIGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtKQUJDQktBHxlIT0FJHU9PQUlOHxlBHhpIGFlXWRYaDx
	IVHRRZQVlPS0hVSktJQkNDTVVKS0tVS1kG
X-HM-Tid: 0a90362ad03103a2kunma37a97e01b5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mzo6Iww4CzMBAkweOT85PSg4
	IjpPCT5VSlVKTEpDQ0JOTUJPSU1JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0pBQkNCS0EfGUhPQUkdT09BSU4fGUEeGkgYWVdZCAFZQUlNT043Bg++

Add node to support mmc controller inside of IPQ6018.
This controller supports both eMMC and SD cards.

Tested with:
  eMMC (HS200)
  SD Card (SDR50/SDR104)

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9694140881c6..b3b98f050cfd 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -457,6 +457,25 @@ dwc_1: usb@7000000 {
 			};
 		};
 
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq6018-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo>;
+			clock-names = "iface", "core", "xo";
+			resets = <&gcc GCC_SDCC1_BCR>;
+			max-frequency = <192000000>;
+			status = "disabled";
+		};
+
 		blsp_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0 0x07884000 0x0 0x2b000>;
-- 
2.25.1


