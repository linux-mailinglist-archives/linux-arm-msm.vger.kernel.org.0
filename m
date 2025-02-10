Return-Path: <linux-arm-msm+bounces-47362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA743A2E52E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CD697A3335
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680691B425D;
	Mon, 10 Feb 2025 07:06:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DA01B393D;
	Mon, 10 Feb 2025 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739171209; cv=none; b=cE8mkHGD59Hz7fqS52OMnJVPd3Ey47LKpIVrDXaK/gLPmViKnImMDdtJJQpAsrx5r1QII6w/VY2opgucani1TJogp9vEV3Yj3Bfaf4f8ZNs4itdcRJYAoPvtLW1pl4UQ0+5E+n3pDZN6IKi/U9RQrmEbsU6wJuLc83L6KZOu0JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739171209; c=relaxed/simple;
	bh=qDpgbY+pkSwvz26gf9AUZJVQKeT6Jrh5kQbO+V4RziA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gmYRn85CQXEXtp6DFXx6l49XnXC8p7HWuaMXXbGnnzP8QZ2OT/4AteBrOQHwF79sX0eE3q1M6RKpB2uvS9aErTXnEzA2g7lz/l2K4wprvnSB4qAPoo5yE6jEwyZzTNA8c15fGocxSHY9zY9UlWFuNZMhhFFznta/iGmVWvPGqXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.213.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id a99674fb;
	Mon, 10 Feb 2025 15:01:29 +0800 (GMT+08:00)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 1/5] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
Date: Mon, 10 Feb 2025 15:01:18 +0800
Message-Id: <20250210070122.208842-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210070122.208842-1-amadeus@jmu.edu.cn>
References: <20250210070122.208842-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGRoaVk5ISktPHR8YSB4ZTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJT01ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-HM-Tid: 0a94eea9c10b03a2kunma99674fb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OC46OBw6EjIJMEsyAjk3Qk4o
	PS8wCkhVSlVKTEhCSkxLQ0JLQ09MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpIVUlPTVlXWQgBWUFCT0s3Bg++

The final version of IPQ6000 (SoC id: IPQ6000, SBL version:
BOOT.XF.0.3-00086-IPQ60xxLZB-1) has a max design frequency
of 1.2GHz, so add this CPU frequency.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


