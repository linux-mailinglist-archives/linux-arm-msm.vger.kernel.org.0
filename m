Return-Path: <linux-arm-msm+bounces-109771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKQlGC95FWrHVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:42:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3BB5D44FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2E1D3027371
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0053DCDBA;
	Tue, 26 May 2026 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FymbiCn1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9C3D890D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792173; cv=none; b=MDo9Shq3RiW5NA/fKMdQ7ObKdNaaQ/X+phDVhgC8v0sgDWZs4MDawAUrp1XgDMYqWPltZh8FaEUHVvk1gQpdfd7a/hT9HxaYhFtfrKYPjnoUkZ2lHPDa9EdrrQC1S5mnrBfmqEgJqjowMEOzjCugRBMSUcPenn0mWarWtQ1mSxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792173; c=relaxed/simple;
	bh=XdAUajRazsbtkFeC4/E1YstodQOfkfyiSW7QP22Swa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BdvZszBdQezpBANXIm9063M/Y73Dx/5XvPtv73n4QhsMfzz9ahaJeNFZDqUdPZnX+gIsAgDreuAcH0tQ+HHDoq7lVZELNkd/7HV6/W5cJ9u8TldlORo8rihJan33RSbI1nkWqu285JJQDJOb9TWTXt3B0lVpgm6b6xsgsFKd1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FymbiCn1; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82f8b60e485so4355314b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779792171; x=1780396971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZhb0lbN22IuVSTfMRrHQ86kmMUFHiacHV4BOlR/KVk=;
        b=FymbiCn1nbNihlyTvHTuIqFCtdshxhZrIKwXRpjc5KVdhPRJHbMQEclRG5A+2W+XCY
         5MOO6JAJM7vszIjpcCwk8kpXiQpXmQKgoPzCsUABtVXi2P28b5ZP3W8VO9P3yiJLbfhI
         b1k9z6Goja07dk0aQ+hjk0eESVtIolZ3eP40+/kKe5l8xGAQ1l454LU/fubw0KQrOVxC
         7C556BA9qz+Z8iBUj9eZQOMhTXWvOml0xQqPwCSMkcTo7yTLeNfnVeiQp+qZWX6//4hg
         pJPNQKorgvor1Gl2ArM6iUENDz0QkzJTaIGAWOz6IMFoYdChKotcKuELMVlanzwkCfES
         rzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792171; x=1780396971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZhb0lbN22IuVSTfMRrHQ86kmMUFHiacHV4BOlR/KVk=;
        b=HkjnS4UL0pkpbkWIuqzA8XVyBM1UPysVUXcvf4dmhYnM1PWn2PxyKdZPe6WgYWKHXs
         LmYkVH3GL4wxcTIMF/PA3DAmtBOcE+Xv89CbJqtG7+7f5LqHCAKePKiRzHE3PPsssyJw
         2YaheufRdKF+UfZHJIs3MkShWAS5OiVmd+DPp2UCAX8PGgK+iHM1e/79l6bMZnLk3xFj
         9cAFdCc2v9ogxDa2XrRqbXeqxP/qMkhDpeJupe0TnY+dvzhz/vd3qp1JJTkT3K26fEvL
         q+PWe2yhyn07gWmXdUk8hxfKgSD+ns3xkBdkWRMS5Zn3qARG8RyssGQ/ukYKxcdvJt34
         xWKg==
X-Gm-Message-State: AOJu0Yxmw9SbObPumOIk0lH7In8rTkJbGNnuzUNsiTbXPehsZafoUe2L
	qgLT1qAEXQjTCCUIBdZFY1tYsShkoREy+KBFEdOwUR17YTBQHpFKZejd
X-Gm-Gg: Acq92OFLgHmgeJRVvsjS0YSD+QR2IFus9Md+eCOekXoqUS4ZSQxTg0SbXOiPswK+0OE
	dcrYAiwHEcuTkG9CVMmH/beTacxfCzQLWTToPNk0NkSzuQWEv78EAQl3+cR5BejNU6J8mN62urP
	m+lq5pBGkP2QKNc2l8Z2WUkrjYhUhTkpTmZolFrLaQrmyS2wAnhmbHLvNzgpk2HmcyiuUF/Z149
	VQiRhGx/hTZF4DqO4rs3wSrqtNxQYOCbpu7u/bIC4d5J486DN5j/ISlpAOMi/yHrc7mVo5COy2d
	Wj6J32CR7w0U7ghSI0CwMWV3jmUAxI9QKC1WNHmnigZ7Lm2Y2ZmAmgWjss2urWFayeObaa1w76z
	TkCVfe/k8MdwEJlR+eGq7IPRjSTu6mILmsMxNoPcjEM8NNIKNT5CUQtDzU2tyTDH+1KZVISgLEP
	SkLG+cBXMpnVUybco+Vim8kNfohHykDl6bbfENduQLT1xA4RGMDBmPzKZ+xUPwQqMjNFUHdx0=
X-Received: by 2002:a05:6a00:8c6:b0:838:af72:fb27 with SMTP id d2e1a72fcca58-8415f0f02bfmr17082679b3a.9.1779792171329;
        Tue, 26 May 2026 03:42:51 -0700 (PDT)
Received: from KIPREYXIAO-MC2.tencent.com ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11539946b3a.15.2026.05.26.03.42.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 03:42:50 -0700 (PDT)
From: Zhenghang Xiao <kipreyyy@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Zhenghang Xiao <kipreyyy@gmail.com>
Subject: [PATCH misc] misc: fastrpc: fix use-after-free on map->fl in device release
Date: Tue, 26 May 2026 18:42:43 +0800
Message-ID: <20260526104243.27596-1-kipreyyy@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109771-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kipreyyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0B3BB5D44FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fastrpc_device_release() calls fastrpc_map_put() for each map without
clearing map->fl, then frees the fastrpc_user (fl) structure. If a map's
refcount is > 1 (held by a pending invoke context), the map survives
with a dangling fl pointer. When the deferred workqueue later drops the
context's last reference, fastrpc_context_free() -> fastrpc_map_put() ->
fastrpc_free_map() dereferences map->fl->lock -- a use-after-free.

Detach maps from fl and clear map->fl in the release path before freeing
fl. Also guard the FASTRPC_ATTR_SECUREMAP section in fastrpc_free_map()
against NULL map->fl, since maps detached during release will have fl
cleared.

Fixes: 5bb96c8f9268 ("misc: fastrpc: Don't remove map on creater_process and device_release")
Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
---
 drivers/misc/fastrpc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..3c7aec9e938e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -337,7 +337,7 @@ static void fastrpc_free_map(struct kref *ref)
 	map = container_of(ref, struct fastrpc_map, refcount);
 
 	if (map->table) {
-		if (map->attr & FASTRPC_ATTR_SECUREMAP) {
+		if (map->fl && (map->attr & FASTRPC_ATTR_SECUREMAP)) {
 			struct qcom_scm_vmperm perm;
 			int vmid = map->fl->cctx->vmperms[0].vmid;
 			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS) | BIT(vmid);
@@ -1598,8 +1598,11 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 		fastrpc_context_put(ctx);
 	}
 
-	list_for_each_entry_safe(map, m, &fl->maps, node)
+	list_for_each_entry_safe(map, m, &fl->maps, node) {
+		list_del(&map->node);
+		map->fl = NULL;
 		fastrpc_map_put(map);
+	}
 
 	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
 		list_del(&buf->node);
-- 
2.50.1 (Apple Git-155)


