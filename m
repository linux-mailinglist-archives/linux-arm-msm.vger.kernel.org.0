Return-Path: <linux-arm-msm+bounces-86137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FC0CD50AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF30E30285BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B059C32C958;
	Mon, 22 Dec 2025 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO3/alo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1A32C320
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391898; cv=none; b=Bntt/sUyZI2JwwaxK4n/8OLdUFzoOHwywPp2Aukogm1wKZWRWsBKsibFaKszW3sMmDlywtuzrl0uWbIphD3YUFhMz9l5t24xp0fTNU6AIbJTVU46y+c0ypcnQc2HKG1j93iD1zLRcZa5LUZXdGkFQGRsKkMJNCWz7hzLQ9xMSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391898; c=relaxed/simple;
	bh=DLGYLqotnJ3r64tEQiOm4CWPKlpXwGXxjO6LBdcTYjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaHoWap5QD4n/UDN9OAuWqMumwB028VUfayPIscsOCJZBsqVS9qOB4eQcmGEklt2cM+2whCoRvv8rki5f4Chme0PmcGjgd1+Lw6gl6XSPoeDSpgB6uDQEXE93U/5sh0/HF1K5JKihcji3R0C3HCC7Cd9dzzmAt0r4zaQuzr5L5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO3/alo5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso5332287b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391896; x=1766996696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
        b=CO3/alo5qNZi8M51kHbHwOHnP8MEkvXrDU8mZEdEQkJ+Oc3aZQB42Ymyf5PdedYH/V
         K8i9+UDOL0avb2m3lrJT640vYEz5gnRwA3P4d7VnegSpCqjXn5qBBuhjUELkVHt2Nked
         iXAVBWRPE/3HZYLmA0z9/Wzk/bJM1ZcsSRJSoZgUlPvaWOLkn6EERo+YC0qIkVkpliJu
         RXe8PqH168CbBvEfLb4iNAuhi8IbDCgYx5iw9/XrtsGrBGIs926BNyfFJT/Ufiu+0heN
         EHV6gz/kkwc5sRUMTY3wq5XXnnbYADUhqs7zE0kw1PiQl7j1edgPJ4+mfev3N2RL0sUx
         xhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391896; x=1766996696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
        b=gh8M8bLD9dNgOyEeTzyz6nnjw5AZv9+AIwqIRnnxJ2/amuJd5tPYoY4U0tTDkSX8vo
         1Sm7YsY1x2wpsao7lAhXBM1h7I2y2ehiZeEH+jy/mPJ0KMQwSm5vs7dGe9Ur8VsyWzTp
         Pg7yIeiBbb/iqJR5c+7X5xwGpxStMH49RKem2vm3ZfJarXt1+PdaWSEQkocAxSSIXgs9
         KnE58GMkJuNAuprpL2OwqcscN1MN+nyVJl47lan6ENU305m/mQKjdaMWmJ7xWeS29IfF
         tjG5e21EwzSikxIppYCdA2bhB8Ru7Pw+7PgXT1gSgH/AS3jICfgRCiZrKBKJGAEZpyA5
         ShsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzrLlNqBQDB7uHIWb5OmL9BHUD3T7c8Z3od/KKo+snK2HIy5TH6TJPLxOwjM6ouOE8KJGAcMzyMQOD07R9@vger.kernel.org
X-Gm-Message-State: AOJu0YxUn+E6J6mgp0FtA8skJEleqwDxvdSmkuUoWRtdNrfHqVvXOdvY
	1tg6UcKlKoNrWxwy8zILjpFJTQ43/3fCSYiA5Hnc1u7A2VHrQMHLWcc3
X-Gm-Gg: AY/fxX63/j6r7ESxDtKv0eXsHQSpqvOqp6HDqP1jh3yx6s2b+ODqc5wXbpOfMBOoMHq
	N4R/CRVcVK82cO/IkJtlUM6ATEdBxIlM65VEfuapeEqZuTGvh24PWG/dqiwZF72s66kRv0D1n5U
	a+7EZTPyERpJFreAKevWFJuRMc2ueKCLKlgDgAwTj3rZU+PP/nmUJ0MCCzan6RQwa4mPUSmu3RU
	oFsDXkf395cXtts5k7AR4+jYyl5yYvJdTioaH/B70JJ03WpjgNdbKchtKaR83MT/SiYD6pATftw
	0GqpL18rt1LyCr7EMqDX0SN4w562ZdqLaDE3XmHrx+dgmem2ifw4A0Gmw3FXK4ZXGkKfeXBI+CA
	bF/2KFVcYZE+EHU2zFYVoRCXX98yzf77tETlF3T031CiPPDTsnts/NTQlWzizXx+lFH7fqjhSFl
	a8zb22svWr
X-Google-Smtp-Source: AGHT+IEBN8n7tfe9iu0lB0z5JyKVlf1YDr7ixcXKx8kSouS/KoZMy7Fhajpfqtky2YSRXNA/9ikrkg==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id d2e1a72fcca58-7ff650ce054mr9990683b3a.31.1766391896403;
        Mon, 22 Dec 2025 00:24:56 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:24:55 -0800 (PST)
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
Subject: [PATCH v7 20/31] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Mon, 22 Dec 2025 21:20:37 +1300
Message-ID: <20251222082049.1782440-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d543b84d447e..c4ebbccca5d1 100644
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
2.52.0


