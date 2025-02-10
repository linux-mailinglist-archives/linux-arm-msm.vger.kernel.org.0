Return-Path: <linux-arm-msm+bounces-47358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF4A2E4E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A33B3A42E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E648C1AE00E;
	Mon, 10 Feb 2025 07:01:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6402F1AA1DC;
	Mon, 10 Feb 2025 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170906; cv=none; b=dfkgLXwOkj728BYAdGy0/n85vRHA333ICp3/tjxEZ0DOciEKQN0qc4t/vGpitelUyl/nR9XqtH4oFdz1n7EZTiFyP2eMUm01LuMWk4m0EXb/8FgJKDyJ1wJpitYVewG5VC8b3vb+1cwWAuDBaGXPHjxJTdmGy4H42Jb/LQYCL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170906; c=relaxed/simple;
	bh=hxkH07tC1P8ZC5rl6Mtx46DUZ2ZoiFa3V5y3IMHSEQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sCgLPh01mTd3yjAiA7CyELeztNOFbcPIGuqQjFzeYc5iHZ8bhNBUfY+lsAL9UvzpEr3a6ZCGFH6euoXrf+PN7LdF8ItWFiDSDa69DTKhAzgdG5yCCQYdGZ7Mi1QGGJqHVgdyHnBegGo9htX/2iFLEj0K5ZMlQ6GnKetvmRF3NXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.213.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id a9967504;
	Mon, 10 Feb 2025 15:01:38 +0800 (GMT+08:00)
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
Subject: [PATCH v6 5/5] arm64: dts: qcom: ipq6018: add LDOA2 regulator
Date: Mon, 10 Feb 2025 15:01:22 +0800
Message-Id: <20250210070122.208842-6-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkxDVhgZHkxKGUgfHRgZH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94eea9e34b03a2kunma9967504
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kww6Igw6MjIKEkswKDgBQgEW
	LgIaFC5VSlVKTEhCSkxLQ0JCTU9KVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpIVUlPTVlXWQgBWUFDSUs3Bg++

Add LDOA2 regulator from MP5496 to support SDCC voltage scaling.

Suggested-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
index 08b54b1e5249..d6b111a77f79 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
@@ -31,5 +31,14 @@ mp5496_s2: s2 {
 			regulator-max-microvolt = <1062500>;
 			regulator-always-on;
 		};
+
+		mp5496_l2: l2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
 	};
 };
+
+&sdhc {
+	vqmmc-supply = <&mp5496_l2>;
+};
-- 
2.25.1


