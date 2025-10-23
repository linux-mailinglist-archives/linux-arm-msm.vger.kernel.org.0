Return-Path: <linux-arm-msm+bounces-78639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9AC03396
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 21:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 886734E2466
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 19:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C833434DB47;
	Thu, 23 Oct 2025 19:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OLiCZ3pB";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="uYAARAUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A52EFDA5;
	Thu, 23 Oct 2025 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249139; cv=none; b=ttr+qC2HXWYyxSHbK7uCxPhQWQcYK+C5K5Hs1J/nGwlnuzk3QiWlnC6tznXYq0AolKVZYKYUL66DbS27INr9Mv3Oeg1FQgO5WHac069c41FylIoav1B4w25rYPVAnlLTmQoyr5TPCNncEk4NfL6Yjg+a/FCfiqc3Txr0Dpk7EHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249139; c=relaxed/simple;
	bh=sHUw8TXefNVNqJ9dbeVVq2lmdHHc7gjWiH9kRpBn3sw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jF5L/wFsPv4LbMM8xzO9b6EyNhK8Umo4/P+iG0cKg7RkNOduu4TKkuR9mWzL+XQ8VdpQxuUyOcua8qk9xY6NNapeq835UHnssVhzyWOKOzy7pFJbNj7AAd0tLO7q8JRPHFdA44XrOUqulZfsFQNsODi8kXL3PfUd1XWYLvUAsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OLiCZ3pB; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=uYAARAUu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1761249129; bh=C46nEt0t3S5/oSHcF9wwDUt
	5uysDMu3pgMCcP8+j3eE=; b=OLiCZ3pBa3EWbk+Jf7rJh2hWHVKF6oVINY4sOutL+zoXZWJz+X
	WVi+vFWdYsDnOmfQCjB+GWUI3wPtJH7Z10nvPXBm7nOHZUR/gxoHeO9eDMNaVb1TxnjM/Pvqxeh
	P0cky1JJLOxXKUeKr5g3sx/lB+IBQqCYRIaoijZ3Y2BW1Ku0OAgJaFVqnMmAjaXVc6ySPBbk8FZ
	l5WxIzYBBv1/rnIA2QIOYqzBJ5mCrwTwuawfAZ22TiBC8u5r0g9EsmHzn4244pB2w3hUcyEUWJk
	hr8VNUE/gTaVuK9n4DP9QNPiZcW/Dg/RZOKey3eei2zZiDBCeai62OhbmUL/eX6PQvw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1761249129; bh=C46nEt0t3S5/oSHcF9wwDUt
	5uysDMu3pgMCcP8+j3eE=; b=uYAARAUuwSOU/7sDF65JmFQsPuDjULdenhSyxrpoXQtfTTgVDH
	HMy/aU574LlnaThHwkIFkJiSXSm+jjKGWNAw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add support for SDM660 CDSP and
 ADSP FastRPC
Date: Thu, 23 Oct 2025 22:51:58 +0300
Message-Id: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF6H+mgC/42PuW7DMBBEf0VgHQa8D1X5j8DF8pIJRJJNKkIMQ
 /9uSipSpEmzwCx238w8UY0lx4r67olKXHPN89QEe+uQv8I0RJxD04gRJimhFt/9POIaRqUI9qH
 eMOwjLBWbBM4pTTg3EbX/W4kp/xzsz8upS7x/N4vlXP46NMOTb/7ypYUglVEaqOlXtpMd1Ijb3
 ZiXvrM8cQdOcEqCSElzwrT3IhlNtWBGBGG1Bp/QnuGa6zKXx1F3pUeIfzRbKSbYgpOJGSVBxY8
 R8vSVpzwN73MZ0GXbthcT9yRVSwEAAA==
X-Change-ID: 20251019-qcom-sdm660-cdsp-adsp-dts-8fabb670338e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761249128; l=1423;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=sHUw8TXefNVNqJ9dbeVVq2lmdHHc7gjWiH9kRpBn3sw=;
 b=maJMpObJ1oFsvLNYf+84GTMwCCAs8U+EqaqViATQ1M3cJd7o/bXQOGhQFE/tIjXhM2s1G7eov
 Hn8W1wQWopgBGQqVu9rdAsLZLhecZrBMW9wmt6DJ5F9A00wyw9EBLwq
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds support for SDM660 CDSP remoteproc and also adds
FastRPC support for ADSP.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
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
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 162 +++++++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+), 10 deletions(-)
---
base-commit: 93f3bab4310d4ff73027cc4f87174284d4977acf
change-id: 20251019-qcom-sdm660-cdsp-adsp-dts-8fabb670338e
prerequisite-change-id: 20251018-qcom-sdm660-cdsp-59ad56867a18:v2
prerequisite-patch-id: a8c9703aec1663b8226556ba1770bd6c5b4ef060
prerequisite-patch-id: 5a49b179c69e045e8003f28e8ef0e6e003c0064a
prerequisite-patch-id: dd158e1214a7e73ac0a8f1da9d3face61ad7d5bd

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


