Return-Path: <linux-arm-msm+bounces-36409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBE9B60FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 824C31C208FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B5E1E492D;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHz1qaOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC01E47B9;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286148; cv=none; b=pXUSH6eg9K1/s48NMn6Z+9Ipiw74A71FGrQgLMhnuNfBKo8lw+TmJM49OBK3jyi5Y6s2Kx6CPihbxQm2ugxlRjw7Z+ubtsNlFITc6IHfd+P1pOeSGictMa07uejTWS608KgjUDW1UZ9b3FijRmBTUH7ew8a95qznGdLdS564hEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286148; c=relaxed/simple;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOnY2iAy11Vqx+eS85y24AeHHq+7cRpVEamuThXXB5qQfaN4N5+33Vtc2rcxWcnVw8A3sSNbhema3vJzTcA6j6y3IvjRTi7eX5Oa1ZWFNtv7uGkT4XYByRYvYFxSLYxuwc5sRc08J4i779mnYF6cU4yFRvWXLFq9YzZx+XkWwdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHz1qaOI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 483DDC4CEE4;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730286148;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AHz1qaOIp76xedSAMP595Br6mVZ9CcHfKY0uxhtkQ9t1obH/o1RsFJV0LAPiZSOmp
	 Am27Sc/qt2/6USI4O2xLwfBOZeVXk/p72yRcOKSGVF5rcin7iddSBfCgZrsbFXpYPZ
	 f81/Y4MxKJZIiljk3hX1Ijw/LFa8rvfMhkAkrfgeK/P4w7dB480ko2eGWuZuXAJmbZ
	 mq2jJ5sPXlJlyCyI8acsIPm1E03DwAwSiK3r5iGM/2AIsDsVDHoQhgetDlPLQ+jGHl
	 DFwwaLS1JY/aJ81hp9MxPm0bhKjngGHVVNIcJer7/KCIqly8XBJp5DW9zDCbRn7adV
	 8SiJ/nFrKMQ/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36976D5CC95;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 30 Oct 2024 12:02:02 +0100
Subject: [PATCH v6 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-jg-blackrock-for-upstream-v6-2-7cd7f7d8d97c@oldschoolsolutions.biz>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730286146; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=8pA9VSgmqgAkjVtPY7nnFqV8q/fkJiqZKAYlfJlGts0=;
 b=PseP+BvxRIM816gbwVIjTMMKRdQQ45/6cfyFEIJNq3HtGdfxFfZzShxpIJff2SY7woDUZfAO3
 Hs4LxApe21RBmaAlfUfXx5U+FbZ+dIck3tRUhts9mPOIX3edtJ5CrjE
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

add "microsoft,blackrock" as compatible device for QSEECOM

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 4785386042252..f1b10c89b9638 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1748,6 +1748,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
+	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.43.0



