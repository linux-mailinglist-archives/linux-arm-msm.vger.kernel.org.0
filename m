Return-Path: <linux-arm-msm+bounces-82145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29FC65714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C1FA828DDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1975132ABD0;
	Mon, 17 Nov 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="a42LTJ0U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="m4R/RIDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08865330B35;
	Mon, 17 Nov 2025 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399900; cv=none; b=HtpLDcXrxf78ZAWHWKj+gdaAiLsxNBuS5t8/dwdAQYcwj1ZyIVwCXK8ozBc8jNBOImR7yn8wd9t+Us893c0G2eAVnGmmhhhdVO9HlTcVghhaBUt8hI7LspwAmhYu0WsXQxwP1rIHZmHWAJLmzvR+Eq8prvAcFh1RbuBd6xPfTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399900; c=relaxed/simple;
	bh=nNBrrYmctHskZOLRwlBwYGrHjUCDPM9U0EIRpLoj3Rc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pGK603U6Lfl15iJ1sAdL9nM9PYbbXC5Nv87B/DDpZFHu5bUK94uhpI76PfgbE29CgwaaNXKuOUMylw03orgYa9Puk4epHqT2gjScf/q+gRATbPQ0eMQFaXi1GaKaIlrodkrLBvy/QYK+Z8Bwl+gHrpaTcptvM0K0KMfWNwraQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=a42LTJ0U; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=m4R/RIDc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763399875; bh=6snJ3KAWKEtGwUFI68wsXES
	OH28NRYQqBiEgOf9xSU8=; b=a42LTJ0UOYmKKJsCQ9WD8XrqKZhiIZttiyXImobxveHkzJlfgD
	TC+YuTbWCVnyEPQUx7YBxaWWFgfOMBeYhBUEJOEnz1IHPHowCCxI5vRzGVPMvEtlMleDfCkNIhA
	Bl/HFl78tm6xfFmbysnyTaxpUrpy4U+pZ5qaEYO/D8HYk8x6DgJLTnyKU7CHDnZrz1Qp6GqQH05
	6BYGqhOlnder8c0t8cCn3eyEtFFPeniOuGDFEtr8501v81yv6lx4ml+WpIVPnjWsQI9efd+0zcg
	zpTXK8BNvFRV4X3Czaal4194Dly1G/qmvjgpmn76dagV6mGspRBc84U6ckbHi4xfq/g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763399875; bh=6snJ3KAWKEtGwUFI68wsXES
	OH28NRYQqBiEgOf9xSU8=; b=m4R/RIDcO1T+wzDUXBHpQtYVV6wDS/dG/D8QoiZf+qmHKyLmsf
	ikWs2/B9JgqOvDKeXApwaFz5ox+bSaRf69Bg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/4] MSM8917/MSM837: Add missing MDSS reset
Date: Mon, 17 Nov 2025 18:17:51 +0100
Message-Id: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL9YG2kC/42NQQ6CMBBFr2JmbU2nWFpceQ/DAmSASWwxHUI0h
 Ltb8QKuft5fvLeCUGISuBxWSLSw8BQzmOMB7mMTB1LcZQajjUXEUoVORCUSmkUFCb5C99vCKWx
 91RvbmHNnIRueiXp+7fZbnXlkmaf03mMLft//vAsqrbTXFgtfOle119BwfHDkOJymNEC9bdsHp
 nDCM8sAAAA=
X-Change-ID: 20251116-mdss-resets-msm8917-msm8937-1b89f25a24d5
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763399874; l=1070;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=nNBrrYmctHskZOLRwlBwYGrHjUCDPM9U0EIRpLoj3Rc=;
 b=ZwsY3gsJynFWhDD/esMemjm0aUAfIhGHAHrgils1Fe0M0VEVQS+s7Tvns/fi4QTp7drJt92xA
 5CYP9fJp0SzBVekQjzg84S9HkSADDmtaDz6q5XD4y3ruahK+a2DkEwr
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add missing MDSS reset can be found on MSM8917 and MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Reword the commits.
- gcc-msm8917: correct the author mail.
- Link to v1: https://lore.kernel.org/r/20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org

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


