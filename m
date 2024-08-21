Return-Path: <linux-arm-msm+bounces-29189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FC9599A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E55051F219E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E2A20FDEC;
	Wed, 21 Aug 2024 10:10:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53320FDE7;
	Wed, 21 Aug 2024 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235053; cv=none; b=gB7sFFPgZiYBrp+4G7/BP5kSt11WDhoO1GG9euYG5F5h8CFBbMz9wz7UrkczAnB48WChYWWUNN0DJzW3+XKI2Cg+u3LlaBBU34lWlteOks0xb2RBWj6UJYF2bGmzkBByC2CLuBsA75LZ+Fu6i7WyafM9iWYgdQfKcxYAHgxP6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235053; c=relaxed/simple;
	bh=EGhrbLwsu+mrU+4W7NCbXZ47WeYGHDmumbvM8Uhv/Lg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GwwDFfI6MYQyqZ6m3AtidNpk6Kyb+9tHrR2vEoajEWOXeE8EiTPb2yXq1Il42BIgwSOhB6e9qfHnbhwH1zrGWgpo9f+S1LW5Dv1nLe/hC+Ess5pBG48lR/jucfYopxgLIyhrozzWmbxSNPRvTVlLFNS9a1xJMfDbe9HlvxpsKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:ac20::1])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 3F8D27E01D7;
	Wed, 21 Aug 2024 18:10:37 +0800 (CST)
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
Subject: [PATCH v3 0/4] arm64: dts: qcom: ipq6018: rework CPU Frequency
Date: Wed, 21 Aug 2024 18:10:21 +0800
Message-Id: <20240821101025.858961-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTklJVkJJHh9PQx9LSU5IQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQRoYSUtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	xVSktLVUtZBg++
X-HM-Tid: 0a91746abb2103a2kunm3f8d27e01d7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mgw6SQw*EjIrDio*HjkqIh8t
	L0pPFDBVSlVKTElPSUhOS0hMQktDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBGhhJS0FBSllXWQgBWUFJS09JNwY+

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
  arm64: dts: qcom: ipq6018: add LDOA2 regulator for rdp

 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  1 +
 arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi    | 41 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 28 ++++++-------
 3 files changed, 56 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-rdp.dtsi

-- 
2.25.1


