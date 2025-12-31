Return-Path: <linux-arm-msm+bounces-87125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F02CEC3E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ABA9300F9FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8DC287257;
	Wed, 31 Dec 2025 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ldDy+FgT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Cct3pGWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29041E1E04;
	Wed, 31 Dec 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198619; cv=none; b=hEH+0OCd/0HhufIwLv5XnxuBArltb5C2ELLL0hABVCMs2BBeiZOuN2KIOrTWYA6xiOf6Yz1WVkMXTgbkYdcs+kfJewVkSPgoOPVwMFjAl6/jPwMUi1U4t8E7ppQMfByAzM4Q5evioYA6zNowu1xK6qHcNzk43Wa8XeiZrVq5jx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198619; c=relaxed/simple;
	bh=Quqo6Lixmq65V6IQr4vVuyt8S/hVSjmkKh0Z84pI6Zg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mMuPl7An5Dor19C/8VprZatrcf2QuPunC0hX9IW+LZ2clzEXPlFjGqSKP4lSiRhHr+wrIHEpCrwERuOmyQEdU5a/KmTFWe5B3dHoeNL3IHvPyQOx2ThsHDzoF+j9UfFQvJSp9GcaSD2O4RMW+Bavq/GJ5Ao1mBpSaQ6rVRyLWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ldDy+FgT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Cct3pGWk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767198614; bh=wG7Bb2GWppUNkt6EbNuYDhm
	86f7F3cPb6sD5mnb8Tug=; b=ldDy+FgT8PwnQK1t9xXSWfUMqbGwCspp+gHhAAev5dOw9MpfEL
	rYlOv40q6MtaDxrVoUTgmKsvsPwPjxRtdyUsr6UqB7CUaG7treISnT+Z75Y4V+1eC+qTUiV//s0
	b9oAc3EL0PPbY1U+clNgHb0BCO1PzXV5p53M7rndOVAmBaXb2N6ri3z+kBRGF6xMJYsA61qI4Go
	WcOixNDR9QX4wCzrRhSiIqQ2dyaK3gkcJsxitLEA1I6B0KBP4u1pJd8B5cWQbA1sxn8rcCOEB7H
	FvXB9pjz/UeS9f1HRC69nMhGM5p9EvkOa4o555KBcqLT1lA5LuqfeMOhjn2EGi7buqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1767198614; bh=wG7Bb2GWppUNkt6EbNuYDhm
	86f7F3cPb6sD5mnb8Tug=; b=Cct3pGWkkgzQOs1xKtPvqMcOY/mgKwYNYwyIEMiDDrCIw1kmv6
	WKDGyo/pVy1fZm97EejtLqp4TO3TsMh00bBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/9] MDM9607/MSM8917/MSM8937/MSM8940 MSS
Date: Wed, 31 Dec 2025 17:30:10 +0100
Message-Id: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJJPVWkC/2WMQQ6CMBBFr0K6toaZWkBX3sO4aGEKk0gxrWk0h
 LtbcKNx+X7+e7OIFJiiOBWzCJQ48uQzqF0h2sH4niR3mQWWqAGxkWOMEpypwNblEa0W+XkP5Pi
 5VS7XzAPHxxReWzTBuv76CWQpDVlVWXC1Ue48GvY39uz7/RR6sUYSfokKPiJuoibjukbp9vAnL
 svyBs0zep3UAAAA
X-Change-ID: 20251228-mss-1fa61b7092b5
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=1570;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Quqo6Lixmq65V6IQr4vVuyt8S/hVSjmkKh0Z84pI6Zg=;
 b=K92Di3YH61QW8UHxvRA8aW11Y90f0ZesNPsGdMMjLoumAAv83yz9FAU6601ogUElzWYn899gH
 LdPtu6SRiCACrJAQRZk0ItNPi1xEL2Qt8+j02lTkLrqZhyk3dyI2hTf
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add support for MDM9607/MSM8917/MSM8937/MSM8940 mss.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v3:
- qcom_q6v5_mss: Rework inrush current mitigation
- Link to v2: https://lore.kernel.org/r/20251231-mss-v2-0-ae5eafd835c4@mainlining.org

Changes in v2:
- qcom_q6v5_mss:
  - Intorduce need_pas_mem_setup flag
  - Use mss-supply as a regulator for MSM8917, MSM8937 and MSM8940.
- qcom,msm8916-mss-pil:
  - Add compatibles where they needed
  - Adjust mss-supply description
- Link to v1: https://lore.kernel.org/r/20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org

---
Barnabás Czémán (8):
      remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MDM9607
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8917
      remoteproc: qcom_q6v5_mss: Add MSM8917
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8937
      remoteproc: qcom_q6v5_mss: Add MSM8937
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8940
      remoteproc: qcom_q6v5_mss: Add MSM8940

Stephan Gerhold (1):
      remoteproc: qcom_q6v5_mss: Add MDM9607

 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  13 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 | 254 +++++++++++++++++++--
 2 files changed, 251 insertions(+), 16 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251228-mss-1fa61b7092b5

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


