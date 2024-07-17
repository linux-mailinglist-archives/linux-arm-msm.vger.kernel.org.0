Return-Path: <linux-arm-msm+bounces-26505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B074E93444E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 23:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2371C20D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 21:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D071E17F4F6;
	Wed, 17 Jul 2024 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBrpdpn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EA4688;
	Wed, 17 Jul 2024 21:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721253532; cv=none; b=SDRXC3amahD7GkUsAmn/ESVrQNA6l4r0fjmQpPWHvBaJTPQlAQGhhXOl6mgZy/DwvqxsOwGn5jL+sRCnfVUuod1lT58/60x07lUwm5cuhdSpFXGAmEFbCzQE+fY5z3npbh6DbPSljABt1XoaY53FzOjd80S5PCEFM2aUSBKgTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721253532; c=relaxed/simple;
	bh=KBqnzoKB50TP2AY7U/X1UxbeIKca/treoIITrsl7seY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftLJcWJcl5ha40dZ3teo4WV3FjDHsydqwOMG91rz3M7OlAIR0TY1P2VYvJ7IcQzrwKQDxysEd2KVlGYhJD4lvakFNrzaLis90E2BXOlRc2fkMRNoDiB7lsROqpuCJCWJj5s1Q7h1bLJVIlOXtExJs/Z7Lo/VaT5Jjozq1yeY37E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBrpdpn3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb457b53c8so1902285ad.0;
        Wed, 17 Jul 2024 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721253531; x=1721858331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiSxCmxpPDKVe52INJHPWGzjKnAAp4bqiCfzE7BK3HE=;
        b=eBrpdpn3rVLS+f2GlTzbcOCd4gSohuknRQ8MozEdZD9NUfcYjFIdb8V2B26tjLL7yN
         D8cMeaJVh9u3oplpbUF9VywuAa3EWzhOXE2ZxPXK5j7Bm2/vEkp8lKNzT5fKsLRbkk4o
         qyQdwMwRTA7Tuca40F09icQ0+zEnPrQ9LY1qnRjc9ALdiQ60t4UYKxGocNOzhHBwWux6
         X467adIs6aD2gxP2ifrcGEM9MDv0/PyiognQLIcxz5Pg46luYdgrjfA5QuqWxFDPqCka
         4DnBBr0G1FEIJ6XyGcBeX1W0uMt397iPiBT9ukzK0cBfKPLrCwJji0YmIwU7pT22CsKG
         tU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253531; x=1721858331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiSxCmxpPDKVe52INJHPWGzjKnAAp4bqiCfzE7BK3HE=;
        b=Den3NUUCtXmWqZwsNAMWeV9YS2URSK+iOQl8Hm2TuEFRnoGWhjG3gIksglzCoH0CKK
         T8LZWmPV2SGBQi04PaEd960qCWPK8OsDXSsaPJ7LwtAX7Yx3oCGcx3lpq/1fW8QOAfnL
         pKmh8qILBD9z6GGr1EWmDbt2FcUD7XZJd5iCEMF4nxR8HDFaZ2t0/Vxv+y8vQ5ZAFLIX
         qmUba6Fs9tCBtY5Yiqh+rgmRidL8BLoQi7KhTGxZDRcIK/kmV5g8IT3X6tYzFjsL5YnW
         ItwQVOXIW9LmIsRajjadei23ZgA+QUeykM0Yw5YiEGR3D6RNoZ7YCwQUktJ5a3dgEPx3
         ilOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY4OdiO0BxiqLOMtPIjYGeCqhuvPcN2V6WgEmJiLVJ1NWjp4eUdkzs/PylUMt5skml4g2md9ktAA4A5bayblDzFILzpaYyvUpCbkM1
X-Gm-Message-State: AOJu0YydITs3XPGL8T9uFZIDspTiFjJ+QUxOsZR4Nt18CjgUFfRFxKJh
	Zuw2YwCcg0jvg22OyhMdcYxx/N45AhXqM0EVtvPiq7QGPcW8V7LW
X-Google-Smtp-Source: AGHT+IFXDAvBMkEMStSH4nurfzh3TYRGe+QjxqF6ssIkAMTxdRiDG9y2G34vCgMvRl51AInSKSBemA==
X-Received: by 2002:a17:902:db07:b0:1f7:2293:1886 with SMTP id d9443c01a7336-1fc4e165dffmr28196225ad.12.1721253530525;
        Wed, 17 Jul 2024 14:58:50 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc5aa6esm79662475ad.299.2024.07.17.14.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 14:58:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
Date: Wed, 17 Jul 2024 14:58:46 -0700
Message-ID: <20240717215847.5310-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Just a guess on the panel timings, but they appear to work.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
find any datasheet so timings is just a guess.  But AFAICT everything
works fine.

 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 38e5178f55ac..411b7218af55 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1966,6 +1966,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
+	EDP_PANEL_ENTRY('S', 'D', 'C', 0x4189, &delay_100_500_e200, "ATNA45DC02-0"),
+
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	{ /* sentinal */ }
-- 
2.45.2


