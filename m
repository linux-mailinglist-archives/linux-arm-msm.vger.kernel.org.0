Return-Path: <linux-arm-msm+bounces-67550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE5B19274
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362783A9AFB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874F5288500;
	Sun,  3 Aug 2025 03:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxq58q8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4542882A0;
	Sun,  3 Aug 2025 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193567; cv=none; b=F9JTOb6JIuIw6+1z3oedS1eTW868wzXUBQXrL2GK+F2RlX8LDBgoBLVeUaLtt39KUKs+xVQFIqFgORLdVfTQ9NBX4LhZfdUsLCdpWhsHNX+qRm5Iy1V0DHYS/AnxEtm9++JuzheWGoUpSLyS2WFQ3dP2XrbFbvEJHhcwf/GDn5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193567; c=relaxed/simple;
	bh=LA1Bxp6ccKS4RMXz0bdyr/rvpCjVEFZv3WJIX+Ftijc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Orr8amHaEKyL1SnWNJaeteU4NX65ciaONzyndjagvbUGUwFUcH56mFvLw7NPlSWDkHUttd+hOIpOwha44RtUyEIOml+aFCp0ieCyCx0B1e/r8HWOT3t1EBLAy0ygw6zsOX82xmBPHj8g2+zR9NrZYA6zs6RbOjZXfoVyglsWwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxq58q8C; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e40050551bso23420185ab.2;
        Sat, 02 Aug 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193565; x=1754798365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=;
        b=dxq58q8CgminzbFoCuAL3rXLb+Fn5iBaOr6y5+X/6XSU3qoRZvnfUZ2qKXDxvzIS2E
         nWAB57GLW6RCBUoFGQliMNnw6TgCy3i/P2rrekw/oyBtqoPPCZAIb2NhkU+oWPy5BTV/
         5COB/TN2D2NT20cF70sS665mzQhCyDDQJcCGpJaEDv8B0JgPwMr/3E8UNLoSumupp6aC
         G87t5XDW77Ip2u3MLogOYVF89ZGuLx9oCo9v+fiioGystvmIFZ90rA5zNWiPjJrGtAJz
         0Ju4QPN3eGdkl/NcJjJ144vHiBFUc9YfDH+MeOZQfflui8/wFQcXOf41FDvXWoKy/UXU
         WftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193565; x=1754798365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=;
        b=UVBgTMhEPi7xPdi8ugnMKwaCj7aigaPfK+e+cOyPVVQaFVmUd31pITFJUI3TLxtm9f
         qmV5612YBrSOjaV77rzYBT5WC4oZ/N77XDzkbxnQQVxvtjHKXmIpk2LtAuFso3evE3sI
         mzfzQ3sTwb/aQimaAjiCFnJTnJnozEOsBS7bHSIorTk7Or4bp1NYBIK1BPwZSO4OtHy+
         mbLy5MHrEg9sqK31EZe9im11DL6KewZlnH9LIr7y0u6zmRiaA4L0cbmB8s7Q+7+wCklw
         x7EozvAI38HmXiiFp01SgYBOqlb9cbEQ72TTNCrQSNArcr64Q1AVSUqBBoa9MDCZ1xTj
         chgg==
X-Forwarded-Encrypted: i=1; AJvYcCVj6OWm6ucnx0VMBzs+AYQwup4Ov98twg+DFrPFZ4RZJZPNJoB/tSyScWX/nnbhIVhK0JvtbzZLWTGbj4x+@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvYs9OhzVuOwmPL8rq7d1poaacE71O3SzTNx8oq5rEc2GlDw7
	BsCoVDC/qbu3lXdLuWAQTdUw2fcy/1BEffXu6S4IwUBx0x6JKIpcgJA5uu5+9VyCWyI=
X-Gm-Gg: ASbGncsDcGNsYTriLLRtVzwe3WVc9t8Sl1Op49w8Kx4U+kcUWI5QI0HvJOYVRZjsLmB
	76jpS2c78gnTQichgGKV82xmFxjHHgqoiGxfePT0z3cUfnOGXuxjxsj7lKsIZyI3RU4AUaVorPH
	lV0RcRyIZqTWZxTL5DV5A9hRL/uK3QPY8yhhRE2PlyEXZCMy+0c5hlFegJjpSUyKmMiPusrXinL
	42gsc8fvQ22r/bDP7wwn354aFiaKVmYCVPjxjQ9eo2/gkncgVjy7rdAIfgtHjT6At6zntNYVEJY
	xKZKdOVmKJYMSMuZTm9sl/XeYzO81wqfgj8u7kGtaae6lQQhxZ7Qi7h/rXQYZjIzobUhORPNrt7
	OnSYxiK2I/Ua3rQOyLsBOEa2pmx301HIRs9mQAsca4xF13Rkp9fi+zUGWPhJ2PVPOVL2nxLTMHP
	QNbbkizdL/tByR
X-Google-Smtp-Source: AGHT+IEcJd96ZbRdB8HACajO/EedKr9dmR2Fy+zza3wMWxlrICb3NJAXPqemd5+ww/dq/aKcOT0zCQ==
X-Received: by 2002:a05:6e02:1485:b0:3e3:c6a6:2799 with SMTP id e9e14a558f8ab-3e4161e006dmr101903435ab.21.1754193564670;
        Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
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
Subject: [PATCH v4 34/58] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Sat,  2 Aug 2025 21:57:52 -0600
Message-ID: <20250803035816.603405-35-jim.cromie@gmail.com>
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs a classmap (in DRM core), and DRM_CLASSMAP_USE which refers to
the classmap defined elsewhere.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
this ignores a checkpatch
 WARNING: Argument 'name' is not used in function-like macro
 #70: FILE: include/drm/drm_print.h:148:
 +#define DRM_CLASSMAP_USE(name)

the macro is empty, and correct. only 1 arg is expected.
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 79517bd4418fe..a3b70d104afaa 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index ab017b05e1751..03b0a2bbf91b3 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,6 +141,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.50.1


