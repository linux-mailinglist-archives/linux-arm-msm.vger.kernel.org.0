Return-Path: <linux-arm-msm+bounces-118632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UE1fOWV7VGr+mQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:45:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A374751B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:45:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=MGvdVaiT;
	dmarc=pass (policy=none) header.from=uniontech.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118632-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118632-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EEBF3017BF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FC1360EF2;
	Mon, 13 Jul 2026 05:45:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D897EACD;
	Mon, 13 Jul 2026 05:45:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783921507; cv=none; b=I/I2ZrIMQrE68YaODy0p/mkwqOckdtDx/sisBwkK8gZJdtDhjIN1kg+qGlbdEcm0Km/LD3a8piaFULDKkRWTBWUhVXGrwk2wLwifS7gzUiiv+lIhDBxlgFb2azuVkrJD9PFtWtiXptuWgcKex/H91n6UNtKKPWUTdojpHHgMVyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783921507; c=relaxed/simple;
	bh=hT+Ooj9tgT1KwwQdt8RCridwYA1wzetFZZJ1WarZjWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxksnCRBmuKaaZvUZ1cgO4wSIM48+5rRE5WwebtkxpSCVSOmEUGihskgKoofdf5AAOV80Wm3PSlCL1fwARdQOUyeQSZcP1X631mHuR0W357GgAcd5HRq30vl/rOyLvGQ0+sJaJ+iWtpT8qbMmUNYtTXGINNR20MrRfognXCfogg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MGvdVaiT; arc=none smtp.client-ip=54.206.34.216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783921452;
	bh=xsMiDfHY3No78dLfmPMb1cw+NhSYORJVBK/d0sBYa00=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MGvdVaiTK1Iz1CIrw/B0DDi2BHd+r4uL69ZkxCQcJr4oQDUH/rGIpYa/O68Yg/5NQ
	 8nkhjA5fLianwRHboTsE0foktSA5fgmyjrk08fggXfk5wVbmMuybWk/sKftwbpuJnK
	 XZIV6YjrEltkcdODmJTIV4bEKqOvVbOuzBTF0Ql4=
X-QQ-mid: esmtpgz15t1783921433tee904caf
X-QQ-Originating-IP: KGIqFQ6ZwelBHVBQsdz3AWi16EJ0V4fs0KzB/tMla+U=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Jul 2026 13:43:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2535388820443823587
EX-QQ-RecipientCnt: 9
From: raoxu <raoxu@uniontech.com>
To: srini@kernel.org
Cc: amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	stable@vger.kernel.org
Subject: [PATCH] misc: fastrpc: drop channel context ref on failed open
Date: Mon, 13 Jul 2026 13:43:50 +0800
Message-ID: <DD9C99F155919095+20260713054350.3170620-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MmIUUz9KGMMdf7ciTnOWCYhgf7Ab6BzS799SOmRs2PXr/GhaMIgUyO/V
	iGzT0/+4dp0z/PtrYJq/h2AujJ9XnJ9j+ejjlUlzR3k3DFXGNDerH+3j8SIhNzBmCsrAe1S
	3HDBB+ia32mplRtxOLJMH1cUUoxcNhaBZfF9zMeXV2ZFCQvEzkDFf2xekbaJHY2/iZh/H6N
	k9CO1DgQ8BBPUbgcN9oKN0guH8hACxaHN98mT7B2c69yw+Dtn8ZhsSLPCysF8HXrnI6iwfd
	+Dd20yPUZK96l55JoL5u4hdntdE421JIG7bMGkKGNVRE4l7ERYWZy4C2pc3VlylT6pawIYz
	uPwowy165LZ6K8mp7UbgvfSaGjA7rv6UUHGi3kOsPnVaHa0mGwDsiKNQKV4ETIfHsz5F+Pg
	t14TrPbNnAQk/Lct130ilnTJWbOw8mji0dpQ1ofkfkAY6k9ylbInO5FYwf1TecAdgcn5zjs
	/9uvgSYZen0xcSZ5e2KcFzJV8HbGLaNehqz6wOiaxSevGUkgbDdb2V6DN8HcA2tLxLxwO2c
	rgrJtsEkZrsL0bcEjPNXUCrZe4ctor6QvGr9yRVxp4Hd9S7nQvH3jLHDsLsKdIA7KkiM11Q
	56dHDYM7n6V8YxZ30ZwOzLuqPnT992NJ9Cal72Q8RZSJQad2d9lQMRwULYSVCpn6NQP6EoN
	1BFTONrJvaebjXNxiKSr2ItlFRwrM9RznnYoq3zh3VGB523TrTDhu4LqqsROB7IkacNpDmH
	T7vbeK5PioQCv1ZJ7MSQ4J+Gx1wBDXmbhFrJolJmZjlPIx/2edHB5SFOPJzL4fa7kvtZhUk
	1C6D89s/jGEBWpgFgSnhoKRQ6GZxoQJ5SX4WSmWCoUCCJByzL3UiS/qVQ3+F3k8zv1oSVqc
	suzMzY4GMXkwQU5e2FBhkccgABcmEDNb6HUcoHU885LN5N/WNVKH+HKl5xTEguhan3hk82T
	HMg0JhKaUDsWMFwOABmuDDP18gQlBNEh9ZM5jkTpp1tKGWiKguidY97HVqN0Fa6bzILeCK7
	86WSzU9MJ06I8mvSlQKCrzCU/PLQcsHSMvKPEP1NvqJi+SdKAIkkN1wmxannqCagXTLTyi4
	A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118632-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:raoxu@uniontech.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[raoxu@uniontech.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,uniontech.com:from_mime,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 222A374751B

From: Xu Rao <raoxu@uniontech.com>

fastrpc_device_open() takes a reference on the channel context before it
allocates a session.  On a successful open, that reference is tied to the
fastrpc_user object and is released from fastrpc_user_free(), which is
reached through fastrpc_device_release().

If fastrpc_session_alloc() fails because no valid session is available,
open returns -EBUSY before the user refcount is initialized and before
release can run.  The channel-context reference taken earlier in open is
therefore left behind.  Repeated opens while the session pool is
exhausted can permanently pin the channel context and prevent the rpmsg
remove path from freeing it.

Drop the channel-context reference on this failed-open path before
freeing the partially initialized fastrpc_user.

Fixes: 278d56f970ae ("misc: fastrpc: Reference count channel context")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a49384586d..907a87d7ca56 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1671,6 +1671,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fl->sctx = fastrpc_session_alloc(fl);
 	if (!fl->sctx) {
 		dev_err(&cctx->rpdev->dev, "No session available\n");
+		fastrpc_channel_ctx_put(cctx);
 		mutex_destroy(&fl->mutex);
 		kfree(fl);

--
2.50.1


