Return-Path: <linux-arm-msm+bounces-34209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0B99B943
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 13:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6712D1F21813
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 11:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85FE13E043;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNnfLr0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1A13C661;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728820458; cv=none; b=X7jv+rC/5yY/HKcnUv3Acn5mN+vLbNgYjLx30TkbE6zRo5XiWY2/qFQ12rxp9I0GP5yf44EkY8KBICjkZqLv7tuhtyWG6xo2J0WsRydG+IYdTPNnlmZPryJuWRtZdR8hlQpfWMRJ/a/w0itEorOUaOIlvb/WQcHin7g7ezwaXf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728820458; c=relaxed/simple;
	bh=EK/TGOxD1PsSnQ1ZgrcrUW6J2r5ZzT28tz2uK/vk52E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GChyCGxTQNFxW93wG6KrKSQnkyOFprkEfgbob3bFiXK3JvyxM3TQwXsvAK1Fa5kXIeHVVsNoAGQQpDrcFLHIFLz6jvKdU4BUlEtdvzCZH44uTzH/luPH5nOJ5G7gG+XXjOKlxAWup5A3aivks2H6GqhXakQaI61VfsJ7n+SutyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNnfLr0w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09E6FC4CECE;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728820458;
	bh=EK/TGOxD1PsSnQ1ZgrcrUW6J2r5ZzT28tz2uK/vk52E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iNnfLr0wjVHh4G4gB2uDiXiS9VpOgmaGNg1qF4hV8vsGn7hEj4SQ6HKGf0r7+yB9U
	 jr1Rpjurej8TI285FRpkSKwyezjXcKBCHnJW2qEzWus64L2Rx/+zT52Tzr1XXlnvOl
	 /2/cEcrl3a1/bB282lTEBYauZR2T1hxPSaHPCIY6bcNalR/SVvsQTQdNM+Js6akgUr
	 t481DPufTYddi+sOt+ZqzGdi40MyvBCqFIEmnNl3FnLRmprYkZjp1v0SwdcvVEEtLm
	 avOSAboVCQTWFKbLPnTJ66e8y+QUfmYk47RsEp67lcN+qEFDD7xGdy8MLnOHhkXXZc
	 XVBMKEelSpRhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00ADCF2591;
	Sun, 13 Oct 2024 11:54:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 13 Oct 2024 13:54:04 +0200
Subject: [PATCH v3 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-jg-blackrock-for-upstream-v3-2-839d3483a8e7@oldschoolsolutions.biz>
References: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
In-Reply-To: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728820456; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=01PvXXK7gB43rwXvTNPNUoS1yfe6XHhWKGe+TIBgjfI=;
 b=OJDuL8wn4tN/ew0ihSLsAaIaDx3NLa4Je2gTRfJbxGHMHrJwFOVvoTh7JRqCG+u9lclooEE5v
 e9xSPhR4L5kBJxP8zhXIdKXs32EnLLjeQgcXScej9eYjzYSE30dQCh9
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
index ebb58bd63edad..e98390e17b217 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1736,6 +1736,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
+	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.43.0



