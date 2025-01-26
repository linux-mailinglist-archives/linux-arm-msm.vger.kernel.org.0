Return-Path: <linux-arm-msm+bounces-46157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E4A1CD04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5601885B6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C24E17E00E;
	Sun, 26 Jan 2025 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK7933kQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BDD17C21B;
	Sun, 26 Jan 2025 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909929; cv=none; b=eF5J0qsWC5H7dxmTKPUIbzQuVWz4b5Q1AbCvb5pfnYrEti1WazniGXvIC05zz9k3fIel1hg4Pf0PTlFZj94DZItDIYNNtEOOpbQMMT3l4Ma0L6+Obwl4lcIUTbxJx7tYSRo71z2K0DM1D4NFbzPsVwDeknNB/O+kj6dXZqZsZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909929; c=relaxed/simple;
	bh=0BeLBNHDiqDawMMwDNlcnyiE/YompFIUYchYVKB0NGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h66E+n9eVhN+3M+CmuLBd2LYicJ43ZoomgdybhILVN1MN/vBs0R21UYzBRlrMCrT3dyyaQ2mpfOMOMy5Upd+AyssreO/2q4jKwdLa8tJMhGEdPFNraylgITG3Ao5OpUEzlJYVeOfw8/8sEDcOgumA4oGJm+UYYKakJ3KCxFzuaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DK7933kQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A77C4CEE2;
	Sun, 26 Jan 2025 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909928;
	bh=0BeLBNHDiqDawMMwDNlcnyiE/YompFIUYchYVKB0NGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DK7933kQ9Ou70xe0KtV0s4T00GDJXRt4cFeszaRWdY6tCH6IMzGDkhDxNdVCJCwJY
	 x9Bmq721zC+L0OE9uycVjh89UQBlZeWrOYPfEXgz/WkwFFTsdWFrwzgEBtbjmiJtgn
	 iqyM3Y4qLca9fOvv9SMDLcArie2edWZIFsv7mG1CY7iUPA1vxl1QPfH3OAPDIBjoUk
	 G1QUby5gitq6yUrnlzBrJoUrK0f0CG8aTO2q3kzIHREj127Wtb1AkGPtYyVO4jscUL
	 pPZzERqaCziCUATXDe1iovPCDD32ZIXELwxg/MO0xTqpv4mj+Q50Z5OMUZU6deNsSL
	 AfvB9zUGbDs+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 3/8] firmware: qcom: scm: smc: Handle missing SCM device
Date: Sun, 26 Jan 2025 11:45:18 -0500
Message-Id: <20250126164523.963930-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126164523.963930-1-sashal@kernel.org>
References: <20250126164523.963930-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 94f48ecf0a538019ca2025e0b0da391f8e7cc58c ]

Commit ca61d6836e6f ("firmware: qcom: scm: fix a NULL-pointer
dereference") makes it explicit that qcom_scm_get_tzmem_pool() can
return NULL, therefore its users should handle this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Link: https://lore.kernel.org/r/20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-5-9061013c8d92@linaro.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 2b4c2826f5725..3f10b23ec941b 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -173,6 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
+		if (!mempool)
+			return -EINVAL;
+
 		args_virt = qcom_tzmem_alloc(mempool,
 					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
 					     flag);
-- 
2.39.5


