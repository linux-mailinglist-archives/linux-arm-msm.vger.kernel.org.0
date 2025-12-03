Return-Path: <linux-arm-msm+bounces-84154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9024C9E13B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 08:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97A103A7C0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 07:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0354F2561AB;
	Wed,  3 Dec 2025 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eb8/1dXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294C523ABA0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 07:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747960; cv=none; b=srNK/0xF1yUO7kDO/bT2eCQpbWXw7bCGbyqaUlW+hxm+N8KQAIp4rkzX6uo9ThUmVRaxLA3mKJwrcTGcjLZL6riv/j76v5PcVr+HoPFqCY986VW+gaPUX1z9IXWQL7BqR7ULb+dGcqSaqGh/OzGV2Qzxa92VNjY4dp67OzA8ndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747960; c=relaxed/simple;
	bh=GfRXjngrWiARh8dF9XoOEilGBkeiBTD+yf9EgHkFYC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q1cxw/SjDGlrDfDLkHkxYoEWrFdY1Q7/qpa1Ce97L98TaFedB0GicaUII93JG5KxyZ22Jww8yrBR1hQM5CoVKFbwibrVASYt218O0TVZc60toEmuqEHJ2aTt1Hw6ZJ9Vf8xmtMOkros+pwM9v7oTv3lxpP5wCkKfUuhkMmRwVtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eb8/1dXd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47789cd2083so38068785e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 23:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764747957; x=1765352757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qY/PbcsnkUZCCKF2mlGoWTtD0mdsRoACsV51+JfVo4o=;
        b=Eb8/1dXdHPo9cWxkYIivzzPJp0x29DBLKmPRSNIHhK42hPDn5cuZ2sd+2I9rDCuwFa
         +hJRri2YvBazzEIgoX/cEWdk9aH/+ay2/s1/ni5fF5umZO41RV4Vzo2PXqTHUr2I8HqC
         4wPqW+pcrnCEoQvxogEjHVa0sqGGtNYQ/zYyqvBT1MgdeI6wmtNGGYnhl8g0aqtOI9vs
         ut6fIyfOWH1sAFQVo6U5b+1xrW6a/nLOgCTtbDkgEyM6BRGRS3cPWqyBL4KnASHDJPFG
         whZH1OrPzRxwSUO+Vqi0Z9lwVbyYlY2YOX4EKa36xoBWTsx2OnLyyoZuKDbZYwchiUVl
         qn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764747957; x=1765352757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qY/PbcsnkUZCCKF2mlGoWTtD0mdsRoACsV51+JfVo4o=;
        b=iVkKIHsxTH05i/6Y0xUA+b4Hico+CYVjOnYxd5pSoBT6EmOH7N0QkSG95dzLsVuJmg
         KUgWV6ctIFqPHFC6+fmt7At/3n19SN3iIl+xyZ1ur8Q2BS/2vk79FLLwYP4gXn3diOu6
         wCr45JCIYECerkcyCvK9eydouv4BucYvPN3xJDKt8AqPq4NXIvJ0g0yAVLLVeNkoKZU8
         i4fblnE57G7VY9VTjI9Em76rCagK7W7e0MF3do+QoH49GGO7s8cwdNf95lHgCeeFJz0G
         oMIcfppARIid92M1qwbfyiTXDWr4P+BENhxB02tu5XUENXDi0RyL3hMuYXZxwgKvx6Yf
         Txkw==
X-Forwarded-Encrypted: i=1; AJvYcCVpPvbXB7gW0oL5m0Q+ixnIA+cZpNvr9JlchxVyOuwEKSnh+lA1AOEKBEGDze/KjEgMfu9BdqBsGHhcchf4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1i+aYwqX1iL22W4klyALruuVbYkvjLj9bMrxuGezCliEHE5zU
	gTHFh+CtILyHS0PJkoGJIyKEXAclWtRlkyFhFKhG3gq/xXhu55mFO3Y2YJ6GA8GkxBg=
X-Gm-Gg: ASbGncuVKYBnH98XImv6TniI1W5xe8Zh4I2SRljxoK3QQDlBwwiR4ENeMYGR4fbVav6
	DcZRJshFuesiOo/EWcx/yVc0z4cjN7CBBtcYRoEcOKVCxTlAL2iolJRzn9DR7ZI5iP7ZBcdLO3B
	z84PjuDTOVa2WSG8Q7AuisFNySYebhxUNostQ+bIon2TxPBV5dJ0aAfToRsVH+4lnRFsDrs5chA
	viaVUIK+CMucOGLDlRFk4rK0xZS+c0QRZ74gOJL3uEB+93+97I9bMjrjzi34LxUYLd651nvXNio
	mHUUczaafnKE7buQqk80zz2GFmbVqcPl7bciXvTyEoN7Sz4YAn2xnO+gnO5NJ0qFzOCnE9XYt+/
	KDpXh4sgKeDM2PxCd5MS8bfcHdnBjVj0tkTvsADNz1hqBEdyQisIo1PVJyKoHdbh6oBMBZEhVHx
	dTTEdwd6e2RJWCd+n4WSw8OKYBlvM=
X-Google-Smtp-Source: AGHT+IEUMDqN8+/nwF01p/sjfG/xJCCAzS5FIZ1FTwoqc1NLx80oiLXSC5Fkzo3aZsGD/y+t8R7nAw==
X-Received: by 2002:a05:600c:3106:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-4792af1b207mr10218285e9.21.1764747957279;
        Tue, 02 Dec 2025 23:45:57 -0800 (PST)
Received: from orion.home ([2a02:c7c:7259:a00:a4e6:4871:7444:3cf0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7a7aaesm32873585e9.11.2025.12.02.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 23:45:56 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	vkoul@kernel.org,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/panel-edp: add AUO panel entry for B140HAN06.4
Date: Wed,  3 Dec 2025 07:45:55 +0000
Message-ID: <20251203074555.690613-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an eDP panel entry for AUO B140HAN06.4 that is also used in
some variants of Lenovo Flex 5G with Qcom SC8180 SoC.

The raw edid of the panel is:

00 ff ff ff ff ff ff 00 06 af 3d 64 00 00 00 00
2b 1d 01 04 a5 1f 11 78 03 b8 1a a6 54 4a 9b 26
0e 52 55 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
3e 00 35 ae 10 00 00 18 10 2c 80 b8 70 38 24 40
10 10 3e 00 35 ae 10 00 00 18 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4e 30 36 2e 34 20 0a 00 eb

I do not have access to the datasheet and but it is tested on above
mentioned laptop for a few weeks and seems to work just fine with
timing info of similar panels.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 944c7c70de55..2298fb312c95 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1904,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.47.3


