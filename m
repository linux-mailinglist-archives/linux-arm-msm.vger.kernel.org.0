Return-Path: <linux-arm-msm+bounces-109469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QECEMihYEWr9kgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 09:32:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 333035BDC00
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 09:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 008EE3011BCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 07:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CFE3126CD;
	Sat, 23 May 2026 07:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sj6TqP2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4115B339705
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779521574; cv=none; b=iZRY2Uq/65cPcRqcu0/b19wfNCwltQf6qIvFKHbJlqLPkU/yw3F3oNg/bKtrNj9+g/DxNvI/aTVZOG6tLKJ+nNfteu0E9Ca98bgWX3466nMBwctpIQPHpia8tww+DVG47BNWo8BhFlaceqKxABvlJNaLKh/1bX89zamJsk9uiMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779521574; c=relaxed/simple;
	bh=LI4SZvOrYB4t3FQlZ3gUc4AMAt3ZEplcuyrZ+eJM0cY=;
	h=Message-ID:From:Date:Subject:To:Cc; b=WgWEt4gcnQ0RKthFwoWIcxUZ2AOOcWibPfbHmzMMpXrrE7NJsraefCcmaPArAph+cJlEDxBh4ZCyH1d/1tRrk2wN2eDU3n1ns5RGnjKGWjrb5RvyJ6NWuGvIIlPt1ZXPwrryLChksHE5Y68xtDV33eazt3gs9jmb7wG/Ah3E0DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sj6TqP2W; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bccb978bd9so53869025ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779521572; x=1780126372; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+KRTw9/sBNPjfGJSKTyHrcZ/0neRgH4YHpK/FuxGf0=;
        b=sj6TqP2WTUSn3A/SnUCwJ4TFvVrbJp6FGu9614h0SedmQS1tscbpQlbD+Fbu5kLLy2
         o47wjAjlbNS3kt0lgmk83BXV00i+QbU1J+bTP0yMowRcrzICp8PJqnH8/zm2B3rf/mEV
         IjpTjpvlTGZaGaS4fCVfXn0HP8wpoFogp3aaifv/LWOofv4VPpoB0NIhchfLf7GUCP5S
         /KHvDU+zkbnwrQy+iAPenWKUqhIp0wrpWJUq1IMeV4rr+GjrZc1an9Kc2MH/M8/8auBz
         UlR477uldY0WR3V/pI/I01Xn6/d7lnmWq/aOAFkBuZquBjrVr5oe/t65IaWkgBHfvrj4
         LS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779521572; x=1780126372;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+KRTw9/sBNPjfGJSKTyHrcZ/0neRgH4YHpK/FuxGf0=;
        b=WXXWyFgk+qflUnYi+sJHFo/UPhfEBWhhO55o5FdhQfFIl9hLc0JdhduxegSP6tQPdx
         2JE3sEgO3e4ABGPdaYLw0NDzUOSi/AMXlKGXcF3O3alpkR6Xc+WRjmDVcaZ7s62eLDAC
         s0jOUyGYFhU8AJVkX19IOUgxCImV4DxbykMP+Pc9YLRVf1sUycB0KksqeVHq+siL740/
         jeVCM0gJo3D7TR/xIf7RTR1+A4GCnR5ZOWV/uwkK85BJrCwkc+77p16gm1URwGlaLTPj
         MdJHeLTqLrooIG1uTsECOo3hvMiAJ+HhX0YuUBFqHWCp2FOVIyxVYSbODYjBN8xBDGC/
         KlAA==
X-Gm-Message-State: AOJu0YxJUf2EfhIDHNTwmcnDubD0qDBP4d/ipmBmrMknMfpfb6O8wWAg
	bvEY3+DpfbTkRcCMZQauxeGgabvVMRQzZIQJ5TluOELboZW//HcRxiK7NyycmQ==
X-Gm-Gg: Acq92OG9JbzRow9mxLXcrcoVkE6VFlyD01aNEMpbhcl0nN7k/9FbIc6mFbXrGr3EOx4
	RQm5LnHZiSG8xlygTyW174hS/ieK5P1crEHiy4W3MevpUmxhdhZtLtVaevyNcdXPSbdZKVqRomT
	gz84wbzBzPHJTZmPmWO0wU46oWycY2NW7BFlVzAl20+MNh2y9n17zQJNhSovksLYczDlRXT21Wb
	jPYiLkcxZiFgRY8mfNOG29epmXtfM7xWhID8UE5MomlxJZg+JCIr02d4rnJ65MDuo9JGv9TFNAq
	EoECM93GXAbq30Y7qo6gAO6mqb5QOP7ZnIdpc6dbjdVsB7hYd/pYIExT1OGNCF7uURAKE0ny1MD
	i2MKZEfRMHvSxC3OdcGe+Gh63p3JwCpp5yH9SCGfB2qa9VUEr055JgqU+zKcFfCztUqmtXGRQUe
	M6Pz0Csksegjk0F3mxNMrKsbrxScqNn3n5VDzUBj3EifZixVmVx0Bjobewudc0+NA3ZtSmMAoin
	1mU/xY0B9UoazdqAsCxZrc=
X-Received: by 2002:a17:903:fa7:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2beb088e3ecmr52736095ad.17.1779521572418;
        Sat, 23 May 2026 00:32:52 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([103.129.134.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b387dsm38101085ad.50.2026.05.23.00.32.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2026 00:32:52 -0700 (PDT)
Message-ID: <6a115824.a0bed9bd.3c0137.9edf@mx.google.com>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Sat, 23 May 2026 13:17:33 +0545
Subject: [PATCH] accel/qaic: Protect perf stats BO state with bo->lock
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
    Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
    Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
    dri-devel@lists.freedesktop.org,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109469-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuvampandey1@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mx.google.com:mid]
X-Rspamd-Queue-Id: 333035BDC00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qaic_perf_stats_bo_ioctl() validates each BO by checking bo->sliced and
bo->dbc before returning its perf stats. These fields are changed by the
detach paths while holding bo->lock, but the perf stats ioctl reads them
without that lock.

A concurrent detach can clear bo->dbc and mark the BO unsliced while the
perf stats ioctl is validating the BO. Take bo->lock while checking the
BO state and copying the per-BO stats into the temporary result buffer.

Fixes: 4ddf4ddfceb4 ("accel/qaic: Ensure entry belongs to DBC in qaic_perf_stats_bo_ioctl()")
Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 drivers/accel/qaic/qaic_data.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 1e4c579d2..1d74c2ec3 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1834,15 +1834,16 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 			goto free_ent;
 		}
 		bo = to_qaic_bo(obj);
+		ret = mutex_lock_interruptible(&bo->lock);
+		if (ret)
+			goto put_obj;
 		if (!bo->sliced) {
-			drm_gem_object_put(obj);
 			ret = -EINVAL;
-			goto free_ent;
+			goto unlock_bo;
 		}
 		if (bo->dbc->id != args->hdr.dbc_id) {
-			drm_gem_object_put(obj);
 			ret = -EINVAL;
-			goto free_ent;
+			goto unlock_bo;
 		}
 		/*
 		 * perf stats ioctl is called before wait ioctl is complete then
@@ -1858,7 +1859,12 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 						    bo->perf_stats.req_received_ts), 1000);
 		ent[i].queue_level_before = bo->perf_stats.queue_level_before;
 		ent[i].num_queue_element = bo->total_slice_nents;
+unlock_bo:
+		mutex_unlock(&bo->lock);
+put_obj:
 		drm_gem_object_put(obj);
+		if (ret)
+			goto free_ent;
 	}
 
 	if (copy_to_user(u64_to_user_ptr(args->data), ent, args->hdr.count * sizeof(*ent)))
-- 
2.50.1 (Apple Git-155)


