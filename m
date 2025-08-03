Return-Path: <linux-arm-msm+bounces-67572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D8B192A0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7ED3BE5DB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A80028C2C4;
	Sun,  3 Aug 2025 03:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqOTBbn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83928C032;
	Sun,  3 Aug 2025 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193596; cv=none; b=faEDduL0NcIjx1vKucNkxSSRmg/U+tRiofhO3f/A2szDkjSbhO8QyH2HAtl8v+d4iQe6Tp6Cu3sJMRN24/KEpTrSbzkgMq5SDAd1myLqXSFLtMd6WlFPGVrgZuY5TqchzZ87Tzop5L2rXyogaN8PYEzAUgOSQ8ylgb/2vtVhXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193596; c=relaxed/simple;
	bh=JknfdaXi8hjrUfCFrJlaKqp9Ypoqe0ctXIo2vRiUbuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seXQatf9SMWe1bS4pJOHesVIMkCbVAfhNAx/PMHz4OFINdIAoahcdg/3BOVl0ahLc8pB9Zr7/tkEmV0u7W09PunxxYE1b5p9uPXmJ4uti8TXY9jorVV5fYU7cjP+d3src9xfXndPR3fEP9M4FeSkiYvejc2RVntbfkcPWIvpVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqOTBbn/; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e3f0f29d09so9438295ab.2;
        Sat, 02 Aug 2025 20:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193594; x=1754798394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=;
        b=RqOTBbn/oBAdy9ld+J3qpLGAdyWCibL7JRKFTP+PUw2VoKeIHQGX/CG2RVuKUZwdjF
         uRufyJJ1HLi0qT49WF5Tc+dhtiOlkmuOdI0xkyn3NIEHCfymJRDmL4IzB7m0xHGW+8fH
         +73l0sj370qs9EhH7R8eFD6HmggJGz91C79z17LgO92gNGuxqYtLDnTeNSr9h7nWiFgG
         KgL2f/ba5A6O6o0kcOVsI1e/Z8Qu2gCGO+bZxl0H0+Jyvg30Rngr1eZBGCd9vBm3xYYC
         2nfPM56ittJsz9z7ZheNi4sndyptxRpKfm0pqt0RsGBGmQJ1UVY38WKCsNIAIbVmxViL
         Oy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193594; x=1754798394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=;
        b=fjJ/sYKSaSgHneUz7idW5aav1hVGk9EyLioM4nP/HsegEpAu1B72fYELH5b1iDBWYy
         Qfs6pbmsFfAn/E7PNdzcM1mVrbGbCoejI0aVdjuJ4z8JBWxLEXB1N2yfbGf0yEmZvGOA
         4STEQkxaSZdcY0CA0pPfWhZ+eeul6RmI4vXc30t2bGbo19LAhtzfRp7OwPdovNIcFFUO
         U3tLrwoceLm6LWQiiY4g2NN9jPsPYmdxE/BIMyxL8RBOTBe5SK5WHJblHXacGCT9Dqte
         JBOIwLkmg6csGz3LdQ7nbUT0Nk4lqkjFW9Y1FxGNQxes/BCPF1CurUPwejZ3FO8QLwL0
         e8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8uW9TxTgsd0hGW8n+miDd49N1XcuCujhPZ9R3K7pO6ZQPfm0QQRjHgIbyjBCqWlkyEAR2Nk3I+mwsJup/@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJhDeJu8mX4GVw1Y9a+SBFnWKpEyHm/W3X6lfe2twNfCKU45o
	AviwHwp5kGMaYl7iZmjJcR4eyN3sliZcPkjSpmtz3jrfXK3FrEYpCMECRURKOrF4hFE=
X-Gm-Gg: ASbGncvuoRi6N3jp76rp7mCTM+vy2vlIxZKr374+mBHdEIleMvTbPm09aIbxrJODkni
	WG9UKKVpo8pNEUzyx0GtLa0C6Aba9/2gx23GzbXbtlMTfDcGS4mHTIUDjQzP1hyCAvO2XayRm6X
	uxxvUW7OL+zMf6FhbD1ZpYCXiMJ16YJ4lr66jd/BclmnagoJxe6RtA8Jkm6ZBdPqb59B+/HtWqm
	i/4LlJeMxGBJPGWb1ewCF2nKyRyoWp+rOigt5p30lq130x3PLDB0QxzbuV9nl+PqgMIXfd7RyoR
	pJrKUenGugZwbpjGR/WAsvQYSFJLPzPt1f7APUn1PCN4Irn6EOEDVH+uNszHbXEnoL4u3V2pnqb
	Zn07Baw5UscZjqjHI2uU5D943n/1SOZ2ZUIL4yQsI3b6fapurGauVl1C46QN6RRgNaTCjKQSi2i
	scKg==
X-Google-Smtp-Source: AGHT+IER1czj1M603T/fh8PrgV2njv/OOVXJjWBlMXOa06xUmclYSmV1HU1IjXDssYCVHfDYAb/JPg==
X-Received: by 2002:a05:6e02:e46:b0:3e3:cc1b:2b5e with SMTP id e9e14a558f8ab-3e4161b0466mr69757435ab.15.1754193594065;
        Sat, 02 Aug 2025 20:59:54 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:53 -0700 (PDT)
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
Subject: [PATCH v4 56/58] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Sat,  2 Aug 2025 21:58:14 -0600
Message-ID: <20250803035816.603405-57-jim.cromie@gmail.com>
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

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index fa6ee76f4d3c5..333df32c2e181 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.50.1


