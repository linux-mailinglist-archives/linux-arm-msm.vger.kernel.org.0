Return-Path: <linux-arm-msm+bounces-19440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4FF8BF16E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A091F20CD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAC1132810;
	Tue,  7 May 2024 23:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4G15kUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F999132804;
	Tue,  7 May 2024 23:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123307; cv=none; b=O26o3zkx+X8Igiv8i+HgKC0Dc6Cv9IDLzVJQq3Gfb2xza3d4TBwcstNXy45p1IjkdtmwNzF2kUmuki9IDM7097RHOsMiyZ09bYwspv9XtfMereWXZzl7Af8j6RxaT/FsafQNtwWkUO9Srexmn8+DmJLMEk4vFd1NGf66s5QUk1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123307; c=relaxed/simple;
	bh=Cq1lDh/SwHShDu5gZ2l0pbzVw0j1TWv3xedi2Bsxaso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSmepgXkTekDQBUGBwsyHNxvokUb4XDZE5wOjZbiPoKqFzFX+bZYjlRwlFzpE1Ly6F/Nu/gNS+f5KeL46lz7VKU8s+79A7OahS9CnxnQpEoQX+5hWmnC+ju1fEf86u3VknVOoXFDzbxgOptBuNRnyb+lBGoByZ70GhkJL+OLygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4G15kUq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66834C4AF17;
	Tue,  7 May 2024 23:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123307;
	bh=Cq1lDh/SwHShDu5gZ2l0pbzVw0j1TWv3xedi2Bsxaso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4G15kUqDQb79JHg2/P4ZHd5y87TLd3FfACWuGMjYKYgFkgpt91D7HH3aX9wc7nUI
	 Abg2Es8KsS5YTEqljcs8tZm22D6gfOcYlICl55x6bmIfUVxVK6s7owBt+JD1Zj6mf5
	 JHCZdl3DWwZLXBG3goTHNZxL9WMTDY+zajRXnvJnGlSRoWleu0LSKOmf5PAQByjtrw
	 NXPVcU8SlPXgothxtajKwtf4jd9MnvG85kJpiyUqBuN+W+v01XpMRxSbwFtErEwfDi
	 2zYBEBo9Qvh5JtvTxQTLRNPtJQznxnLxIUi8xhQA9lVnVgXlL4nTJsHrtdkkR08uPD
	 Xhnv1CMpZ4IUQ==
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
Subject: [PATCH AUTOSEL 6.8 14/52] regulator: vqmmc-ipq4019: fix module autoloading
Date: Tue,  7 May 2024 19:06:40 -0400
Message-ID: <20240507230800.392128-14-sashal@kernel.org>
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


