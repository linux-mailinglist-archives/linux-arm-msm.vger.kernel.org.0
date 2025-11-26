Return-Path: <linux-arm-msm+bounces-83516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EE580C8C087
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 22:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 93DBB3502ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D4A2D9EC4;
	Wed, 26 Nov 2025 21:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhjKowlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E522D63F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192731; cv=none; b=DHAeSLslpKcnwKu/Fq3Freok6389q4aSFQ0xWuqySeipOyv6p4v1gMpBCd0X7ZWSXs32OfpOSt+aNS8Pzm1C8lzdDFh8iBcGwqs2UBakFU6Ur6IfBdRYFNsyWJ17tIrQ7Qh3LhIv1fkIbYaLZRL7ZnwSxfVoHMcEVvItcrEvxGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192731; c=relaxed/simple;
	bh=LilEzDhcWjY57veICYfWfLCwFQ8k3uO5J7lq6Uiq/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EUaNZDk3IOYJy8ydgIEF1no9z1rPjFKXi80l6deVJcC5TI4ILE9AE+7qR+rd3bnnklNM7l6B15fS80ATFxvE3xOwJ3e6r3ROvcYIkcIUnzrPAjIThVhz0Gw1xqnpmr7zK782cS6+0xFjnjlLDBGaRVue1POR8tGeFaHrEX+Oe4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhjKowlb; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7355f6ef12so42446566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764192728; x=1764797528; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/IjEkSbir+5iDrD+cjTkZjSpdltDA21ZlX4G/dyJhg=;
        b=OhjKowlbkl+eBdWdhM0y0fbipEpp8Uh4w4Eq+BrS1/KoplnQA01HcoUTEqshA4qfKr
         eorF4hLGEQNAvkpOtBeRUTKtXSD6nfGX161yZhWLqyDYsZEoMVuxbYeCPBv/gCYLtP42
         G+yOq04jFLs+jwld2tO5iq7aUMPCamLlfjbLtkSupCxDxJDVkl9Sr5RJPXx125/aHzZy
         QfRcWuRrt149fpUsKEnP/kuBf8iNJP49In3SPz0ze2f2b5LHBeflzbdaJyim8UulxUnl
         TDlYp05qbZEfORgR0VXOqCyHQaue1ePlPPz59GUyKYAO38jGV4FhMNRbMVtSSBbvXe3x
         oMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764192728; x=1764797528;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/IjEkSbir+5iDrD+cjTkZjSpdltDA21ZlX4G/dyJhg=;
        b=kbqqkSbja4R4gQxaHl0t1s0aqnM+UDmWlHCJVM9I7jZNFRfiFXXgnq5ZLgvZveeIfI
         3B20KOj3fIY5SsOxe14z3TEJxJETLH9S4GLSAjspGBgSSN2kQHs4GcBbZ+d5sYNyxFTG
         B4O7G3ybCYDER/mU5M/vJ4+Of0/i3AsxmBHbfRk7gjS4zruo6wYoqMgQqT/6d0MFe8Dr
         LZgTqBLzceVxk6s/8wJ8aLrEtXdHu+2e5kdlYQJohjAmI1tvO405qOOIzQXnkhtO5kpX
         f8cjfYksRie0YVwAdzTn9XG4s5dKvRTMgkaqmhxSUBMUCuW4MU+0/gBOE8jDNz624+eN
         yhJw==
X-Gm-Message-State: AOJu0Yx3TTPrCNXdjPy/a1JzVJ9BnSYs46Ive6+8OAKh1qq/Pcs9yd+W
	EUPSBx8j4cQtpZ17V5mfGgiCBp2Lm8UtETuOnoIitxUh3+hUQA1i3b8=
X-Gm-Gg: ASbGncsfFGlRmtbIZ98RnkWVbfd7Lodw6WVdxxgTI2DRUqVyqt1flq2Cn0DWl4clezM
	uJdPGnyNaz9ljZYuJBnedFoOv2qy2006PlBNcj4A5gBSIk3KEUq1fJrt/Zr7BE+SRAEfaBabsCI
	hwfenNORs56QsBk12wixTDLWe8/mX+P+XzGgGNakxe64TnjjeUeQhZptPSYUWrkU6xqTpULPbi8
	2Lh3OU45MTI2rG+HvHbM5w3U9kOV/VfBSKlnlcJLnTYSf8eMx6yB8ZNDPERQoVnjUB3BnCpGApN
	jCoH/ONxDRw6nVyTzXxG1K829q+tsHCTmHoYTQny+cu4gWSu9X+mw9SOvTlDC2qTDF5zQQGyeQy
	YMmg9GgXK3chK2CJ/49VCaB8XQHGOlGfd33HQ7r7yVKjg4Ki1xsDWwQoskVnsjewItAlaE8YtlC
	rmTZzPHyMyqr2UdyrLWhYdCuYt2hIHWpZfZvPpEPuwjmGgZqnBqi/MAiKN6KGxidD3A1g7S9mFh
	Q==
X-Google-Smtp-Source: AGHT+IGvpQiDa98vuZ+r2RJ8KvDkUmhL1X9QjLRFojlbAheA3iOOln2ak/2qbylZFWsWbYzCZDCEow==
X-Received: by 2002:a17:906:50e:b0:b76:bb8e:9291 with SMTP id a640c23a62f3a-b76bb8e9627mr777562366b.0.1764192727897;
        Wed, 26 Nov 2025 13:32:07 -0800 (PST)
Received: from [192.168.1.17] (host-87-16-172-206.retail.telecomitalia.it. [87.16.172.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ce15e7sm2007828266b.8.2025.11.26.13.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 13:32:07 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 26 Nov 2025 22:31:30 +0100
Subject: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
X-B4-Tracking: v=1; b=H4sIALFxJ2kC/3XMQQrCMBCF4auUWRtpJkaLK+8hRUIyaQdsU5Ial
 JK7G7t3+T943waJIlOCa7NBpMyJw1wDDw3Y0cwDCXa1AVvUUuJZsF/sw4bXvFJMgjqnlTcKNRL
 UzxLJ83v37n3tkdMa4mfns/yt/6QshRQenaZLe+pahbdhMvw82jBBX0r5AjpbfQqqAAAA
X-Change-ID: 20251126-ifpc_counters-e8d53fa3252e
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764192726; l=1193;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=LilEzDhcWjY57veICYfWfLCwFQ8k3uO5J7lq6Uiq/yQ=;
 b=M/RIo1ohGCP4894QLZEeWHawQG421ypp8IgRCofThp6HqeZ3mrMcKYA3M691q+HNdFzOqT7b3
 o0RZiLYLO6xBaRZQ2hYP5JFmJVxtFFr5EaW/d1sVYGhM2cJld5cxQgQ
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Added Fixes tag
- Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..b731491dc522 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A6XX_RBBM_PERFCTR_CNTL,
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-ifpc_counters-e8d53fa3252e

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


