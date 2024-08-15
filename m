Return-Path: <linux-arm-msm+bounces-28615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4600952CBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 12:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5273A284A5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 10:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4327DA63;
	Thu, 15 Aug 2024 10:36:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165539AE3;
	Thu, 15 Aug 2024 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718206; cv=none; b=aMzblVzPJNqmvgdwbuY6VwvAFMMiYfMkKYZPlapVEAFvIfahMd8La1iJ0aUlAzByLepnikWZdpKhWmkzqd6r6rsj8rWN2cTMkhE9gVN4NpoexOqhLZ4L8WdxszHOkIClp3dyyH68FD1RhvuaGyeDOTkKHfn29uQmeFkRzKaEw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718206; c=relaxed/simple;
	bh=2DqwIUXy8ogUqTcwlFLWqK8fKshrPZJ8bHMdCboGRRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzt70KRQ4Jh6DfH6OnKqc2kL6AiDWfJDNNXL3OOhEXlTj7qpUrs/G5WYog7Gluso0DZd2fv8QT2jM15VWLqOyAMr8xmfogMELiFBN1XsCiO4/0t7MP7u3V5jcHjatNQgSdbwPjeTE61+ywRJx1VKrlegbHr0YhmEzkeG3Vxw8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id f33a0482;
	Thu, 15 Aug 2024 12:36:40 +0200 (CEST)
Date: Thu, 15 Aug 2024 12:36:40 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/6] Add initial DTS for Samsung Galaxy Book4 Edge
Message-ID: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
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


