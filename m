Return-Path: <linux-arm-msm+bounces-99862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDxcL7HUw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:27:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB0324DB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8874730FD05E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476AD36166B;
	Wed, 25 Mar 2026 11:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rniPaj3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6C73CF677
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439204; cv=none; b=i9/TQ1DrKbOHQivh4vN2XH+NwXA4w28QT2maCNH6TPw0asqUwauQBgxvVi6dk5rgseHjYHXQUH3+qMDW3+TBXxRJTL+/NEgrTzjfcqNBCqcYEVbRWrzeEQc26FzDUNwzo991pAW2MBboFgSqOHyrNPFsRR6UW/ndr7DdSdvVyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439204; c=relaxed/simple;
	bh=Ly6IC9Fz8h1DyU1e0Ndd9ZWVflSJrVz9ndtt9bADr1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sl+IqCdR+h4T2Z8/BGo6FN41/9cYxaX2x/OBxNzUjM8I3Onxa2UP70PF9ZxmauGVhre+e9Zde67MA7ImZLuP1V7xTFLTRJG9e5HWO3lH/FPSGmL2x5Ari6OoOLOw2URdO13sUC0dfjt4UePjd43dxJi/RFI+483He0IgLsQ/kcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rniPaj3J; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c124d2613so346321a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439202; x=1775044002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcgLnCA0f7wz6dPCqxCZz9kXuIVTeQJ0aRrxBcbCgTA=;
        b=rniPaj3Jh/JEuk/Y8dGCYQg9uEJAXwAZ1DsPAjWLSs1uGReTRm2fROX9b+I41LP5d7
         CK+BCg8rSWzv6hh93o6goyhg58eLFG1FaBF81PCsjBsTh1VuCt6oBoLcTx2oei5RHgvc
         VtW1GgIlVQ8MRwhUbGACH1wogXQB6XQULij5hGXZEkB9tuiskgXOkcTNSUAm99zsXwi4
         CDb5GS+BY9x/HGHZ7J7ye/g9xdxhtU5mD8zKOWQEEswydas+mWhDGq60Bh2Z9Wc1Uq3a
         zcjaK9TnP5g2fzxQtYQcPksfdly4BduKj6+qeYquyJx+TtgbpqJR/BEPgMDf1Xnw1Qqg
         edxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439202; x=1775044002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcgLnCA0f7wz6dPCqxCZz9kXuIVTeQJ0aRrxBcbCgTA=;
        b=lYb8uh+4KL54aS7ukFJW4/tUKU2P5SRWGayKP0mpugiPXShsVvdkLiUFh5EwuE/UgP
         j92MLACBdWPskhhhhSOBVIX+5sFG/L5E72IJvEd5fKsjyJGejOe1uMtXbRJzR60pgFPp
         9+nNnu5L9/8OWPjkxbuCYIMPWLTxmdcfMNd+++3r3fJdE12oLRdHnQ7Uuk+eYdl5rNgn
         vpgdc9hGZXFpM5zRElJ96DZOjZvR2bXxhDhxa1NiFYPr4hcqdengoCmxRWXlQoaSJydH
         YzFhby2f0kHkISON2cOMfKJGClQx3ECmUMaWkmrCYrNjLSkbys3+RKr6z0zNJWhgMiSr
         E8gw==
X-Forwarded-Encrypted: i=1; AJvYcCWLL4oWdzRO4PjIxx4Hr0EPwVN6W5kjqEcxOC8m/5faKVF64uLOu5q000ThGglo/pF25/yfdDWH1DZL9wFm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqh+dIR3cVNShfpzqdvCU26cPHE9lvVdG8+VIC82XTDJtS55t2
	pXvPXxp1FBBBlkeLblKjp4p9BZnQ7TtkGF+j/o/QL/Why/fkyPHBfihJ
X-Gm-Gg: ATEYQzw3U91SL1gD8vpNDSQt+nyLczf83yRj9ijHc9TBEbpU0qF7b5POdbPY4D7Glb9
	EPrUbKttIiJ8Sq+vvmisjTGKXVsjBpN4LbZwlbEpcfpzFgJDiVGwIz+w5avF+Pqyhe527RzyTwc
	T/n8b/IvZ1vEnyeEBbxi9X9sQLmzyH2s8ujPtuZgax3b925KGyVnS+Km3j+vG+xVXkMwdkkF5zM
	WkoD3vORJ7/daf57o0Z1Yc8dGhgOVYt0wDrFZVHCptxdgqR7cZ6yYSWv0QQsX2VEsAUNSIwAOVJ
	fR8AD3bav0npYfvZvfMzHeU9YHCu+gERMya9z+2EG/HiDKd4/SChRnNfqO5h9OlI+GVs2svMCYW
	AGFNiMuMLD9V7Or8YMiN53zthn8zwsSa75sBRpHZCRtZ+79gr/br3B60MHpMH/YTlfsM4tM3iDx
	yHWQ2NAYevhL7jKm8kThlPLQQ=
X-Received: by 2002:a17:903:908:b0:2b0:669d:3a68 with SMTP id d9443c01a7336-2b0b0a15b81mr36980765ad.19.1774439202138;
        Wed, 25 Mar 2026 04:46:42 -0700 (PDT)
Received: from nixos ([240b:10:ff26:df00:661a:64b7:4163:997b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c36fsm234579835ad.61.2026.03.25.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:46:40 -0700 (PDT)
From: Yasuaki Torimaru <yasuakitorimaru@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	stable@vger.kernel.org,
	Yasuaki Torimaru <yasuakitorimaru@gmail.com>
Subject: [PATCH] drm/msm/gem: fix error handling in msm_ioctl_gem_info_get_metadata()
Date: Wed, 25 Mar 2026 20:46:34 +0900
Message-ID: <20260325114635.383241-1-yasuakitorimaru@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-99862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yasuakitorimaru@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21EB0324DB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

msm_ioctl_gem_info_get_metadata() always returns 0 regardless of
errors. When copy_to_user() fails or the user buffer is too small,
the error code stored in ret is ignored because the function
unconditionally returns 0. This causes userspace to believe the
ioctl succeeded when it did not.

Additionally, kmemdup() can return NULL on allocation failure, but
the return value is not checked. This leads to a NULL pointer
dereference in the subsequent copy_to_user() call.

Add the missing NULL check for kmemdup() and return ret instead of 0.

Note that the SET counterpart (msm_ioctl_gem_info_set_metadata)
correctly returns ret.

Fixes: 9902cb999e4e ("drm/msm/gem: Add metadata")
Cc: stable@vger.kernel.org
Signed-off-by: Yasuaki Torimaru <yasuakitorimaru@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e5ab1e28851d..195f40e331e5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -536,6 +536,11 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
 	len = msm_obj->metadata_size;
 	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
 
+	if (!buf) {
+		msm_gem_unlock(obj);
+		return -ENOMEM;
+	}
+
 	msm_gem_unlock(obj);
 
 	if (*metadata_size < len) {
@@ -548,7 +553,7 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
 
 	kfree(buf);
 
-	return 0;
+	return ret;
 }
 
 static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
-- 
2.50.1


