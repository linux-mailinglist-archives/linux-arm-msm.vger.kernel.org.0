Return-Path: <linux-arm-msm+bounces-66978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51641B14B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EDF43B54E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA0285C86;
	Tue, 29 Jul 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=Richa.Bharti@siemens.com header.b="d9CFyWjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67811266F15
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753782627; cv=none; b=Cc1TKOCfgpQzj+Vfh3d+hsnuz0Wsl7GIwhZSKcBJEYT2Bodap4rpuzxoG+LVSL31EiLsDywuD6un/d6KjcEIOUhhlo7q6Zrp9OV48z4Bc/PHgXwG1IKGImxHUkO99NJ4tlZ+M31ev2cRtRwxw9x3tg7DEHaEXxe7nGXNG1j9LCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753782627; c=relaxed/simple;
	bh=NF67huj+JZXEKbMxs4q9eQUot7kyPEQ1/jmQAO1Bfhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gwFvL8t53it1O34gE+n4LWPN2Ri4C8fDzmBB0LKWUAiWyiYeNLHCyjqUY6uwWi6cWCQkmeSQ2YEY77vRjitlrOIEwiuDBWdt4hB9ty78rzfDmKiojWDHDOS0Zy6T1rmWT6P8Wli+56lytORxvta+EZp06kosu5+ORpBXdfsohNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=Richa.Bharti@siemens.com header.b=d9CFyWjV; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202507290950152612ed7ea2140fb80d
        for <linux-arm-msm@vger.kernel.org>;
        Tue, 29 Jul 2025 11:50:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=Richa.Bharti@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uM0t5DDiNTeF4HYXChPFC6deNZRomgtgmzVjY7dKA2I=;
 b=d9CFyWjVUFzO9VgOsWMeaHTPt1pVZfVlCb62mfVCLhP2enMJ4rosykCaNGwUhn42Czo3x2
 nYpd4X8etmxc2R3BkDtTfk+m9patazN1mX58d9KSyUwSxEIF8SZ/v0bex4hFa6O0olMdfB8G
 8Tw+uTgnn3RJKNNW4i1FGe6Qgv1eYzctOl6S4+BQLqUd1pdwSoYCYiikWfIlUQBcF53dEQ7q
 SfPSoSlZXIAj8EwQkGKvl/d626C6Gebhbq7mSPi6Ug12lsghlR0s7ROD2gtAm1W0Be6qOkX7
 PuNA1XuHZc5ID5o4iSAlhcL/GLlFDVVCPg00M8j/GIUvmXwlKDVaztOw==;
From: Richa Bharti <Richa.Bharti@siemens.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srikanth.krishnakar@siemens.com,
	cedric.hombourger@siemens.com,
	Richa Bharti <Richa.Bharti@siemens.com>
Subject: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
Date: Tue, 29 Jul 2025 15:19:43 +0530
Message-Id: <20250729094943.863392-1-Richa.Bharti@siemens.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1331316:519-21489:flowmailer

On QCS615, we see the same issue as reported on SM8250 and SM6350:
"gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
This is due to GPLL7 not being enabled by default as a parent clock.

Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
gets prepared and enabled when switching to it, fixing the warning.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>
---
This change is similar to upstream commits:
- SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
  gcc_sdcc2_apps_clk_src")
- SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
  gcc_sdcc2_apps_clk_src")
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 9695446bc2a3..b281f0dfe165 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
-- 
2.39.5


