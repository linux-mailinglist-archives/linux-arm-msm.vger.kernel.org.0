Return-Path: <linux-arm-msm+bounces-31824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD297A207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BF281C219C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 12:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC79115531B;
	Mon, 16 Sep 2024 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Pr/nOfRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B060156225
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488932; cv=none; b=f8fVsAGxYF1J7FaSCJBlh+770Q0ZleOEhvAY4RvfwAxy83pAY0qzmmv/Km4uUv/Qm910yIdIXRA1KH/JBqvdQmyyj+0QKpiC6N4rrcOcGcl3ZbiByjdSaA44RpZiaqpTeszYhTvzyqo5FlGmrIFrVdZKv+0QFiUX7baEGYLyVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488932; c=relaxed/simple;
	bh=x/eSy/WZngJyR2Y1V+cS6ZDXgK4xdbIYX/lcxdZ5Lfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Imc9vjPm5mubFtOGA2t2HQ5vkgQY55xnaHRxi7W954e5J6WJdxOxs+GLU0QWBg5hLwC698puCqE6ms4NyV3UwMoeYylAN7DdFDkw2Sr3BFhgzK6TcKD5XcDXDRdrvqTmb2CP5LLBlu7F9+g3PY+FIeUAlDHkHxA/ZutY7clb99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Pr/nOfRC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3WW7oYrAHHYvUV
	DPvSSbuhZgtgCR0ALACH7FRX5ibzE=; b=Pr/nOfRCwkZOWp6tZyV+ZnYgx7b6XD
	/KXiIBBfZPA5WuaJhR4Y/de6382qGKturGnCM8B9I/6tdMWk9HuStk7WKyv6lyNr
	ghZ7oVnXhPcfjxf+2gxwt4xr35PXLvq6arpIpSv5+NTRdhIUbcV28EU84KyIxUTb
	n1gR9ndFIAWyEGWmbMn2WqDDVHo2ZgaPWjkywfPnJeOoEjcdcGsdlZ1O8Kx30L9u
	6TIK2KFNsWg+Vl014E/x/EEYG7354kr0Uw3TMTY/rePngK5nBbBIMltZC8raR5wr
	wBYC2xlsXhHHqfAsgvCAjD9tOrqdgIfSUi0zrvNo0e3QJvHNegKIzIeA==
Received: (qmail 1991357 invoked from network); 16 Sep 2024 14:15:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2024 14:15:24 +0200
X-UD-Smtp-Session: l3s3148p1@GVoJhzsizsq5aIoy
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: Keep comment why interrupts start disabled
Date: Mon, 16 Sep 2024 14:15:17 +0200
Message-ID: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The to-be-fixed commit rightfully reduced a race window, but also
removed a comment which is still helpful after the fix. Bring the
comment back.

Fixes: e2c85d85a05f ("i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 4c9050a4d58e..03c05dcc2202 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -818,6 +818,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
+
+	/* Disable the interrupt so that the system can enter low-power mode */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
 	if (ret) {
-- 
2.45.2


