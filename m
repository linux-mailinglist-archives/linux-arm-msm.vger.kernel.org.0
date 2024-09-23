Return-Path: <linux-arm-msm+bounces-32176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928B97E507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 05:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE2D1C2104E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 03:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABC010A1E;
	Mon, 23 Sep 2024 03:41:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A0E79D0;
	Mon, 23 Sep 2024 03:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062882; cv=none; b=Ak2pseg/+rSUZJFP1n8a+NjgbU2TWJcG2arJ3cp4i+bH2Dir8qlwHDzDxQFH284+8rT/S8TYzTIAzJ3GAKL/ygehmt2BmN6m5bs2y4mJT1TDYYCG11DdWpZHuyv7TEs4gyPzOGYnMrGvA0TA2PLoJT5olSewo7BbA0D5b9/AqtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062882; c=relaxed/simple;
	bh=hVUsNSZG+X0PBH4IQwTyPL+6UyoVzsFwiNCZrdnw8n4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6ti2OCQ9HKXg/v0lXRtkodicq1Y+4gI08lZgC+C27ZVwaLoRPTt2rJmXj9HUMc73zJIPYp1WYpQxdpQtXGXU4WOTEjt7OGYioEKiGve+xudgGP7vIvDrkviKntYunoHf3qaQ+8rfxklSig6qTnT+VD6jOeEka++kBa2wOczIeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XBpfp1YByz2QTtY;
	Mon, 23 Sep 2024 11:40:34 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 6680D1A016C;
	Mon, 23 Sep 2024 11:41:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 11:41:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<hans.verkuil@cisco.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 3/3] media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Mon, 23 Sep 2024 11:51:15 +0800
Message-ID: <20240923035115.3008900-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923035115.3008900-1-ruanjinjie@huawei.com>
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

It is not valid to call pm_runtime_set_suspended() for devices
with runtime PM enabled because it returns -EAGAIN if it is enabled
already and working. So, call pm_runtime_disable() before to fix it.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 165c947a6703..2d5966f5ce97 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -412,8 +412,8 @@ static int venus_probe(struct platform_device *pdev)
 	of_platform_depopulate(dev);
 err_runtime_disable:
 	pm_runtime_put_noidle(dev);
-	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 	hfi_destroy(core);
 err_core_deinit:
 	hfi_core_deinit(core, false);
-- 
2.34.1


