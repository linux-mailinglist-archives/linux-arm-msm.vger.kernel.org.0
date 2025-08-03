Return-Path: <linux-arm-msm+bounces-67561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F103B1928B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F90189A39C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88680289804;
	Sun,  3 Aug 2025 03:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIQSCF0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE52A28A1F0;
	Sun,  3 Aug 2025 03:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193582; cv=none; b=fvg6VBTt6Lc6cZ+4g70sUk/j8n2T1MpA90KXhih90YlPqZluJGruQf0h/QduIHgC+ZkejDrjstgldIgyxkonJh6wrkNKRwsTUkK9WTDDIZGPQ0IZmzM5xsKcls/YHfvsjMGIZYc92MXDx3ZFq5c4Xe9h418MmmVNuqJv6ZDFZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193582; c=relaxed/simple;
	bh=MDGWeJbDY9VZMdZnaXbOaD5IMcEPFMIZ48niWvEaiyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqbGT8JCnPy0K8W0SFrccIfGa0OJMay2iKafGv3sfeKYwWkz3TKpVBH0kcDC3E2eEfkpJ08YsmTVQUhkQnAxlzd2f0KNaF2+wsmY3u6W19rWMjcuDNeYzOiYBZYTWZk5yfar+FN8TvwCuVH0A0sK88fz1yo0mnGuQqV4eHo2cpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIQSCF0w; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so14697495ab.1;
        Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193580; x=1754798380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=;
        b=FIQSCF0wlpPhLv8SGGW3bZTlePb6bwnB7N0wMIL1EUSSpV1mk7pLeTHb5nLeRBjEmD
         fxzrRL+Se3P6tSOJONy4j4bIHk7cVF//50VeG6QVQpAn7oO10tqDqiutQmVDL1hAxyTH
         VQga+MzR4P0iYhpVLFtvOqLxljfC/+/o7RM85cJ4nJAVBINmg4P+/E1JDsKs9igaeC2i
         leO/NwRedg+EN1j8kWeFTNiPE/pLinQFON8xgtz2CMYlttU8hEf4NfwSf9BU+Rdhrkuc
         bLd9gWvk1PBBlwPKv2tUZ+5xkH3EB2w+b74UQs1HUdXO0mbU1YOlum9pF3xBGXyiI6pm
         bobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193580; x=1754798380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=;
        b=ZsSy31kYRDL5DLK1I+9nNPrmWoK6jgfyUC0Cye+A1er6LPA8loLGJBntO6Rw/2Jhco
         zL9rxB30oX3YC68I9Y/uMoXNt6LFTSee8yrxkVr3zJ48YdEADf7ShNvy9CmUtO6SL1UT
         wn1yz4Vy9Ey6Ds+mhS2etKmQK9preXyKUHdqOVheSeMPU9gUbapuQFtPhfE6wzJDnZM0
         s9FpkQB3kW9t7HUJWNUTlmp8bFDnO5mL2swtfgTm0op+O0Ww0F7POMznwaXJNu9G7Dzb
         mUSxYY1VbrP3ubFNAFDlzzLitAIJdUZjRqyWTcrmODboqpBIiLDR0sAXq+BGwTX1u0ib
         X0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFZZfonwiGg2gyMFZH6XGhnqoV3YhssoGuUWFkW+uVVWh0kc6Fd9JVl8b9YtrQVAYpLnIxR/L2nUmuqDlf@vger.kernel.org
X-Gm-Message-State: AOJu0YyKHD4/QEz305eSUW1m1U2rWtb2D5W7kth+M+ukd0OGK3Y1U66Y
	iqc0qV7luCecC0tBFQs1RDjrLE55WIzXz1OWAXJqMpjIzWh5Jv2Sa0s5ylUZuwLLl6Y=
X-Gm-Gg: ASbGnctg59N6wEVeFEZLrmQMRA6m/lFsl5MeizNZJNMFwB//7LNR6AJ7KM32VvjfNul
	YfveiK6IgOFEjpmmJoV4VcHoIRQw1jn+xXzc5izKGAfrYyIUtnbPKS7IlT74NNoBUp2stBPwLzF
	AqkrzfkEGQnasXEH5jtFH+/tBU71jjODc3zBUTmu4PIyazAdZrksKh5m+6FxYNzzPzzwOYHcFnn
	H8lX3q+oL3xEpSCtm+DdzpBxrhwFLqenyfFtkVqfGzRK/dFLpN4cAeo235yBCkCS7mpNFOTUwHg
	JBjgjSnBHSdf52yuLbUZacmjLulnO4z/Dgc2DovP9uoN6WpDZ/sAtR4nEKcRcVED+ZJy3jORnhN
	F7oVwlTPoy6L+7+mdLuffO8uV6Aa4JNAxYzwBMrEjvvMbyXOz2jZG6fmQm/YIblqP13QIl2zHrt
	g5PFON2q6AN0tl
X-Google-Smtp-Source: AGHT+IHMF0Stckwb4tgrilrVESFlmaGnVXMaPmoUxRg8HxQvWlfXjPvvkTeyvK1bWCUd/wSr8kLBNQ==
X-Received: by 2002:a05:6e02:2707:b0:3e3:f9fa:2c8b with SMTP id e9e14a558f8ab-3e41610837bmr85829345ab.8.1754193579730;
        Sat, 02 Aug 2025 20:59:39 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:39 -0700 (PDT)
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
Subject: [PATCH v4 45/58] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Sat,  2 Aug 2025 21:58:03 -0600
Message-ID: <20250803035816.603405-46-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fba..dbcc8ba70dfa5 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.50.1


