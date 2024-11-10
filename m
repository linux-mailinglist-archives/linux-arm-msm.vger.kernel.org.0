Return-Path: <linux-arm-msm+bounces-37417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF129C32AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155381F20F12
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C0A1DFE1;
	Sun, 10 Nov 2024 14:00:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m6029.netease.com (mail-m6029.netease.com [210.79.60.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8D101EE;
	Sun, 10 Nov 2024 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.79.60.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731247244; cv=none; b=aNGIV3WLM8plxRBU8yTXwGhBYan667oy6Av2iiElRejfAIeVBibZkvshuIqgHAwVHERjGnH6wvqgzCBR0NuGnTUCGtGR4Fbi41bdFj7YdGvBYBRzGlR3VKjCUnJ5q0Xejq2B+xaXprTuv6FztyMemTVnVYrSpidr2cf7tk+w/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731247244; c=relaxed/simple;
	bh=p0eEhEZTALt8y48BJJSgM4eOFjTiUNLHp0OHRuN0Z8c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lGUqbWYCmE4vLH9Ge6ysDczVQS7nSCCxT8lMRL9Qo1cRNV9V01ZsAm8SqpInmo/pBIc9rMOMU1WP+dmY3lAfxLtz4einrN0SX2jIxT3KZodvE2g/EzLNf8NlK/dVU5/4QO/gqrE88MkvvcDw1Op0IlowWPxVcQUcl2Y/887236s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=210.79.60.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [113.116.6.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 24fe03a0;
	Sun, 10 Nov 2024 22:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v4 0/4] arm64: dts: qcom: ipq6018: rework CPU Frequency
Date: Sun, 10 Nov 2024 22:00:15 +0800
Message-Id: <20241110140019.3426181-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUIZVhpNGB5KHhhKGh9NTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVSkpNVU1VT09ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-HM-Tid: 0a9316604eb103a2kunm24fe03a0
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6Ggw5ATIfGi0SIz8xNy0v
	EjlPCxdVSlVKTEhKSU9MSUhKSEtLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSk1VTVVPT1lXWQgBWUFKS0xLNwY+

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

Chukun Pan (4):
  arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
  arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
  arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
  arm64: dts: qcom: ipq6018: add LDOA2 regulator

 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 44 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 28 ++++++-------
 3 files changed, 59 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi

-- 
2.25.1


