Return-Path: <linux-arm-msm+bounces-19439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969628BF16B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517EB28432A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8208713248D;
	Tue,  7 May 2024 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7VTY5YN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795D13118D;
	Tue,  7 May 2024 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123306; cv=none; b=rNZNJDDvTPTOBwNorVHJkw+VPMdAbedvKLMfhVlQj3cHeu9kmNaupiAuSQaGJ3IRqy7cNxkqbjtGC5atjrcEUT/TaBxIR1OIdqZC4MfY1edYjGF2/Eu9j4yqOa+sgK2CLcdBnFHCvzzRBBplJaeU0t5ACDYmPbZaa9NSLlB5kGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123306; c=relaxed/simple;
	bh=wSkfnaPITX5qLw6RyeCyK9vxuYtr6G5t5yRD+6IUEHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKl1V4Md23CP7l7cbiOzm812HfwibrGR2kPBHCm4xIyIMe3Z4cNHvuScuonuapB8z+zJzGfz0ynkAA8uNt6hO7nXapy7HNTzz9edPvPu+fPmago2jjRCEWjbKoGSCXukLrMb73tVZmnRZkGiEyYjECO/lvBcQZCJL09mm6X+4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7VTY5YN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6820C4AF63;
	Tue,  7 May 2024 23:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123305;
	bh=wSkfnaPITX5qLw6RyeCyK9vxuYtr6G5t5yRD+6IUEHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a7VTY5YN+cAecIUbj7Vt1Pcota2X2eaE6tewsHi4Af0dOuaSwbcC9Ktu5mnD9DXvy
	 YXwMFPZeyuouNq6R4y8SeMJnLALvrckYkBXG55XLbOUNaadTcdFLJv15qofQYqebkp
	 eLI4flqYGsK4x1pk5VMfupiT9FLcRt17V7MBBYWtZOtbc1ynn8mg0s8iYsoBIAde9R
	 0aaMJnzuGF6Cuwy/Pt02Vy8053h0ZsqcCwe9BgtRaCkp7vS1RoW4KZgsnq1wnBg/6b
	 tmIsxzZobPEl2/X1qKEkVmzbxFQhsZfYkaoZ51uM6ufW2YG4d8BMe5gUeuI7uHAjyA
	 g83arCsyx7qeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 13/52] regulator: qcom-refgen: fix module autoloading
Date: Tue,  7 May 2024 19:06:39 -0400
Message-ID: <20240507230800.392128-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit ddd3f34c10002e41ed3cd89c9bd8f1d05a22506a ]

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://msgid.link/r/20240410172615.255424-1-krzk@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/qcom-refgen-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 656fe330d38f0..063e12c08e75f 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -140,6 +140,7 @@ static const struct of_device_id qcom_refgen_match_table[] = {
 	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, qcom_refgen_match_table);
 
 static struct platform_driver qcom_refgen_driver = {
 	.probe = qcom_refgen_probe,
-- 
2.43.0


