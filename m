Return-Path: <linux-arm-msm+bounces-28850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3032D9555F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 09:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0291C21453
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 07:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3007B12CDAE;
	Sat, 17 Aug 2024 07:06:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AD620E6;
	Sat, 17 Aug 2024 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723878370; cv=none; b=HENWGVKQGR+cO2KRX+UXOiaDvLLyiQoEFtM0yhmWE6rH6qv5mCQLwyQhWOUcipl3EeSoW/LJbICv1MNR+hiwD9Yse3u93oCgdz3l2UTTKQkn7vd05W50trLCwbyom9bELm1VMOIGWkUPF2NeXan5DmVk01R3qQuXJiJW/mOnC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723878370; c=relaxed/simple;
	bh=IY547ZcpWtIPAEJC9DbRMzd7nGkJUZiA8PpUspOKts8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcIMi+vawErJG+sD4gPZk+/Om/ytGgPRnNnckhx6Q4IIfsGeYaYzbVs93dItseZ0hFQ/8Mj9LHzTEf6WR/KPHtfwAQomq8dxq1LCGFN62oh25+Ln8dnoonTxXMioGo/bp+rnwe+TVyUcZ94VERLwn/s63SYsPvHVYV7Mh56AbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 4c0366b7;
	Sat, 17 Aug 2024 09:05:57 +0200 (CEST)
Date: Sat, 17 Aug 2024 09:05:57 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 0/6] Add initial DTS for Samsung Galaxy Book4 Edge
Message-ID: <3lmcfffifsg6v3ljzxfbk25ydh6446phdff7w75k6gwoyw3jkw@ryc66frtyksk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This DTS adds initial support for the Samsung Galaxy Book4 Edge laptop.
Keyboard, Touch-pad, and UFS are working.  The Touch-screen needs further
investigation, and is therefore disabled for now.

Changed from v3:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v2:
- Squash Makefile patch to new DTS file patch.

Changed from v1:
- Provide the patch in the expected format.
- Added missing bindings.
- Removed sound node.
- Changed regulator syntax to be consistent.
- Changed touchscreen node comment, and removed false pin definition.
- Rename ufshc@ to ufs@.

Marcus Glocker (6):
  dt-bindings: crypto: Add X1E80100 Crypto Engine
  dt-bindings: phy: Add X1E80100 UFS
  dt-bindings: ufs: Add X1E80100 UFS
  arm64: dts: qcom: Add UFS node
  dt-bindings: arm: Add Samsung Galaxy Book4 Edge
  arm64: dts: qcom: Add Samsung Galaxy Book4 Edge DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../crypto/qcom,inline-crypto-engine.yaml     |   1 +
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../x1e80100-samsung-galaxy-book4-edge.dts    | 959 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        |  71 ++
 7 files changed, 1037 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts

-- 
2.39.2


