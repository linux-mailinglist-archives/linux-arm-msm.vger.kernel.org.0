Return-Path: <linux-arm-msm+bounces-58146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792FAB90DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B1D2A054D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE2C29B788;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/u5STCQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE8289800;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341544; cv=none; b=EteG87VwloAEYLZC9rTXr6KXX+vwOauR+h+uk3SfSNnn5jtGtEzuUngOSA6zmrMiBgUImpkDZH5WP7TtgXYK50JQ0SZKnVTU7oCbA8dGzy314jytjqsZ+AwC179L8hfOUnNiq7r8SbNMWcnkyBV+xpZ7zhsr1O5TpVD558l8nzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341544; c=relaxed/simple;
	bh=7NYXxqUPC+8FJ33c9Hn8TrIB+g/kFzQtpqlZtADgg8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1yNCzIQlT5iWYFGjxxzD5+N6UfoPjNNU6uldj1Tfh8Sn3Zo4oWI5uP77Vfgektemf3BGBLi/nYWdXoWXHR2HEGlGN3+dSK0KSSwVORUyZQohmMCf7omRlZ01Wfl3Z2h54t3TaYMItHRnfb6BxeOqQjRs6GPJ8f/vaFMZjENNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/u5STCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D848FC4CEED;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747341543;
	bh=7NYXxqUPC+8FJ33c9Hn8TrIB+g/kFzQtpqlZtADgg8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s/u5STCQaZb4AZPCraM8nyKkFcuB6eIePAeZvT4OiIwSX65mxYHdGKtm+TWD7uspe
	 6JY/jwoiOToRUWZyj5TOoQgjMlWobJxgghJk8Lftsd9HQzqhGGrqxLl4sAgChXYVhz
	 jPeFXOu360kahaQ0Hv+fAa/8DMRI2zdS3I9NlEdddP/epIq/nj7YaGOjEEQ4flPPTg
	 g7DTwjufAymINao77rZ1SZu6tedMKOkyuHnzTIi3lJvlCTNFlz1/i+pvjguozuJIAs
	 YGWiebLPgDl64fYDkQGJBWGEDnYJgEpLrWboj5zExuKNriaN+CztEJV3PpiPhNUxQp
	 gqPozU4MKuUmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E3BC3DA6D;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 15 May 2025 22:38:56 +0200
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook
 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-tb16-dt-v1-2-dc5846a25c48@oldschoolsolutions.biz>
References: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
In-Reply-To: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747341542; l=871;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=qMpKHjKO2hgJNmWBGCeb19wutfZa9oDXfI5A36FWyC8=;
 b=Kp1JZHczaR5mGFiByniqRukArQ+9q93CRzeo3/5kc6PxT9UKtm+QCcTtBP3war5I9p2nZtRjZ
 f6FcZ136VuhCWP3kWwGnMItyDgvHC1HuRiJzhmf9EZuMpCJtRQxL7c5
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
index 79128d11eb51f0efca71396338f7e7c8c913e457..ab63a04b044c42ff779588c11bd736a98735cc9e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1992,6 +1992,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },

-- 
2.48.1



