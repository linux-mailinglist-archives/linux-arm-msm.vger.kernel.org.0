Return-Path: <linux-arm-msm+bounces-51095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59FA5D759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 08:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A4D67A9B89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 07:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556261EFFA6;
	Wed, 12 Mar 2025 07:34:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C841EFF93;
	Wed, 12 Mar 2025 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764872; cv=none; b=UAedVKtnYQ7Z9IIDTyBOo39vdugLXyMXU/iEHZ0ef4CUiEDZCyT4/fvG+X7hbx5c5470KG26BMC2KrIhOb5rb9U93eOoJ91kUuxleVcfEDgd0QkwZa23LOxX9k9B1cdPKbqB1kdaOeGUqZD1SDA1txe3+IaL3/rlxFhHXBpsunQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764872; c=relaxed/simple;
	bh=OLTuU8F2AI5YTT87vjxQRcxdax0NuEjM2Mk6iK3m5K4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pbYW7dRXf+joO4P274GpBShN4USMgr6ZnKDIh/0QpgzJmBEFKytwH5R0tyErE5pkSP7dAWUaC4gjQqMPp4Fz/FCSBeHSuYw3cnWlQhl7GFwgmhnAQI5ywUYEMlwbFK4nCqMV8MPyKfrjV5LXsb3eHJovaSDiDcWG6exqx+5RTPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACXn9P9ONFn+Px8FA--.64272S2;
	Wed, 12 Mar 2025 15:34:21 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jeff.hugo@oss.qualcomm.com,
	quic_carlv@quicinc.com,
	ogabbay@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] accel/qaic: Remove redundant 'flush_workqueue()' calls
Date: Wed, 12 Mar 2025 15:34:04 +0800
Message-Id: <20250312073404.1429992-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXn9P9ONFn+Px8FA--.64272S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKF1xZFy7tr1DuryrtFyxZrb_yoW8Jryfpa
	95AF4rtrs3Jr4DC390kw4UWFyfuan0kFy7XrWIg34av3Z8Jr98X3W5KFW7tr95CF93Jr4q
	kF4Yy39ava4UKF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYl1vDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- flush_workqueue(E);
  destroy_workqueue(E);

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/accel/qaic/qaic_debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index ba0cf2f94732..a991b8198dc4 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -240,7 +240,6 @@ static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d
 mhi_unprepare:
 	mhi_unprepare_from_transfer(mhi_dev);
 destroy_workqueue:
-	flush_workqueue(qdev->bootlog_wq);
 	destroy_workqueue(qdev->bootlog_wq);
 out:
 	return ret;
@@ -253,7 +252,6 @@ static void qaic_bootlog_mhi_remove(struct mhi_device *mhi_dev)
 	qdev = dev_get_drvdata(&mhi_dev->dev);
 
 	mhi_unprepare_from_transfer(qdev->bootlog_ch);
-	flush_workqueue(qdev->bootlog_wq);
 	destroy_workqueue(qdev->bootlog_wq);
 	qdev->bootlog_ch = NULL;
 }
-- 
2.25.1


