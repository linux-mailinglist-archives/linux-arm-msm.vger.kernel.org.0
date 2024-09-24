Return-Path: <linux-arm-msm+bounces-32319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C89848E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 17:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88233B20DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 15:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821C017BA0;
	Tue, 24 Sep 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SojFvqWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A901B85D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727193348; cv=none; b=DtHBr3ll1P6fJ7Ex3g2oft+/ruqFTM66DvQ/Z6Ki6AOUnZqjO2l48eZB942vTMBANR4isrucfqNCpSfxklAvcSxxJfZdYE3SMp2nKvhiVyM9ltz8JQWETqoMYGUP7IzjvNFcybTsuiZ0Kcr9QsY9YWO4GO2DbTZ2S0TlTF2ag+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727193348; c=relaxed/simple;
	bh=trcYW71Wt+lJxSeuc2MSvhSbsMAH7DlCNGUaHCrVx8E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z23oZeypiOyT8qwputeSYpnarUuxYUPXBAa3YbZFc+my6Xz/+JB/DqAUGWG5XExtWJOfYu8di2cb92UDiLk5C2jCdDDy2ckQTAuFtRMJQIctyY1L0Axq/4EtrfaDwlKjr69Vi8eyzvKvrwOYgTdH1cClOqspqFFAc55Ac+9iJsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SojFvqWP; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1727193344; x=1727452544;
	bh=Bgc9ku9ZnIZuPji3nNLEhFTzuk+iakKOr6H5Ksl/pJo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SojFvqWPqH3W8FrQcKUiRyDutLiCxLxiybgfio7jbmT75dwjatAMIEyDhBTS+pBx3
	 KT0UNCScLPg2Fg9A+zANEqfioBw0AoFzcUAQrJXK3NYtkgP0+iO/1Zept9OcbfyYSp
	 Vnd5r+zKHaiMj5MVzMNkSeybaPTDVWDC5dgXzWwIDpqCdEQBwVFPPQPXzjE7o/Rq86
	 rqW2EtQP/Ow39XtQu/HFINnoKB3i/l3aSrhO3ffjhpFQP9r88EI8DuRpDRHHDAUayT
	 Mt2fzFGqxaV5P/QrY2w4DVNeqrixjP3tpKsQWpJiz5abFpoRpa8LO50l4UzpcGUIfQ
	 m9yqW0HE4XnwA==
Date: Tue, 24 Sep 2024 15:55:38 +0000
To: dmitry.baryshkov@linaro.org
From: John Schulz <john.schulz1@protonmail.com>
Cc: john.schulz1@protonmail.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH] drivers/gpu: Switching Adreno x1-85 device check to family check.
Message-ID: <20240924155442.74210-2-john.schulz1@protonmail.com>
In-Reply-To: <20240924155442.74210-1-john.schulz1@protonmail.com>
References: <20240921204237.8006-1-john.schulz1@protonmail.com> <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j> <20240924155442.74210-1-john.schulz1@protonmail.com>
Feedback-ID: 15150580:user:proton
X-Pm-Message-ID: ce4c6a619a854d575d0f286ccff226323d57d9f1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Switches the is_x185 check to is_x1xx_family to accommodate more devices.
Note that I got the X1-45 GPU ID from Windows which may not be correct.

Signed-off-by: John Schulz <john.schulz1@protonmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 12 +++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c
index 06cab2c6fd66..f04aeacae3c2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
=20
=20
+#include "adreno_gpu.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "msm_gpu_trace.h"
@@ -1026,7 +1027,7 @@ static int hw_init(struct msm_gpu *gpu)
 =09gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
=20
 =09/* Set weights for bicubic filtering */
-=09if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
+=09if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(adreno_g=
pu)) {
 =09=09gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
 =09=09gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
 =09=09=090x3fe05ff4);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/=
adreno/adreno_gpu.h
index 58d7e7915c57..ec36fc915433 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -526,9 +526,15 @@ static inline int adreno_is_a750(struct adreno_gpu *gp=
u)
 =09return gpu->info->chip_ids[0] =3D=3D 0x43051401;
 }
=20
-static inline int adreno_is_x185(struct adreno_gpu *gpu)
-{
-=09return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
+static inline int adreno_is_x1xx_family(struct adreno_gpu *gpu)
+{
+=09switch (gpu->info->chip_ids[0]) {
+=09case 0x1fc31043; // X1-45
+=09case 0x43050c01; // X1-85
+=09=09return 1;
+=09default:
+=09=09return 0;
+=09}
 }
=20
 static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
--=20
2.46.1



