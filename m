Return-Path: <linux-arm-msm+bounces-108304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLpzKAvGC2qWMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 04:08:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 338935764B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 04:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E18E3081321
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 02:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4872FFF90;
	Tue, 19 May 2026 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFwIi0vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B35E307AF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156336; cv=none; b=BUP5xsEbmDcimy+Atx3zZoHjmyMxQ/BWUyxzfNwu1PSHRllbSfO3pZEaM6KlRkKtkG5zvx8r/QBqKHF3Ylv+xqh2c6BkPi6n+I0Qd5b7OCXjwbcHrKaeyULggR4glC3yZJAGFTMtcVUheEjyF+STCSvbqbiK2rtoh8M+8/idHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156336; c=relaxed/simple;
	bh=pa0C9yhdgRhLGWznz7JUIUCYN54IH05uEVvyc4UBRSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljdC9uK/czcGnPiyLdSrYoX+BzL3HptGeykJEr2ul3+BO2isHNxTZaghda/SkXc9c4GIPDmB00KYJGsgRot0CHgA+bQUf0hJsTcQ8/PXIfqYzwnEvcEUuBa9Wf74ciTv09ZJ/Oxvoj0FPRxwp/xQRUw6YppVtgX9qt5SwFNa+5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFwIi0vp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b9ec9443c2so20062395ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779156335; x=1779761135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFGMV7mqlPtrUKnFCz1Two2EamH1z04Y7KnQTcbEHDs=;
        b=eFwIi0vpLbd3t0XDTdyVSQY6J/2mQPgSf7Q+66fqoyYoo25kdrs4uLpiBZ7YnBGQil
         ECpfAgHl8VZdBaJQ7LhB6z6kyBQY7I64kljL2BizanLzYHC7bTvoX7xIALz+RGIo7BpR
         WkdvrAm9wJZDPgTRsb9DD7iJGA4hD9iBpVw00yhrj8P6tgcz4WErudE/DT3TFbsrI5qV
         FKtwr2i7c27GiGMIzKlcMdjbJbD8ASh6VjTQmVJsDUpN6NAsYt7HDFX9Y9sMgW6/VeJ4
         /39pmcQ1pALpslNGVOQhqU0loXj1LTBOJnPq6r85Plq4ffzmPxmmGNeD0bAa3GKzTutz
         Ajuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779156335; x=1779761135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFGMV7mqlPtrUKnFCz1Two2EamH1z04Y7KnQTcbEHDs=;
        b=KISp64luzS90jqtDCAV/LDB1g6YkByDYEnaYz5/oLFFfFbtFPQhT5morUwaUvGzHbe
         35ZXN53CWcaySRTCvg0fFWLt2n/ZX7iBsj7xtd8FrSrczWaNrsejLA3ONqa59+lHHTxP
         Cy/7OGPx1f7foJy2iaeoc8J7NY9RKamHTe9vY7hRe8j+AsC4CdEdrFvbeLjuZTIWDKUj
         QPQ959biMytERkysDEW9ZQ0U/KZqPWncqXpaVbT/ZmvywmlGQkG7INmRVTuESbOMkt6j
         Px8uQi3nfUo25mj4rvjewvx+6LA1bTzV2wrvBzypDjOIXKaV9of96ZcrQ2cXu+OHVsqI
         o+/A==
X-Gm-Message-State: AOJu0YxolGG1L95jw9TT8F29LVwcXfifrvwEAbI2ZiXuz36/NzTYX695
	fDGraoGUojSdMhNGoYyL/wRa3X4vCl4ArMW4pAlaVAuJQ3atF2K9s+Pp
X-Gm-Gg: Acq92OGQJh3qnTIH01jtlWVU4NtmDTlF3E1g6vhuUnF+4Kag5vOtR2DvJ05+OO9AnMF
	4/ycAnPxFOdB8IGoGvENzsHY3BsmbaDuZBubZRFRYhMnk6oRFcMGO7NHjumw5gxqG2gC3xUvL/z
	yiAclCdgkuz7WN5kpXkECZXO0PxyCQLg5dFcY+0YJmy7/G+Tf+j0DPuA23fFysxm+eNCJmosHyc
	PWVN4jnNk+ZijovNOMR88ceoggHidZBIkm+ypHy5P6p/DGGRaxXqLx1v5I7oBzOaA6JNGl7auXU
	T2yOXC1gtir/NXP+r9olZjLP6+3gdfA7fMiw+U22AS/vjWwnbfsXxYIjQWA+Whz0BJy/1NwzD3M
	ujpbPC/3HwAZYPjmL2q1L/Z4m47qt/Tnkcp7AdDxPShyQ/yQHQmd1oOzdKlC3jc3vbJzfCZwx8c
	xHi9iOlXmnQgJocjbzJ+sbN08s5Xs=
X-Received: by 2002:a17:903:388b:b0:2bd:8c03:2efe with SMTP id d9443c01a7336-2bd8c0334f8mr135999395ad.26.1779156334703;
        Mon, 18 May 2026 19:05:34 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe7270sm163125925ad.50.2026.05.18.19.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:05:34 -0700 (PDT)
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
Subject: [PATCH v2] tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
Date: Tue, 19 May 2026 09:05:28 +0700
Message-ID: <20260519020528.133623-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-108304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 338935764B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qcomtee_object_user_init() is a variadic function and when the function
return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
case, there's no va_end to cleanup "ap" object initialized by va_start
and that can cause undefined behavior. So make sure to use va_end before
returning the error code when there's no dispatch callback.

This is reported by Coverity Scan as "Missing varargs init or cleanup".

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
v1 -> v2:
- Use "break" statement instead of "goto" statement. There's va_end
  outside of switch-case, so we only need to go out from switch-case
  instead of using a label (suggested by Amirreza Zarrabi).
- Add "Reviewed-by" tag from Amirreza Zarrabi.

v1:
https://lore.kernel.org/all/20260513091031.145826-1-robertusdchris@gmail.com/

I don't have the device, so I am not sure how to test this change.
Thank you.

 drivers/tee/qcomtee/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b1cb50e434f0..60fe3b5776e3 100644
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
+			break;
+		}
 
 		/* If failed, "no-name". */
 		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0


