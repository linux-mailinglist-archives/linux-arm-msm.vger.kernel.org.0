Return-Path: <linux-arm-msm+bounces-24662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863091C50C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D9CE1F21D90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627971CCCAC;
	Fri, 28 Jun 2024 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="VT1AtZqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495BC1B94F;
	Fri, 28 Jun 2024 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719596344; cv=none; b=beKKzF6b9qhYfbd16TWObao1uifTx0tE9fTCkj2UaRVKzNmkrTgokbt2r48eHk5CrZULefcqOZkn/Q8W86i/NtQUdpuLU8Ar8CvSOi3Lj65WKcZNR/aNQzH6cBXqYBwRIE6qjO4roQGdSPOoFQu24lURxCaHkOCwsxdnwkqlQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719596344; c=relaxed/simple;
	bh=BK09IPXEmALm8Gdo89s3fQ9e2NwgJoDJ3gLuk1S/nic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QvH67ISuL3lSiolYlxv2XSJbRqmR7SMMtoKVsCvmqfZefWxGalP+B8z66o10hcH47hoW1m6u4jgdL866GTRuhl2kGuw3ASV818/x2cbEswkE+/LXGuob/YNXm74bq7zw44l5rso6xkiuHgGLy6uuH1SwycR7ltMSXN9cnBN5FLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=VT1AtZqs; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1719595832; bh=BK09IPXEmALm8Gdo89s3fQ9e2NwgJoDJ3gLuk1S/nic=;
	h=From:Date:Subject:To:Cc;
	b=VT1AtZqs98/uwP3P/YU+QlUlrx2apHg/XRtP93isHjKOssLUdW2wv/AylrG8s0qDo
	 ng00yWuMFzNCor7IWpr42mf2i5Yhmp7pukkOIq1w3S8I81Ch3qyBRwdVThG1fiA2DN
	 yhYNGfZrvCdOagURC7HXXd5YzGvw6gqr2JIxwdAs=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Fri, 28 Jun 2024 19:30:23 +0200
Subject: [PATCH] soc: qcom: smsm: Add missing mailbox dependency to Kconfig
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-smsm-kconfig-v1-1-117d5af4ba1f@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAC7zfmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3eLc4lzd7OT8vLTMdF2zRANDcwtjE3OjNAMloJaCotS0zAqwcdG
 xtbUAekLAmV4AAAA=
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=BK09IPXEmALm8Gdo89s3fQ9e2NwgJoDJ3gLuk1S/nic=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmfvM3tko9blewzgTgzwAB70K9tcux67YW7REKU
 PsY/V5ShRGJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZn7zNwAKCRBy2EO4nU3X
 VieMD/9au88RKFA4PK6YLlLbYdyrPrBvMGbLvmKLtcckx5TS22ylMYJmWaMo4KgZ8uus5uv/WfO
 tmq+HgRkj379eqOWElufsHZs6AIXEzacyYhgux6ZgQW00dQUvcCa1jKEUIKlyARu7Ed8QB0yxTR
 MEDogu7pK8U4a/s5+6v1bd/qnRb1Ay/91DNUbOeH7L2UOTz5vxCzOPKgR1WwC8leNGce5jBPj7O
 DWpr62ht0sxuejANoelemC+Mx3bJkyD3Nl23lwkZF3kKdocwolPcp4r/vym8vYTJuHILl/jSH8U
 pu+uTbAIG+czpMyVeBOr99IPqFR0jD7NZ8veB9rlSLLvkjBaR44Z9FHbuZ8EVojf/DVRrPL4rrx
 S/LwmRqO7u/BoKGedzDsNiU3eyW/YROUjV8pnaOTIv6GKAAAjIjEpM4D/fud8MqvTgDazsPDGiR
 YiZEMA3gMQvWsbjXLwgXS61qDV2j1iIyUuuoHw3DvqUm5I4J66Xs9XzZlR63uBjIXnVZrjRizhH
 mLNSQ1vA4ObpwGpwHmybrnesp6mtAe0UtV1gAU8QwjM0YO4it5HsiFbPj2gOzgHqa7fpn1oJfCY
 a7iMrsASR+yKu4L9y2WWM0tpTmHfnDWsJjeE2pW3k2KqeDcnuc6LmIVNB1w/pUWdMue5wxYgDgY
 yZTz5kqoWem1HMw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Since the smsm driver got the ability to interact with the mailbox using
the mailbox subsystem and not just syscon, we need to add the dependency
to kconfig as well to avoid compile errors.

Fixes: 75287992f58a ("soc: qcom: smsm: Support using mailbox interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406180006.Z397C67h-lkp@intel.com/
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 5af33b0e3470..60efecd16380 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -194,6 +194,7 @@ config QCOM_SMP2P
 
 config QCOM_SMSM
 	tristate "Qualcomm Shared Memory State Machine"
+	depends on MAILBOX
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN

---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240628-smsm-kconfig-6a01783472f0

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


