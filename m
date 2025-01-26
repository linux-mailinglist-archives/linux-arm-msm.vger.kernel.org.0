Return-Path: <linux-arm-msm+bounces-46160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD34A1CD1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE7AA1885CEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC8F1957FC;
	Sun, 26 Jan 2025 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBjIMQY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4083AD2D;
	Sun, 26 Jan 2025 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909954; cv=none; b=oeJmGp4c98JnKjZz8uPoNeb2L1UHiAsHxiaLR4MMFvPPboYEeMhfZav25mSOOb+3rKuBrUEuj1J9lkfVTXwH4S2gBauM6/RrLAXLg/mH3kMRDtCA4aUvhWz6EMifFWdXrPSLw/TLktLYbiVBDz484NEaFZjMnQO9F74hQHqlr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909954; c=relaxed/simple;
	bh=0BeLBNHDiqDawMMwDNlcnyiE/YompFIUYchYVKB0NGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=irnSoXcZWNTw0jf032uUJhofP9EIP6/OTd2sBKtEFSkdwXNr/fsDd3YY/1EFIbAiQ1rqxMU6cBIKehb/Dg/wuLKbgU9Rzr/JKs352y/b3T2XB0W3JYi/gs64s0qjUI1agNZG00qjM34TfrnbPI5ePdfDvqwwD/NCSAxdpD5t6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBjIMQY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99D4C4CEE2;
	Sun, 26 Jan 2025 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909954;
	bh=0BeLBNHDiqDawMMwDNlcnyiE/YompFIUYchYVKB0NGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBjIMQY2EX7Dk2i0woIVO+wpe/Zr/lnwXQjTbIB47lGLStiJkz1EEbGpt5TR1Oc3h
	 gILxBMx0IK3u7WMDkzt4LGXChZtW10UhLPc48N3RkTMZDi+GXSz+ybl0FQcgDT7w88
	 Fd4wrPw28iAxc5dD+6/oXcUjS5XqnTMnfbXGFAbqHeC+vsLwMhye1msaVkCWw1sfo/
	 oEEyVYmdVOT8ePJePFt/uQiBwmmYj0q+V97GR1eRRDyF7E1FnRxfyuW/nVEWeoS6rM
	 yRE0CKo2eXWeQp350bqGUaPvrMi2Bd020zfXLBNgbpPHD694OgFPd72UeJfY3gQJqM
	 kmf26wDzUUsqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 3/7] firmware: qcom: scm: smc: Handle missing SCM device
Date: Sun, 26 Jan 2025 11:45:45 -0500
Message-Id: <20250126164549.964058-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126164549.964058-1-sashal@kernel.org>
References: <20250126164549.964058-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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


