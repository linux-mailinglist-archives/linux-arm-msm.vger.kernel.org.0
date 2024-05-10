Return-Path: <linux-arm-msm+bounces-19642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E81E8C1FE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 10:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8781F2219F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADA613BACD;
	Fri, 10 May 2024 08:38:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51EA5339A;
	Fri, 10 May 2024 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330294; cv=none; b=RXtRQvV25ng0ljJztXybyzVY5C6AqRYnek3zjM8jSzSTVro/Sx84OMOxHUQ3Zf9yra+oSYQ196EMlWO2EgV/qkFi2t2YGz2separnQIy59yPFySuT1/l2JRsYl/9Ef8CzzteVWA/hmnLjovF+2rRiIu+qiBVt0xZQslw5Rb4/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330294; c=relaxed/simple;
	bh=OoaGjiTfFRyZbV8sGqmZGR1G4m2IHxOtwyPSE8x1PAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rS4ph2/MzSaukvxa7op8pGAIkM8r/RPSc9SQ2WdMXpym2akmMeAbLAEe1k54ofncoF0JGwUWzRfpglWDvL5k75+qPP5h2eiJ1JYuMsTlO4e5u10yFXYBL8K5qIN5z6TWo5HriniythsaDjomjgjwsv/hPWK3Hrb6YYRlUrLuPrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAC3vACX2z1mdfUMCg--.13096S2;
	Fri, 10 May 2024 16:32:24 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: qcom: pmic_glink: Handle the return value of pmic_glink_init
Date: Fri, 10 May 2024 16:31:56 +0800
Message-Id: <20240510083156.1996783-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3vACX2z1mdfUMCg--.13096S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1rury5Cw47XryrAr1UKFg_yoWDCFcE9r
	n7ZFy7Xr4jgrsxK3W7ur13u34SkFZ0vwsaqa1SqF9xtasxJw40qr4UZF13CFy5Xw18ZF1D
	KryDGryfAryI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjwL05UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

As platform_driver_register() and register_rpmsg_driver() can return
error numbers, it should be better to check the return value and deal
with the exception.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/qcom/pmic_glink.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 40fb09d69014..8534a9692c45 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -369,8 +369,17 @@ static struct platform_driver pmic_glink_driver = {
 
 static int pmic_glink_init(void)
 {
-	platform_driver_register(&pmic_glink_driver);
-	register_rpmsg_driver(&pmic_glink_rpmsg_driver);
+	int ret;
+
+	ret = platform_driver_register(&pmic_glink_driver);
+	if (ret < 0)
+		return ret;
+
+	ret = register_rpmsg_driver(&pmic_glink_rpmsg_driver);
+	if (ret < 0) {
+		platform_driver_unregister(&pmic_glink_driver);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.25.1


