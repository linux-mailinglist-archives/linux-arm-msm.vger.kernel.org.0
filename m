Return-Path: <linux-arm-msm+bounces-19443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F1B8BF23D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 157C02863CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25A8182CB7;
	Tue,  7 May 2024 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o68KAl6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EA182CB1;
	Tue,  7 May 2024 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123560; cv=none; b=gxTKVzdatHpKXrZb8B7aAl7MJ7WGkblGG8AHj3UnH8QJA7E8JMlXypSLqSOqHx0/oNXTTs2tAivkWczziNhm9vuXWT08WYymbiecp1xCQMV6g6ka4N8CR931p5wWm3GolhMC9pRoQU+WiLlZA1g7gWIigNcL1L0DK85JLEJOz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123560; c=relaxed/simple;
	bh=vrVJHhflsxwPsqTQF9ADxFICweJpY+fATogbX3yxrBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ls/i3RWnKCH7GZQxrrBkuxmyLv2XL2ngHI+DRRVVAx3HyzIJmi0LXyYcX38CXyA82DSBGpyzFtaJ6KfxbVFr8Dkl8rLGbV0jWVGtbBEF6PSmMp6Tnhgov3jxnMoCOoL2INMSYdqnx7goYeTp805eyzxFNRW/ky1k16lo+XVj+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o68KAl6E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA7BC4AF17;
	Tue,  7 May 2024 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123560;
	bh=vrVJHhflsxwPsqTQF9ADxFICweJpY+fATogbX3yxrBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o68KAl6EiRex+KM68VrLqVky07pWqxJQookHR+GS1SFZSnpbKFzK74E5NCQXeigS6
	 Gwa8+rFWHcsiZto/F5Zauc2BOQpMb0nm9ZYq4yS1HOPXGeq0jDyfRB4/ESzZI+Gx/k
	 58FnnwX5hpmSjqgCFqLhQxqyrw9lwQUwzcRzSFuuaafiNPemmJ+IEVeT15kgzHGBtN
	 93gB9AQNbn8YEBntykGm6sZy2lOe8XO/c8ZOCL+jKKmK7E2Mvv0eP7bKtV1jL0SFef
	 G12qk7aTSikTJiokHUZW93HEhs9RwOvWhZqd+Q/LQaPnNG34Bw0Dg5TqeJFejy95Ma
	 IV7Qdxgap2RaQ==
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
Subject: [PATCH AUTOSEL 6.1 05/25] regulator: vqmmc-ipq4019: fix module autoloading
Date: Tue,  7 May 2024 19:11:52 -0400
Message-ID: <20240507231231.394219-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231231.394219-1-sashal@kernel.org>
References: <20240507231231.394219-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.90
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
index c4213f096fe57..4f470b2d66c97 100644
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


