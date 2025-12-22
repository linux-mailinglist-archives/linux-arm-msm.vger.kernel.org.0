Return-Path: <linux-arm-msm+bounces-86126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2BCD511D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 720483041CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888FE329C6F;
	Mon, 22 Dec 2025 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCozcjw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65B329C4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391772; cv=none; b=X9Jljr1bmmMDquDHsz6MADxf0Clz2xxn874Fqs4o6aXtutY9NGEtPrFFoY/Pnzce9Z6q96LEg+P90ebqKkT5c37Ag6eQKYvKZeivpMfnDTEsfNwLVO2UCelhkRTxD4JO6slg4A7GCj7thlTE4INHkJzQg8nBqsRNaJwgATqaBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391772; c=relaxed/simple;
	bh=wepq2o8x4t8iETVUIn8EzyPUIPyNNDfZPTFTI/EzHMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISQ9cM8WKM4wLE3MSip1hoh3odm9L5D6ZWjmKdukZ2WDIE0CNDUR2FYJiHsRuYsLtOGq+T0bccOoDnDW5qVZw53JJsELkdFVHIAhdO+iysQnHZMkVx9PTcTW5C9vw5VI/RIWaQ7CtYTxBDgq0yaxY3pNrPIBLaxleyZV8SHtPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCozcjw4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso5330117b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391769; x=1766996569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
        b=bCozcjw4KlzZqsHOVlJUoHGdt9DTYgkyLUFugBLwsBqVo1G8AAC2otAfAoChTJqBan
         tnCSftxHxzZR1ZFpq54q8W46+/PF6xj00V3HHtFQxsbZ+kkqCXMNYgKb65hURO/9XxdB
         5BHBORBYvDekHuuuV2gTTK2KHQBNgHs2qiUryQq9gz/yP6aZTU+pbEEyFKDxSig2Ktpd
         RMo3DGr8ARDs52wOG3f6D4ep/OdqcD+bDGpRp4uBAjqGfI6QBEJOrQsqkCaLFPv+h+QB
         4ATlc0UdBvi5RF4u6XoJ88ir//fmHrAw73vj6tVJgDq+gv+Msh9qvIWpLKC8di5qVOKY
         FFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391769; x=1766996569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
        b=Dl6PYTslKLU1SP384sh80IE5krfWxrq19q5JuyNXojGXMyYsXCotjJOOJNOG1tvszg
         HWyHIeaShZeYbNb1hNfI999BeRS0gyn1yeHOfkoJVhRFeN6SlFh3FvqQAk+4R4PTCMtt
         wwgE1fmp+zr3QzLjKliiHA64AN12g8t0LXO9PTygaq8PRJPQUWLHrtkORyse2Gi0RFrr
         oVzmmQ0RftOhHP+f+qdDvBRJfe9oUdcmJIz7h4MtVd4VnQl1T0r3yUkiKvFy0PmbF/Rg
         Wv6V6ry18dxvFyVWttmo7QfIvWHogCcnyMIN3zUSplKrLAfwJRhIlmrUVKEyoYRnrheo
         rTKw==
X-Forwarded-Encrypted: i=1; AJvYcCVW+gEKO1G9yAzMn3pic50actvGQPumLNk29Fc3rdANqCGMI+HWmnlsj0QgRvKnHeoN2PdrUhN67viqsDAt@vger.kernel.org
X-Gm-Message-State: AOJu0YxGIgA43lT7tF06HcD+IcrUQxdo9D+BXVHj1GkItsCi7p6gsE44
	WEVtQYdbBDfaynk7v7y/YROhRqimJrUdWOyj23JPRE/BUsUk+HNf94EZ
X-Gm-Gg: AY/fxX4YwRs42HbLgnGMWqXoxSPqScXKG10GkvTtaW9jB/CaayUheqAGFoE3gAAQVsH
	hSAsYKP2ZoOwdR99r+9t+M8hZtSasY4l7VZ7Gi2+Gzh8ERwZ7XQ3P6TNtTAlf5Uk8W98yatMb/0
	Ucgz1/mFu4fL4uhTFDroegyr+WoEQFSSQtcgWj8hR+mcL3Uj9ccaYDsAZmx4fu4xbZomd1mcuMb
	M9LwsjN9sc+yEt9AliVKIEJ4nYFvfjPCqxhGYIBm7m5CF1XOSnkt2krt+EGJAG9rRmqyk+NiBhW
	7tiPBj0Or2fmA92Z7eGoEPCCyBki1M3DMElC5cdjRRCa/P+o0HYi3GXFUpUgUmV3J/40W54b2Ja
	j+CKqP/6kpg2H/mzQOtXR2/pu00RZ7gAypYJoXDBbXFt2ZlNDjJAhd4WDQtZrDtlubL6vH61ZBC
	jPksdkZpnY
X-Google-Smtp-Source: AGHT+IGD08I50soJcdL+xzw0QhupyvnNGdXij4KQgDOgK8/wl2+Is9lHSt1ytu+E7hNdpFYZDBEOMA==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id d2e1a72fcca58-7ff650ce054mr9986499b3a.31.1766391769458;
        Mon, 22 Dec 2025 00:22:49 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:49 -0800 (PST)
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
Subject: [PATCH v7 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon, 22 Dec 2025 21:20:25 +1300
Message-ID: <20251222082049.1782440-9-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4b7c3b997657..c4ae79f934d9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -131,11 +131,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.52.0


