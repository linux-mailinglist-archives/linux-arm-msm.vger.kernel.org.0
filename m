Return-Path: <linux-arm-msm+bounces-114379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KWSJB18YPGo6jwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:48:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B66C079C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DiyQkiu6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114379-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114379-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E232C3035AA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 17:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB96A3CF673;
	Wed, 24 Jun 2026 17:47:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B63DCDAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 17:47:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323260; cv=none; b=Dw7tbK6EKhxTqkH+2jrje35hlp2KC16zIrcY+fMvYlAflp1xnz/8mNZ3ToJVXeDGh9WkaZpbbCnPgScPJkHfddUI/gzPBJWZ/esrC0FO8VrKPMi0WrXItA/0VKf5L86ViSc92pWa1XNMuW/57ZpPEB4LRW9ncmUL+swIui2/twc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323260; c=relaxed/simple;
	bh=Gc+IDF39vp6FQfOEkcGETRsTJtyLzVdrJQUiGTBYgVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJ2vzQKgfGyHTnWaRHDV+TlQcHmrJSMNAL8EghOXIMm3QxYTdTbRD6WYT2067+Hp1U8cBWgZ+QNFvFZ0AIhyHtmTI+pac7cAEigd0XrYE2a2pzjlWtaJlHUiIf91rON1ctlXJRXd30Biv/XsitNrL75Ch+xe/vdKM9GTsDNQ6R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiyQkiu6; arc=none smtp.client-ip=209.85.128.171
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7fe8bc0a01bso14399727b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323258; x=1782928058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9uT2nEBsVBOjOqOHhykIfJmB66KxhmqDufZGyy0LUQ=;
        b=DiyQkiu6BPMoEdBi4QO8R5ODNW4VmRHDhbnSYcD46OWhfGOE5HLSraq1zyIs8H9qok
         FGhib1zVnlQMeLnpveV+VdXZHN7OuQWUpW3+uILwCFuvPMwJaJTUALCW2mSJ81B4/RIB
         8Vx9DxRumZ81UpUUCagosgcN++7egkWlETe433edysShgTJanmsP/tVDjcdpyR5yitp9
         URvxwqV6kTMkeBOw8cb+sosiHOF+4fRjIYjt02pgp8U5jhHMatSOVvwYkeC9ifsU8Dk0
         4uWYAT3S597zEAemFLj2jZ3QqZx3+zRDjilRR2LN97ik8iECD0gVhNWqBC5plW4OQ+oy
         uLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323258; x=1782928058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9uT2nEBsVBOjOqOHhykIfJmB66KxhmqDufZGyy0LUQ=;
        b=d1BmCk1mvTnNHpXV9FihvvEmj84oHe4CksnPPhp0xtvG+OITWrnt09dKyD0Puh5u1q
         /zeTMNh3oN1/1XAnCjkUM6KNxhySPBj5VON3r+3QreNNCzQlKhS6w7XsPJNtfkiOok4E
         NmhruA2rjWgzr1hMg6Qip2Vj5SId07YN+R/kc/qsZxdPhKuWZhpn+SxZ/r7SKe5oDg1E
         sl/fJEM7ebVYK+QOQuswzlK+c92ueT8KbggXs2DiZOJ3AmQvEtZmBkH8YS8DxmJtSoD2
         Wl6AyT+W1RMdvCsFgmEBQx36Q6EyIb4HkLWL3rDAyQV2V3G66IV2JXXDt0sWnA8IFd90
         PcQA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+U23sYw3u9sUy9PI1XiqfJHXO98bgDa6EqqIIbsBppdpYQtB2j7flFcmCrTXlTVG6U6OBCMgVu5dlDF3S@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4La7oWnUx124RurU/faMSHi51TOtHJ3pTBSA7hDOhfr070Lu5
	ZuMYyWkjh4Se1Do41tv9gQbdwCRGBjD1495vVW6L+Nrqt2ooZI2detFd
X-Gm-Gg: AfdE7ckxuxMFfY4wWLGHyPXsjdEojHZzX0dftxQcb9P5FxZfUxZUxt4csxRd7SEINu8
	zFl4zSgmny8aoV/qAuAm0bbYTTZ03LtKSomLf2EZVu+KUM8yTdTkKl3pv3ckoN/A7doQ76CXXMp
	thsiScBU+aS8rh3R3UUgn58aJI2DAeEDq2tjJtLD1gb82kyJHIxaBkKj94xdSbpeSIVPsKteqpO
	GCV2F/+vhs8Sm30bcfa+4Dwq8bjcHmBLsPg4Of6tJAZE1IO6OVJnrVzqt7t4wHDskoWhd9PGGFG
	3wdk4zdIw+owpemWj/Yzx6kAXn/UB/5XRg+EUSrpeOhudKqDSzUR+uZ3KKhDMzed8Fn56BUsNCf
	+MGL+JIMAlXgtZ+nIbPO8USX9NEWGzm0A3sNY5MLAFnupZfJa6ypTCmTEvdyk/znGVNjTkzNBFO
	TlAdK4BYNQmDA+lj4qXGPOA7FM2w==
X-Received: by 2002:a05:690c:c4c5:b0:7fd:5297:28da with SMTP id 00721157ae682-807f00ea515mr37907337b3.49.1782323258458;
        Wed, 24 Jun 2026 10:47:38 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm61310697b3.0.2026.06.24.10.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:47:38 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: remove mmap entry before remote unmap
Date: Wed, 24 Jun 2026 19:46:52 +0200
Message-ID: <20260624174652.6792-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114379-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 892B66C079C

FASTRPC_IOCTL_MUNMAP looked up a buffer and dropped fl->lock.

It only deleted the list entry after the remote unmap succeeded.

Two threads can therefore find the same entry and unmap it twice.

That can lead to a double list deletion and double free.

Detach the entry before invoking the DSP.

Put it back if the remote unmap fails.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ba4ade874..6a5239b1c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1902,7 +1902,8 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 		spin_lock(&fl->lock);
-		list_del(&buf->node);
+		if (!list_empty(&buf->node))
+			list_del_init(&buf->node);
 		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
@@ -1917,6 +1918,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1925,6 +1927,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
 			buf = iter;
+			list_del_init(&buf->node);
 			break;
 		}
 	}
@@ -1936,7 +1939,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
-- 
2.54.0


