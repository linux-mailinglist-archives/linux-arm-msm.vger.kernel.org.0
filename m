Return-Path: <linux-arm-msm+bounces-59184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E0AC1EF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0DD13BF388
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B5A1AAA29;
	Fri, 23 May 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6Xq3bOy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5438130A73;
	Fri, 23 May 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990426; cv=none; b=exFCsaTlQk8A+RW4Zt0EcAu3V0aKbMh3Ck36lRKSm3D2GYSl7Ci4Tr9Uy0nadcf96NxMy+NgrJw+bRJbtPUn7bPTRDG/MZVNY1lzry0cFvx0A6IrQXa+CPP5rXjLPgJixcuiMfT4cy1uOVP4vBfyWzF3RHJDurXGXoubptI1d9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990426; c=relaxed/simple;
	bh=mm0bfmyufwtJrc6Y3eLB7UAy7Ut/F17CNbAk/Gc9S9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNmD+BSGnCRHZid3Nxp1xs+Kgnw5qDaUS2B6jxcjMzBdzL1tZDGnFttyUv1FCaHXTe6Hgu5tt5sIqVihVp8Zc7Uu1q7IA+x+H/iPhhClswF+1UOSWWKvRh3asMG6tLsQJl05cjWhwl44DKaHyygzuOANbItZT/IzmpoN8QigEEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6Xq3bOy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93434C4CEE9;
	Fri, 23 May 2025 08:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990426;
	bh=mm0bfmyufwtJrc6Y3eLB7UAy7Ut/F17CNbAk/Gc9S9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=J6Xq3bOyicknAHviQXeCLQXUDbfPG5x8aI+DdrXBgN7F3vl5IBmCMi3eA3BI02OmC
	 GzxgeTE9s8iGnS8juGNLWgCJfjza04cZo2wvwSNXwoBuQiptRrsL6qFkc8Pb+vk70L
	 onX6vSKjOYyt5IAGO0EZO7qV/HivSfIIFQilrh0mMM5EikSByFBqnaviAewztYcj/K
	 IhxINwKTASLlAxxArXpp/c4zQPUr7LfWliQ593JsQuDNKwOgQ7n46Gl/kIQj+NMzr7
	 qpjXElTyTfISMEC0djROjHHN4W+ZKSleR0oc8gMdNuW5f7GViYGZyDObatADjA2YJ/
	 4fuDw9e3fiphA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO9w-000000002z7-2hrE;
	Fri, 23 May 2025 10:53:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] soundwire: qcom: demote probe registration printk
Date: Fri, 23 May 2025 10:53:17 +0200
Message-ID: <20250523085317.11439-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver should generally by quiet on successful probe.

Demote the Qualcomm controller registration info message to debug level
to make boot logs a little less noisy:

qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soundwire/qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 295a46dc2be7..3265c39e6b51 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1648,9 +1648,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_master_add;
 
-	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
-		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
-		 ctrl->version & 0xffff);
+	dev_dbg(dev, "Qualcomm Soundwire controller v%x.%x.%x registered\n",
+		(ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
+		ctrl->version & 0xffff);
 
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
-- 
2.49.0


