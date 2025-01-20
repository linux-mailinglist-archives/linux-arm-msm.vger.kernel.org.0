Return-Path: <linux-arm-msm+bounces-45592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8533A16DF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6096D3A5904
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD151E3DE3;
	Mon, 20 Jan 2025 14:00:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA051E0DBA;
	Mon, 20 Jan 2025 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381623; cv=none; b=WLllChdCEwbOLI9uoNsREDShsi1d2/6JZgOLLlCEJh4uH7lvA0kxrEQolkUde47feBbxo6/Q5tV08gLrOoceRjrBMrRilTPZZDPXAQ9cJ2vIFNSb3vdjmeUI/yZJvOFLILE6bk/l1/oA+E98GovoXCYokW9xkD+OVyPegVDUKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381623; c=relaxed/simple;
	bh=if1IJBgPQjMinB/E/gXbZAHRlKlanEcd/bK1JE83Izs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TEFoN46YsZFiAQUS3l2YUhQAawA/ijNffgK1mLnDfr6ogdkMfuKF0VGEhUFTyoMQolhgu/o2g8CGeGasXkR8zORtd0tuSb/NVt5ZFNjVVdL1mZOX2JsyGTKzJE5co5CCnw+HchH96nBenJsZyFTU39K08TCzn6zyxXnCd/ca5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.126])
	by smtp.qiye.163.com (Hmail) with ESMTP id 93577297;
	Mon, 20 Jan 2025 22:00:10 +0800 (GMT+08:00)
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
Subject: [PATCH v5 0/5] arm64: dts: qcom: ipq6018: rework CPU Frequency
Date: Mon, 20 Jan 2025 22:00:01 +0800
Message-Id: <20250120140006.655463-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaS00aVhoZHktJGU5DGhlCGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVKSU1ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a948403826d03a2kunm93577297
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PE06Eww6KzIcKDZRIQ9OKks0
	HgtPChdVSlVKTEhMSENKTUpLTENJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpJVUpJTVlXWQgBWUFKSU9KNwY+

Changes in v5:
  Collect Reviewed-by
  Change the aliases of mp5496 regulator from ipq6018 to mp5496

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
  arm64: dts: qcom: ipq6018: rename aliases of mp5496 regulator
  arm64: dts: qcom: ipq6018: add LDOA2 regulator

 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 44 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 28 ++++++-------
 3 files changed, 59 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi

-- 
2.25.1


