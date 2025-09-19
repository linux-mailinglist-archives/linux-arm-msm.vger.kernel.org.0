Return-Path: <linux-arm-msm+bounces-74183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2FB8977B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272CC5A1BC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5321E3DDE;
	Fri, 19 Sep 2025 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FJbxdM5n";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BElzwfKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859471B4236;
	Fri, 19 Sep 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285376; cv=none; b=O/2o4y2Hj6okNYaPbvQXtuV+YRHaR2OF09ed3bKZ2cZdu1DSuXBky+mkHPZmbrrsTssP3w5mzNZCIycx4UML9L9Q+/j8CtoHgliOYhMo2yaop29Y7dj8LQe57ff3rIXgl2hcKTZrlySKPg9c1bjLns7fXBG8R/5mCn02inblqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285376; c=relaxed/simple;
	bh=yHE19xNWqMoQ0j5g1y4gQ2BjKim8cHCBZSXAnCp6u+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OS4R9vEjzVG94jC8ka3CMgq/P4zxlm4hV02PjnmLSOHbEstfhW82tSkZ19lxfnIKDLDvLOeYe0LenQ3AQQorQ/YO/FjsKKNIv8nvq3WIYDtE1wI8AC6UiDjxfSOT8Cdpk+oE3ihQrYfNmIWlxx+uBgQiPtdWkIk0d8Am26wMb1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FJbxdM5n; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BElzwfKH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758285281; bh=oq1b1uY6WD8MECr+zOBO74z
	BuK4eY2CaQ4h7o8MTRj8=; b=FJbxdM5nf7mj9ohcJJHm8qBW9/QvH7VUNYyQZoKInDqNq1R3ho
	LnSY0HU7Ty9sHSKcuF+bpKfV+aHt2bq3CIrsR1ZdTtgJySqfVpiVY7DHMMz95UFdVkabUZpnCu1
	rtkTD3+OgBucccGrpA+u4IK5kHTCf2nFEaUbChKemrE3RzkEek+2FKOwIRC3aiGMrnEmmTjkckL
	qn5YWchQIEaaaK+Ik0RzsMqm78KIFMvuDWW5O/UCJiNXaT1kKUy/IX8gGXo7MUFEzE/gSYJaRh9
	Dw3AR5ltOpp1Zv+3Fp5pqvcH8j6wCJxJN9a0QrtpTIEVAGf3uJxDJUaKZ6LmNS7y97g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758285281; bh=oq1b1uY6WD8MECr+zOBO74z
	BuK4eY2CaQ4h7o8MTRj8=; b=BElzwfKH8zasbivxDfNkiZZGHoIXk/bi3Zp5iCe+gSV/eN9dIW
	X/fsfs9AvU5gdXVgXlTP8ti7Nab4XJMbtyAg==;
From: Jens Reidel <adrian@mainlining.org>
Subject: [PATCH 0/3] Fixes for SM7150 dispcc driver
Date: Fri, 19 Sep 2025 14:34:29 +0200
Message-Id: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVNzWgC/x3LSwqAMAwA0atI1gYapVS9irgoMWoWfmhAhOLdL
 S4fw2QwSSoGQ5Uhya2m51FAdQW8xWMV1LkYGtd411OPtgfyDme1ixkXfcSwJR86juKZIpTzSvK
 HMo7T+36UaYOGZQAAAA==
X-Change-ID: 20250919-sm7150-dispcc-fixes-31578cae5c1a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
 David Wronek <david@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=yHE19xNWqMoQ0j5g1y4gQ2BjKim8cHCBZSXAnCp6u+U=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLO+j5wlzLQyfIPXsvU//3qgbvPWCLMrJ9wH+Z+sj1u+
 z9R8zX3O0pZGMS4GGTFFFnqbySYXLX+dmh+vs1qmDmsTCBDGLg4BWAijzwY/mfLN167u0uuSsTr
 Z+R/tUrBz5dVbWJsO2T4Lj5S5N4Wr8zwz0RvYfN0p/T20r1Zz6xdd5xzED7+2FZ3SY6puOTuymm
 ruAA=
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

The MDSS needs a reference to the MDSS_CORE reset since 6.17-rc,
otherwise video mode panel initialization appears to be broken.

Also ensure that the parent of dispcc_mdss_pclk0_clk_src gets prepared
and enabled to fix an "rcg didn't update its configuration" warning that
started occurring recently.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
Jens Reidel (3):
      dt-bindings: clock: sm7150-dispcc: Add MDSS_CORE reset
      clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
      clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src

 drivers/clk/qcom/dispcc-sm7150.c               | 9 ++++++++-
 include/dt-bindings/clock/qcom,sm7150-dispcc.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
change-id: 20250919-sm7150-dispcc-fixes-31578cae5c1a

Best regards,
-- 
Jens Reidel <adrian@mainlining.org>


