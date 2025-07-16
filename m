Return-Path: <linux-arm-msm+bounces-65328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E46B080F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 01:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A15797A9554
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 23:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D8E2EF9A1;
	Wed, 16 Jul 2025 23:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b="odPNkQCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.atl.tools (mail.atl.tools [49.12.87.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6243128A3F5;
	Wed, 16 Jul 2025 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.87.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708321; cv=none; b=jkJmp6YZMzJXZoNrhvEU2naQzR+qhWK5FnYiO/LJ2hv3B0N/JUJgot6M0/z2dnjSQbzIYHd3LNG8GlwrzxLlL2BYrlFQM8YN25C63z5gYw9dXtaRFmc+r1x3D/eWvx9viBIwuIbtTvc7XvXaQofESj3nj0g1rydPcaWK7fuMtQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708321; c=relaxed/simple;
	bh=9WzX3FFOenXx0/BJv8oQVqLXl1SIENq9vmB/gJLwCSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EhJyksIBqxyivzobIniBXM21TxEQpdk0hb7E3heEnJpX5YW94fOFk3p2FrAHNVDH+lsfurJ3P9Qsf2fUOb9fHTGG/rkWd6JoWn5qZxOxzS2qZta8wYVZKMWPm3Jd6Nvpko9kPEe8KjIQT2NAXjj4eUpQG94MrTIlngCSgFC38oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools; spf=pass smtp.mailfrom=atl.tools; dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b=odPNkQCs; arc=none smtp.client-ip=49.12.87.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atl.tools
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB1E12AAD9;
	Wed, 16 Jul 2025 23:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atl.tools; s=dkim;
	t=1752707845; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Z3ilcqrD4PmYjpiXrPEU+gqpYLCmyZ/DdRrTlI3A5V8=;
	b=odPNkQCsEbqkZp1kFI5hidalm0OxWEFJjzP4/jL25LtoqBwwONwjeR4MLKONnDUredynWF
	ob6KinIkjM48+IgxUJ3dZPEewzz6nvkxOPasVY7Wz1/a88TD8eslF/ZOEOBlYDC6whUIhZ
	adw/VDZHZCC9CbujnH0BsIiYdS1BqhjqN7KMmC3E7Iemu9TL+eFHyWt/YpgSiwut4QlDQQ
	po0sPUazEfHkLijCbprVj/nmBqcfKiwgNSDEhnxZYJdlqRBk0X8Ci9OM31bWVZ/N/uCT3h
	42mR3JfRd2/lxdZFT0D5zSL7ShwveGf0BdHz8a4Byi9fl2E2oSIgz8hUKr1A2g==
From: Violet <violet@atl.tools>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Wed, 16 Jul 2025 23:17:08 +0000
Message-ID: <20250716231710.99983-1-violet@atl.tools>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Changes in v6:
- Remove debug features (bootargs, etc) that slipped in the v5 DTS
- Format and organize nodes correctly based on existing DTS, 
 move "status = "okay";" to the bottom always
- Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
 from existing SoC .dtsi
- Disable buttons, ufs and other features for later revision

Signed-off-by: Violet <violet@atl.tools>

Violet (2):
  dt-bindings: arm: qcom: document r0q board binding
  arm64: dts: qcom: add initial support for Samsung Galaxy S22

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

-- 
2.50.1


