Return-Path: <linux-arm-msm+bounces-49946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A820A4B316
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 17:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED523A64F1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 16:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DF51E9B26;
	Sun,  2 Mar 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FHv+LKRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B13594F
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Mar 2025 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932583; cv=none; b=GxCDxgC5kIExs1dIZP3s9BOf7Jo3xL5bJqSC0hFcmcBRpqA2CxxjecPGi9+RUIxjV//tmsqkbeB6cOCp4lSLyZ9yhVYgkbh3rSiwWiUzj8Dr13LRpt2TEzC7QWHlbYDyNaTkXSkjWsEgRTQvPkoK2AuXcAP1Xi1M9KhwIwstsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932583; c=relaxed/simple;
	bh=IjiqYfOaFT/5bcZk8bWzCldlSR2W+8zYw0RxG3snBeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tg8gC8+/54cZ00d5OThYrP8fOwpWxVxGSP97KcudE2kNdP4DaJsyADjhaNdDV3lsp/1Z9oAPoM9h3UGLK4jNsE1zxFlsjL+hJN3wvG/gX5rgYQ9Ukuxh90+MDk8w560qB1hA8GHFwOiWHM+BSmDBrP1smSMEvnuWxwCrUHgIDhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FHv+LKRi; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id om4YtTJnYVX8Kom4btOvoD; Sun, 02 Mar 2025 17:21:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740932510;
	bh=iipt5Yn3YiPOXNMgfxQ8YWRnO9V/lrPEOyeJI1wMlbY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FHv+LKRiGR6lZ+NPxG9FsMoGQDc4hl+YDqaTSvO5ym240lMZXEu4ax7mz5cGl7FIC
	 UC40eL+bsSFicmSFH/DxOtIkjdPktO/02UssrVWWlgt7fb0N+rVKib1BXMKFrVRC/n
	 CTLwl1P3pRCMY52ndBh/TgcbFtjfObZUHZlxz9ft7/se4NPyDiJmp51QfsBPuTIrZQ
	 OkET8rq2EMnNjZWDjXVEXXJy6k9WX9ELhZRVvy6IAb+Mct2mc2Ovhao1MAZZGh8Ad9
	 Wtt0NLoKKPlZdtBGokikHSZRBbC2bKC4ppAk3Q+17p98n7puYLhvmug4OQvBnJ6WlC
	 6wS+NiJxWDrrg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 17:21:50 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andersson@kernel.org,
	Michael.Srba@seznam.cz,
	konradybcio@kernel.org,
	jeffrey.l.hugo@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] bus: qcom-ssc-block-bus:  Fix some error handling paths
Date: Sun,  2 Mar 2025 17:21:33 +0100
Message-ID: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 should be straight forward. It removes some ioumap() from
resources allocated with devm_ioremap_resource().

Patch 2 is more speculative. It releases some resources in the error
handling path of the probe, as done in the .remove() function.


Finally, the .remove() function also has some 
	pm_runtime_disable(&pdev->dev);
	pm_clk_destroy(&pdev->dev);
calls.

Usually pm_runtime_disable() is paired with pm_runtime_enable() and I
would expect some pm_clk_add(() calls related to pm_clk_destroy().
Neither exists.

So I wonder if these 2 calls are correct in the .remove() function.
Thought?

Christophe JAILLET (2):
  bus: qcom-ssc-block-bus: Remove some duplicated iounmap() calls
  bus: qcom-ssc-block-bus: Fix the error handling path of
    qcom_ssc_block_bus_probe()

 drivers/bus/qcom-ssc-block-bus.c | 34 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.48.1


