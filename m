Return-Path: <linux-arm-msm+bounces-82156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB8C65A25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id F3EAD28CC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A9D30E842;
	Mon, 17 Nov 2025 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Swe7my8S";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sAep0Gy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1329B796;
	Mon, 17 Nov 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763402350; cv=none; b=F7ja/ja4wLPXJM5SYU2+bZOAj/8daXwcpFHo9Q8f64HgIDJj7LRcZw6TGTcnFRRdBnkDxRCmGfUtGQ+RdjDys4hkFTnZAOUJyfVKnuP3cZG54xo0An1xUw+tcIitacpZ+MgizQcwIfnTIlKmBk/vCr/Pid6c+gvHZ6lQcjfH4vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763402350; c=relaxed/simple;
	bh=uW8km/vDo2EP4so3IaZLe/21KmEaqMgXEdKDzh2tOLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZfPf4SwADJE4pZbtVaEvScMcs0VFMesZRVVU+GdzUld0B5aGsMCyyoyRHUiAgMm0i02PhbUc2BOQlB3vaVSpzmZgt6N4jI0T3Fs/AodKgJCPeLaMRmuNcpPno3N5UeIqzqfwrPUOdrjbvhBF5Zcc6DZwG9RrPcehfIl30gufuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Swe7my8S; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sAep0Gy+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763402332; bh=LVGLx1olVEMlisFeBeMHKlE
	cU7WjcuNhMhDRU7G28Uo=; b=Swe7my8S0SJQPQc0vAI7nFYWcwGvWnsj610bRgqZLbkps9edZ0
	CPR8NHL1L2BqJArCmYitPBf7A0eWoqMoOEFKzoasQ6YmGaQIjTKIS752fiM2CmlQ48QgPlNhzLJ
	RjKpdy8N6ZaQKdCoDIDNH4AahRfp/K+Oz6rEV4vdXS2F8HrsqJ3gf4r23oAQ8c0m3PIbSI2dwNB
	btTB0I5zN6c/j+CU7nLYi+bAFUideunbIF9G6ayqVOqSr28fIW6fX/kue3CIJzKex9EAH1C9lpF
	vagJq72NJWHrOq8wAj/5BBFTfxvahkdl8TZHVPFSArmxuLX1JRSBbS25lf11MY2M/ng==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763402332; bh=LVGLx1olVEMlisFeBeMHKlE
	cU7WjcuNhMhDRU7G28Uo=; b=sAep0Gy+8rvvOpU/g7orX/aDKYNqXU31N3q+cWP8TAHixQKuCu
	kwqkffiA74eZIaHuFShH/aCHNzIesrod78BA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 18:58:48 +0100
Subject: [PATCH 2/2] clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from
 cpp_gdsc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-2-db33adcff28a@mainlining.org>
References: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
In-Reply-To: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <junak.pub@gmail.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763402330; l=668;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=uW8km/vDo2EP4so3IaZLe/21KmEaqMgXEdKDzh2tOLo=;
 b=t6VdLFH94E0l9CrU1H7730nsbqnoAsjHb+dNymvK55YsdcT1I0XXuztWb5nG9o3lRMmR25nbu
 l3P9x7LXqwQBd3bcw/MZ9B+JTbLYSE1v5utxY0RCLhDpbiTTDfP4eeH
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.

Fixes: 33cc27a47d3a ("clk: qcom: Add global clock controller driver for MSM8917")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/gcc-msm8917.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
index 0a1aa623cd49..9d1c5a9953e2 100644
--- a/drivers/clk/qcom/gcc-msm8917.c
+++ b/drivers/clk/qcom/gcc-msm8917.c
@@ -3409,7 +3409,6 @@ static struct gdsc cpp_gdsc = {
 	.pd = {
 		.name = "cpp_gdsc",
 	},
-	.flags = ALWAYS_ON,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.51.2


