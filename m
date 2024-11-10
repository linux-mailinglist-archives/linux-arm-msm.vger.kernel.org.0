Return-Path: <linux-arm-msm+bounces-37420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C19C32B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7BEB2814D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83D620B22;
	Sun, 10 Nov 2024 14:05:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m92226.xmail.ntesmail.com (mail-m92226.xmail.ntesmail.com [103.126.92.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494CFDDD9;
	Sun, 10 Nov 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.92.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731247555; cv=none; b=DOPP/fb4r6eHGCjB6n+hHK0oqKdhUkifC+ZLC1p2kD7JBm1lxaXzopURTWoj1I0X2WczibBAJvZibD0O8sMQHhj5omX7r1ieCM3c1394BM4Tje0BDsrytNSXnA1iYx26PFbRIeUHOR4f+18p0oAtYuaytZXlDx5BvcWaLulkd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731247555; c=relaxed/simple;
	bh=CrrSKl79p3BvyaItxoA9OT9fy7jUXX2MxQX+aNC2oRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jvYLRG3pZ0OyZaYNyK2eyucTkDGKWIxInCyleMxZf30CBTH/BEcSN8KMFy6FerG1wqE27p+JRA7MzUQaJnFRniJQtp3lGjxCDNyyrA4zi+NRtQH0+W+i0TeYYXVgMT9Rjo3nHLtR40ZXRTb6+7q4c4TfHdmD5MaXZBAHjV63C7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=103.126.92.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [113.116.6.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 24fe03a2;
	Sun, 10 Nov 2024 22:00:34 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v4 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
Date: Sun, 10 Nov 2024 22:00:16 +0800
Message-Id: <20241110140019.3426181-2-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTElDVksfGExPHUxPQh8YQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVSkpNVU1VT09ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-HM-Tid: 0a9316605c0203a2kunm24fe03a2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6Mgw5DjIYDi09MzoWNy9O
	FzNPCQJVSlVKTEhKSU9MSUhPQ0hDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSk1VTVVPT1lXWQgBWUFDTEI3Bg++

The final version of IPQ6000 (SoC id: IPQ6000, SBL version:
BOOT.XF.0.3-00086-IPQ60xxLZB-1) has a max design frequency
of 1.2GHz, so add this CPU frequency.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index dbf6716bcb59..57ad6f0e6e34 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -119,6 +119,13 @@ opp-1056000000 {
 			clock-latency-ns = <200000>;
 		};
 
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <850000>;
+			opp-supported-hw = <0x4>;
+			clock-latency-ns = <200000>;
+		};
+
 		opp-1320000000 {
 			opp-hz = /bits/ 64 <1320000000>;
 			opp-microvolt = <862500>;
-- 
2.25.1


