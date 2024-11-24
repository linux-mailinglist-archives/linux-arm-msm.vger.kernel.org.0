Return-Path: <linux-arm-msm+bounces-38964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559B9D6F44
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB117281825
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E4A1D318F;
	Sun, 24 Nov 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LstO8UEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE7C1D2B13;
	Sun, 24 Nov 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452568; cv=none; b=OAKakDNSRDIvPT0OkrMD7YN1cz6A4ikHAv7qAiqNIY/aPkhypFDTyy7tENzWEB7yhlkSACJKpp351Y+Oj4iqTYYIDkTVMesnDtU7he98zHuA6S3KcAQVga+dLf04TxLGToPnAR586+znZBk0pIcHH1fMlIGG9RXjP6OVv10nj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452568; c=relaxed/simple;
	bh=q2IosYFibw2XMVcu38Wmgkeq5UyjLge6fJKkkWOdRSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0DO7T7ys50BlVemKdkGKQaeutKYK7ZEyyLM8lJ4fKvydLdVPjnhph4QtVXqmEwT7GJ1OSwnXJ/NQoYBj8bK9DHOVMnkGdlCNvQqs6xjUXTWkMeHxM+TsbJEKGjouimBY2bVykrLoGTryz18zXAW7ePc2t8ZUMvaMEaXE7Laebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LstO8UEo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEC5C4CECC;
	Sun, 24 Nov 2024 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452568;
	bh=q2IosYFibw2XMVcu38Wmgkeq5UyjLge6fJKkkWOdRSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LstO8UEor4ChAvFNop3Alp1U6yiB8JrEC7xlw/8Hw/3IOqot70xft15YpNLeh4g72
	 /RzDlVvdH9dEWTt/zmROFMXEwEdjeSWrpWJSj9VVNwUSOfwtelbQhvWstA34LXG4t3
	 lf8EwGpzpF2BZhj1pOZwVB+MCzoF6UuGYbkybWhuGSA+MLXwCadd1QlW8F6qJNhNMc
	 1AYfq6DIyHzUEY17uY27A+ovjtKRl8w7OcQ0gCzCeEcpoAynhmOUIr0aeTMp6itGXx
	 WIXBI5AEgVP6lbW74IcwWiDDzXvhyk2psthZVGZz1P0629BKrNyeih9U0MO0FufFCq
	 eDK2PqqH98sWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 05/23] firmware: qcom: scm:  Allow QSEECOM on Lenovo Yoga Slim 7x
Date: Sun, 24 Nov 2024 07:48:16 -0500
Message-ID: <20241124124919.3338752-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit

From: Maya Matuszczyk <maccraft123mc@gmail.com>

[ Upstream commit c6fa2834afc6a6fe210415ec253a61e6eafdf651 ]

Allow QSEECOM on Lenovo Yoga Slim 7x, to enable accessing EFI variables.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20240919134421.112643-2-maccraft123mc@gmail.com
[bjorn: Rewrote commit message]
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2e4260ba5f793..f019e0b787cb7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1745,6 +1745,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
-- 
2.43.0


