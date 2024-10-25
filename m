Return-Path: <linux-arm-msm+bounces-35831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9C9AFD55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3CE28364B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01171D2F74;
	Fri, 25 Oct 2024 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UIxw0YCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6441D2B3B;
	Fri, 25 Oct 2024 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846666; cv=none; b=Y8RSX9KIBFXuBU5FykkRxBmqzbY+U+JDesyyhvX9AQufC5Dg0XGtEbMboyIjBqDRACRpyX3eQpCdhyxXDMrFFAqdiYeyxv4oC3ohdMJkYdn9JZm2bVMKY2ofxgrRRwzFfd2R8hpjsKrEljvIExe39nhReFjxWLDMhWMCLTGTfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846666; c=relaxed/simple;
	bh=yL/f+sZkF9apaQ8WkY7O+IEaSP34RIkKSxZsNkgFpPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H7b8VUrBCdo4L3EhEGpSDJtqEZEqu7wqtpEelNA9Tiq0LKp0TAY+rvbY59tDNzsVY0AWjHwNB5LrR8kgPOeaRms3mnb4MiFYwtfk7mqfelWaMEFNDpCyLkZ2vo3GPXolPAu8DZopDbxXqxk3y0tcM06hk2hJQyAodJwtq6jTTwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UIxw0YCB; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1729846654; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=0q6v9CWAxxTHgiYP/YFQoVfoO9w1id0iATXibxMe+pQ=;
	b=UIxw0YCBloYjW8QhSkpjuchc7nZV1hRSms4qGW4CxaPwD5yQaaFRuq0kt88u4iPqlw1zIAy+0rPRKPMyaqTBWnuj9bC73AwfP2X7SuYrSS7GR7w6Hz0kvUNQHDhtDx4Fn2f1SW7A0VhVJTk/iyqFD+LwzKTpSf3xPvXweVcNlZY=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WHrxpQr_1729846649 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 25 Oct 2024 16:57:34 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: loic.poulain@linaro.org
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] i2c: qcom-cci: Remove the unused variable cci_clk_rate
Date: Fri, 25 Oct 2024 16:57:28 +0800
Message-Id: <20241025085728.113098-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Variable ret is not effectively used, so delete it.

drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5cc791b3b57d..c7c4fbf73183 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -523,7 +523,6 @@ static const struct dev_pm_ops qcom_cci_pm = {
 static int cci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	unsigned long cci_clk_rate = 0;
 	struct device_node *child;
 	struct resource *r;
 	struct cci *cci;
@@ -597,7 +596,7 @@ static int cci_probe(struct platform_device *pdev)
 	/* Retrieve CCI clock rate */
 	for (i = 0; i < cci->nclocks; i++) {
 		if (!strcmp(cci->clocks[i].id, "cci")) {
-			cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
+			clk_get_rate(cci->clocks[i].clk);
 			break;
 		}
 	}
-- 
2.32.0.3.g01195cf9f


