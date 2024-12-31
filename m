Return-Path: <linux-arm-msm+bounces-43750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2C9FF07D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 17:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C750161F06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 16:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F9B19C558;
	Tue, 31 Dec 2024 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="T8y6FY2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE81217ADE8;
	Tue, 31 Dec 2024 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661401; cv=none; b=kPPDG/kj569Z6snlKCTlF/Y2ZPme1+7jl3b/yzuH3079W6wHkLHtmwSEguwOMfdm/0o31/ldqadfs8/G7XxOosKCthx9QQsVUyY6s6GGOGkpm5Kv7gqqa27eu1g7d5rjrrYyM2yTn7Y9aTyuxQ0ve64echsEzVYvAw2nFP6boqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661401; c=relaxed/simple;
	bh=7npF4ShDytvlwANsqYPDFUzlP0Q6NH3M99kf0rBKN1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iR3HtSHhbiAw48GRMHAqAAfCQyuytgVa/isxTMUi/ihNvkqQ+U4Aszwcxme/JvoZOHZYmWM/9R0RLzkjG0RI3rsp6rLbm9kEvK4sydKiJ53UL5H1jpLJILnycyaNaB6f3/C3eDIeQDbgSNa2zHLHCBtKAWd9N/t329dgz5mCHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=T8y6FY2y; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.30.162] (254C25E0.nat.pool.telekom.hu [37.76.37.224])
	by mail.mainlining.org (Postfix) with ESMTPSA id 0B829E452D;
	Tue, 31 Dec 2024 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1735660874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N2bPHktKV4lvD/TJJZkmZ9SgBxvu268x0W3WFie6Df8=;
	b=T8y6FY2ys1bUJ2RPpElgH6H4H9W4utGye9rE4GPsw0GZX+BBERGK8A/Ia9zktm9lwh7P4C
	6R/e8Rua3Oyr9ncoZCy8HHPfX1CyVZQ40DBLI40KvrOrngGvr1f99hTq7qa3uhmHxIA1CX
	cSOdqf/WZ/ps8+7Fi+nxMWK0f580OILifnUybKqOo78Z1nzPBcVusmsmsmrXEDIpTQXfvb
	fO6LgGizUlLlrNaT+u63TgY4mjKruiwjdgNxZOqtSzRA8Nvev4N/RhJgZc7qQJfgTkFwMs
	fioGvJ6Tkr6jajE2t26PGU6WIfCpggmYbR2CxwukjZgkK6J+fH1i2vXqF/n8gA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/4] Add rpm clocks for MSM8937/MSM8940
Date: Tue, 31 Dec 2024 17:00:48 +0100
Message-Id: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADAVdGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI2ND3aKC3ORkXSPL5BTj5GSLpDQTMyWg2oKi1LTMCrA50bG1tQDN5NA
 fVwAAAA==
X-Change-ID: 20241231-rpmcc-29cd3cc8bf46
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735660873; l=738;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=7npF4ShDytvlwANsqYPDFUzlP0Q6NH3M99kf0rBKN1U=;
 b=OSBgP8u5zEu66iEs3ZPcz2cTwXqXof3YQKaJZ1AXEarTDJBqdkRxZAWeGp4zbNI7DXPn0+pvI
 IEWWspQxcorC9RR2Z+vxZLtaCy7pQdBH+oDrYLn4c+khE+WIep7Q4T5
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patchset contains rpm clocks for MSM8937 and MSM8940 SoCs.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Daniil Titov (4):
      dt-bindings: clock: qcom,rpmcc: Add MSM8937 compatible
      clk: qcom: smd-rpm: Add clocks for MSM8937
      dt-bindings: clock: qcom,rpmcc: Add MSM8940 compatible
      clk: qcom: smd-rpm: Add clocks for MSM8940

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |  4 ++
 drivers/clk/qcom/clk-smd-rpm.c                     | 56 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
---
base-commit: 8503810115fbff903f626adc0788daa048302bc0
change-id: 20241231-rpmcc-29cd3cc8bf46

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


