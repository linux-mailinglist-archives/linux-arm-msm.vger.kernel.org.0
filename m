Return-Path: <linux-arm-msm+bounces-81138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D024CC48E75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66D1F18949D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D90335089;
	Mon, 10 Nov 2025 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tEZ2t2C5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kTb0P3x6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6CE32E6B3;
	Mon, 10 Nov 2025 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800969; cv=none; b=eF7Nefs/RP0socsKR3+O1lQT5b/sQ1aW1edvYS1TX9K/+l39JiDcG9FOCRHORgq033/gAyHM/vFPY5UnHm6ZUvfM9LfdI3+fEcl9igtGsIKMaPZBB5ZofZkEu8kv55HbABwEmCsA198gC6zwjGmCWgM3nqtCdFG7qBCDYFL71Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800969; c=relaxed/simple;
	bh=AQE7U/VupyWZUQxlablk26n00PMnOjK4CR+gbSV5xL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rcKht8itP40cJLn8uqkvTW7P+yeLnfJB9y/UCm5s66Ua8L83KHgUPQ9TZWfDO2yO2Cub3IUeYnODIQcusYZyhCfDN7+igr43LChWq8ChXnNMXwpMRv0YXl8/bs9RRKsG6eDdMjZIGfuX2uvO+VBLqV6rqqZo9DR8iOK0xgzJnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tEZ2t2C5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kTb0P3x6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1762800909; bh=+kckv3x8ijHjyud85NatWZ4
	deFyEZJKo9HcFG1Krlmc=; b=tEZ2t2C5ocZAgYLoFQhst1lceg3bzcb90lNvwfLw4J9KrNC1mt
	TZA9515hjDln2qURVrru5DmezVUuhuVFfaOUotCRLG4YKtr0kabA1A/Xa0eBCaSyOVuCbPe3GMP
	eCImUmndjMMpmM3vdb0hWxx6tJPTFBTprEC6koNF83jP3IdmRVmD6q0/4S446tAQtz8IsF2cLW7
	8SXEZ0r7L2Un0CQb1yNMxiFujExOj/Y4dUK2PLCkQ0uG44q7DPVkPmlMSpKTnNLAZdbGQHcNKFJ
	O02mIAFSmcF1joPQtkj+jF0IlL6XyfrNNS2Cfkw5PKCaFepY2qAYB8AqcyirvZdz5UA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1762800909; bh=+kckv3x8ijHjyud85NatWZ4
	deFyEZJKo9HcFG1Krlmc=; b=kTb0P3x6WAoc6GJ13utAOiwsUv+sGp3o9Nhd8+i6v0qpBIWbp2
	FqFVIn6U1izUgX3hrCIJYV1zaxBmwWMtshBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add support for SDM660 CDSP and
 ADSP FastRPC
Date: Mon, 10 Nov 2025 21:55:05 +0300
Message-Id: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAo1EmkC/43QzWrEIBQF4FcJrmtRr4kmlNL3KF34c80ITTKja
 WgZ8u41zqZ0oHQjngt+Hr2SjCliJkNzJQm3mOMylwAPDXEnM49Ioy+ZCCZaznhPL26ZaPZT1zH
 qfD5Tcyx+zVQHY22nGIBGUs6fE4b4We3Xt1tOePkoV6y3IbEmIy3eFNeh6SGANVYCZ16GoIAJ5
 ZwMWnElhZZe9koZFw56wpxN7TY0T7Ua5+y+2ga07Bw4UEIrVOJlMnF+j3Ocx8cljc/k6HWKeV3
 SV/2Cjddi/3jtxovdG9sGobvWdPjLrvQmfnAC/uJE4XTfhoAtO9Q7bt/3bwaqWfauAQAA
X-Change-ID: 20251019-qcom-sdm660-cdsp-adsp-dts-8fabb670338e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762800909; l=1761;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=AQE7U/VupyWZUQxlablk26n00PMnOjK4CR+gbSV5xL8=;
 b=Cv49/bPEsFgeDmq9STi9BQnq6Y09j+jJ5wSpxVA4LxmCTde2usRZOwJ8tlpHGdS98z+4AXOKP
 P6F4W682f9fA2Rw0UBLp3mYQ5TPwUftYAAWq3tlk440hZbqc5G00q9b
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds support for SDM660 CDSP remoteproc and also adds
FastRPC support for ADSP.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v3:
- As suggested by Konrad removed the qcom,non-secure-domain property from CDSP's fastrpc subnode.
- Changed the label in the glink-edge subnode of remoteproc_cdsp to "cdsp"
- Added R-b's.
- Link to v2: https://lore.kernel.org/r/20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org

Changes in v2:
- As suggested by Konrad reordered properties in the cdsp_smmu node.
- Fixed indentations for interrupts property for the cdsp_smmu.
- Fixed formatting for the CDSP node.
- Splitted ADSP-related commit to separate ones.
- Link to v1: https://lore.kernel.org/r/20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org

---
Nickolay Goppen (3):
      arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
      arm64: dts: qcom: sdm630: Add missing vote clock and GDSC to lpass_smmu
      arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP

 arch/arm64/boot/dts/qcom/sdm630.dtsi |  40 ++++++++-
 arch/arm64/boot/dts/qcom/sdm636.dtsi |  23 +++--
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 161 +++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+), 10 deletions(-)
---
base-commit: 93f3bab4310d4ff73027cc4f87174284d4977acf
change-id: 20251019-qcom-sdm660-cdsp-adsp-dts-8fabb670338e
prerequisite-message-id: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
prerequisite-patch-id: a8c9703aec1663b8226556ba1770bd6c5b4ef060
prerequisite-patch-id: 5a49b179c69e045e8003f28e8ef0e6e003c0064a
prerequisite-patch-id: dd158e1214a7e73ac0a8f1da9d3face61ad7d5bd

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


