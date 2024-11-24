Return-Path: <linux-arm-msm+bounces-38966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CB9D71F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9302BB22EE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1384C1EABC1;
	Sun, 24 Nov 2024 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMAPkUDO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3051EABBB;
	Sun, 24 Nov 2024 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452627; cv=none; b=PNCPLQ2C/PwdlZB8V9X8u2kG3KbO9V5/fRCyJet+E5ATSZlk5mO6+zS25ssFVE0pL85NvqefuKtAkbAUYo+c/ZYfD3i06+57L8Q+CDkWSLJpQ/+4kn+oBjT95kP6Qw5dwPPDaeP/Igrjxi6d44CdADjq33JD1whUQwk6nXmjKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452627; c=relaxed/simple;
	bh=Mgl0pv4w/Zt+hk3qCZ5r+Yk0YiqJZ2n9zCwPmYiaGYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMR1BnyTpGAjW/4yZhojpsqfdQWXTFaaTeqM8YvvEb1MyOCeTrh19XAdnUz85Rf2O+5jb6rJ4k02vCKvXxdqGwYkArhC2N/kxcWwvAPDuU+kp8V0zN0AuAYfvHEe9sRxX8tzE6lboQKSoIDSxl65VsrbcpGYNtqp4GUkxqjsl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMAPkUDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7BEC4CECC;
	Sun, 24 Nov 2024 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452626;
	bh=Mgl0pv4w/Zt+hk3qCZ5r+Yk0YiqJZ2n9zCwPmYiaGYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BMAPkUDOgyemgNiNe3/xqdkkdH336vlT89NNeiGrgtiCr4zAeg1/CcLZ2Js5kgau9
	 akjC5m65/LoX/4Ih0aZiImo/IoVa38W+KPeMRtD/04s0TJbF+WldjaFjdbNulKJsRM
	 AjRy5JrBiFq3A0JBOmMTKNL/VgX2UgGJQKUE2E67sQRSbsE8deKeCmCIAFoKncgsoe
	 CscvIVSQgToI/DEk7DFPKvstS3g/e10aMskFCcJd1+CX5Y36mNC8duHX/DFfNnuwMr
	 XPXWCjuZhNFqx5o8SYnid8ARJ8kepAuhp4DTEz0IQow0PnP5ld4qb0MF7++7eX/6R5
	 6xsNkmxKFaGXg==
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
Subject: [PATCH AUTOSEL 6.12 16/23] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
Date: Sun, 24 Nov 2024 07:48:27 -0500
Message-ID: <20241124124919.3338752-16-sashal@kernel.org>
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
index f019e0b787cb7..14afd68664a91 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1742,6 +1742,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.43.0


