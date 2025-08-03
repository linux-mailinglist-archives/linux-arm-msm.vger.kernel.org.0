Return-Path: <linux-arm-msm+bounces-67522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8FB1921B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D699E3BB3D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7910227FB15;
	Sun,  3 Aug 2025 03:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkBVkO02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7227F183;
	Sun,  3 Aug 2025 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193524; cv=none; b=UBUHL2uaKtpRubbjESpWakqO7381GhgpikyK8tMNz8wOa9nv/6R8l5G27aSldz2Qot1uzXYLDj0SfmDrUJRHpY60yjyVA7JL5OMyr4y5aIao3qK7KCKa9ies3VfyfA12CU2RHdfmGAIN+mq17jB4NVswaGpBG4hKlsc4zP6w08g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193524; c=relaxed/simple;
	bh=cjIzNBDsuwE2q6F/gVm+brc7k7AexJB0PkNGHr98X0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtOKGmG/dmlnJfbvt9rsAplLR6MOAnKwPt+wRdkwwH4A4iJuiATZz9dfaPXY41oQ3mVFj7naLkeOBXsoyy4PK/Fkbxq4qu4sSrki1ZWxgmPwRqnPN2jkny9qaRsWLd62rirHB8TjCmdYlSXEApKjLpj95/sWou0Af7c323Sh6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkBVkO02; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e40212e6ceso14461785ab.0;
        Sat, 02 Aug 2025 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193522; x=1754798322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=;
        b=kkBVkO02GZ93RfSwJt/OV3017ZyOBxuMLz1foqSr0C4OdZihxx2YpZdk0vc6sN9eH4
         hHxCT7VoeLei1nYe+AJGNjC742VAf58c/I/KwRkQXwaUXmX3G9nSjvCosuY4BfsE0qjp
         DXs6bP85/rAoEKOzJU1lwOoW2k2MYGlCljWUfBLH9TNyIh3kyRJgTPSVlgR7Lf12V/MW
         maVtC7L2Z0wPu5UMu67wVFGGHijAPmvrOibcB8xqXR5aDtcSOhZXGYNEpbRi4g64rxMY
         snPdsios7rjwNz7flYHqIyL5TGHMLU4uOih6YpxjuRi+cps8YBM10RNVi9XqwHwuQ9K3
         TTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193522; x=1754798322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=;
        b=j0zNBZOWguaX8nmHC9io3vVqxA3gZiMO5VFK/iFafih2+L+1M5O0ePumdlpAAj36mk
         p5EimqT5txeTbhIvsUe5nqijPZj2ypGROsxyFXRPEOE01wi6o9HTeblAoBEYAjvvcs/B
         7/f9u1ukVSdZrvO/2ZuYkcP2gXWRiftgKI5Q7PdinRbxnPXVCiWHJodBKy/SbODym15F
         eKgkdtq3mXQJdlc3pzbMtw/pu1i9KA5SQD38qoU8dGyQALHg/5ydXFyLJZrfvfnRbNPY
         s5XmkGsSE/G3owH+/O07kMKgp/PqWIHMJaBiZZV+f+XykuB1DKOUcSFXXMUxyNH5cgjP
         JPTg==
X-Forwarded-Encrypted: i=1; AJvYcCVO5CLdwTUOtAPCz9yPkpoYvXNlY1LaxuD0cvFJ7h/a8qdSaNdYFwSxdHZJ5Z7qPOPehEBY6gzXxpL9/+xx@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmFPjhw2zEK6fIztJdxP4aVcYdIhS7C0nznZ+RXMjWu0im5i7
	xXGqtFk4fUb9oBu5ERrNKHz530XK5E4HDAzfS0jDXfIUAa73Mqg955b1KXzWKOuZCWI=
X-Gm-Gg: ASbGnct7g7dBo23HgZ2M06UiBSNUKoip0qk6szJlSEvrS+JWG/FfrYbTgXmxEvBpWSA
	Q2PW1TvlLncOck3+YOpN1ckaFvYOOgQjkQYil1/3azSBJsbKjYWMfDPknSxPQJ3cijmg0cy982D
	GmG8U2HxJN6pSPn56HGIZBnvjPx76qFjE/BQeaXU0oCoQVK/irLjMm+3s1LcezbbZwZoVMwLa6i
	5u/D+ctpsFGz4jiXeFXxWkYpWfA0ZDKx3yyQ7QmYGbV+r/UwOozFWpPwS6NPXdWc0v4tfqEqgf+
	V3G+VylkbiXLDTaFCm/3kgl4xGZmtkOi4seBHUA8lpxRC/rboFNufGuJSr6vI0H5OOXBxsFi57P
	zdvuZvTSUbztwNRz0zHI6IVx/o4iDWmAgPfQQcf/WuOB2wV585FVCpR6SHIZ9m9sswhIks9wPYW
	WcCA==
X-Google-Smtp-Source: AGHT+IEBPg9osrUDJ2eMDLZJ8n8wcDzvlf2PJNGm/kwan5N45OjUBgHKkKoWTIKMjcalGwUYti/UbA==
X-Received: by 2002:a05:6e02:348c:b0:3e3:d674:6754 with SMTP id e9e14a558f8ab-3e4160fb6fcmr87580415ab.3.1754193521740;
        Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
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
Subject: [PATCH v4 06/58] dyndbg: drop NUM_TYPE_ARRAY
Date: Sat,  2 Aug 2025 21:57:24 -0600
Message-ID: <20250803035816.603405-7-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7ca..ac199293d2032 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.50.1


