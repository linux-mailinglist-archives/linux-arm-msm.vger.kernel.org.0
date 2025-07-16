Return-Path: <linux-arm-msm+bounces-65111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D6B06A89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 705565681BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9458019066B;
	Wed, 16 Jul 2025 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Bou0CddU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAFE170A11
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752625931; cv=none; b=i2k0+5f9PySvQtqfd/oNYXft7bEJm8+Sixm7URHKUKuoJubGujQfus9R8REG/k/KV27bEGA/APxf6GX8rWIaSoWy2f9MitYNNmsqXxyS5e0/baxApuSxHlKNt9S4J+PFEZL27s8/0wYOj1X2Z8PbMw36vEsPYK+sp0o/hTfPJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752625931; c=relaxed/simple;
	bh=lzKljEu2ic70QPDX+INYtNEy1StpnqB/dy1FAFQ9Ni4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HR9hVpi72VNjJ32MJKJTU9cV8Ott+SAi80+Ediqyq2/DcbC66FJ+HDHCeDH0rSMCHKcUrU61zHNaDxp2iZdyZicyxfaULzfshgyL4pdYHRlV4VfOKf5jt32sCUwrkMh5IgL8ONLWS7ju+9Kn5mbSQTiELmzzydt51XrwgpZaWZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Bou0CddU; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1752625917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3pTmCpWa5iASZYnIiU1JPiH3jdsamI1C0nlfWvY6Lk0=;
	b=Bou0CddUckij+K4wjmS1pBWC5guk/w3CMUNzlpRNG23EPVe02+M1MboI/VEnAPlL/J8I3e
	U3bmBQrr6zQ5Yl7yChUheaYUEdeJ3ak6jBsK9x0/rSiBkCoqqi5ApAU/U0AU+AhfexX+zU
	f6U3+ZyaWBgAnb155+a0SHyxYZXl5yQkwN6JX/pOeSnNIfe8msuwjjqmPzeLB3xOGUJWbr
	SokI7/5JBrtRLNBXrtLhbnYfYlTfUNFINdOjpelB6X4vTKROcHddubdrgpSO8MPeYJORjZ
	DTPQ+eOpCamsNrRV0/T0t0kiEU2qG4r2c3K5//MikSE5yikYmw99SEQZFrPcEQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Add Dell Inspiron 7441 / Latitude 7455 (X1E-80-100)
Date: Tue, 15 Jul 2025 21:26:56 -0300
Message-ID: <20250716003139.18543-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Since v3[1]:

- Applied R-b tags
- Skipping the eDP panel ID patch now since it's been applied
- Fixed the last remaining '-names before -0' order issue
- Changed usb_mp: keep the unused PHYs enabled in the DT
  (to let them go to sleep), like how it is done for the XPS

[1]: https://lore.kernel.org/all/20250706205723.9790-2-val@packett.cool/

Bryan O'Donoghue (2):
  dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
  arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455

Val Packett (2):
  dt-bindings: arm: qcom: Add Dell Latitude 7455
  firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude
    7455

 .../devicetree/bindings/arm/qcom.yaml         |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 1666 +++++++++++++++++
 .../x1e80100-dell-inspiron-14-plus-7441.dts   |   52 +
 .../dts/qcom/x1e80100-dell-latitude-7455.dts  |   53 +
 drivers/firmware/qcom/qcom_scm.c              |    2 +
 6 files changed, 1779 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts

-- 
2.49.0


