Return-Path: <linux-arm-msm+bounces-71291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86669B3CF7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 23:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E955B189FCAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 21:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453A923ABA9;
	Sat, 30 Aug 2025 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Mr5M0T0O";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="alLpRS11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E113774D;
	Sat, 30 Aug 2025 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588719; cv=none; b=W+KMNpIqanG2/7bkeNZX/9K6QcgzZ566A6JJaGZsnZ7YlO7oIuWNvWKHW8u8lJQVfa+8MeciVNezXDUMRttf7r7MfiG0hvDn/GlIH/T/C9DylVaYZcle67HtiEuE8sC4rcewIudJezJDrh/PbS5AHQ1+BnLgQA8geanxMs5OIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588719; c=relaxed/simple;
	bh=ioUGJaJPYkWGaGwQYiBKjisQOP9jxH3IW7H/fF1De6o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ljz9e4waCmmb421YaM4h3hsylHakbQrkMarax0RFZeb2ziCxA7KjWYReq/jI6sF9JDr2E42mbJcjPWryIJxzJmYqlZXZxuzUNzKsGoIsV3Tgm8chK45hfRoNjLzFMlSh2DqiBYuCbc8BZh/HX8pWACHDPtxKtkmc54bH9Dyr+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Mr5M0T0O; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=alLpRS11; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1756588401; bh=WIr/Mg3ZauXh9puBPbW3mXD
	Ph5YYT4boIbBW2lhphqU=; b=Mr5M0T0OOUmS9q38Qs7GTYfnHcpAUkyrK8xCxeDu0uwtD/ZsKy
	WBEhCNUH0EmS8n7HwDvF5bAPr2H+/uif1QQWKxM4fwujgHVuFTAIdk9cOi4NBGgWd5pZOQp2x6L
	R8S2/2lI9qPoOqv515cj6E7IXcsI0q/Na4q3+PetCV7pGjtyggymaPvwNtTUh2aU2f59sdQAYLY
	fubhV3F7hWiek5bt525875pQPSKx9rGjPH9GkvphqjO4RQegVxTZt0avo6D99UGWboh9ObpE+P+
	aH5cY0Dtt2YSYMTNF4iGPvjbAkl8/LOT97/j9/s0vCbWpebzgeFrY4d0vnAgqC4sr9A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1756588401; bh=WIr/Mg3ZauXh9puBPbW3mXD
	Ph5YYT4boIbBW2lhphqU=; b=alLpRS1180BAkfyb4AN60riiWUCBPf6Qk/WqbLhuSnkztGd3h8
	Y82F8ugW1a305TF9uSvlpqR8sx1W7OC2kEDQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/3] MSM8953 Fix SPI interfaces and add spi_7
Date: Sat, 30 Aug 2025 23:13:18 +0200
Message-Id: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG5ps2gC/x2MQQqAMAzAvjJ6tlCdg+lXxMOYVXtQxwoiyP7u8
 JhA8oJyFlYYzQuZb1G5zgptYyDu4dwYZakMHXWOvCU89PCDs6hJcJUHXSAKbvGxtx5qlTJX/R+
 nuZQPg2U5XWEAAAA=
X-Change-ID: 20250830-msm8953-spi-fix-5a00a5d8c438
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gianluca Boiano <morf3089@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756588401; l=722;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ioUGJaJPYkWGaGwQYiBKjisQOP9jxH3IW7H/fF1De6o=;
 b=BkSWlDxpOFIY4m3/lEb8Oye5BojcOMWcVFENutNjKWKBQXyz4ue44MMH6oizO44znQLynQjYQ
 Yan8MO8MKtWB/jT8GMAD3VQSH++VeELQTV7/sVGyYK2oRw1BGHUgeBH
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series fixing SPI clocks and pinctrls according to
downstream sources and add support for spi_7 interface can be
found in MSM8953 devices.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (3):
      arm64: dts: qcom: msm8953: fix SPI clocks
      arm64: dts: qcom: msm8953: correct SPI pinctrls
      arm64: dts: qcom: msm8953: add spi_7

 arch/arm64/boot/dts/qcom/msm8953.dtsi | 160 ++++++++++++++++++++++++++++------
 1 file changed, 133 insertions(+), 27 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-msm8953-spi-fix-5a00a5d8c438

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


