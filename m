Return-Path: <linux-arm-msm+bounces-36369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A389B5C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A5E2284327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2191DE2B6;
	Wed, 30 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWW/4oAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575411D3578;
	Wed, 30 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272176; cv=none; b=ddHh4axMpj7F0OlUvERr4VTXfADLSjiD5Bh32T114styspkxsZJ9Pm/eNVfYnPgQHOe/rIEdZgBxAu66OsAf7zOjiiPUeR1YEtKNkRFniIrEPsR2TzyuOiX0mLZBx9LrD51D+RE6IEsTl6UEVTUfW16AorimYRvLPae7QteS+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272176; c=relaxed/simple;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceFk4r3yskqixUS8bKQVKvWkvUwh9t178AT4j9CtmkE9CoxnUlqDm2WyY+rvnzE0DJRWY3wEZAoOTx9DdVWpyYF9WXQpuzOW6fGb2YTgQyXOMybAHmR6c0mT6g6y2QK30Zbzm9NoViDsX+GYKlBGDz6JtmBZBTZQvUw4GMex+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWW/4oAA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01ADFC4CEE8;
	Wed, 30 Oct 2024 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730272176;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FWW/4oAA2UhZvgA1GA4fe1q3uEA9MgG9x/VGgD8s4xO3DVmT5QhoPDbt/DWoFxjui
	 5bogBgSV1DHSeZmskpt1LFVz9wRQaL7DeAX6n9aNyL7Sbdzb2/At4SjtIqifH9BzQY
	 ABIMLzB05VZ7Z9tAK9EhjVtGsSgrLJ/gVaCEAcxij7f7a7/jeBratPitXx3h3h54hN
	 syjWvN6RIUwInxz+A5wTumrf4qayQwoe3bd96lKAEm3Y4+iePP+fgNYAPdk6FphbsY
	 RD3EwxjibWtYdIJ4Lrk8Z0dZNWc2VuHbIdsJYQgchrZL/PvDI/xRqRHw89BWsY0evy
	 RVbmDC7ThUjow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E711BD7497D;
	Wed, 30 Oct 2024 07:09:35 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 30 Oct 2024 08:09:20 +0100
Subject: [PATCH v5 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-jg-blackrock-for-upstream-v5-2-830c938437ad@oldschoolsolutions.biz>
References: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730272174; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=8pA9VSgmqgAkjVtPY7nnFqV8q/fkJiqZKAYlfJlGts0=;
 b=dMmJCbpJGbaGZRi68PPj/Vzw9vq0Ry7dNgrwzRY52GfaDqfpH3WWxi/+SvQp8vKy3V4f6twNp
 1pcOkD3DTwjD3Nt7Vd5+ox4LNdo5daHBKgETWCRlqt9Zh1bPYO+04fD
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



