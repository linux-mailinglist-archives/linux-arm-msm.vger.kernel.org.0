Return-Path: <linux-arm-msm+bounces-114475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0zPGA67tPGoouggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:58:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4066C403B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:58:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZZf0L1Zx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97028305A5D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E57326927;
	Thu, 25 Jun 2026 08:57:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908637649D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:57:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377847; cv=none; b=nouI8YFLnNJz1Z0F4BwFV5pZkXx+cQhwKGUuxXt7yl2cC73YwInj/gT9l59WCU3qMMT7uozKbA5PSYTKGaWNH62RaRTA+NstcEr219S5aF5UNLA0jwzumchzBtzJYYiGnR8ukMLbnZTSlusqQ7L2eW7Iy5f1SJIUy8BRy22Ij/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377847; c=relaxed/simple;
	bh=z3ifyXo4P4eBwNsPbrBccOs5hNTXuDWJynVPrxskX78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMFWYuRTjQY41fuzQap6pSevxIrfpKWARIhXfKbPdoSwYALCJrM+9yzRjQlDbS3XO9LuffOSrIpgeU0Tjrv0iWAeKci8vRXyj/XQNKXGimK3k8Cek6GhwO7ZV1U34JqE1yAlAWgIVdr6IXz/FK6XxPhL5PxAxWJB8nzLnKOBo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZf0L1Zx; arc=none smtp.client-ip=74.125.224.41
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-662dc387b7aso2182451d50.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377845; x=1782982645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCYjeG3UoXuLJvf4tB6q96AYo9bWZwxnIXnqLkpJp/o=;
        b=ZZf0L1ZxHi5kzTyxX+QGcQdakZhBt2nHzu8s2gHK94spNSevw8zxb/KmPwD/J9AyrV
         HMdRRtdpKcOyWvysL9cuXvDf5QyGicwh5OlsRBpR/xanV0Fvpxdp4Wb+W61Y4lZGBQYg
         K2LOTKSMuM9+FVfL+FXzVTkEyacc7IYf+8T3EcNU91juRqfIBJTIrONysIL4/gCo2S7H
         99SeVJnAg22Jp+7RIbYdBjKBkWS0JJ5wTb03OO8PKOQ4W0IjXjKPoh6qYpLR8AUdnR9X
         rg3rcKVy0f6caeI9nDyxyJfDcUqsDfaLE/x9zEQothxCjzfeiKOc5hEJoVGRZsWWYdOG
         +V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377845; x=1782982645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCYjeG3UoXuLJvf4tB6q96AYo9bWZwxnIXnqLkpJp/o=;
        b=opkKa52YYD5jTticLnC7lAUBsYirYH31Uf0VzSMLM5djngAjbtVvlN59undmCa7pVr
         I/vtrmKYdJohjEbMSnrezMcxeuxu58DGkfOiLnux2gKqGq3IGBGMt8DZ87PSqWFoSFZi
         rbx7HaN7uUoRgRhmEN+tC6J9kAWo5hDLEDwfUP/jAFyFVu5O05rrFG9RjgNqurlQ9ov5
         H0zrOuH59TAxNMNxK8m8G3r2EVzI4LRM19ugKy8ob/HgALMMRDBaGP6ihjRx9P+AhuTS
         0Cnoe8ySfuuBAJELX0+zh86ZjUjYzPfROaA/4kE+PM4SJnbOKYEOD4+NSsfuIVsc74ds
         nn1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrjfex0FK8nUlXbXX4XCVPEY8KDq8h5UidB4s9Dh8qT2nuJBopSUvxYmqTa5qY/uGsqEWCzthMpoy8giNzq@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaZ4GO38x1mEsFeSjh9vfivYWTZtXw0/qaQ/TcX4BPFOKyzCR
	tlvci4EDsCSQB42s7chMfk0PuAYupDs1cqoaPzPh1VNKAt4OwPOkGP7X
X-Gm-Gg: AfdE7ckomeF821qMLh8nUJsnRc2n8Ul1wormIGz7ttsg9rCuaI6wFJi/DGPenQtNxSP
	RgtOv2MKwlxvpPGV5sjp9lN3TnmcyKWajpwr2vu5uxQ4W69ytgvrV6V5bnWjkpHNvt+TqUZG5em
	r5mnW6Kr0Dmo8Oas/0zRysQlBm4xSqTDHaE+4pPAXx6GcwH4laPBxClz/EqwZ/yZVNJNP9CbEHp
	5ybvynisdu3IKlDxFhGpHKGN/CDfPkzDNO6PwEPe8vaVtLXtaWEtuuLT5eU7b7kmkyVdDDD2yYj
	LGvdkPxMUFlaP0hJ7bux8szEqubchd+wv7LznLd6ef22M3Ug6n0J8hSO2yXC35GPxjcUxJ+5jt8
	GBDAUY4YYx+bz8MH7Tpm2wOWeRsmbIfU/CTZwhQ3+y8BWGQNItQ6xS61wwogElvt+gXw3ymx1j/
	VJv70L7mrLwcU/PP5n0DcXJwxFG4IZnZQYJtrD
X-Received: by 2002:a53:ac9b:0:b0:660:5a7b:9d7f with SMTP id 956f58d0204a3-66487c7810amr1149739d50.15.1782377845163;
        Thu, 25 Jun 2026 01:57:25 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f785f6bsm1105061d50.6.2026.06.25.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:57:24 -0700 (PDT)
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
Subject: [PATCH 2/3] misc: fastrpc: fix map cleanup paths
Date: Thu, 25 Jun 2026 10:56:58 +0200
Message-ID: <20260625085659.4469-2-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114475-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B4066C403B

fastrpc_create_maps() can attach dma-bufs for every scalar argument,
including handle arguments beyond the input and output buffer count.
fastrpc_context_free() only dropped references up to nbufs, leaving
handle maps attached after invoke cleanup.

fastrpc_map_attach() also falls through to fastrpc_map_put() after
manually detaching and putting the dma-buf on late errors. Leave the map
object in a state that matches the resources still owned by the release
path so the attachment and dma-buf are not released twice.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8992b5c0c..50f90e17e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -580,7 +580,7 @@ static void fastrpc_context_free(struct kref *ref)
 	cctx = ctx->cctx;
 	fl = ctx->fl;
 
-	for (i = 0; i < ctx->nbufs; i++)
+	for (i = 0; i < ctx->nscalars; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
 	if (ctx->buf)
@@ -917,7 +917,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(table)) {
 		err = PTR_ERR(table);
-		goto map_err;
+		goto detach_err;
 	}
 	map->table = table;
 
@@ -966,9 +966,15 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	return 0;
 
 map_err:
+	dma_buf_unmap_attachment_unlocked(map->attach, map->table,
+					  DMA_BIDIRECTIONAL);
+	map->table = NULL;
+detach_err:
 	dma_buf_detach(map->buf, map->attach);
+	map->attach = NULL;
 attach_err:
 	dma_buf_put(map->buf);
+	map->buf = NULL;
 get_err:
 	fastrpc_map_put(map);
 
-- 
2.54.0


