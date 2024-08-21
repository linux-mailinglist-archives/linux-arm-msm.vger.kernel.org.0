Return-Path: <linux-arm-msm+bounces-29190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C849599A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B1D284AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C890520FDFC;
	Wed, 21 Aug 2024 10:10:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B020FDE9;
	Wed, 21 Aug 2024 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235053; cv=none; b=LTU3bS27EnCcswi223pMaAq2o47Z1h0RoEDontByFsN+fgfkoiIUxE397HAojDvF87hlbjGz8necudoH6iZmCY8fFv6pI0FMenH2W/eXW5m1JTw0P7l/QUpCPFcgKrMqZ9HOrbLEWtIkngXeFRAzCgD2a+JSIUELefl4Un5WWrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235053; c=relaxed/simple;
	bh=VrdJvXm2sC9xmYQzGLd2CrG3SKsFp+2orO2ikPyeeuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rXT8fmnqF13q0SRShmCVPxJVNmyD1Q7GRs1MLMgLYfMKA9AmTBQ2QwgNHSjepuL3v783hi1oxZtpX2cAInW9YCxqc6gVnWFeJzwjnDDXofzlQ3iTvLxIxXVBQI4vUCPCuXCuWwxEysY5nebAQzQb0aYMBkyTPRi+YqhUqC+sTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:ac20::1])
	by smtp.qiye.163.com (Hmail) with ESMTPA id CAD6C7E01BD;
	Wed, 21 Aug 2024 18:10:40 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v3 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
Date: Wed, 21 Aug 2024 18:10:22 +0800
Message-Id: <20240821101025.858961-2-amadeus@jmu.edu.cn>
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
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0ofVkMZTx5MTU0fGUMZSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQRoYSUtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	xVSktLVUtZBg++
X-HM-Tid: 0a91746ac91003a2kunmcad6c7e01bd
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6Vhw4SDIyDipMQz8sIh9I
	LAkKCSFVSlVKTElPSUhOS09KTktLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBGhhJS0FBSllXWQgBWUFJSUpDNwY+

Some IPQ6000 SoCs (fused)[1] have CPU frequencies up to 1.2GHz,
so add this frequency.

[1] Usually the SBL version is BOOT.XF.0.3-00086-IPQ60xxLZB-1

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 8edd535a188f..1b584d9aadd1 100644
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


