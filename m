Return-Path: <linux-arm-msm+bounces-19442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA98BF1E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2527C1C235C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BB5149C7A;
	Tue,  7 May 2024 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMIWyFHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9E149C76;
	Tue,  7 May 2024 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123454; cv=none; b=P1Mloaw86sYcOTlPeOZYoCsrtAC3drc+goS7jIAtVCfpL6JFkgIOK29D+/ZYrYHT3TGubwytfFaIhRSq6QbkRJVS+JQYpaXPMnA1lzEJeDd+pwkoDDjuI4R0+YpcG34omeKuT5yyYPS6xAyHUUSiia90FAbJ2hYove8+FOzCGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123454; c=relaxed/simple;
	bh=Cq1lDh/SwHShDu5gZ2l0pbzVw0j1TWv3xedi2Bsxaso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSUxANNxThQ0/HNryY1t4zHGMiwsk3x5b/sYpPjJ/diVxCZAxpgY/FVj9lUfl2fWziyCKKt2Ua621TvpTbqpA2YrR44olQf+6CKBf25Uci6XlNx1h1vUHls7jzNRHOyWSyZluPGmFOWKlcM9X0iQ+y6vHxNTRw8jJ00n3hz7+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMIWyFHG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B1CC4AF17;
	Tue,  7 May 2024 23:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123453;
	bh=Cq1lDh/SwHShDu5gZ2l0pbzVw0j1TWv3xedi2Bsxaso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMIWyFHGDXB/Q1Df9m2x7Eie6QvW3v9BoyBaun8uGH1kOktyn0CDwPeamp6h7klJz
	 dlFgSaVQy6jxCHkwDuCdWl5aYiTUAXC8RVQSLX0m55/B2DEHQhbZRViOt+D77a6XW+
	 HdQKSqE7QyKoVWtILXhXIl7fiXQp3EtssPv43Mf/uBDo5uO5trijx/RxAAJ0rwh11h
	 4ysKW6oz866tpRIk7ToYedlRjB184ezU8/hkcgJc/7C4I8XkRZHgVxy+vQFuL0+GKW
	 ib7mzo3ccsER0uuZcq1XJZriU5B6Ud1EEIC3rgSQwmRu0Y1KmM/ByEbGap9wfZY4AX
	 lumKZRfsQTZLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	robert.marko@sartura.hr,
	luka.perkov@sartura.hr,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 11/43] regulator: vqmmc-ipq4019: fix module autoloading
Date: Tue,  7 May 2024 19:09:32 -0400
Message-ID: <20240507231033.393285-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231033.393285-1-sashal@kernel.org>
References: <20240507231033.393285-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 68adb581a39ae63a0ed082c47f01fbbe515efa0e ]

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://msgid.link/r/20240410172615.255424-2-krzk@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/vqmmc-ipq4019-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/vqmmc-ipq4019-regulator.c b/drivers/regulator/vqmmc-ipq4019-regulator.c
index 086da36abc0b4..4955616517ce9 100644
--- a/drivers/regulator/vqmmc-ipq4019-regulator.c
+++ b/drivers/regulator/vqmmc-ipq4019-regulator.c
@@ -84,6 +84,7 @@ static const struct of_device_id regulator_ipq4019_of_match[] = {
 	{ .compatible = "qcom,vqmmc-ipq4019-regulator", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, regulator_ipq4019_of_match);
 
 static struct platform_driver ipq4019_regulator_driver = {
 	.probe = ipq4019_regulator_probe,
-- 
2.43.0


