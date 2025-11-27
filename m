Return-Path: <linux-arm-msm+bounces-83659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE57C8FE95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B3E3AAC1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD703009F7;
	Thu, 27 Nov 2025 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvTL7hro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65D93009D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267776; cv=none; b=RASWsF+zxh4tr+/1TA22H4vBqAy31gXdWcIvmVs9ntnaZBlY4jdmriMnwIaYL7G0ONYgllP08fO63PfkfXpeqnEyEVUnYUkelUK1uV91vVsuZ44vi25kc8J4/jGIrtN3zA/awv0t0usGKqej+QcxnpccQDiSF64GklFbjlotw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267776; c=relaxed/simple;
	bh=BYc9eG/7xNHRelEgOLZ8MfPdhDrlPnZeSwZLNF9pGgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vdy51fDFC0h7LOhQmVwZ1XT5qWKJ4ioiOZkdHttqecesHgpzvwWrV4ONtBME0t6tTmbK6qBSe5HXf1xlZHFzZA7r+XXENa3JR1010AkTCPLdzcl8MdD19jtyjvDonfS4ZAvl5mAGYwPZZr1c1YP01O+nxLZpu8B7xBHpwqADae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvTL7hro; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so2193812a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764267773; x=1764872573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YKWiD1wozDvJbxoMDBeh7eVh+Lppci2WxPgnJe7OyQ4=;
        b=FvTL7hrozOCJy2lddN7L+z/HhJYPz6OeNOBc45oggtK0Ox1TzDyuEs4OhmVB9A9Irw
         WuEBlePILPCWH7BOZe1Xbzt1cDVzMIhTSIR9uFZPgHwonnaJIH1+40Jn6cgLQd8DzHuW
         62052508GLaTOEq6nkiz+sA1JSWzfyKIFkFC8/msk+dXwRrTD/XfDUHZji/WWObx9wYa
         TQ4hOK7d0VYz8fEfBGO8NSGdwdNdXK6YV6lyi6CZW3UzZ/e/2sz2NG6Ft7Oa/Z9slFQU
         vwXQH7QZnHLqBT2FpFq4QDlDgoDgWLExqTrwk5K5TcCX18Arv8m46Za+jbnYAh1i7okv
         Vrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764267773; x=1764872573;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKWiD1wozDvJbxoMDBeh7eVh+Lppci2WxPgnJe7OyQ4=;
        b=uJLyb3tEI0esk1Ng6eBUaZSY+12+jt9aylBYBXXbVoQkk+kc7QQVIyVGshi5UPSeSj
         4QkIewRaqnJJK6C8VpN6vGZue2ZsSkfv9kTNP258ASzy87xGQZ25RErxTYjsB6UiJDZq
         z0wKvPkcfa9lWRNRkbIGobpltjcTwm5g++Cs2mGuYRvxxq3G0YpwBurcvdieEKnLgB7j
         f2YMEPS27rKdETWf5wsjQGpBYya6wnEpbGn2q68wQAlVydqYYHGq83XrX9qkCK2j3xWx
         vxRVezzncQybUQC5HEY5ZoEbGydplMssVcJcxNa+Bb9N8kTVfbbXWLIFPx8XAo4ePj5s
         3CpQ==
X-Gm-Message-State: AOJu0Ywzfb8vtLcg+kKc6eXT9L/SKMIDAuYZOhXes/Jj03D/ducXAfi+
	kg6+rOHGXbx6FJxu0B//lTgNHF+qi9h8jS3K7Be4D9661CG1KGMNSp8=
X-Gm-Gg: ASbGncvdgudrZGpTo3RTbfLLMIi2zx2QhEb95RwcDSbzmmjXMqJ+GHbwYrx7ZOFYNk7
	syhgfBxh9iLaeU05P+PS4fyRt6alNGg0zr+kIiMB5qT+94ne4J4DQYPB84gf0Lzk9cphYLIn44u
	AuzkD8yEOgjx4e3dMbkcGwtRsXF9doBzgaBXPj7OhBIwXyb6FDshFs1exu48qMgNmY6lZU/jW6g
	vuj00fadU+FTkNw+Otrp2cs33xaLle1yyagS7h2PMBo1e0asV9MReiKIMttxlcEEaeGHgLmSvPu
	+QKPjN0+7aRIKEazpbcnFfgX1dU/J36aYiDSjzpUv/bz+61gF7wS0Wo+NRWuxDQt1DEXUne5QuC
	j9hfvinymisDrxL6j9BfbT1JMIvbNhpJFcViwH8sIQs3E8myXg3qQ5d+nGTxOxDZOV3mgBMqHMk
	ZSRU4dDP1ZgJOtEcmTs6VlF1GZ/uILeVYXD+GU1q83i9l3p3vVAqD7nQOzZaZBBsEcoDh7J90=
X-Google-Smtp-Source: AGHT+IHNZkrjfXQZeYu8VRMJ9sEdJ6dPxPLJBwgMuvhZaJF8dEZYgh3svLCKmEeVHuVu5VStsfQfAw==
X-Received: by 2002:a17:907:7f08:b0:b72:6b3c:1f0d with SMTP id a640c23a62f3a-b7671a469e7mr2207490166b.35.1764267773073;
        Thu, 27 Nov 2025 10:22:53 -0800 (PST)
Received: from [192.168.1.17] (host-79-53-175-79.retail.telecomitalia.it. [79.53.175.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a25fcasm225084266b.61.2025.11.27.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 10:22:52 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 27 Nov 2025 19:22:35 +0100
Subject: [PATCH v3] drm/msm: add PERFCTR_CNTL to ifpc_reglist
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-ifpc_counters-v3-1-fac0a126bc88@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOqWKGkC/32MQQ6CMBAAv2L2bA3dUkFP/sMYA2ULmwglLTYaw
 t8tnLzocSaZmSGQZwpw3s3gKXJgNyRQ+x2YrhpaEtwkBsxQS4lHwXY0d+Oew0Q+CCobrWylUCN
 BakZPll/b73pL3HGYnH9v+yhX++sUpZDCYqOpyPIyU3hp+4ofB+N6WE8R/9aY6ro4lbXJlSJrv
 +tlWT494fwF6AAAAA==
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
 stable@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764267771; l=1513;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=BYc9eG/7xNHRelEgOLZ8MfPdhDrlPnZeSwZLNF9pGgs=;
 b=osGbVboLLrVEabJOeT/IL8VrAcnOO/dmBJlLk38onTJZtWhhFZdcyojrab0K/BeIKlw776AVd
 vA0TxRCOXw6Dsyn0X1nHS+E3J8/x+O8k446JL/SfY02EMi4OxNZY32Q
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
Cc: stable@vger.kernel.org
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added missing Cc: stable to commit
- Collected Rb tags
- Link to v2: https://lore.kernel.org/r/20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com

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


