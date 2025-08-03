Return-Path: <linux-arm-msm+bounces-67564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249ADB1928E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4DE176A56
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E1528B40E;
	Sun,  3 Aug 2025 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crVZMg2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008E27FD40;
	Sun,  3 Aug 2025 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193587; cv=none; b=MDAmcbMWc4+SAHjLpPB6lNZoKDry8HZS5XAEa1q2drNhZ9kamU3In6NOvkq7BHtCi00VD2/h4V+ArRz8WZnL7r7jm47cnfpUASkZPcnk1Q8p7b/+yJ9Kht6+p4UDdpVtJZGPKML7yyZXqz6+3fVv6X4MKBWjBoaivb2gS+U26bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193587; c=relaxed/simple;
	bh=cWMj3UNMewUmw+1ja2nbNiC8T9Mn2RMKVFopgCgA22c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlqEnLNng/KSndvQuGE9wRSSJuaY9CEWnZL2l9jxKy7EFmH35ybKzgp3tPXII5DpM1JEa1y5aDa7gImQB+hq5VioftEGh+zsbxnj0/8N1PRFjoSlS3BgTVOG9etCFQ6fUg3ROUznyvEFTHq/IBIxrMPFfrKSjGC2qG6L/ZjejCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crVZMg2U; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-879c214fe6dso30595339f.1;
        Sat, 02 Aug 2025 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193584; x=1754798384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=;
        b=crVZMg2U8hYB8zYbjupqtSoDYKNc1EGEVkYrCCG3UF6/j2xP2RCvs38oTJsQsEkvWf
         s89pRNwi9pLBKedusTAkK3NRe9ZA1qeksKNuwADj02vKgFHqW24RKfg8NH6du3tpIMKm
         yKeJjdVuDmlTC7U9kZeQmeNmSWuPbZdgFymiTYkBV7Af+b6dA7LbB46NJ37r//jcbXW/
         MJ0JLqkLDZli/qsDbt2lFiRJ5njvm/j/l8lgDvOMVhxRO7bl0jFpj9RmdodxZoU1bS7Q
         HXZekthgkX6hu0orSXLwyqOQMn/49rPKUeuOw68mt//yRFrbBPMT/MQp3I5RPLG726d0
         KhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193584; x=1754798384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=;
        b=E+sXtFD37ZahlcugOicEAiJm6kDklp1UTOvbXMgYI+kTulsF1/ErbiFeM3B/wp08r/
         RqDJ2QyazlY4KuG15gW+tgchZEW2Jil7JC1xqzkvDJcxyl62n7P4OEkl/EYZFCTmgalN
         CXShhujmOW2YBJApaqHilddRhT/fpFuR/RsOyWO29txhqC1wlAQmIIetro7RjyFJNfFk
         G4LkU0DURql7WcneALSRwH6SblSTYxuYIYx+X1V3ppbOj0APTL0jUw7TgN7zRPc61T0c
         hTnAFa8dfch6Ugd14p+Rlmc95bDrbtJgvHtXLjwXAbDCDUOOWIA2Rs2OuPj1k5dliBDU
         YPeg==
X-Forwarded-Encrypted: i=1; AJvYcCXDFS0PrIGH5d2EBSvbou7fr0Xopp4QKYgx8AkAd+aryFqAqhhIxB5mgkLGltVArv9at4JsdxX881k/kWRY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0LUuL8fkWzqZZj5ie62bfYeVY3/Zxli8JJcfAkRqCg7fuk+j
	vC2cywoLyPPGrSQsqMaDxP/pjsEMV//4I7CDh+1QZbRiAOgfKFY/Bd9I1JDBwJGet/o=
X-Gm-Gg: ASbGncvjg8gg32as6rl7lXR9+rNyx9r4PDZeYLdK1KqfaWsJ6qaKY5hkYWlj2O9cetA
	m+utEs8gtHwW7u5JgrTe5U/J5Q6qmtYcZYb6c734L4NldT89at4raZhXy55iXMseBxNuZkj/mhu
	wpAsNnGpundwh/7XuZRazELIbRvAO+IuyOenBpxq/eGv+kfrMKRCtrff/mDfvSU3FsGx0pOT9SG
	161Bxecht/g8K4Q+DKLX5qdE4DVSJDar0hiEmrzBT2zs2H3r1Py+a1ZrYwDILann2eT1PX2kqFV
	oXiYGhCHRX1e9RcBdMnwcgUB5JASTyfSCp7lRaE0k0AGUBZRCOYpTPc356SrNDJ18f7vSthY6c4
	Exd0AU6WJ5lNBSkuCjeyvowmBEL6mfJ8Vz2gyPvTHnwuHMlCKPttYdtjt5MihgqbiVdi6ivDVhf
	k1BA==
X-Google-Smtp-Source: AGHT+IF5gmZRxVoJe/ZrtZudgNIc0O6RXiQi/MncQOQVxzlu4r2b5IK1NE9kZPr2rom2pyyvDkmK3A==
X-Received: by 2002:a05:6602:2cd5:b0:87e:7359:133d with SMTP id ca18e2360f4ac-88168353137mr921122239f.8.1754193583881;
        Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 48/58] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Sat,  2 Aug 2025 21:58:06 -0600
Message-ID: <20250803035816.603405-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 267f082bc430a..6eaac728e9665 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -253,6 +253,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static int radeon_pci_probe(struct pci_dev *pdev,
-- 
2.50.1


