Return-Path: <linux-arm-msm+bounces-79318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45958C180B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E01B1A23AA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B7C2D23A6;
	Wed, 29 Oct 2025 02:27:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C231E2307;
	Wed, 29 Oct 2025 02:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761704875; cv=none; b=C9T7IESUno2STElPzWVwmU8L5OK2ofNagNO6IU4FPTEJ9rCcrmSBM0SFLj22RkskUnrQ9XZ9ZOiIH0Sel2XEBVcdFm89TyUc+wf/0XF6r9jT+t/HMGFt709u8xnyhp17mF6sBXbad/iMXMxRVRgRg9a0lHjryFDJB/W8Ln81yQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761704875; c=relaxed/simple;
	bh=R0QHUv/WgXvHGlBRf2jmyo+ur9BbI3F2Zn7ndzuKc0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cuzL6rr1Ej7vX0ONM3cPol7EaDu2gRIcYNdxGSwEex03XU64dUdt4JSVZyw2kvpojqGRM1vZL24Zn0tnzuG1YL4GpQCyNHWy4UiPuvS+z1PAS9FfDsBM2e7fnfdEGuS2N1/im20LzwG2rQrbt6qQDz75y+0z+nTf8yaBIoSGzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowACny1qiewFpdyAyBQ--.29216S2;
	Wed, 29 Oct 2025 10:27:47 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] soc: qcom: smem: fix hwspinlock resource leak in probe error paths
Date: Wed, 29 Oct 2025 10:27:33 +0800
Message-ID: <20251029022733.255-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACny1qiewFpdyAyBQ--.29216S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWDZry3Cw43tw47Zw18Zrb_yoW8Gr1kpa
	1kJas0kF1UuF4jvwsFga4kZa4Yka1xK3y2grZ7A3srZF9FqrnIqF1fGFyUZrWSqFyxGrsx
	Jr42q3yrZF4DZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNt
	xUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8KA2kBUHqjagAAsE

The hwspinlock acquired via hwspin_lock_request_specific() is not
released on several error paths. This results in resource leakage
when probe fails.

Switch to devm_hwspin_lock_request_specific() to automatically
handle cleanup on probe failure. Remove the manual hwspin_lock_free()
in qcom_smem_remove() as devm handles it automatically.

Fixes: 20bb6c9de1b7 ("soc: qcom: smem: map only partitions used by local HOST")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/soc/qcom/smem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index cf425930539e..5d831b551c9a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1190,7 +1190,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, hwlock_id,
 				     "failed to retrieve hwlock\n");
 
-	smem->hwlock = hwspin_lock_request_specific(hwlock_id);
+	smem->hwlock = devm_hwspin_lock_request_specific(&pdev->dev, hwlock_id);
 	if (!smem->hwlock)
 		return -ENXIO;
 
@@ -1243,7 +1243,6 @@ static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
 
-	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
 }
 
-- 
2.50.1.windows.1


