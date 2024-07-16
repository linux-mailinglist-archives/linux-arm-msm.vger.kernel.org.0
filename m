Return-Path: <linux-arm-msm+bounces-26348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751793284C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 16:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0BA91F231A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D3F19D8B5;
	Tue, 16 Jul 2024 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIXjYa+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5756319D8AD;
	Tue, 16 Jul 2024 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721139923; cv=none; b=ss0C/4yl6RDyRtWyTLhhIoWDdV8zZo0JmePrW4K6+n0aD14pTg41yp9XlUrZrFKWwPni6jKtuSBEy1poZo3xRw4p7nvsIdW+J3sECBZmqmBQUBrpXpHxNJFlfPtJYo2M4bDYQ9iMxD4Zye3v7ss/WDsyGey7I2x2sdKScxPmeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721139923; c=relaxed/simple;
	bh=upDeAl9zvyu6Mv94XULirvgTdusvzyKbmhk2dQLRPVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pY8Sg6F3FSx23OflphOxfRzhIJTgWxNVTp0xrnWWXHbHQPID//VT7oXy3tw5wXUj2ENWgq6X1a//bX8EMtucf0ejUKpOZfVUfr/ZDA7MCzKnIS4LKuOGHGt68/Z7Jx6JWJxN1JsCRiUFWOuPSRUKn9aeFzOU34QxdPOwrRbe0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIXjYa+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2875FC4AF09;
	Tue, 16 Jul 2024 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721139923;
	bh=upDeAl9zvyu6Mv94XULirvgTdusvzyKbmhk2dQLRPVc=;
	h=From:To:Cc:Subject:Date:From;
	b=CIXjYa+Bhhw96oB6RbLhWcGSDKn4zbGTFifIPcWJD83RZHWPwINPP0Rz0ik9Ura7H
	 vNagwlOtw4OEs7CI9P6BAXMC+37rsgE1mGm0RRYQdEb6cMevILeUvMdc57UMTt+pFw
	 ZoNZFc+mQ7BFFs/r2Y2cgAXk+afcFIlQBJ/ldGE4Y6OFU+S0M9cdFpCTNbUrhO3ITY
	 989SiSrdN/65Fn8aTvSy27vGK49Gz07ujvGo/MWC03ynXLaaNBSiruwG03BxqFjynA
	 zaadSzKA2gWoiC242b+2B65HhAZv61y47y6HbyasUWaCiFombBfokwQJ3jiNQqtFyK
	 0a3YyhH/HJZOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gabor Juhos <j4g8y7@gmail.com>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 01/22] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs
Date: Tue, 16 Jul 2024 10:24:08 -0400
Message-ID: <20240716142519.2712487-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.9
Content-Transfer-Encoding: 8bit

From: Gabor Juhos <j4g8y7@gmail.com>

[ Upstream commit 2ba8425678af422da37b6c9b50e9ce66f0f55cae ]

Since the CONFIG_CTL register is only 32 bits wide in the Stromer
and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
IPQ5018 and IPQ5332 configurations are not used so remove those.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/apss-ipq-pll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index d7ab5bd5d4b41..e12bb9abf6b6a 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -100,7 +100,6 @@ static struct clk_alpha_pll ipq_pll_stromer_plus = {
 static const struct alpha_pll_config ipq5018_pll_config = {
 	.l = 0x2a,
 	.config_ctl_val = 0x4001075b,
-	.config_ctl_hi_val = 0x304,
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
@@ -114,7 +113,6 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
 	.config_ctl_val = 0x4001075b,
-	.config_ctl_hi_val = 0x304,
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
-- 
2.43.0


