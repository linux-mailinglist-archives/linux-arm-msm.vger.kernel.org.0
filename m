Return-Path: <linux-arm-msm+bounces-114476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K8D0GoLtPGoguggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:57:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1867A6C402A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:57:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gXVhpqjw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114476-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114476-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 819793028C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460F63876CC;
	Thu, 25 Jun 2026 08:57:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FCD31578E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:57:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377850; cv=none; b=X+ngrM6iEZ4alObyvf0WYnwE3zCfoyeDEG9rnmYPvQaC/lWULRKbD2TDOMeyXncHf95qPOpOcWqFqPYQugi0lxGMkHLZ+MYfnx6MhD341DfuO5PGGSKE/CHFoEwW+wAfCh/jTQg4f2ESvvt61PrKvdxNqzeCazc9e/YnpueTsUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377850; c=relaxed/simple;
	bh=7+RpgeFXilV9LBg54j04AxM1dVDg8zK074PE+ydai/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cibPmDLLXLPyv7aG35/YuArBv3dQBKLo8bvL2FuDzeTBItb9FNSRO6+/mtjZyvve8wqPKJh+r89JIkpFZnv4BlroSPDvg725zcp0wY8qZGm6vWWfEpqjqDpK7xus1X9oyCigVvx0k1lJBs/fsfoaJIf9FQTroI3t3L1pEBf70rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXVhpqjw; arc=none smtp.client-ip=74.125.224.51
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-663167a3ba2so2143255d50.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377848; x=1782982648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HXBGWP+mHV9r0WWwErucYsy42UpdRmWv6NJcEbVBLI=;
        b=gXVhpqjwqJFHcx12EuO8AanvpBdSfaGcTVJWC5Fo8lHUD2jxcTv1hxFan5diXBQQTk
         M+kzD7QsLvD/cG4DJgvQhbIygvmVjG0cth2v4/OVSmynwfrcxJwREPQwfA+RQ1PS/ve7
         bObLzkxD4wJUXafF65NRxLSpjKyGmgCCFQyLIcvAQzr3QQUr+eHENp7MaydZv6UmUFTG
         gvNbYpY/+iFDIfVJkpDi96F12vKtEDD2kN8DAvuODXUW/Q5DF43mp2brLDdP9rPSuJK2
         0Rcrh8GOrZf05oExTn9AngAWY2AlWeR/wpMXV4LRgv12NosRM+ekzpIbIkkmAQ+iiuwE
         DMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377848; x=1782982648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3HXBGWP+mHV9r0WWwErucYsy42UpdRmWv6NJcEbVBLI=;
        b=gYEUSKrOGOakzmHwDG7cEYsxvBrsS1kVJsB0crMkMD34+zYVp+ie24NzKedyiuFDXq
         LSFm5kDd395XoUKjko9Su81be300dMMzqPisHhGX5RDVLrm6rJDi1RunLsl42mEyBahX
         LSDDbQ5Hg2wWsvVJZilG4K2aJn796rM+HsybkF4xi/BsBHTrgRUi31ZvMhIhpp2X9J2y
         atxrQkj4aT5svk92VCPiFLXrbsj7E81tIasWmV8u1Q/c3am0Bisfl5oaw1GMUJ5NdF2p
         NXa6j+jZDAMJDXuUjjjN26U12Hr0xFNU1XS1cDGOe8YyBIaYEwktCyFizHJsAyQGfD6Z
         uGuw==
X-Forwarded-Encrypted: i=1; AHgh+RpFWkM+ieri8mj+nH8jA7RYfI9NpTYWOIgBTIgkpRB/uYXHPDcHKrW1j5M2tNpm1+2I/HqtsHhccDmUUTiW@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQLo//jSZcnF4YfKMobscV8O3tt6pA7xgIjrF3LilW31D5a87
	VEfaAMVF9mQbi4rwNrYz5fk0RrQP4kZrGwbYXRYxWjT8rHYNNEjCUl92B9vVUm/bFUNfOw==
X-Gm-Gg: AfdE7cmoEkUSYyToYNnVgRnzzH1++WxdcGd8ndf0VYu2e7oFglwCPGLiyDs90Xmsbg7
	6KrTkn2kdV/zmmsySxHFUFJGP3QfxLaizd33Rb1zXmLoicVE1TncYFq4oXWKMs/d5wd17wTv4zx
	DTzAWID2sYJ51ktAaH32hZ25HRDNUpqbuZzo7NyjuAbb5GNgAY5BMoqMhR1EqUqpBws0eRA8LYd
	J3zUGS21QdNJVs1x+XmF6vLhVZ+7mrrT/NqfMrd+ZEmVNy07p//v4914GMLB9XFB/Gihj3LXUbT
	QIefa7Hi27tRiHwj9VGo7B11AS43FKEejjDj3Wcbu3K7FtKJimQrUbzWNycGTrRedjB9Q6aEyCF
	sKYMAbhHwY2SXh56FXGsfq2tOP7qRAkdeNWGkuRaQ/rnD1/XKhbVirRkX6+Whb8Oqr9D29UuA1R
	fqmfCK5rAy7GzVZMIInMsLtsyH5w==
X-Received: by 2002:a05:690e:b4a:b0:660:ffe0:2df7 with SMTP id 956f58d0204a3-66487c28ae6mr1186398d50.23.1782377847966;
        Thu, 25 Jun 2026 01:57:27 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f785f6bsm1105061d50.6.2026.06.25.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:57:27 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH 3/3] misc: fastrpc: protect interrupted mmap cleanup
Date: Thu, 25 Jun 2026 10:56:59 +0200
Message-ID: <20260625085659.4469-3-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625085659.4469-1-alhouseenyousef@gmail.com>
References: <20260625085659.4469-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114476-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1867A6C402A

The interrupted invoke path walks and moves fl->mmaps without holding
fl->lock, racing concurrent mmap and munmap operations that use the same
list. Move the buffers while holding the user lock and use list_del_init()
so later cleanup can safely identify moved nodes.

Buffers moved to the channel interrupted list are also discarded on rpmsg
removal without freeing their coherent DMA allocations. Free them during
channel removal so interrupted invokes cannot permanently leak DMA buffers.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 50f90e17e..608878052 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1395,10 +1395,12 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 bail:
 	if (err == -ERESTARTSYS) {
+		spin_lock(&fl->lock);
 		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
-			list_del(&buf->node);
+			list_del_init(&buf->node);
 			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
 		}
+		spin_unlock(&fl->lock);
 	}
 
 	/* We are done with this compute context */
@@ -2628,8 +2630,10 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->secure_fdevice)
 		misc_deregister(&cctx->secure_fdevice->miscdev);
 
-	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
-		list_del(&buf->node);
+	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node) {
+		list_del_init(&buf->node);
+		fastrpc_buf_free(buf);
+	}
 
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
-- 
2.54.0


