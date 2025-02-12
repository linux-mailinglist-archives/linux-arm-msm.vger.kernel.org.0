Return-Path: <linux-arm-msm+bounces-47788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0BA32CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D7F01886EB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8628255E42;
	Wed, 12 Feb 2025 17:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UEPGAcx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20B21506D;
	Wed, 12 Feb 2025 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379855; cv=none; b=Wir6T6iPUe+9T9htWuIDK72cQzZrTI7eoBXWQ3ieOInBC+zDg6c3NiBm1HoB8OuH5YUjjZYuAlH8Eqox8p9AoV4KFdM+875yVgoWfCbq9J8PS1WIJKAYL1iZyYr+eReLoueAWh/kqqKZeL71OLBefOQeEqNAKYxXTW804Sg6ROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379855; c=relaxed/simple;
	bh=tnZzLK0VrYkfdiqwd0I3PQ34iy2elO2SJXYEtEvLPYk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=StFfAnCsT8X82zcAy/47vJA9xz6vsGuvBXXUHxjGxSafNZs4MV7r5qj+DAoLc5g2omVvAH3De8vJUmHWCN0Zh30fzV4ohbN5J6gHfgvCH1hOJ2hLNSL/S4ManZoQV5/YFcgyXBSBep54bPyF/ThqhZ58eTZ2rL02E+D4sIX/sGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UEPGAcx/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C23D7.nat.pool.telekom.hu [37.76.35.215])
	by mail.mainlining.org (Postfix) with ESMTPSA id E49C8BB837;
	Wed, 12 Feb 2025 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739379851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VEZblu87lXUcJgL4iNC0ZVQuIsVOZGnLoGvOSnm1OIc=;
	b=UEPGAcx/ilp0OeH5ZBzPkOF8j8chrb6i/pjq95+5Yc4MFxDR7+caSCK1PHFnBBxXXEAjcr
	vMn+iuDjPihHAVDLjTKCeRuhaeW4JUWZmYxYLM6QgcVqibdW1/NWpxQQscDfQDMc8KMgxp
	lNAMOfu9gGRRXcNSKPtktLiFJat2nj8slpsbT04NSBYgFdte1YcxWI2LvkPcxxr21m5DtO
	OrspMvPHT/15oo4H87ymAQQ5MZhKeggAL9sBfqiORl/eYSYYBlJz6uyQaJi0kUVRU4o+HT
	yQxk2Fx8gF3iZDdQWb288DDvuKakSFJfZs1u7012jBC7fqfKAhTUQtoo8EZTvw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] Add rpm clocks for SDM429
Date: Wed, 12 Feb 2025 18:04:08 +0100
Message-Id: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIjUrGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Mj3eKUXBMjS92iglxds8TkFHNjUxML8xQzJaCGgqLUtMwKsGHRsbW
 1ANlbcXZcAAAA
X-Change-ID: 20250212-sdm429-rpm-6acd735487d6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739379850; l=665;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=tnZzLK0VrYkfdiqwd0I3PQ34iy2elO2SJXYEtEvLPYk=;
 b=JRQX+ZzJXQjSUWM4qE43vBhdA/aVeV9x+vvla4hURtMxBfggPwI7oBm/2Izk3V0aIewIVbcCA
 JVBzOW/TZtDAPZ+/tSerFRq48OoAUY7rif1Oo5iD2CgOVXvg07xLaE0
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add rpm clocks for SDM429 SoC.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Daniil Titov (2):
      dt-bindings: clock: qcom,rpmcc: Add SDM429
      clk: qcom: smd-rpm: Add clocks for SDM429

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |  2 ++
 drivers/clk/qcom/clk-smd-rpm.c                     | 32 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h             |  4 +++
 3 files changed, 38 insertions(+)
---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20250212-sdm429-rpm-6acd735487d6

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


