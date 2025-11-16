Return-Path: <linux-arm-msm+bounces-82002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33545C61D8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D13BD3452C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 21:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BD027F016;
	Sun, 16 Nov 2025 21:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="r8yXjBzv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mu7C1iQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79F2271476;
	Sun, 16 Nov 2025 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763328991; cv=none; b=UbyKv1QPYDYjz/zSw7Y0L9YGnFGZhFKZ0u5Ed8mm39BcUPOuArb7DAcmDUA/Ih/hnpfCfNImqB+4qteu39n8uhFW69Ifgt24TRn1la9stHD5fnYdmooc2zOrfejUGBjc3qxt3f2Nz9GAKQf6w8GAcvPGxkMp/O+bZhnD8GJb6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763328991; c=relaxed/simple;
	bh=5PIxcua6nsz58aKI7AnuptIEDXao5NQgM/24BQf9S0U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eFjWgAOgrsOj2Bk+wdf9b7Uf5DuboyXWAhs0JF/xKkuZJtf605YNRqx3M076QYmj7Aq+zwfTr8GVTaEa3il1KwhA3A5sHEd4ZGXT805O3Q9jyN3In0xWJEIP81AtB9qIYCr5ShpAaYBWFK34/JA1c/wm3jpxgVUDIDxFrqStffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=r8yXjBzv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mu7C1iQi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763328958; bh=447xCEb0MWnl+oxdr0W5EbF
	9+TtFVcxwx4KvSP/vras=; b=r8yXjBzv1UxXJzauWr2AQbbJUADoJXbJnz8tsTSKhafn1qlseT
	rHPbkemMenn+APm09d+o2FoKMsWOptrtEaap51THL98MiaeiuKF0fD6dtsT0fon14HVZSn39qQJ
	+sYGNgjMVFVFlpeeXBmQ07RbdH4et9HhrQa9l7SVzWehk6Glt4+kIb5FmVRo59sODF8HEjjS5qo
	Q5mXPgonFdlt+5K+7D39hnEtoWphTONhMSjUo4aLOAiXqGg6KZFiXaO0WwkqmTwegStnRvyByZq
	N+b1KwoukRyqgd/+I8n0FaFrRwNyxQCt+RvjD1tQjtKtOcsBsoqX7K4kVnUdfI4/isQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763328958; bh=447xCEb0MWnl+oxdr0W5EbF
	9+TtFVcxwx4KvSP/vras=; b=mu7C1iQi07HLmvNxZomFxJyAQw+8C0Sk6CDjS6yhIqVJR9DjjH
	BaaWb1zovfnOT6hP+Max5spxKhRayZiwumDQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/4] Add Global Clock Controller for MSM8940 and SDM439
Date: Sun, 16 Nov 2025 22:35:55 +0100
Message-Id: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALtDGmkC/x3MQQqEMAxA0atI1gaMdor1KuLCSaNmUZUGRBDvP
 mWWb/H/AyZZxWCoHshyqemxF1BdAW/zvgpqLIa2aT9E5HFlxmSpD65Bi8l1AV3nQ4yev0weSnh
 mWfT+T8fpfX/5LsDDZAAAAA==
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
 Lanik <daniilt971@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763328958; l=960;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=5PIxcua6nsz58aKI7AnuptIEDXao5NQgM/24BQf9S0U=;
 b=M7tLtFwSu02B9PFfIpqHz2KUBCOJT1PgrpO0YjxXgiLqS24+mtFOweHcCdYaV1gLHp3xXiXNd
 hBj3mf07K93A2+A9Wp6JRsH5Y0i8W47VS9RhDynlZlQghP1Hlw8flML
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add GCC support for MSM8940 and SDM439.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (2):
      dt-bindings: clock: qcom: Add MSM8940 Global Clock Controller
      dt-bindings: clock: qcom: Add SDM439 Global Clock Controller

Lanik (2):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8940
      clk: qcom: gcc: Add support for Global Clock controller found on SDM439

 .../bindings/clock/qcom,gcc-msm8953.yaml           |   6 +-
 drivers/clk/qcom/Kconfig                           |   6 +-
 drivers/clk/qcom/gcc-msm8917.c                     | 286 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   1 +
 4 files changed, 294 insertions(+), 5 deletions(-)
---
base-commit: cad72a2aa582a0ca182ef1977dc45ff2a0bfb71e
change-id: 20251116-gcc-msm8940-sdm439-4369dd6cbc16

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


