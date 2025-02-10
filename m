Return-Path: <linux-arm-msm+bounces-47357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85274A2E4DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B625B188B0A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D6C1ACEAC;
	Mon, 10 Feb 2025 07:01:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C41ACEC2;
	Mon, 10 Feb 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170904; cv=none; b=E1Wx5SF291wa3DbqckFsHuxfk4lUSwcyYq4/FO1qfqlfrReAHK1yh3hod15Ef5wNfmhMa5d27MbS8w1kFT50+sSzbDQXhiZ2KBO0SX3kj03PYxPLD0IR9aI/HHCxpHNJvaUBLxE8pX9a2+xLcx2n8wUgF/MWv7OnKslcE10IxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170904; c=relaxed/simple;
	bh=NlDPQ3SoBpBEm8Z+/r8oj4OA9TgTzyH5wymt+ye9W/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gBfS3DR8afWMYiI0JwEL87dISAWlM15OxGkGGnEQAe2+2bbp47pVoZYxHKlh9+DdNAMScxRqouSqWVB90CC3oOm3umCEsrXZVvk1S1DZUDdfwZnTGWtAoP6Nt5Up4OdgzSjY58eFmvdcXRWRDQ8UZcnqy1qu/vhKIO7Kb1em4VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.213.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id a9967502;
	Mon, 10 Feb 2025 15:01:36 +0800 (GMT+08:00)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 4/5] arm64: dts: qcom: ipq6018: rename labels of mp5496 regulator
Date: Mon, 10 Feb 2025 15:01:21 +0800
Message-Id: <20250210070122.208842-5-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEJCVk5CQ0pPGUNOSBlNHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJT01ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSktLVU
	pCWQY+
X-HM-Tid: 0a94eea9da6503a2kunma9967502
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Myo6Aio6OTIRKEshODojQkxD
	KCkaCTxVSlVKTEhCSkxLQ0JMT0hNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpIVUlPTVlXWQgBWUFKSUlKNwY+

Change the labels of mp5496 regulator from ipq6018 to mp5496.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
index fe2152df69f4..08b54b1e5249 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
@@ -7,26 +7,26 @@
 #include "ipq6018.dtsi"
 
 &cpu0 {
-	cpu-supply = <&ipq6018_s2>;
+	cpu-supply = <&mp5496_s2>;
 };
 
 &cpu1 {
-	cpu-supply = <&ipq6018_s2>;
+	cpu-supply = <&mp5496_s2>;
 };
 
 &cpu2 {
-	cpu-supply = <&ipq6018_s2>;
+	cpu-supply = <&mp5496_s2>;
 };
 
 &cpu3 {
-	cpu-supply = <&ipq6018_s2>;
+	cpu-supply = <&mp5496_s2>;
 };
 
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-mp5496-regulators";
 
-		ipq6018_s2: s2 {
+		mp5496_s2: s2 {
 			regulator-min-microvolt = <725000>;
 			regulator-max-microvolt = <1062500>;
 			regulator-always-on;
-- 
2.25.1


