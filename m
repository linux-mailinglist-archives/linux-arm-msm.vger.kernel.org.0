Return-Path: <linux-arm-msm+bounces-67569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C85B19299
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2624B189A2B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B4728BABF;
	Sun,  3 Aug 2025 03:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYkc9N7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A097228B519;
	Sun,  3 Aug 2025 03:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193593; cv=none; b=qI4ccszoXC1o3B325y4cvVLVCNqRZ8FwzZiYfU5FfdVKZJXo1j3nS59LHH8Fm+/yCPcRZAnIH8TSypdDEPEZi+N16oTt5VELyr6GQMJ96tXZDJJiKrfK+bSowD5qIH9eY4XzvVtkv5+OjyXJlT+v3BucHz/HdRahxih7KgaLM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193593; c=relaxed/simple;
	bh=jkOn2xBk0cLb442PiJIEZjuOEN+OznhyNqZ7NJoJTyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0E6ErVBFUjokZLNxOyoeM1yilrPG6M42zfChdrvp1RfbZ8vnu/MktyHCwDaCA6fAcqLNqBUOwTmk3xp46O1+sqZZI46V/qCgv+ayQqT8vGZ6vMmpqRZwNRxjKc3qjGjMgthFERWf6hZ1+5x4gkWsZBRO21FeNt5MMdz32vgNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYkc9N7Z; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e40212e6ceso14463955ab.0;
        Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193590; x=1754798390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=;
        b=jYkc9N7ZGv5k8kf59wIohr5AJOudZd+zMmvBQy/L1hhZStk9M+CsbQFPsNvxjJi6jy
         VYWFcatJjQx2JRJh8pP+ZL+e6YuXK3NGAM22DbP/ADtYj0vZscf6bzzbStqHprgUbDba
         3C59n5KCy3Qp2Hr7Nh2RWjScidglr7OeNDIjdmcoV0j7gRRkWh4GCuihzhd6pDvpmk6q
         GXeV5WhtRcLRB0S6skKVUlDeA2OlWeiLqiqnJsY3koqh+RD//X9NZu4oKkpTTnRspTRX
         KCFsk91+7kWTxE3cCunGrvFNvLDFXPGDUxbY+U1Mmdd+4OaQhfbwoU4PlQStP3JDGnID
         o8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193590; x=1754798390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=;
        b=P/BUcvyvqEjfFGzkVXrk4vRST8WjrhxGcuwoRUnVA8PVgL13m8uhkeUU62r4HJ8FgD
         mFbBO/R5fXiAo+liDNyQ4AVQstl953mtBluMbaKMm2yVayWQiueSFxIMWqe5lBvB5vQB
         vyKvZYpFUKJTnt7h/0i+JmRSpy5bjP7UJMO3+lzsa/LlfVVoqH+HfcbyVlNSSSrZMZB/
         jD5jLmaQUsuZ6ZqEcoplcK/iLFatG7QMixWDqvpOB9G6bNnEA1iD/T4Rsw9JvWeU9jyB
         CdRtNN3X9ob/e+4jOCkOwMzyv+XRdnYdK0RoFwa79bOCUu61Q97gjqIiNZGibD9+f9Vo
         hKKA==
X-Forwarded-Encrypted: i=1; AJvYcCX+C9wTeMg5h2G8Drk0WqQQ++vn2gWdUJdWa9zNuPdQXwFtyw9xHVoFI15tcUEupDKs6rsGOfuBo5Q4iVIP@vger.kernel.org
X-Gm-Message-State: AOJu0YyJioQk5GtoOebSrKXda4d6+4a5O8QtnIIVbllpS22c/bXulvb9
	4TdavfrctQbioN4ilwUM4pYl//VX5+YFQS7Cig3w46pnE+tl5MiIgwSVpP1NfnDJ2f8=
X-Gm-Gg: ASbGncumIBm/uw4zebqBb8Yv1IVTfckllAd7JCplPi7FISz769BTKK/tWyo9edFjBJg
	bzJWkCsaxGY1SXBAfqE9bXqg2rxhovQZlLgipMycHZtItOHX1VACZcYiqAUC0Unb4WOL7RP11Kd
	PRo2im7rkwa9FvBY/H6OHXtluLSf3xdZaNy+NirpMwXVYzJUW06gdVabXzD4qhzpm79k5VtaR7E
	meWYBfHh0rSMmwTdbgEkzltClYqArWPoOXKHateXA6fdFUPKTAk4GyrE1CUDWFRzgU7RCZBNAoq
	IQzXuiH11QWCV4O1rHHQATSU8/gTLkPijEElQBfEQP4IQh6vP/30QOnnz6QAfjdUz4U0VlhoGlP
	o/je5e17JsyydTeRR6/pCqh8+VXB0NJ5DJYG35UOOVW9IGB18QbgNRpUSa9nap6EYzPbQ8wCUGR
	RVyw==
X-Google-Smtp-Source: AGHT+IF/wtqWPX2Zi7GTVg1C35Kj0vqsIIXy5Rg7Uw34TkqPQk+fiEKJa0lSA2jtCZZXOMZn37J89w==
X-Received: by 2002:a05:6e02:216d:b0:3e4:ba2:2cd1 with SMTP id e9e14a558f8ab-3e41617ffa8mr84699525ab.16.1754193590548;
        Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
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
Subject: [PATCH v4 53/58] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Sat,  2 Aug 2025 21:58:11 -0600
Message-ID: <20250803035816.603405-54-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 5385a2126e45f..5b6797b80ff01 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.50.1


