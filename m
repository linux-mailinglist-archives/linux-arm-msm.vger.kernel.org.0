Return-Path: <linux-arm-msm+bounces-55189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C35A998E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82081920EF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 19:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2915129A3D5;
	Wed, 23 Apr 2025 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyjGsfeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4847298CD2;
	Wed, 23 Apr 2025 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437368; cv=none; b=GXPLkh+c2LT8P5HZAZJ1QiSApszoPBq5vvGUu+/5i+EkUaGaBKnSJX2ArnDO+Kk28sqcwdOuTc142GDhYCpWfyUybnsh3uEjnZQeOvINoUJrA0nvnhPibKEBpmrtffUU/4Ojp/wSb1VdAnwH/yI54c0isOQt34AIdPe4b6p+FyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437368; c=relaxed/simple;
	bh=F3azllxUB00Zjj+oyESkLHmmdJpPPIUF3Md9fl4CSXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnO093/b98wuk452uIePO+0ZV1NmJYmPgknRfPotZ4cYHDBdWzBlEOAZDovP5m7tOzNnlqhebhY3y16v9Eiga0zWbM2PCnYa/kUJ/ttxkmFQ1WPukD+mAf77f4c5gH+GDSiT6n1+S6CfIPyS1F3d8jE+IVF8Yu8ZEokhks6yvRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyjGsfeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400B0C4CEE8;
	Wed, 23 Apr 2025 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437367;
	bh=F3azllxUB00Zjj+oyESkLHmmdJpPPIUF3Md9fl4CSXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qyjGsfeKW2GqcFpbWB3Kb7mvyy2Xoq+aQoDh1c/CoCcOoFyHg28t1qqkV0fIPJCkH
	 4OUZ6PRJoqEgjXGexarz0xJp7gH73jzW4MhyuWTN89MBqcBul7aqBEa3pSsZwfBGIM
	 +HcPAhQVvU3iYoVDTo4bVvwNjY9dsBEcSppmkUBTA/zD48tTfHCjdOxDh3faN8Pu+H
	 7SZ8MFljQ0ztYHcPBYFW5zKWJ5rhQh5b5aSyGJAPacb1vt0bbfu9VUWeaVn9ENoE25
	 ZoZUWC5DLuCnZ49Vi9akP16BmfWUWfTqrfZPBUSr8cvm5n2x1C7QSTmTZTWlQbcQfs
	 RlVvMmkZSPanw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:15 -0500
Subject: [PATCH v2 3/4] devres: Export devm_ioremap_resource_wc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev

devm_ioremap_resource_wc() is not exported, so add one.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - New patch
---
 lib/devres.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/devres.c b/lib/devres.c
index 73901160197e..378b07730420 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -206,6 +206,7 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
 {
 	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_WC);
 }
+EXPORT_SYMBOL(devm_ioremap_resource_wc);
 
 /*
  * devm_of_iomap - Requests a resource and maps the memory mapped IO

-- 
2.47.2


