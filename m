Return-Path: <linux-arm-msm+bounces-29192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A119599BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F90280F13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815101A4AC3;
	Wed, 21 Aug 2024 10:17:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAE199FB4;
	Wed, 21 Aug 2024 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235460; cv=none; b=h1Qm4D3d+HGwDjBGH+HzS14Wy2nI4mfJnhTw0O+6hPlbs/suqc8vLTlOhI3ye4CXlSSqhpTUaVd78gNIQMHneJw0BKSSZz9gsNs6FmhaU2udX2Ni4e4FRG5y+xxk3Ma3umTJOp4smT/dg+w8QEKZL4RlpcQsHccJaVmMLTqvJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235460; c=relaxed/simple;
	bh=0RhVFhYoPwHMcp9xML/40dBV4iPibyeBgl8/kuvVXYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TV/flQGb1U5HVubeRCxq9nPzNw0WWCtPFineHOzuP08g3tkMymTS7Lzj9LzAiVBwGZp+dL70u490TD1r3J1gBoQ4UEMFE3KpK2e7eKGydZE8vmhMY9LT2F3DtbUcIp85NOSIaSOlurkbV/CxG6Yw+ChAjD6c7Mi6zdnrkJyRf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:ac20::1])
	by smtp.qiye.163.com (Hmail) with ESMTPA id CEC937E01BD;
	Wed, 21 Aug 2024 18:10:55 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: ipq6018: add LDOA2 regulator for rdp
Date: Wed, 21 Aug 2024 18:10:25 +0800
Message-Id: <20240821101025.858961-5-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821101025.858961-1-amadeus@jmu.edu.cn>
References: <20240821101025.858961-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUgZVh5PH09KH00aQ0hCQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQRoYSUtBQUpZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
X-HM-Tid: 0a91746b03d103a2kunmcec937e01bd
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSI6IRw4DDIwLCoRDjgTIi9I
	DT9PCi9VSlVKTElPSUhOS05NQ01LVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBGhhJS0FBSllXWQgBWUFJSUNMNwY+

Add LDOA2 regulator of MP5496 to support SDCC voltage scaling on RDP.

Suggested-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi
index bb56c1245f92..4aa17ed8235c 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi
@@ -12,9 +12,18 @@ ipq6018_s2: s2 {
 			regulator-max-microvolt = <1062500>;
 			regulator-always-on;
 		};
+
+		ipq6018_l2: l2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
 	};
 };
 
+&sdhc {
+	vqmmc-supply = <&ipq6018_l2>;
+};
+
 &CPU0 {
 	cpu-supply = <&ipq6018_s2>;
 };
-- 
2.25.1


