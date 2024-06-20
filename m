Return-Path: <linux-arm-msm+bounces-23379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF0910946
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91616281B02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE621AF680;
	Thu, 20 Jun 2024 15:08:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95491AED4E;
	Thu, 20 Jun 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896092; cv=none; b=kW2uvbY/L625PYtDEcc7YOE5UkpVywRdBvaRwuc+RsGkRgesiBE596z/ZRmrQaX8xq8qntyzsLYLZ/U1xWZRe6G6zpJce0CIpQQbrl6+Z8INW//QW4o9dJfrUg0YVTxTFFGI4xsyDfC27Qqnk4Qh1QYS6VxZpDjSIJawjJrnRvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896092; c=relaxed/simple;
	bh=A38uNFuqbWu1uL/s4VdoYZ4T7u+gnu1BcrPcKjtGLL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GE1plF814Dq7ZXDRJiHCdmAw2XGdCP1CtdV3w/6AufQjozo0wVt7MAn7XwpVTSqkbQGYLKDqIb2LX711fRGqxPSfbObRMPYzl9vJX0dVkzvITQYLnBEG6zi01K39B+JLPeQRMEw4GwbZ4Q3M49pjHlU+UeoUv83wSugi+uYitj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c01:9890:db34:2f44:25db:ea3c])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 249CB7E0107;
	Thu, 20 Jun 2024 23:01:30 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v6 0/2] arm64: dts: qcom: ipq6018: add sdhci node
Date: Thu, 20 Jun 2024 23:01:20 +0800
Message-Id: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUkaVh9JHh8eTk1PShoYSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtKQUJDQktBHxlIT0FJHU9PQUlOHxlBHhpIGFlXWRYaDx
	IVHRRZQVlPS0hVSktJQkNDTVVKS0tVS1kG
X-HM-Tid: 0a90362ac27403a2kunm249cb7e0107
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjI6Pgw*LzNWDkw*OTg9PRko
	Lg0aCwtVSlVKTEpDQ0JOTUJLTUxDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0pBQkNCS0EfGUhPQUkdT09BSU4fGUEeGkgYWVdZCAFZQUpCQ0I3Bg++

It is difficult to add OPP table for sdhci node due to lack of
datasheet and other data. Limit the maximum clock frequency of
sdcc to avoid overclocking SD/eMMC cards.

Changes in v6:
  Adjust the maximum clock frequency of sdcc to 200 MHz.

Changes in v5:
  Move LDOA2 regulator patch to other series.

Changes in v4:
  Change 'enable' to 'add' of the commit title.

Changes in v3:
  Remove always-on for LDOA2 regulator.
  Remove 1.8v properties of the node added in dtsi.

Changes in v2:
  Add LDOA2 regulator to support SDCC voltage scaling.

Chukun Pan (2):
  clk: qcom: gcc-ipq6018: update sdcc max clock frequency
  arm64: dts: qcom: ipq6018: add sdhci node

 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 19 +++++++++++++++++++
 drivers/clk/qcom/gcc-ipq6018.c        |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.25.1


