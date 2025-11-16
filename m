Return-Path: <linux-arm-msm+bounces-82004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74BC61E29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93D4F4E3289
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA873286D5D;
	Sun, 16 Nov 2025 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oGbmp2CR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="By79NjUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DA283FF9;
	Sun, 16 Nov 2025 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331028; cv=none; b=ZHOYhY+985EBUKol2G2R4FevsA2KlDBUZNWdeGEzsoxj9kPklZHQMAKuzOOSYUWT2Elr9X85JweQN6KE7SPO+K/t2Av3Z5dV9D9mEnZ5WWrhJCUlGPrFn+R6pYPuItPtCvZITtTF5dTg94B6bRHum/kvJ/tJh7VZN/r9enOQKRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331028; c=relaxed/simple;
	bh=Htj0x/pRIxgZYWhOmTGjFgSiom+0IEfKTJm/dfQNywg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tZsnjpYz8j2OxXHNQAcP9wfU5g5KfCL48QoETcMGTnMMXB1ilnSRIC82PSMRwQc+wSSMuULxKV8ke5zdJcxhles6/xlDbuJzXHgcjUELZ1dA5A/0UmqO9jrYnuwrlQVLnu3Cjn+LeVMD8miAce1kEVlx70yDMnqiQAxz09Xk6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oGbmp2CR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=By79NjUl; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763331019; bh=EE4FHWEmiiR67N7/yKt1CqF
	FuGRjZVLPc+ZKYFDwQ7w=; b=oGbmp2CRa8smt4u0ZUnkahHWmlB1QjvnpeY3vt8nuetolikRCk
	203nLOk9sQO5q3+joa1eU3HkR8WOco8elF+fuqy9agg7v7nx/+upMY5DBQQdL3bOSTH2d3UFAMB
	/8UQPlimL547Q7lpw9KqhkU0kQ4fWPg1g5KTBmGVZzmw9A4quIGKHYzBn0LIExzbHbfVe1lAusA
	44cMXz7rIuPqHVgyOkE0OoCbUbHrAKk3Yq20cXiKuXoZpGPk6uNNq+FtZusIGRHLEhi0H+ELaZB
	Tc4V+u4DsGFL1IofE8Etc8BRWoa+U4Eda8idiNmV6XKBmeSDLqLdkY/jrbaLdnoHvUQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763331019; bh=EE4FHWEmiiR67N7/yKt1CqF
	FuGRjZVLPc+ZKYFDwQ7w=; b=By79NjUl8T5cb+eFnvFimTvGCLmUGsC+0zk9HQXYBVkMReiCLb
	pmxXLDwzfmF564Rb2LLFeWQDThYzSIinreDg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/4] MSM8917/MSM837: Add missing MDSS reset
Date: Sun, 16 Nov 2025 23:10:16 +0100
Message-Id: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMhLGmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Mz3dyU4mLdotTi1JJi3dziXAtLQ3MIbWyua5hkYZlmZJpoZJJiqgQ
 0oaAoNS2zAmx6dGxtLQAUrzIRbQAAAA==
X-Change-ID: 20251116-mdss-resets-msm8917-msm8937-1b89f25a24d5
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763331018; l=872;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Htj0x/pRIxgZYWhOmTGjFgSiom+0IEfKTJm/dfQNywg=;
 b=LnhzzXeZUSWaxIIqJkDVKYGX+hjYW22oVyP0W+uy5CdE853cal0QC/JSHnLdR9UojMdfarPED
 uASdO4rUXDwCf4iDZM8Zbc5XmY9LrHSliRI4Ch6ihk9KPtGWUk0PPus
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add missing MDSS reset can be found on MSM8917 and MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (4):
      dt-bindings: clock: gcc-msm8917: Add missing MDSS reset
      clk: qcom: gcc-msm8917: Add missing MDSS reset
      arm64: dts: qcom: msm8917: add reset for display subsystem
      arm64: dts: qcom: msm8937: add reset for display subsystem

 arch/arm64/boot/dts/qcom/msm8917.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi        | 1 +
 drivers/clk/qcom/gcc-msm8917.c               | 1 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251116-mdss-resets-msm8917-msm8937-1b89f25a24d5

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


