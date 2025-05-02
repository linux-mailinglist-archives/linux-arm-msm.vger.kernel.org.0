Return-Path: <linux-arm-msm+bounces-56593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAEAA7C39
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0C61C005C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A81B20B806;
	Fri,  2 May 2025 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9ZMGlpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546ED1E5B97;
	Fri,  2 May 2025 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225500; cv=none; b=f2T/nEXnJZ3kRFPknn8P7lQFtJ66k+jZgByhV7rhULIVvG0Xi5V2OtyRrw4BTfSox5+2zcBZa7xF7QygE46YpTqUWPIoP+6lhFhUhac/AzfWTeTKQ3rNqteMQURPmw1vyZDudB89p1tP8jp0UQn5QWZTQwlblW3t3GhmdYRsKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225500; c=relaxed/simple;
	bh=vTGFmnjkGKcRCC9tRoKN4r8LKJucXa/gWctyDCrQZZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o5ph3YE+IKAEmYL38yCIOObNFt3RT+IdHzeVSm6C1352t982c999CbjwHpZcnv5dZFzEolszhFTa4tEqId4YpI/Ig1FX2tJKwQQKsCivC7wKrwaqV24vgEcKEl8A+G/NPYzzEqgoawyUX1OHQzPUMbQIJ/I7hUFNudV+ANo/0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9ZMGlpe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04B9C4CEE4;
	Fri,  2 May 2025 22:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746225499;
	bh=vTGFmnjkGKcRCC9tRoKN4r8LKJucXa/gWctyDCrQZZE=;
	h=From:Subject:Date:To:Cc:From;
	b=r9ZMGlpem/CMMfX+b/Lv3dyveUoW0wI2z0n5obo9FoJCHDhu+WpcWdLY/1CTJfpi9
	 d5XKgRcRJaMPufy+VS34gRKA/PT+9Cgovbgv7iHtJZXXeR+Bm1qwU2s+TTE4HPvB/X
	 Qv/aiYM0lTQoDeJRXity6X3+xyYPskWvQtaaPZWKDcg+iyM16DjpOkoOaRxMUTuMDF
	 fQOmLVrphwhf4Ztf+zWnYMdXcBdEEIauRrzipHOCWNrYbkJHAkinK4D3NOkqJUjsfJ
	 vYATXFSW+TPtE7JVhe1cNMj6kjOKDsfalga0DDww9P9C+vecud8CpBmU7M7jfEGiR7
	 zEKuVBIW/6csA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] SC8280XP SLPI
Date: Sat, 03 May 2025 00:37:58 +0200
Message-Id: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZJFWgC/x3MQQqAIBBA0avErBNsQrCuEhGiUw2EihMRRHdPW
 r7F/w8IFSaBsXmg0MXCKVZ0bQN+d3EjxaEaUKPRRqM6U2avLFq9yJFZhc6gDy7YoV+hVrnQyvd
 /nOb3/QCEXtZnYQAAAA==
X-Change-ID: 20250502-topic-8280_slpi-d152cdad893f
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746225495; l=786;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=vTGFmnjkGKcRCC9tRoKN4r8LKJucXa/gWctyDCrQZZE=;
 b=4Cu95faWVdYtQoAT77qruKtTRaMS5cPtLNfEUll2CWF4/0V7xmsb2uZgf0MNqJ0mln8FVd0m0
 a2ZnN9p9X8WATFEiDLQZAlxiYf1ZC2sXpL2vykOO3H55h439AZP+L8F
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

SC8280XP features a SLPI, much like its distant relative, SM8350.

This series adds the bindings and dt node for it (also cleaning up the
DTSI in meantime)

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
      arm64: dts: qcom: sc8280xp: Fix node order
      arm64: dts: qcom: sc8280xp: Add SLPI

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  54 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 626 ++++++++++++---------
 2 files changed, 379 insertions(+), 301 deletions(-)
---
base-commit: 9d9096722447b77662d4237a09909bde7774f22e
change-id: 20250502-topic-8280_slpi-d152cdad893f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


