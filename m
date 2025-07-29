Return-Path: <linux-arm-msm+bounces-66996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A9B14D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17BD218A2C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997D72900AF;
	Tue, 29 Jul 2025 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b="GwFIQdmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.atl.tools (mail.atl.tools [49.12.87.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB528FFC8;
	Tue, 29 Jul 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.87.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790628; cv=none; b=d/kYdnX/vQRGovdVvNG2r8HJmfODPn6jXzy1+EJP/h2lEI+aMGJgw0ZynnbSDv0Ike2brrZP5esrCRpgqk50Q4J6+Y0y1Gv1CmTGG8MsDbdOBRr6De/M/nZpklxPvHtEA5ksL2B/51A6yhFPHHoWsHnW3Q6OuI5LS3kymG3IkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790628; c=relaxed/simple;
	bh=fwaCjLD6EB6n8W82GgacUq5Hd72P7HmejoAcodIb8hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyNbLc2Zx8X5gtP1NzSUojFmpmIPlogc/0qsknulFf2rLUr0Fnbnkc4Rud6GpeTU1JLKnlLujU1HQyRAd2myS4uP4+4cF/qExkvHk00mty/Ea4SuCCiwXskFMWMEZUK9MIzpRZ2ikzZOEqaB2Luk6ciTIiwQ9LBHBMM0+KHp1/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools; spf=pass smtp.mailfrom=atl.tools; dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b=GwFIQdmI; arc=none smtp.client-ip=49.12.87.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atl.tools
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 623F52A8F9;
	Tue, 29 Jul 2025 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atl.tools; s=dkim;
	t=1753790624; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=p0FOHDWyMZP0lChScy57LuBVhQcpOIP/X2zCiU5WuuI=;
	b=GwFIQdmIPgqPCC+OFcZeIYQAxg0zsyJPpQbgFN10msg14G0Kh1UQtX+F4n7doS0VnDzQrP
	i33LMOC6LSjqXXeJ4u4NkjkFHkLOBSQQR2WftTV7uKiBRp2f957ZTby3Dp52JKtdExpqRU
	ZUV524cYtb2PW+GmtgHSvaOIxd1Gr+8Xfg7Of/FZM1ZvwRY1l66srNDLxlGrBsbnH1HbbX
	qU47l7YMvGrcx69cDuCGxmqlnRAc6k4zq/wM7MbTTqtXMs9Txock+E65n+BM107d3tmNkB
	7sJNLC0cIImxdC7bjSghyfE2smjNAPXQ6B+QylT4hXClgqoopDi+eQjWZ7Itaw==
From: Violet <violet@atl.tools>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Tue, 29 Jul 2025 12:03:29 +0000
Message-ID: <20250729120331.287245-1-violet@atl.tools>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Changes in v7:
- Document the reserved GPIO pins, remove pin 50 as it does not
 need to be reserved
- Clarify the phone isn't limited to USB 2.0 but rather USB 3.0
 isn't implemented yet
- Add a newline before every 'status' node

Changes in v6:
- Remove debug features (bootargs, etc) that slipped in the v5 DTS
- Format and organize nodes correctly based on existing DTS, 
 move "status = "okay";" to the bottom always
- Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
 from existing SoC .dtsi
- Disable buttons, ufs and other features for later revision

Changes in v5:
- Properly format the thread

Changes in v4:
- Try to properly format the thread

Changes in v3:
- Removed unnecessary initrd start and end addresses
- Make sure r0q is in right order on Makefile
- Properly format memory addresses
- Set r0q to the correct, alphabetical order in documents

Changes in v2:
- Attempt to format the patchset thread correctly

Signed-off-by: Violet <violet@atl.tools>

Violet (2):
  dt-bindings: arm: qcom: document r0q board binding
  arm64: dts: qcom: add initial support for Samsung Galaxy S22

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 147 ++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

-- 
2.50.1


