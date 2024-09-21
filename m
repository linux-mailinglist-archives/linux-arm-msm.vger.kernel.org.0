Return-Path: <linux-arm-msm+bounces-32151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8397DED6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 22:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79A1B1F21026
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 20:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12DC3A268;
	Sat, 21 Sep 2024 20:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UrOHHLnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5A18EA2
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726951381; cv=none; b=dOauazkLsQyTmr68zKpr3TAuJnx8ZON3P4DvFMU37cG0P2WUkWsHoX5GXKlWpD/68ssgS+SbyPmVQ7moO5L1HoG91LmA1hnxTHNmlhM8ed9fl6k4RxUlnbpz+NQ5oNXdbsN3sG+mMNSdRbCVZjJkYFGb5ewLj5k+dtjkH187ZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726951381; c=relaxed/simple;
	bh=trcYW71Wt+lJxSeuc2MSvhSbsMAH7DlCNGUaHCrVx8E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IcrWyBnVoMzrPeRWTNWHEmeGVvkPaKlOsRmyDt90C0jPUnk5jt9I0BtIV/SrH3oj1Z2Tf8fFmMXF0wUqOqgK4RwJ89xjXyfBqL95bb4MBSkbJOheVL6R5FRQ0kgCoIx3xH81wElXk6jmOGA43jj5xhEJjFJFSS5anW0YYe0Tk5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=UrOHHLnY; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726951377; x=1727210577;
	bh=Bgc9ku9ZnIZuPji3nNLEhFTzuk+iakKOr6H5Ksl/pJo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UrOHHLnYiZfgLNjT+q/rbrqWzAue5Tk37qZK8fb6CVl3GrhKNET7B8W8PSqsAoRmt
	 GSqgoeDoR2meVZ6wGRoMKTyy7EQLrEiMmGoR4Fwugrfh/aw0UvE38LWh009mE/LAX6
	 pkdFTxyuqZoFCZrX8NbNFn4D/nfhAX8NcGyZ+SaTmZQJdlRdtv3NoPZA8I9446Tdcv
	 MbvxzGoDtsYipOgSKptnhcX0VUekFThgkzhp+K9VOhOX1UAnqnmj8zhroWlOmN7Xgd
	 mnwYUpzEtMKCtyh6dhw54MUqOb7XUA3itq1FNQ8I7LdTNNYYBQcjRb8SIhvDPqWyQQ
	 X9yzacTo3AL/w==
Date: Sat, 21 Sep 2024 20:42:54 +0000
To: linux-arm-msm@vger.kernel.org
From: John Schulz <john.schulz1@protonmail.com>
Cc: John Schulz <john.schulz1@protonmail.com>
Subject: [PATCH] drivers/gpu: Switching Adreno x1-85 device check to family check.
Message-ID: <20240921204237.8006-1-john.schulz1@protonmail.com>
Feedback-ID: 15150580:user:proton
X-Pm-Message-ID: d4549f5c7f780cbc0fbc7e7ccaf4a4325d948123
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



