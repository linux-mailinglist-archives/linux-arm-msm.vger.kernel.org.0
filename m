Return-Path: <linux-arm-msm+bounces-39944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82C9E0D7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 22:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D43BCB295DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F290E1DED40;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQfniddA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D021D63CA;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169589; cv=none; b=fnNnqzBpyGdUNwmyAbk05pxi5hrV2pAYy0zsI8Zr/Pp0PQZtCpPwbc1TA7APPLH4QqYLvEEsJwqNYeqhjywJ5p/YTSsaj0J9+EXlhVviLpeopVAyc+DGmwqKe3l5cVUGpC78Q1QBvCiHXPXyaX7fgcrSlaXfjUcBSCB/0jeIYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169589; c=relaxed/simple;
	bh=c83gLcAqjf8TQGAjIo9T7GBoyRViZ4YLSRSevQSiLSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m31lV0K/ESpmAncDS6uVz/6Y0Vmn7P3nzff6F5yp38IOVUCT2Fl+TMkOd6x1YATOt3cwHvtBLiV2CuMeWdDfq0vT7kG/bleoBTKJHKvG+h9tuTxPHuI7YhxhSeW3wc9E39zAZKeLft3PjoMGy2advY6qPGpFguJTOW9JiVn9VHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQfniddA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69DC2C4CED9;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733169589;
	bh=c83gLcAqjf8TQGAjIo9T7GBoyRViZ4YLSRSevQSiLSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PQfniddAF8+XcO90FGf2Te98dKJQESBCec1HE7Rj7eWWyOIInktB0nUR8/RvbUZ1J
	 wiYMhhMYNypOOQXXhOtC5GYYTgG4gh59Bc+yjsK462JufwjB5BdiKZqoNAPD1EP0nI
	 INbBUHRDNCmhNMFceqTlP1WYdbnBC2XHri4fkoCRRNnZ8dRPDSix5kEQvTj11pjSm5
	 8vXC1/AYAiQyrr+jZ2+xNYIJd9/SCqh5vPWkT+J/cimPjiMkItfUJbwVNQBsh+3N3T
	 xYLc+DLWJpTVcNryTNwcx74PJla7HNljWeguH/JV8SwOVOvmEZAZR1vUEy9M6PI5KN
	 LaOz5nxnlaSPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DF0E69E90;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 02 Dec 2024 20:59:46 +0100
Subject: [PATCH v9 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-jg-blackrock-for-upstream-v9-2-385bb46ca122@oldschoolsolutions.biz>
References: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
In-Reply-To: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 xlazom00@gmail.com, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733169587; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=SPEO1LR4rPbgAYook8a7vfGRX+RKcgosJIhhsVSzbHY=;
 b=HRBdgbw8S35D9PXLsDv1bkVCSENcOPtBkheB2NxYSq+p+ymtyPMorZKB4MMsTYF4tbX5TfOcD
 CsVrVRArYJWD6jv+JHp2CW/WwTMGU2+1yMmMXTYA0XLjy27fHu/9cHI
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
index 72bf87ddcd969..bd660618fb365 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1774,6 +1774,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
+	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.43.0



