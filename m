Return-Path: <linux-arm-msm+bounces-51537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3FA62F10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 16:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF06189A37C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 15:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32422040B2;
	Sat, 15 Mar 2025 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YkWVBihr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1889019049B;
	Sat, 15 Mar 2025 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052383; cv=none; b=OVlduvrRouskGejzPyk5EWmkh0/se9RxH63HuYU2IQvhNGgUgFTMG1NQdYkMTw3WyTP4rT8YKdT7oRRZj9JoHuVpMK08KY8EXDylcn0rKibUvuJySxZeF7jMaxqbmoSFTih/rguHRzMmn0CEuuU/KrkcOOzamfEqoo073zKrFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052383; c=relaxed/simple;
	bh=ZRgihp2HxWgGaHTKbjNjtRc3dPDXREH7xMWjqg3t3ZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B3dU0/HsPwrd6F+N0cvXB4WIpDLEUfQ0+PxhbdTs1W5Lm48BXJMDZ3DeC2F/hY3VlA/4LAtWBOfgqPGWyAoDTleMFjq9h2fHxR9uT7+6Dc1ZDD19pzTB3ZD8abDm7qOpRdTU1IwSM3FnTFuJZx3TMVuJG5sCKZvPYYwGVBaYdMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YkWVBihr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C339A.nat.pool.telekom.hu [37.76.51.154])
	by mail.mainlining.org (Postfix) with ESMTPSA id 57F93BBAC0;
	Sat, 15 Mar 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742052380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeQm8+FhNPyVRvUsK+uCissE24j6EUlv1M8Ckqr5ApM=;
	b=YkWVBihrX76DGQJbcyQ0T7/hCbmwXyMncvuiPEMhmfRBCFgdSO611zDsFtRTN/acbIpCYy
	Jbzqj5owaA0jmc410iTdGX0hLgUbKQd38V2Q//W9yb1+iIcqOcM8JFO/W4/PEzGWTqeS89
	QaxGlH6IG3cDDHnSFR5hL9gf3AIifbNEqzxJkMTErwwu3KlDE1C/OHL/H7D+NJHyvm0J73
	j2BIsUbkT19iXVqr5BsevwD5wIKW0P8/mOPt2xJ6bnUFGSUyFgvYcg4HDqtqcE0pNbipJ1
	9+jb4F+9GOxOTBKSTrqWkG10s4ksDY9Ls++pGRU+42QlRpmnFA6DReUt/0I+rg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] SDM660/MSM8953 Fix video core clock status stuck
Date: Sat, 15 Mar 2025 16:26:16 +0100
Message-Id: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABic1WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0NT3eSc/ORs3bTMCt1E0zRzo5Qk00QTQzMloPqColSgMNis6NjaWgC
 MfpPAWwAAAA==
X-Change-ID: 20250315-clock-fix-a5f72db5a416
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Vladimir Lypak <junak.pub@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742052379; l=668;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZRgihp2HxWgGaHTKbjNjtRc3dPDXREH7xMWjqg3t3ZE=;
 b=qLgPYhswUqpxBiMzO5Z0f5/z1nbziZGimgI74fVwXoGmCGrZ7MT+WR43+BKe21XyCkak+imBk
 MCdVgMo3MTUD6MqGSRWyG2GS10jblK8h2GJSMU6rvO5e2EeYfemx+Wt
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On SDM660 and MSM8953 video_subcore0 and venus0_core0 clocks are stuck
at off. This patch series fixes them.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (1):
      clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock

Vladimir Lypak (1):
      clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock

 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 drivers/clk/qcom/mmcc-sdm660.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: da920b7df701770e006928053672147075587fb2
change-id: 20250315-clock-fix-a5f72db5a416

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


