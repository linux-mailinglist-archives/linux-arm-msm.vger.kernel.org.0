Return-Path: <linux-arm-msm+bounces-47363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F945A2E526
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E570C188D19C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884C51BD50C;
	Mon, 10 Feb 2025 07:06:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252E01B4149;
	Mon, 10 Feb 2025 07:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739171211; cv=none; b=lHHjNkaHJU50Z7Wru1v4n3YtHTb7e38axWz86PtPygmbiTPUPTkmzby/vZcGzjUZ213xriuEgPTyG54dclUrPSombjhocL+k2iWLFHGPh/eop/P9kJrNn23u977OXXzIXVFYtVa0scqJ5Q7RbdiqkQSQdxYZvJqeHUEpgAGaT1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739171211; c=relaxed/simple;
	bh=xJywoSB3ZphGXm9Arwqc+Z7YKhKh1ayvTAfnmDuMcvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LxAH762OKNa1BHe7MhJvvRkUGUMyDSOvURbPe1LeqG5m4GTQBV3XN+BNS8PzesX0QT5Q/wl7zf/j2Kk/VNkfgTGyaPGSedXva7i1sPZl4vY8HWy67rovGm5LEixrhohEvMh/6E1ROWv9LA9ENhDGECGibFvLHFi6bZ6pXihOO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.213.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id a99674fd;
	Mon, 10 Feb 2025 15:01:32 +0800 (GMT+08:00)
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
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 2/5] arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
Date: Mon, 10 Feb 2025 15:01:19 +0800
Message-Id: <20250210070122.208842-3-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQklNVkNIHUJISkJNSxlMTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94eea9ca2d03a2kunma99674fd
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phg6Nzo*DTITNEsUAjgWQkw4
	MEwaCxBVSlVKTEhCSkxLQ0JISktKVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpIVUlPTVlXWQgBWUFCTks3Bg++

The early version of IPQ6000 (SoC id: IPQ6018, SBL version:
BOOT.XF.0.3-00077-IPQ60xxLZB-2) and IPQ6005 SoCs can reach
a max frequency of 1.5GHz, so add this CPU frequency.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


