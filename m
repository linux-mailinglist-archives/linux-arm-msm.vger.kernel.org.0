Return-Path: <linux-arm-msm+bounces-93596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDkUFvj+m2md+wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:17:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A47E8172973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BC33008A75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98FA18C03E;
	Mon, 23 Feb 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eBzo7868";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lsbbhVAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB911713;
	Mon, 23 Feb 2026 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831028; cv=none; b=s+NDlThbUgOS5j3kQwQachrRNKNiV1HyANOQsdgXoaZR0Ov2lvTcluFdtPzRCU2mvDMjNqqQwRFRj6qlPuR0i9pJjdQO/LnmU3w1S25nKRAPa5u+qciSxrEQ7SltVBP06VEPDpvgxdoZrd4pvLVTraqfJ5BtRdKLxzRBCHmKQ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831028; c=relaxed/simple;
	bh=ydC9ZYn9dv7geOT9yMIAu01E9Fk5oooAlrjdOpuCrdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MGo71uDupHAJaRxphroQgyZQrYr3RysFwE8USitjQRATQma3vwnnDTWe3nWXlUZ0ogAFeI8hl+uRkMsxtWNFSbzH+Gl6MuKBaUMLM1XP0UEb0aw6LbFepjqcLILP6GkU6Ibx16Ckh1meIjYTJR2gtTODZS9lNLEJxXouKCYBwe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eBzo7868; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lsbbhVAg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771831026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vex6uUERTZKOlhlGWb5TA6tfr5M9Yt1JYhVsOWZcm6Q=;
	b=eBzo78686n9u2ZnIhKPYOgLMLM467PT96gtjVJ9Hn5E3cuh0O+P37zvX76JnRz2V4bqrbp
	453EdjLTWU4FjIfZ0kia01c8vCfkictLxc0gko7Qj/PkhEkY3eUsOnV8T3xK/EGJm2NEkA
	JgIealSemfCJyoZnSvwLS99EsJLEdMhgOl1BlFJvIBa3g71tDd7+jI28zogYUlXDL+w43s
	mzVYfR0yss3HjinOXjds+fBsGJVpBdbNlblc1Iyeojbl92TpF+2a/cUiuHb061hm6+tt3z
	waug2fFkKh1xHsqWxpDzvoVJEeZF8cgQAeOvtljAZXnXs995Hbg6y/A00fmlzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771831026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vex6uUERTZKOlhlGWb5TA6tfr5M9Yt1JYhVsOWZcm6Q=;
	b=lsbbhVAg2mt2OZvqKr5tfwVfNcBouubtHJAyzCgO6wOAjENeEi2Cmuxic1MOOcvPUH9RrD
	Hjh3PgKB0yFW2KBA==
Date: Mon, 23 Feb 2026 08:16:55 +0100
Subject: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNapYNXEQdtU83QKkkRoXh3i
 +Mb/i+gJEwKU1NA6GblM1X0bQPuWNNOyL4aTGdsZ8yAQpqFXSaP18kpkyhGjejtGga/hX7cLNT
 6Egr8/Od5ed8Po4sXGmkAAAA=
X-Change-ID: 20260223-restricted-pointers-msm-d6af3dbf14b6
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771831020; l=1609;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ydC9ZYn9dv7geOT9yMIAu01E9Fk5oooAlrjdOpuCrdo=;
 b=0rtDYIrbE3QcIjVM9CfBHXFdO6mMJZ3hPT7DjgMCnacaElPeXOJwuFNxlIrqqpnVhSPmbmJxL
 FM7L3GgwfP7BTGB+wK8dkbe5izwjDLEDYuGysiZRa75StTBbbh8fSVC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93596-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: A47E8172973
X-Rspamd-Action: no action

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

This was previously fixed in this driver in commit 1ba9fbe40337
("drm/msm: Don't use %pK through printk") but an additional usage
was reintroduced in commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC
driver to provide GAMMA_LUT DRM property")

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 188ee0af2c90..23dcbe1ce1b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -89,7 +89,7 @@ static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,
 	base = ctx->cap->sblk->gc.base;
 
 	if (!base) {
-		DRM_ERROR("invalid ctx %pK gc base\n", ctx);
+		DRM_ERROR("invalid ctx %p gc base\n", ctx);
 		return;
 	}
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-restricted-pointers-msm-d6af3dbf14b6

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


