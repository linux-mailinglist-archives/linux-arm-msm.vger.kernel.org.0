Return-Path: <linux-arm-msm+bounces-58171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC4AB961A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 08:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104481B65D3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 06:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23334224B13;
	Fri, 16 May 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tH3j/LKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC68C42A9B;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377797; cv=none; b=jzpVMz0LaGCew0MQmXyuw92Azb8++tbxoSASVE3XAcP4gU0KysgatPqEKuboZ2hrtsNlkyPS2PycXtMiO3S/9u5XuTblS/9nTVT450Fod7Nk4/VEeGJAtKdkuYG5z/xocsWtUwNBvJrAEqCwOxTCOAVL65H/GktshUIfCsxBTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377797; c=relaxed/simple;
	bh=nRgzOOCuIPHGX0gadXiMJ/Ch0afEnXVbOaCIFDyeXCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5DRYsjPHoYMWmK+MyJw/vTCYxNE/r33IIDiV7By7qM5sOlER8y5RCbYRNuYiVr0ED7fEo7rfWLr0+u1MhH9EQknZdk+7SzgHcRcnZIuMW0WR/5mGA6BP6f36TeAgmDL8q1x5l2zXCvxOkt6s36HmB2hjJD0+to8h7rAOel9VwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tH3j/LKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 612C0C4CEED;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747377796;
	bh=nRgzOOCuIPHGX0gadXiMJ/Ch0afEnXVbOaCIFDyeXCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tH3j/LKWHOZuMfGNkXsk6+V9Rsr2TQHVSSAucrjGkG4TSjUJBm1/r6QD/Wav/bWpO
	 aEln7ZCzcv6rM1PVeowKNh9FUxS8S5U9fS97ove6stZuUyucYxFsKTALF6GePA0dvl
	 sMmweUvivehk7cbLPt6plVvh8MyEW8c4CPbOPG2hezgsco7R0kUvyNNSYJAe+1e5bs
	 74DRNR9fAV2C8Ne/LOe8EYOvycvYM0RTXEo4DJ53B/zUmnM1Z2Vo2Z3Kt1dmEPzNGc
	 ZDILy4F+gOznHuaRbVvRALX5bOBr+TGvrRGPF0D0DIghSqXSBKNCF2yYM/eVvPwE9d
	 ktcJtnZRGlNRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5050EC3ABD8;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 16 May 2025 08:43:00 +0200
Subject: [PATCH v2 2/4] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-tb16-dt-v2-2-7c4996d58ed6@oldschoolsolutions.biz>
References: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
In-Reply-To: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747377794; l=871;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=SqyOjM4lFCEsz5Ib0lcU303VTifLpUJsBJ9F9U5GZRI=;
 b=LSBskCbhnBnbN47ZFiZAB5dGmIVdTiSZtujGvvo6I7siwvxScHDybhxM1Us+yWqCV2ZBF+sIw
 MqeS7EZ1XqdCNgfr6l9LKPPXO/GaKo5B6D8OavuyPjJuj2tjQ5Y4j8E
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Allow particular machine accessing eg. efivars.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..171cc2a6502463e3445919ef77a129563ea233a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1993,6 +1993,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },

-- 
2.48.1



