Return-Path: <linux-arm-msm+bounces-37196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE609BFE50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 07:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C95F11F228A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 06:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EA7194A64;
	Thu,  7 Nov 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjgSSvAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6161193416;
	Thu,  7 Nov 2024 06:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730960210; cv=none; b=u5Z6EJRX+ZIX5szNhxbihCfycktE8BQDWBlTXU5AX//eFIlOVkTIjUhO+fiF5QqVH//AJ9bo59CllaPRneKPVI14oN94PMYqZFRnMMygyOLvRM+talnT7uiL8hERU9VsJggRFsd5MJ2j9TNMNZmcOdcZshWKegTzuMykRUBIIz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730960210; c=relaxed/simple;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXrVauoxO9v8FbJ+OXcJKuM9QAwVqO80/w5Rlo9FH/G7h5Z+qK/+5vwgp/QvUl3AEORhfWXqnQ0H3U0BMKofaw6zrUlHkF9Lp/f9CzaQU0tNfoh6zbDmROLFHM7UGp+D38XaIAIksxSccm5HVxZqvn8+bzuasYHqZj2xrWPNRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjgSSvAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78E23C4CED5;
	Thu,  7 Nov 2024 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730960210;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sjgSSvAbWkJBxxEfqqO3fuQH3Z1wBmXoqQAn3JgDBwju6n4ppdPBCin1wxkC4bvJ3
	 Nvkp26yJ8oNRpuEsxoMy/9efd/jqs8cgTrgwy8vU6O/pIkiPqSevgzKO5ZFxIb/ucs
	 q0UY4R8f5dWRahwcmqRN0N02h5L8YHcKveQlqTGn2nreCUfDDJNQgDDiOjUADwyjkB
	 fD0D3Br9CZZHv6td0kX4KCYvG4nhd7G2StgJyRgSaZGXlI5+TJ+OgVZqhs5dzUEyKT
	 G5+QxRDhE0ASwLmENvf3Xrkc08ppB5+27M8zuNTgKCS480NmE08Ft6ykvRsQhLOSGb
	 bLbihSylXZvaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687CED5AE66;
	Thu,  7 Nov 2024 06:16:50 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 07 Nov 2024 07:16:48 +0100
Subject: [PATCH v8 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-jg-blackrock-for-upstream-v8-2-0305621f17f2@oldschoolsolutions.biz>
References: <20241107-jg-blackrock-for-upstream-v8-0-0305621f17f2@oldschoolsolutions.biz>
In-Reply-To: <20241107-jg-blackrock-for-upstream-v8-0-0305621f17f2@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 xlazom00@gmail.com, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730960208; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=8pA9VSgmqgAkjVtPY7nnFqV8q/fkJiqZKAYlfJlGts0=;
 b=QZYUbtUyVjB8kW82KfyjGfV69iOAJmysyOrx4w4tuTZEJrB6mm0skNDXDo9U8sOQ5gMLD2om+
 tyk+LKarrwXAFW+knMX1h/oINtB09zlaYMeguYwJbUqnAPVP6ES3gV7
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



