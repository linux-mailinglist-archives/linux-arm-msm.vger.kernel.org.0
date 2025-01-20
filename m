Return-Path: <linux-arm-msm+bounces-45596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFBA16DFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD30169D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7518F1E5705;
	Mon, 20 Jan 2025 14:00:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF41E1C36;
	Mon, 20 Jan 2025 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381625; cv=none; b=uRrOnsDl1LLLYS+YskpjENdpUn5LHbv0JnMf9hQp8w8xn6/OGf8nngNpuCQedlLOk08J7OpvXsD8EZLhM0HNRjfkThjPuPZX88TmDMffDgd+ByMGmJO/043t+1RkKmMSo/OmDTHcMHOfWI219H2WrTPK5yaC824YvSEBd0UApC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381625; c=relaxed/simple;
	bh=hxkH07tC1P8ZC5rl6Mtx46DUZ2ZoiFa3V5y3IMHSEQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5g1K8YcjYBukeJShY0VZ2VkMmzXNX0/T3KqlGbk8ADewPPascdca9KPOIxnRPVduP77v6+OWCGSVb3/D5QkHSncMxqYDDTb6OcaUGG3kElHWRgnbYbotMepSRZDc8aOK8srvBAg7QB7lZaPKMU8M0AW/j6FiJoWvtW5532x6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.126])
	by smtp.qiye.163.com (Hmail) with ESMTP id 935772a4;
	Mon, 20 Jan 2025 22:00:19 +0800 (GMT+08:00)
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
Subject: [PATCH v5 5/5] arm64: dts: qcom: ipq6018: add LDOA2 regulator
Date: Mon, 20 Jan 2025 22:00:06 +0800
Message-Id: <20250120140006.655463-6-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQklNVklOQ09JH08ZSxhMT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVKSU1ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a948403a7cd03a2kunm935772a4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Nio*FDIOODYOMQ0jKks8
	CiJPCRBVSlVKTEhMSENKTUlLTkJJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpJVUpJTVlXWQgBWUFDSUs3Bg++

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


