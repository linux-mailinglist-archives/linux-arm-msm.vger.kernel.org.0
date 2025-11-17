Return-Path: <linux-arm-msm+bounces-82138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E6C6552D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 81D5F3846CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028F3019A1;
	Mon, 17 Nov 2025 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eodfuszi";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Pj3NN/kj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925F29B79B;
	Mon, 17 Nov 2025 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398666; cv=none; b=YDGk0FLG4vGMf6wrjlSuS3Hh/Rn2pI/a3g6ToLuEWZjwBHeZwZI2CJmf4sPSjX5ADWW00ZmxTeZgpLVXAmK/7BZaOOxsDzZEcZX5B8IQgSuJkGTpbfCFxXYVRFDLUT26nfoTvgJwelbDW4F5ycnVvYa0OkYy1uQ3P9LX6U+ghBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398666; c=relaxed/simple;
	bh=n6nEWW9pPjq0AqMeiO3sg2ecm+iuixF76Y7HSJX3Q/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TWP8bQOlq+rz7n7iEQ3CAhGqwDgvhVz3ds9WtR2/m/ywke/GaW9jNJqA0KHjGRY4qeMtDg58sS8I/4bqd6dRCDWBN+nbQj5GeLzKhF4AmeXLKuQ/mdNgJPHIlQD+V7i3SXH8/bXSMSPvljYGKn+rsaouVoMeCoWYQEeSxIrZJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eodfuszi; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Pj3NN/kj; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763398640; bh=GMUQV1/e5EFHr3C4saiGqYK
	hD3EuyO2MN44wM92o0JI=; b=eodfusziAk+fHH61U5AddG9vYbS5wxYsy0uKBL2Dr7dHN7mfrl
	eNgjrEQyhdBrp8r29DZlYjltpkafYDxHHSkzrN+WXxW+l4pBGMUjc+LJQXShs1UVcAIorDaMD+S
	I4JfT+QDS1/nSheUlmsdBoIAznNPw3mVJFrhZGPy1fa/ncKOjgq+H6P7nzpXVE7mVQtIOgsQkpt
	WieQgvLoXwIPeoiSemqE0LYd9oUnOvhirLt1YEfh620b5XMbrx6VqBIdlFHa4nzLIrgvfpBXeX5
	wPZ3Gngu68j9sV+qSomF3OQOak8fdjZKzhI5cO91D+J1iIM9gjnAwMq65NvQmZp3Few==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763398640; bh=GMUQV1/e5EFHr3C4saiGqYK
	hD3EuyO2MN44wM92o0JI=; b=Pj3NN/kjkRXbChd/CK21rouNXX59rx8pAXCmartI6PJuU7iJ6U
	DFRm0kzEfeBeqS6GSTiOax3xoDbrOHDsbyBg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/4] Add Global Clock Controller for MSM8940 and SDM439
Date: Mon, 17 Nov 2025 17:57:05 +0100
Message-Id: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOJTG2kC/32NQQ7CIBBFr9LM2jFAKxZX3sN0UQekkwg0YBpN0
 7uLPYDL95L//grFZXYFLs0K2S1cOMUK6tAATWP0DtlWBiXUSUqp0RNhKKE3ncBiQ9ca7FptrNV
 0J6mhDufsHvzeo7eh8sTllfJn/1jkz/7NLRIFnklY6g0ZpegaRo5Pjhz9MWUPw7ZtX5d6XRa5A
 AAA
X-Change-ID: 20251116-gcc-msm8940-sdm439-4369dd6cbc16
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763398640; l=1193;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=n6nEWW9pPjq0AqMeiO3sg2ecm+iuixF76Y7HSJX3Q/k=;
 b=bW/rdDauTH6Xwfon1PVs4luqZ+rH6MhVCOJHIaPsutMxy95kMaYdFf+ViL7neONVgbDdeikTv
 /nzY5T7DOkwAxVOPbLMnaZGLfhGFkOJ8WVTWnqrHht9DfFK5biaC4Hs
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add GCC support for MSM8940 and SDM439.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- gcc-sdm439: Remove unnecessary comments. 
- Correct author names in commits and Signed-off-by-s.
- Link to v1: https://lore.kernel.org/r/20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org

---
Barnabás Czémán (2):
      dt-bindings: clock: qcom: Add MSM8940 Global Clock Controller
      dt-bindings: clock: qcom: Add SDM439 Global Clock Controller

Daniil Titov (2):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8940
      clk: qcom: gcc: Add support for Global Clock controller found on SDM439

 .../bindings/clock/qcom,gcc-msm8953.yaml           |   6 +-
 drivers/clk/qcom/Kconfig                           |   6 +-
 drivers/clk/qcom/gcc-msm8917.c                     | 280 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   1 +
 4 files changed, 288 insertions(+), 5 deletions(-)
---
base-commit: cad72a2aa582a0ca182ef1977dc45ff2a0bfb71e
change-id: 20251116-gcc-msm8940-sdm439-4369dd6cbc16

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


