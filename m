Return-Path: <linux-arm-msm+bounces-67534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35120B1924F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8838A166666
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10C1284665;
	Sun,  3 Aug 2025 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms1Y6ENr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD8283C8E;
	Sun,  3 Aug 2025 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193542; cv=none; b=elxKOhG8fToMBk/ubwETEzkVKN24nrJ4dKHDX2KddGTDE0nKSQQQDGi/CKn92Cr6Hfg4iMyF20cWGy4OX6fiadaP2if3nljqQGjjoliogHhzI8+niie8VTCIifHI27pfDea8xESWc4vVPD3LHqQyjMQeru2UM2ZnV/ja0jTK060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193542; c=relaxed/simple;
	bh=hwd4K1U+dKls1ayEPAWsDeMY0d8xsvm4A86uIfBoNWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+RHJiSTv/6cw1MYeKCkhhU8ycrB5cB3whMxk2oq9ZeZiP50X0vEdMuv3vlT10JWb+oU4PlyAAFd6WKAH/Cl82VxtVPrZZ1L1rZYNaZewqQlzrTB+oB573fL7Nc4QHxc78Bw0fm0O5S8BSl8pL1VU4sf2yQyVuEChhV0exDuQPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms1Y6ENr; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e406ca2d22so10975475ab.1;
        Sat, 02 Aug 2025 20:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193540; x=1754798340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=;
        b=Ms1Y6ENr+Qey5k2H4YQ15LXLmykk+RbCG4EW2ZTNtoTDG906Oy55aZZVPQxkgM32Na
         q8JOXlJR+MO4JtcWfQ1uW/EKdZg96xwLYZUQwtwkJxbg0ZYOeGXXsQnr/8xX0pt4Chzj
         1Bl9jpafw8TlOfH3jj5x1yLZm6HN9yo5WV1KKCnk05ygaOhVfQ+MeSXwVcSnMHBEQWs6
         KwYyxocW0z7/U/OehCMMPlZg5zhmHtx/wk0OxGOoiYbHcD1uOJN6GfUHxg2NhOwYX7yZ
         qe0QXHUHc4VYem59yHo8GBE/Tn5l+uyeWakoTF4dBG7uH45IBUWozxQJfUu3WlXGObuQ
         gGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193540; x=1754798340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=;
        b=AOXJsL7T0WgF+qu0BLzpkxt+fXvP37oUp27bSckjwFyR6g/9KWx+RQw+RBBoYtymMq
         R0SbWvfPGtyQH8E8/Pne0YudXLtWbGsbahee23lLNatJJYS5yVFY20FNSeqVXfUjOY62
         hYERjYUOdB9LO2kNrhkGHBc1e3LHzjj3P7T+C11hdK90PBi0jMQOZZk9fapg1s2DXiGS
         KsyNGdQFmh38GUDJ+h5f8PAg9MTaX2sBKzRvz66u4H9bxkXxB++I/t+65gip5+2oVw32
         dZVGf18opuREr5n/DEvEcGpvNh+rxc0tqDkTIynaUSTwtQ5HQjn4J/v91DKjLFvYZkHr
         RQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCU/egrGmyJT0+AeOUgkA+Y0B6U/c+HoOg9fIFUhddsuHZonipXNnYmlKLZd9YrZs2u8Ku5L7rp36JMUg/67@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2GbhUGpBp4ObbNI6F6DiScCFAVOYhGK995JXAp9zCMCIhacdU
	Um30WSoZKcaz9P+0rtAZCBBlNjvoxVtBDxMDa0tl6vO50SmW5Rlohda/T++CNgfpY08=
X-Gm-Gg: ASbGncv7bAEs2II73dSdNcg2NLCZ5UUrTG3UAEFyfZriasvIN04p2Yh3px8A9kB6b++
	aJE3hwekl2dGhIoy+kDsMINI0YMPeyBOGPkO+pb+zd5mPQYAv/WB0NednAY/Q+uQ0zGB5yQxrzs
	iJY8VYYHVlweYO9DY98ttUjvXdsrSwxgq8uRwVe9SzLiNiYh2gsrOFH3JGdw+3migcpWpriw4Up
	n8Hy278N2dRQyHdux9rJV2So/RfxuHXYRrUGWoArJuTjqG7dKfQcYfMY/7ZEZeHCDsZu5VU5AFV
	ssTLG2w7z5d6UrbS7Xza5rYY6Imt70mCzILtH3pZcYfmL76AxjanosEHexGGyGYUcnxlCjPn+VO
	dxBz0hwqcI0tC/9vgc0A7ErtEonZUmBA9eNYVuOfFOTBm9lf40CKCJo1UBN0Ip1XKLbv5tsgNPz
	Ckdg==
X-Google-Smtp-Source: AGHT+IHGjrGeB/JwKNMq2lNHvYPJcP3h9GIpyCQ+sHPo7dWlzj+a9+9jFlwqwwnEMpSJYhvD73NT9A==
X-Received: by 2002:a05:6e02:2194:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3e416191d1dmr96253475ab.12.1754193540188;
        Sat, 02 Aug 2025 20:59:00 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:59 -0700 (PDT)
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
Subject: [PATCH v4 18/58] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Sat,  2 Aug 2025 21:57:36 -0600
Message-ID: <20250803035816.603405-19-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 769f02456c8e0..1785ef5b93b15 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.50.1


