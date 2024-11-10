Return-Path: <linux-arm-msm+bounces-37418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1F9C32B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8291F211F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24A445038;
	Sun, 10 Nov 2024 14:00:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m6093.netease.com (mail-m6093.netease.com [210.79.60.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB62BCF5;
	Sun, 10 Nov 2024 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.79.60.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731247248; cv=none; b=rG4LQ5GDFh4t9nl4DUZCz837lEBjF0HfDpUR4Y87/w1GWho4uoYdMsXYoomGvyNNEgPn2YsH/yH5O+iuFRBKrup8e+vcxtuNchocVAb7Ticp8+4D0DINr307LykJ2MSdnsOf+6LoS+9dSWV6NilMM0aqcN72WU7Tv+Nlg6OytgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731247248; c=relaxed/simple;
	bh=YLz4DL8XCwJVoPnkfa5zUwb/kAZtAQQ5f7H0AN0NGCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WN1AMcfrRQm06rmxEeUfg5KJZ3XKknRT/ujcrtDYAV+Y3tazduTA4BUZNuythkgRvK5QF0X2jYLA4F0VYD5PIy9ujkkWgIn801c7mSGG18p0yVbZrl6hoEN5mb9Grgx7ma97TgAb26tYX1N2t8/1zvsC0OlLLqrEfjvpz8RULuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=210.79.60.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [113.116.6.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 24fe03a3;
	Sun, 10 Nov 2024 22:00:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v4 2/4] arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
Date: Sun, 10 Nov 2024 22:00:17 +0800
Message-Id: <20241110140019.3426181-3-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkNDVkoaHx0YGU9IHkpLSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVSkpNVU1VT09ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-HM-Tid: 0a93166064eb03a2kunm24fe03a3
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSo6Nio6TjItLC0JFTkNNx5K
	FS4wCgpVSlVKTEhKSU9MSUhMS0tMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSk1VTVVPT1lXWQgBWUFDQk43Bg++

The early version of IPQ6000 (SoC id: IPQ6018, SBL version:
BOOT.XF.0.3-00077-IPQ60xxLZB-2) and IPQ6005 SoCs can reach
a max frequency of 1.5GHz, so add this CPU frequency.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 57ad6f0e6e34..7514919132b6 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -140,6 +140,13 @@ opp-1440000000 {
 			clock-latency-ns = <200000>;
 		};
 
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <937500>;
+			opp-supported-hw = <0x2>;
+			clock-latency-ns = <200000>;
+		};
+
 		opp-1608000000 {
 			opp-hz = /bits/ 64 <1608000000>;
 			opp-microvolt = <987500>;
-- 
2.25.1


