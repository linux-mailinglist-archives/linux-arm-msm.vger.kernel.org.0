Return-Path: <linux-arm-msm+bounces-37419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD519C32B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55BC728155B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC9B22318;
	Sun, 10 Nov 2024 14:00:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m2418.xmail.ntesmail.com (mail-m2418.xmail.ntesmail.com [45.195.24.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0C200A0;
	Sun, 10 Nov 2024 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.24.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731247257; cv=none; b=DCrZkFeREIZatN73ahqmgRl8yPW9I8urf03d+YoQU2Ceah4hGV5a8+ejHkDXd3EbMsPSfjYI9X8yHkByAUsdo6ALsQ/RMdWoofdfapwj6p7ltmC3P301Mq1QiK4xMT4lOKK8jsGbP9xOKV4FkZDcmltokhvneMwPJIEuNgVIVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731247257; c=relaxed/simple;
	bh=8JAVTZmA2yp2tNG6SaXz1Kq4su1SU/83FVKKLu0fEk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aNkxIcCjzQBZZuubCvgV9Ghrw/urtB4hBFANxR1F9ExM+5tWjLhRBD6OHNUBuHZ3jOpXDzD68S7rt28+piTB5jWTAkFp15DyAm5ApOKPCjjYnlVxDkECOeJn28fk1R5iwEJ/X5B+TEp8e+FFKNhuiTDmTwYdbjUiIh6c5m+wpqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.195.24.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [113.116.6.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 24fe03a8;
	Sun, 10 Nov 2024 22:00:43 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: ipq6018: add LDOA2 regulator
Date: Sun, 10 Nov 2024 22:00:19 +0800
Message-Id: <20241110140019.3426181-5-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241110140019.3426181-1-amadeus@jmu.edu.cn>
References: <20241110140019.3426181-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkJCVktJShpCQk1OTUNOHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVSkpNVU1VT09ZV1kWGg8SFR0UWUFZT0tIVUpLSEtLTE5VSktLVUtZBg
	++
X-HM-Tid: 0a931660817b03a2kunm24fe03a8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NEk6Vhw6GDIeGi0MIzlNNxgR
	DygaCwhVSlVKTEhKSU9MSU9PT01PVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSk1VTVVPT1lXWQgBWUFDSUg3Bg++

Add LDOA2 regulator from MP5496 to support SDCC voltage scaling.

Suggested-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
index fe2152df69f4..0a57e1afe218 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
@@ -31,5 +31,14 @@ ipq6018_s2: s2 {
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
+
+&sdhc {
+	vqmmc-supply = <&ipq6018_l2>;
+};
-- 
2.25.1


