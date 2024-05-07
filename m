Return-Path: <linux-arm-msm+bounces-19444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9318BF27B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 539331F2284F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6318920FA8C;
	Tue,  7 May 2024 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDxJRBhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A1920FA85;
	Tue,  7 May 2024 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123620; cv=none; b=n+4gARD1h5FMDeONU9XDxoY5tWxMJDthUCLv3JQ1fvwjsbIVzdj0Ka+VC7SkoJ65beTLQ6VsNWQ9081R85hIIytl8k6n5AV4OKV9VQ+ZUzObdfK6H1TQaxhZ1cmuO52TUhDHCWzPnEtP8vuvw9z5hScgSJs3K3+mJ8uXM+zA4aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123620; c=relaxed/simple;
	bh=M1gaNMrrm9Iv1t0efvYS1c+/seipl5ULjiiMEx4oQFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2PmqEt417Ji3rhCjZhXHj8WyGRGGV2XhqdRGB1t7xbXpiXgwXMPXc3u/SePhlau+JgR5ZJZYhdYB94SL1eCeTF8+jP6ernFeVX1oGAYfU4B4pxtXll3EozS5puTWQcBAABeDtBLDIRFnLEUnvV95A2mdBBF7mscpoGIOTNxMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDxJRBhH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0525AC2BBFC;
	Tue,  7 May 2024 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123620;
	bh=M1gaNMrrm9Iv1t0efvYS1c+/seipl5ULjiiMEx4oQFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDxJRBhHNJHqCTwSGa+AyVtNKB0OsR0fmlrrDZcNgO80KBV58oAavHld+8TACM3ui
	 LG5Gpcn3BryhSyaV2P0SyuYeNy4K8Gm0j0wPNc6tnWkVFHomy0XUihpyfeDZTSoHbE
	 m90rU6EAHri5fho6hhFisEVjEfAAPmBCrK0/NAmWxpcd8pD9E8ZJPXDX4N0g8rgGkM
	 k/e6crpeMdVzZ1N81nhnyJVI6grOvPUPD91TV8DBNtGZaSilicNtX1rMiuJux9ijlZ
	 KJeG8UVxTZlh3MQwo0MrL+/gJnOWQhnT3GvnJnIroM2oiKn3F0iQqeMYqBItd0Tcp9
	 BMtkDvdV9atsQ==
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
Subject: [PATCH AUTOSEL 5.15 04/15] regulator: vqmmc-ipq4019: fix module autoloading
Date: Tue,  7 May 2024 19:13:13 -0400
Message-ID: <20240507231333.394765-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231333.394765-1-sashal@kernel.org>
References: <20240507231333.394765-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.158
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


