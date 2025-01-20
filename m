Return-Path: <linux-arm-msm+bounces-45593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFFFA16DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1C2F1695DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440D61E47AD;
	Mon, 20 Jan 2025 14:00:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75C1E0DFE;
	Mon, 20 Jan 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381624; cv=none; b=NXbH+LvpdnScQPozBh+LQXXeFTWyJZYdc3ZaOAo1OQ+bsc/ehuiuBFgq0IVSD+cZe/wArx9zccxhA+pNKJ8QAuSfMPMF3zssohfin1oxYv0Aezt6xGSG1fVCySUH71vEJb3KrIIrWfxrfP1cRK4YPl3i1E4PcIhXnaqCQpoEoLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381624; c=relaxed/simple;
	bh=NSVWKv9W3XsnBnI8ENfih3ms7NaIdhrXMVVQjnQtL/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kkLU/YP2laPaKzcPodxWBKyqBZS7G/3ydnYwbHrW08kkwh+Y5ksutYTZOq8xZeMojY0s0yG/xttABIwmKw1Mn7wgZnr6/s0UXdJ3vL1g1GC6h+Ujvui3uHIQEe5objklHLd3dLhG6L6LoewtOJlfdGC+QFqjGgzwZPfbAEJ3yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.126])
	by smtp.qiye.163.com (Hmail) with ESMTP id 935772a3;
	Mon, 20 Jan 2025 22:00:18 +0800 (GMT+08:00)
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
Subject: [PATCH v5 4/5] arm64: dts: qcom: ipq6018: rename aliases of mp5496 regulator
Date: Mon, 20 Jan 2025 22:00:05 +0800
Message-Id: <20250120140006.655463-5-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120140006.655463-1-amadeus@jmu.edu.cn>
References: <20250120140006.655463-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0lOVh8fGk1KSEhKGR5MQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVKSU1ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSktLVU
	pCWQY+
X-HM-Tid: 0a948403a18d03a2kunm935772a3
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OQg6Thw4QjIKNDYyCw8sKkNP
	FRBPCTpVSlVKTEhMSENKTUpDQ0pNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpJVUpJTVlXWQgBWUFKSUlJNwY+

Change the aliases of mp5496 regulator from ipq6018 to mp5496.

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


