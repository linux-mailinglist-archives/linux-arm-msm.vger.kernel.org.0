Return-Path: <linux-arm-msm+bounces-114416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N8DeKmIvPGpelAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:26:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A551F6C1063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Bx8/zMZL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114416-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114416-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8487301277A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF4834A78E;
	Wed, 24 Jun 2026 19:26:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8932E696
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329169; cv=none; b=AgPU1xzopWXGft39XejB9/2kZhzDkFNG3SX6iawQBrRwxdaRvrjrviun+PJm0BJXBfdm2gpAsbNaIyE2XnpdIuv1tLBO8ziGnHmz/+Pebxcpvh151NrkdEEPp25WVL/BVBir/cXrG6Zn9a28Rr5A/2qaOspxfwGzimCnHHwcJm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329169; c=relaxed/simple;
	bh=uFdweM4aJouxeUV836HB26SAS4KqpF523nYMZBE0ESA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4sAwkRUCai3zMlmZhcloSim5v1gRFmrsBSdf8HMSZjMUQjkG3xZG+oNo2q/RnI3MkYHTcRq/qqc9FVOCAlGvyPYdL1b5E6CVenT6VbxJwHc12vazXJJ2d3XlGYO+iLiGv3joM+XzB8Xa6Qs7Rvg7wTh61BvPVf91UeNW+039dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bx8/zMZL; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso9650905e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782329166; x=1782933966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BvV+Q7TxmkZErxEzBPmGA9pyzogQykAvWuzenzPuaG4=;
        b=Bx8/zMZLUravhztk8ETE8ytKwBAHynUBhw27OJh46mAM0TTKLOoqgiAtduavpMJeEQ
         BOCWxKmO1vOZNU56NEz7JCZ3qDXTDD6LGpKWHwzloM3qO69iUWFam5xZqRO6vYuQIVpr
         TqPg59gTalZqS7lPjQ++YKEC0oZa9fZb9huZCgjGjtwXIfXtHHwiCeJvDHArN4ipNifb
         C/BKcQRMb3PrI7G93Dk0WStfkl6PGm1CVcubLY0U4PnEcoMW/9Et2TQDzgiVvY4RBldV
         IKAw3AZOqXo0FRVNhC/rBukUm/IGRDJL8emtlAf8YdRrqsSpp8a1q8Qn2UP3hcH66aM9
         y+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329166; x=1782933966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvV+Q7TxmkZErxEzBPmGA9pyzogQykAvWuzenzPuaG4=;
        b=nC+Iut5fORjEEg7LxllZ2TyAgj0kbi9QtylT0KQCXnoL3VjtIka+Fwu80z8a/VCjNU
         2Iil1/8V8hjY34Ao6dEVxgaX/Uirahc7MgmynnjzPQvBLas4NivevMng4mmtUocrFteE
         9vBOqpUA2vGjsJZXmNXB54m4z8MzGxtYPTqh6919THriLrYFBSbqS+h3FxhsTjvLkSZ4
         xVl40aBUa4HzQbihePtn7C4LDOyPts1qyANi800USDCASIveH1uFdSyvCFry7sZ2rykq
         UQnvdkKAWSjf6/+ex2bJk0K2OIzd4iQdsEWJntqKdtsgtrD1DPPxXVJCg5Ek3J+PjtLI
         q/Iw==
X-Forwarded-Encrypted: i=1; AFNElJ/Jwk9JcIChQ41MQBgwZ4gkQX9dx8JfNFvlE8ezpZWuLxCJNTa4NQzkhHF+HeR2cvvTALjwEFCKTOcfR4Ii@vger.kernel.org
X-Gm-Message-State: AOJu0YzXKIe/ZqSQjV2TpZaq5ruiS3uDd7LwBKP94BNltO5ClNtPOZCB
	lwBzf+y1TRmKXjESZB4dnvIR4LAr5BylRTOn911JxH1f0x13hYGGfQTn
X-Gm-Gg: AfdE7cmti8H+JWMIPoXqFKKH3VS+7Z9L3uWwK+WIpsFA49Tt8RjpU0MCKSQ1PAA3hFS
	oXrmO/4bub460gq4KQNdvhr0SyX/rtkeLcjpvSYkDCdKiFBUCoIp7/ke0X58cSL5VSrypASFtE3
	GYlQCxNsUJ88uNv8BvFQNH3GdLoSz0xVv5kVui6msdJfi5K44xUL0qn+Ut+dtPdRY8uDbEyaqPk
	w/5Q/ALXeG7qxC1Rx4xe9Cjm5H/vMV+5lAIxJHuW1aMjb48pt+kDbRzXfqnLU7B25PqRaYUZyGm
	hDZGJ+yrwmpX6nglrvpwHWN7yvc8jJTEzNa/ycdy7CG/EBaWjsZhx4bHCdhgx4ChaYNyRFNkrB4
	TDRd+v6uOVgLZjg0c+BZd/5CCsH/TGAlb2/4MGJvVu5ldOzpthMdK6CJdCQPttdSvTGHXffiG2S
	qIf9cLShv/U1JkDA8ujNLe4l/fEL3jIkJPOD67
X-Received: by 2002:a05:600c:3489:b0:492:5068:61fc with SMTP id 5b1f17b1804b1-4926086c3fbmr73867905e9.19.1782329166203;
        Wed, 24 Jun 2026 12:26:06 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926417f0c7sm11379775e9.14.2026.06.24.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:26:05 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: drop invoke context on interrupted waits
Date: Wed, 24 Jun 2026 21:25:54 +0200
Message-ID: <20260624192554.5172-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114416-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A551F6C1063

fastrpc_internal_invoke() skips removing and dropping the invoke context
when userspace wait is interrupted or a kernel invoke times out. The
context remains on the user's pending list even after a later DSP reply
consumes the send reference.

Remove the context from the pending list and drop the caller reference for
all exits. A late DSP reply still holds the send reference until the
callback releases it, but interrupted callers no longer pin completed
contexts for the lifetime of the file.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4b258dbcd..90281859a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1379,14 +1379,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		goto bail;
 
 bail:
-	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
-		/* We are done with this compute context */
-		spin_lock(&fl->lock);
-		list_del(&ctx->node);
-		spin_unlock(&fl->lock);
-		fastrpc_context_put(ctx);
-	}
-
 	if (err == -ERESTARTSYS) {
 		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
 			list_del(&buf->node);
@@ -1394,6 +1386,13 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		}
 	}
 
+	/* We are done with this compute context */
+	spin_lock(&fl->lock);
+	if (!list_empty(&ctx->node))
+		list_del_init(&ctx->node);
+	spin_unlock(&fl->lock);
+	fastrpc_context_put(ctx);
+
 	if (err)
 		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
 
-- 
2.54.0


