Return-Path: <linux-arm-msm+bounces-19445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2502A8BF29C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D585A283756
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC8C19E903;
	Tue,  7 May 2024 23:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvdDdviQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F619D43F;
	Tue,  7 May 2024 23:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123652; cv=none; b=YX4gmU3nGAwtTR5z3AEkaLZU49ErBI5jmdBD1aImxQywaRQI6Bq3EtnmuUOpKv05pkEl33EraUrjmOivYjvM8yUDvG5p1Dy1qROjOdKBGTnLxjQbXlzdV8wvP0QqpXI4Ewvp+OAzsDB+P9G7epwHXAQTKvhrRglGi386OHj/sBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123652; c=relaxed/simple;
	bh=M1gaNMrrm9Iv1t0efvYS1c+/seipl5ULjiiMEx4oQFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROcTOxycHR4tXdE6Y9Ib8SDkH9yIcYe6pwrOiYnh6VlBZhEDf1xib0N6+LFfZW3TsqhbS8PKfr+2A6ZLjRhwIlZxQ7z/H2kK+/mP2+DktX8RYkImFM6xAnBYhgVT+H+MtU1ZKVG9WKxTSyQwKpt7Xz9TV9qwLkgpO/AcZnqQN9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvdDdviQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B523C4AF63;
	Tue,  7 May 2024 23:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123652;
	bh=M1gaNMrrm9Iv1t0efvYS1c+/seipl5ULjiiMEx4oQFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CvdDdviQLpVWPphYxpsrY7Qv3NpnTJaEEOd2Ofp1stilq1bQaFcJvHddBsXEwWa6K
	 nfGjkpLjWIJi+Kck47vOXtct8lTQckdf0c3KmUxTfYqOdBn8J9LwG54mDlgdy9jtnq
	 oUGDRhlAXh2ut9FKZ86DrOXb8A144eTmnb/0FAXrIJVbJbXQvLBq0aw6c3YO2XOny4
	 Xq/YINdlZvyANaLOzxg3TWU/DSsd/IPadFBitBb0b4z3XpLkXXCPts0lGyEKKN5ixu
	 WjBOnvnbibDRCDgkFgCn9SciYDAZ/WoZ7SYWyWDIlh+UZ4D8IDGNVmqd30hFfUQCeJ
	 Hyz14mrcz0feg==
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
Subject: [PATCH AUTOSEL 5.10 3/9] regulator: vqmmc-ipq4019: fix module autoloading
Date: Tue,  7 May 2024 19:13:58 -0400
Message-ID: <20240507231406.395123-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231406.395123-1-sashal@kernel.org>
References: <20240507231406.395123-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.216
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
index 6d5ae25d08d1e..e2a28788d8a22 100644
--- a/drivers/regulator/vqmmc-ipq4019-regulator.c
+++ b/drivers/regulator/vqmmc-ipq4019-regulator.c
@@ -86,6 +86,7 @@ static const struct of_device_id regulator_ipq4019_of_match[] = {
 	{ .compatible = "qcom,vqmmc-ipq4019-regulator", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, regulator_ipq4019_of_match);
 
 static struct platform_driver ipq4019_regulator_driver = {
 	.probe = ipq4019_regulator_probe,
-- 
2.43.0


