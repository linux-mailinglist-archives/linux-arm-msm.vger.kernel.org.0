Return-Path: <linux-arm-msm+bounces-86717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0ECE5108
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0061300A36A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F3F28C84A;
	Sun, 28 Dec 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ObESRS8F";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QIPTQce2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110541EF091;
	Sun, 28 Dec 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931857; cv=none; b=ihWvrTq0Hsq/CfGvAxUpG3l90IHiVwkKogZ9p3H68/vok1WhcyLQxwmlezOMFbrSr3y7Mfv59o4QODv8zr5D/LdX4XyJAuWtrG8mMd+dKBXGOGlBHoOFK7aNFcG1S/0emCLqANnHgXAVX0WjIGIM/lQIQKiXZg8CBWnx0sENX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931857; c=relaxed/simple;
	bh=0YBlbPJl14eUi1Lk1OhL+t/pPjuB0/xSAF0gaia2xyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rjx6R1urQPDnoTbrC1Drjova8xa1xUBtGYIAP8NiHmp2eoA+BtVzAkaZfTXMbd6hGs2iXOdsqkIVyMIuJq5ftagpU32tQIr2ntyWdsxdoTxJrkFjt3lniYzJ1pWM5cr6fgyV8cIfcNRTs1hd5qgEunWMqIozl/MccpKsibICkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ObESRS8F; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QIPTQce2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1766931720; bh=Pa4nCRigXOnjKjp3kquyYGR
	pSpsaoNitBK1dmEwTmb0=; b=ObESRS8F5dOxiAuTxoFCUPLDb7Oph6K/mnwrVO2dU68s3JSMj0
	MxGzHX3DkL6ApXlAiFv8svCSk6MBDoLdNFFeCT5nMBZxRbOmIMbZNl9/hEHy8DwyvmxQtKuvf6p
	70LkdOaoBHLAjTI6AnCrBvlhSMtJp6pVQvJ2UNu81YPApudXYQqYekUJrYnnzNhjq6nOazLuE94
	w2Eyb2LhU9rVvnTgmbQmgT2bzLXIjkW2tMR/+c0ULttnSMZATZ3eNXo24Y+9TylneK9brQKTmMj
	EiO1Gn98pDVSd17ZQ//25utUARccGd69yA6d17yEObg6EywksBJtVKgoPnWYbwUo9NQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1766931720; bh=Pa4nCRigXOnjKjp3kquyYGR
	pSpsaoNitBK1dmEwTmb0=; b=QIPTQce2R2i0+VjaJR50EcHCVoBIm85YjdyEperFnfIwO+FUvj
	1/iu+J02dpbH4BQRJKDnJTnahXh8Z6hr7GAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/8] MDM9607/MSM8917/MSM8937/MSM8940 MSS
Date: Sun, 28 Dec 2025 15:21:50 +0100
Message-Id: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP48UWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyML3dziYl3DtEQzwyRzA0ujJFMloMqCotS0zAqwKdGxtbUAOxqvHVU
 AAAA=
X-Change-ID: 20251228-mss-1fa61b7092b5
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=1014;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0YBlbPJl14eUi1Lk1OhL+t/pPjuB0/xSAF0gaia2xyo=;
 b=1vWn8RsJQSMy3ZhcNw4XfE3PkNLc+ZqLJvH907w1d9OMqFf4GgWVnDMXh+N4ublFRsJ+Kr8R9
 Bwl7HLtP3ueC7GY+ZMUDNUaZlflcE2SI7XETp/vMSNBapGdG0BPW6sL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add support for MDM9607/MSM8917/MSM8937/MSM8940 mss.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (7):
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MDM9607
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8917
      remoteproc: qcom_q6v5_mss: Add MSM8917
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8937
      remoteproc: qcom_q6v5_mss: Add MSM8937
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8940
      remoteproc: qcom_q6v5_mss: Add MSM8940

Stephan Gerhold (1):
      remoteproc: qcom_q6v5_mss: Add MDM9607

 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |   4 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 199 ++++++++++++++++++++-
 2 files changed, 195 insertions(+), 8 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251228-mss-1fa61b7092b5

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


