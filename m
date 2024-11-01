Return-Path: <linux-arm-msm+bounces-36790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612DB9B976C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 19:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA250B20EF4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5945E1CEAA6;
	Fri,  1 Nov 2024 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNM+Nyad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1CF1CDA1E;
	Fri,  1 Nov 2024 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485564; cv=none; b=mjlqIymU/bUUohkp/5mVUU8yzPKiFsMSu39y2Qg4KmwCgN9WkQANYgDq4FRkAAO/v1R28jbWko4w8G1ovntBSOzXCxaDlROjJouQK0pP7d+h9ucsUQ6nVXbmjQyddXyeFVYkeU254jE1TaebejXCheEoWWayWy3K7rx71gKkO18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485564; c=relaxed/simple;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OL8+Z+ZDHLBUB7EtyydW3vb6rBoCS06h4PF+i03WRbEmf2k2zUw0NCMp5FmIT+9XEVEH/G1zHPIzIvUSv2y2NYySfxJ8DRyOoGQAcO16fJwsT3CkzR3tFxRG/hYBlIp9WvvnsUJVijDA1u1QFz9+dm1joa2cN98exp/kG534PVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNM+Nyad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D429DC4CED3;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730485563;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hNM+NyadOSjlNTIbWJuyurBA6+J4p1a377HgcH5wvoiMVBsriywj9vPuF9jaqeW7W
	 S0pyDy2dBBWPJBKwNunNSPOfV4Bd8HUKjPJacUlJQveYepPlAgDO9wn5Lv0AIu31Nw
	 xGJFz2JfKp0lPcruMmt1MXd08UZ7ouJZzvNKG7jGpCdo1YbyQme4Hka25KCv3fhU6x
	 nUwALu2FbsLU20hfXJHXPG0DkdisXv3x8UmTjkzz0cGPD8s7qesl+MT+HTdtdxd7wK
	 8umOmiXTwHskwS1LYY1XNsP3coqkFrzgXotnnqgaYthV4zXnv99mP0VODVMMm0aOrU
	 +jRlYnuSbkpMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5589E6F07D;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 01 Nov 2024 19:26:02 +0100
Subject: [PATCH v7 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-jg-blackrock-for-upstream-v7-2-8295e9f545d9@oldschoolsolutions.biz>
References: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
In-Reply-To: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730485562; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=8pA9VSgmqgAkjVtPY7nnFqV8q/fkJiqZKAYlfJlGts0=;
 b=Q0WxgotiCtIX0EWuzae4U3ZqDWfCBlaNLCJOACtwS9THtLVUXnPdnLjs6RHreRoZV3WH4mVqD
 yiohidIlrZzBArfeCO3vzTdEZWVZDycKO8ywA5X1V5nBTRy//OVfwsi
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



