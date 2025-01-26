Return-Path: <linux-arm-msm+bounces-46146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B0A1CB43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E55F1628D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 15:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7029521ADDB;
	Sun, 26 Jan 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPu3MjH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F555219A8A;
	Sun, 26 Jan 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903810; cv=none; b=cx9TBE2dXmtM79Q0NnzIs+yLoB98RJfPgtNgEs9WGySLskiX7uhSsfQxhZ4mULO+XrS5v7DNqy06II4UVcBStBJd1Mp2AdETo879KYMHRTPvqzeKe00paxOc1JKlGSZcGdLs3QHMywkg1g7rxnRDN5UuWy8a7/K2J63iPcti5D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903810; c=relaxed/simple;
	bh=aF+3ga1v/nQKqAsCdLZ5XM0VzKAFjAM3UywPYlZrgNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ri+g8l1EhHhLC3YSN3d55tVYPBvwV7rngka2pg8IdZ+8YxG2sX4UlPDKre5+z4rRUMVDRpagwZrSUKpgUoxZg3/0oqTdIU+qkkE4VGmOsT0F3DtZXQwsV9/z2hp4y53s/1VzzjfQ5ISp8n7s2+ucA7bo0QLzrs2e2NFP/r5C3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPu3MjH4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7248C4CED3;
	Sun, 26 Jan 2025 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903810;
	bh=aF+3ga1v/nQKqAsCdLZ5XM0VzKAFjAM3UywPYlZrgNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPu3MjH4Th7GWbYm8hMJlzOuApxixeXpmDLNOJR2CCaYJ9g/PuX5iJiyYeAub7RYM
	 HGfk2ZplEcxuz3ISCNHqhWfiMWuNHnw58zsWIpisdogxg6Hoz1CcobsQXx1qbflvYu
	 Zy+SUw106W4qi+tOSvvhQ5lg6yFbKEEBwZiECEoxXjsEG4Fv29Ib5j8PMtHO8r0PG5
	 f3O+q3Yzm4O4MmBqOLAZgTmWJ3DcLKezRVJUouUjUfSbmE6KNXrftFOGqpDrW8hSjj
	 JDz2CEuYKQSW6CFPyQGZMfDRU3EzdkdxQ04UIdNFVg4frYp2XvMT7XdUN7QdH+OzQL
	 v0YOClme73zOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 08/19] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Date: Sun, 26 Jan 2025 10:03:03 -0500
Message-Id: <20250126150315.956795-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150315.956795-1-sashal@kernel.org>
References: <20250126150315.956795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[ Upstream commit 1474149c4209943b37a2c01b82f07ba39465e5fe ]

Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
required, as the GCC driver defines and instantiates a bunch of GDSCs.

Add the missing dependency.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a79b837583894..1de1661037b1b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -881,6 +881,7 @@ config SM_GCC_7150
 config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
-- 
2.39.5


