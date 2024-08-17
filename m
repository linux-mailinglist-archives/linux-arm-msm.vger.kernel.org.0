Return-Path: <linux-arm-msm+bounces-28876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068795598A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 22:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 223C21F218B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 20:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7873B14EC55;
	Sat, 17 Aug 2024 20:32:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10456824AF;
	Sat, 17 Aug 2024 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723926738; cv=none; b=mxWv7cHt2N+Yu9eO4XhNobQvcTfioHUOGD8zaImrw1iFeD9f7mVg6gP91/6tMiY8/rHytYfPzRkdA+9vrwKe0kBf/9zDgfmajIT3f9o6lbudyCnLD0W0UVSYoW5vuQs49+m8vf//aYYiIQtzx2Yzlkh6O9Gmwnh823F10XF2bSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723926738; c=relaxed/simple;
	bh=KMqCyYhzR9SrylOR/4Sow83m2ffzVE38jEZnSTN2sI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hw3DxUOmtSc2GNvjMFUoY+mXmiybTLR2KzlLYCrZAEYuoq4hWQoE7pmXpjfZ0O2eSr5QDWcIpGc2OwKZLlR67WPYeTsft7AHMd29eZFksPBdtVE+NFHy4xhaZSq737PTS8QOuZGouw8zJZnwqQsRXYk9CWovJ19dkreKLl7UFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 060ac2ee;
	Sat, 17 Aug 2024 22:32:11 +0200 (CEST)
Date: Sat, 17 Aug 2024 22:32:11 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v5 0/6] Add initial DTS for Samsung Galaxy Book4 Edge
Message-ID: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
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

Changed from v4:
* Fix previously missed commits:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

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
 .../x1e80100-samsung-galaxy-book4-edge.dts    | 957 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        |  72 ++
 7 files changed, 1036 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts

-- 
2.39.2


