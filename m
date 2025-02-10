Return-Path: <linux-arm-msm+bounces-47360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2E7A2E51C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 472AC167CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16B81A2622;
	Mon, 10 Feb 2025 07:06:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042261922D4;
	Mon, 10 Feb 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739171202; cv=none; b=BLwlFizyEF+5ZeoY3g9NHf8qgSb0aOSdeXnrgBhvPocE6igK0ljRA7KOSrea8LjtwR8KE9Fg3iMxN+Fc09hbY0vmMq2EESUy+tOnUdomkhI02HM7CthPUnCXBeEicjZ3Yz3RDIS8VfoUGHZGenLqRFPtF988sBHstwZoQ+QsU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739171202; c=relaxed/simple;
	bh=pD0NrdglrJw+8PSj1Nm1PY/lVuMPsNCjvvifVUxCz60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AiPiL2/Sb15X6WX/XCkSelQs7TA6+nSvbr/M4dzX8tsdaiKYcA7Z4PTAiuXxe3XSx+FG0XzuThp2ajxSa3vVEJt6qZGU7AmstjWfToVU0Y2z9UygIAoB3g3HR8agIMSYZVU89QcDCDeTmA4CNYrk1DCGnVbSxsVn2Rtwy553r5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.213.246])
	by smtp.qiye.163.com (Hmail) with ESMTP id a99674f7;
	Mon, 10 Feb 2025 15:01:27 +0800 (GMT+08:00)
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
Subject: [PATCH v6 0/5] arm64: dts: qcom: ipq6018: rework CPU Frequency
Date: Mon, 10 Feb 2025 15:01:17 +0800
Message-Id: <20250210070122.208842-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUpNVksYQ0seSh0eQkgZHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94eea9b67903a2kunma99674f7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NFE6Fgw*CzITT0s2ODkJQk4C
	PwEwCwtVSlVKTEhCSkxLQ0NDS01NVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpIVUlPTVlXWQgBWUFKSEpNNwY+

Changes in v6:
  Collect Reviewed-by
  Small typo fix in commit message

Changes in v5:
  Collect Reviewed-by
  Change the labels of mp5496 regulator from ipq6018 to mp5496

Changes in v4:
  Modify the commit message to further explain CPU Frequency of IPQ6000
  Rename ipq6018-rdp.dtsi to ipq6018-mp5496.dtsi (inherit ipq6018.dtsi)

Changes in v3:
  Modify the commit message to further explain CPU Frequency of IPQ6000
  Rename ipq6018-mp5496.dtsi to ipq6018-rdp.dtsi (common for RDP board)

Changes in v2:
  Add more CPU Frequencies in ipq6018.dtsi
  Move mp5496 regulator to ipq6018-mp5496.dtsi
  Add LDOA2 regulator to support SDCC voltage scaling

Chukun Pan (5):
  arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
  arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
  arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
  arm64: dts: qcom: ipq6018: rename labels of mp5496 regulator
  arm64: dts: qcom: ipq6018: add LDOA2 regulator

 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 44 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 28 ++++++-------
 3 files changed, 59 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi

-- 
2.25.1


