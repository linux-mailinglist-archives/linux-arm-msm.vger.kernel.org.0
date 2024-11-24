Return-Path: <linux-arm-msm+bounces-38968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DF9D6F97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3B1281C04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5612C1DEFFC;
	Sun, 24 Nov 2024 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhFGFtS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408D1F6660;
	Sun, 24 Nov 2024 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452733; cv=none; b=MPvYmLbAjaPQuETp9fblIpUItqO7967mRdxIANwOk+wpGc9noYYuAzB+x7LNSstt6y01293iQ9JuOjI6YQM8prinFjY2Y1YrLJS50v2NXy8/zF1LjPolgUJT2kV8qvlG3BOpAHD7GAJdeMsHkX0UcLkeynvk3CHTfZy36B6rw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452733; c=relaxed/simple;
	bh=158XaLLvocpvBfQcC8zbIcD+QZA8uiQPXskBYpGv1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvtLA/cYSzl91JWY1fKmgq7RC+61ICeFKSy+0c2TrS06SqeFl8Gc0R1WPP+ED1HPkaFJho8ti0L4lWevctCF5bx1of6aBKHTVWEoZMcv2tI++9WpN/j7QYOBQSN+lhi9Ac7KxQD59zBXAfqqOftiD3Q51owp9bAxsfdVPNUtLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhFGFtS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51B1C4CECC;
	Sun, 24 Nov 2024 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452731;
	bh=158XaLLvocpvBfQcC8zbIcD+QZA8uiQPXskBYpGv1iA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhFGFtS4vkjXjByBZ2IQt+xrw8apkKAOYitgJmEnZTmAtjVWV0VqubtKql6YIjy+g
	 OyO2bTdkYVfPdU5YvZAf2eIjXmzBQqzgf1YG6GT7uU5dRu4TTRSPpsxEt2m59jODY7
	 ZmNIO+Uzj8v2KLCCWeoGMqrdj1Y8jbLihs29QA/8FBk0/muTiOViQ58XYKyDYOs2F5
	 586mIRchAhdzgeH08nKq2hcVtnf6Yb30aKImgo0mLAAlIblIW8d6Gj6oW9bxUOwzE5
	 5qh+lh/guyI7KOTJ0p87A158segXbuS/Nw30W0vMh2NVIhltEushJILLrFkKZLqR4i
	 fgQpEAGD+xieQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 14/20] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
Date: Sun, 24 Nov 2024 07:50:44 -0500
Message-ID: <20241124125124.3339648-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

[ Upstream commit 304c250ba121f5c505be3fc13dec984016f3c032 ]

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Link: https://lore.kernel.org/r/20241003211139.9296-3-alex.vinarskis@gmail.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e10500cd4658f..d9738b7bb6d66 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1738,6 +1738,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "qcom,sc8180x-primus" },
-- 
2.43.0


