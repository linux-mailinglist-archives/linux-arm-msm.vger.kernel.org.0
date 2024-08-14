Return-Path: <linux-arm-msm+bounces-28553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D39952465
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 23:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787FD1C21BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 21:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C16D1C68B4;
	Wed, 14 Aug 2024 21:01:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B991C8229;
	Wed, 14 Aug 2024 21:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723669294; cv=none; b=dqYcszabyKziTeQj0/KcYYPJrH4BESpeEWrtV9jB7lED6/2z0FI0ahCvBo27ZLRLeM6qtSLAIy3hbw4sGIWfe1acNVS6nPSdCGcC/n3nCK46Flou2rvt33Gz9vp6OombsF8QO14UZQweF8FuTyNVxJx+egRwdlhYUG2g4s/trXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723669294; c=relaxed/simple;
	bh=dS7tPE5ZQytdxCjgO+p3xo1vO7bNf8cXUAePMZYKIfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUe9981Nb183CyTEiaWUIk9sKeg9lIJqBDAn5PnRxu0EoFH4S66xp++usHlMP6Rn5HKIP6JEpVK5sd9qvF8fiM+JUkL9+c0qkK67JDtJ+ctw7XopgdlX7iMQ4aexMXAjeT87BFTSm30P6L6oistmXDCu/dFduq1xYIW9qxzQCUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 472ecea2;
	Wed, 14 Aug 2024 23:01:22 +0200 (CEST)
Date: Wed, 14 Aug 2024 23:01:22 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/7] Add initial DTS for Samsung Galaxy Book4 Edge
Message-ID: <qv5pz4gnmy5xbxxjoqqyyvn4gep5xn3jafcof5merqxxllczwy@oaw3recv3tp5>
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

Changed from v1:
- Provide the patch in the expected format.
- Added missing bindings.
- Removed sound node.
- Changed regulator syntax to be consistent.
- Changed touchscreen node comment, and removed false pin definition.
- Rename ufshc@ to ufs@.

Marcus Glocker (7):
  dt-bindings: crypto: Add X1E80100 Crypto Engine
  dt-bindings: phy: Add X1E80100 UFS
  dt-bindings: ufs: Add X1E80100 UFS
  arm64: dts: qcom: Add UFS node
  dt-bindings: arm: Add Samsung Galaxy Book4 Edge
  arm64: dts: qcom: Add Samsung Galaxy Book4 Edge DTS
  arm64: dts: qcom: Add Samsung Galaxy Book4 Edge Makefile

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


