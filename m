Return-Path: <linux-arm-msm+bounces-107240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLSsOiRFBGp0GQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:32:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51B530ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB43832352E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3663C5DBA;
	Wed, 13 May 2026 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyexIRYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D773D9DA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663439; cv=none; b=lEJK2ngKi9W9K99knODbO0iGK1HIw8vI/avAqIraJsBvMKiZUMEvdfjt2s2VeIwCy2jLcs9UqFKStvI5XsPrQ4BmiiFZI2lOGr8POD0P0XUsMAENugQZlaAAIiztYMl08xw180PZr32ZmC/St986VkPJyGN3VgI3uID9S7Hvkz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663439; c=relaxed/simple;
	bh=rC7nG2+GpOdgcnUjLzX1d00FpSLVoi1YuxHiT2V+/I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D14ltZPCZuyz/+ns9OtDUPY2tAaHP9qFwN7b0X7xzPfvU3ub5kfyNKRQ3X4EfWfh0FQOpzCzBC3UOq5xacXJ1TbJ+pxGrKKxmUA+nR1iQs+Zr7jc5sukZYPUy1GQM5ntewMpNwqgyYAr3TiWqzmXQGwvg0Ckr2/1P36w2a/FPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyexIRYR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2baef9f5ecdso39712045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663437; x=1779268237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDkyCdkfOQyq4nl3ME+VrFeCYaGPzyVj4zyQTMVwELs=;
        b=LyexIRYRLdUQev7TBo5Z+ts7VTbJytCBJCtWS8RnDNXxU25YCh/eNBRueblnLLaVE7
         iAl5A9Y9AjaN723Y5ieLf7bZjjA+mUe4BUETfqoTxmrrBMHNSTLTSa+gNpiDudkYZtNW
         c1L/E7+m6BnmZyYXgHlHTTIfP4cpvPgVEnjveSlt2YrUUT/3F0FT+73bxS7nehXsZBPv
         xS2CLWfSLV98lSKhIGUdmzCAZR/xiUQ9g62+y6/EJjboeShBvipRJwNHkvVuFoOcmTt+
         Qxlaykwf5cljBd64t8etPhHdE0Ayd2RtaqPgV7hsYL+ABd2a6TnUI2ieTHvlR35zaWSU
         +V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663437; x=1779268237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDkyCdkfOQyq4nl3ME+VrFeCYaGPzyVj4zyQTMVwELs=;
        b=lNW1pUfJPnr7gf9Dwl/eFwFDvVCpDUfR+3VbN5hhdaL7fvUFKud/3rU5Arv7w18RoI
         eev9bCrtVd84ph4UvnRqGvFwl6VpLpuE+43qes+bpUELzwH+BQKIYA6mbZ+UzaYUCKpT
         vJc4GV4/ebpCHomj4rbZn/raWX0qx+OLomRxE1QKm9Fa60aJt2A8XhlXYipovBJB3IJz
         PBAoYDg836OEpLnb7PRCdVT8RYxFrV721BiXRSTp8CRChOR9u7f2/DiD/FW682aodm+L
         axyzjDn+eSySXjBSW8I5tzVadT/TxfrJu0VeegL8YOk+v3+WMR92tXX0XaMzWHUea0tE
         wc/A==
X-Gm-Message-State: AOJu0YwgUhZtbUW7R+Z8ew6XfGBdrUZvunAetPkKbQolhHp5YVHwhHbP
	6vHYMS9jGqVH2iZyTm0HLjiNL8wwpIRXSX9SzO9CJdgD6d1KZNeHzV2JJsIdkw==
X-Gm-Gg: Acq92OFa0NBDxZjiBfnh+ExHh52Bod1HUXHejg1Cimk5qMXrqN2wGzoGmCv3SWsnA5r
	HrgmY3VrolpXA3tAZo81qzpIoiuXqFWaJi5gVn49mUvAKQyTSP/iSId0FCgIKnkfXsP+tAOMsWd
	SxIRnCmatxp9fKiBAjct5i6AL6e/J4ose3Cmj1Lce1nk8uc20NPRVlU5Z//fI2WLVSnLNPMW6cw
	RNkxbdv2M1XwQhgYhKIh7b9xlzs8kv9mQyvTkCRCHn7tdB12E6Nzwx9+YYyoZgLsTo3/z2xhHxe
	gL4BMZ4Rvrtt5W3zejiRrvbAw24w4JzRXz7ZJE8wbw+EikRQTAnSFfKzQxN9RWi5KnypVtlB7G8
	Dcq5xOp9j9G1RHY9xkRovxdoSt3DMTIyZOx7gj/PSd/yGHb14wOoGEyCEKV9BPNnjB/KKHLliei
	B7/yq9NraJ1KSnpe44yROsmeXZgeEnwShRh9KgUQ==
X-Received: by 2002:a17:903:3e25:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2bd2718bf33mr20560465ad.7.1778663436624;
        Wed, 13 May 2026 02:10:36 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e66970sm160480945ad.56.2026.05.13.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:10:36 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
Date: Wed, 13 May 2026 16:10:31 +0700
Message-ID: <20260513091031.145826-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C51B530ABE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107240-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

qcomtee_object_user_init() is a variadic function and when the function
return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
case, there's no va_end to cleanup "ap" object initialized by va_start
and that can cause undefined behavior. So make sure to use va_end before
returning the error code when there's no dispatch callback.

This is reported by Coverity Scan as "Missing varargs init or cleanup".

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I don't have the device, so I am not sure how to test this change.
Thank you.

 drivers/tee/qcomtee/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b1cb50e434f0..901a31e8201f 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
 		break;
 	case QCOMTEE_OBJECT_TYPE_CB:
 		object->ops = ops;
-		if (!object->ops->dispatch)
-			return -EINVAL;
+		if (!object->ops->dispatch) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/* If failed, "no-name". */
 		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
@@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
 	default:
 		ret = -EINVAL;
 	}
+
+out:
 	va_end(ap);
 
 	return ret;

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0


