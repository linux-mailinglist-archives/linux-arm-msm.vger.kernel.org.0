Return-Path: <linux-arm-msm+bounces-113779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9wnrCnTxM2oAJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:24:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C16A0752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KfXKKsdA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B1D730091C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9A58F49;
	Thu, 18 Jun 2026 13:21:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96D28641E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788865; cv=none; b=SoACQatJSfaulhhpTT76aZY9QEWH+BePeD2fWmsRQGBN8uVcX0K1HlGHl31s0aKj1uPH9TIfqIEfDb5uakQXOXFKDh5UfpRm4s/VnQS/Bp43P0E/F2ZWVHquV2TRdvl1u/xjhzPxlH2cGuEW0OnuXb49aZ1yAHErJENPXXODZcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788865; c=relaxed/simple;
	bh=vNBdjxlU+ppYVxObjZABSBqUOEIF651kxgmpq1PcnqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j838SRjDx2l7jM7vLc3Ht29qzKot3YNCzPd96YDHQMi6fZcs2FL6bsVi04fOO1EOnKVDBuFyZq5J8E9W/DsyAvzvQzcq5bvA/iYgsiT6MbzxF8CVVR59mCM8NsUK503Pjaz9sGX3JLSDPGkBg+jH5ohjsVYyYg1mv9tu1kISeXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfXKKsdA; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso481766a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788863; x=1782393663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQcnBImPBTtnYmt9WXdAtfeZcsf+lPgDW7RAiTWI4cE=;
        b=KfXKKsdAbIW8msXI8bm7oncfKPtllmcuaTGN20eeD5EQdlcSgcWTl93mmuRCFEen4P
         WxFIf9C/SonYRBZMhMVtjcstUfMBmFJ76ehOYQ/inIFpULAlFXqfVf07Ikg1SGtbNNYU
         fNdH4kDIK+U5fBEMgxrPsgft4HJ8Y37iUi2S+lz0sD9ZgvmEmhoo9i60qnD9w3icM7VL
         WIiw44GQb4EWC7K6LIlKN+AFeMZFC0SnVK2e0tRGX+DSr3WwINIozAfpZ/TYm3NBhLXp
         Db0JmwGXd6alScTqn+QRCn7EEHeqGPkcAGqW7+/ciraUO/48l1PWqXmonDxr02cIIOcn
         sakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788863; x=1782393663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQcnBImPBTtnYmt9WXdAtfeZcsf+lPgDW7RAiTWI4cE=;
        b=Vh0Ie3WweSMQDGeu82mA+CLOoZtCHc4JWWqhDLf04QIoK9RIyDN4zfSB2lQO536VWk
         g8qpz4WY5zyn+XHum0sQqCBL4urK8YlnFYB/vYFRZCm5WnYAmz1wucwbogr5PpxY5Lh6
         R5mx+s9tBgVvYr+QPQnETQrAQvNpRS/5p54X8aidxV50loLnLScFGH0+B7r7C+m4E4ho
         pTWU4Fl+9A7XCw97nGvrqvjQfpY6h0cM1KorVvJB5CxngKlNn7chJAxB97vMk4J8elpu
         Fvh3h/P5u0FMoVsU3+y2ZJCCrjKJLv3A8ar0l/A3Vc3Y8YRdtLpjOE7/ufnLdzKCYVEa
         /1lA==
X-Gm-Message-State: AOJu0YzH8mH2pgPKcWhnS2lY0a/IFmXUEtWC85X1qVB0nXg789Q/4oR4
	BJ5W6lg9IxGEPW6Tke+mxV8uOzMA8QhHtI+dfzBmt/f6aKYrtCjVYDKz
X-Gm-Gg: AfdE7cmWolKwpHSjs+mq0Xz4CH/8N9KIPIIya2bNHCNxtfU2qkDGtyBnh0KnBCZKptl
	JV6OhY5X/Av91p9RodjWuPVgoVNggSserFF7gQrz2XldUYEMjUNu+cmSed1kXXH7Y8wKuC3ONpj
	ogTu2bij6BD+gSru9q73sjdAdP3xFxc0FnI1GZDcauPuGYovklZtD34WtNo/eytxnBtR3/DuQ8w
	kGJSjV4ea7NC/UQbjdlPKy9c0Q6OEz1IZBxuPnrANZf+hFRF7oc4TjqVkqEX7Ea8rhCvg6xh0az
	SHW6g5ZqyvqyxzBlQVQyd5r5tskiGO4lmjTEZB4jJwkvfRz7sXPoyEYqORJU9O3hFmYgQEJVFxZ
	XASbEJA9H0FXlS6AaQkm5pvC/FTLwWnxLRtPghX/wgKumSkUjrqW6jp0az7QG3B6wqHXL9Sa+QG
	LkkDalIF5cBX5ZXNs3zF7/2ielDNH6pCrFRqJaV8Pp
X-Received: by 2002:a17:90b:4f49:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-37ce4537d59mr3751785a91.11.1781788863063;
        Thu, 18 Jun 2026 06:21:03 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2401:4900:1c19:e45:6f99:fe25:8bbb:3a22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5b377e43sm8256956a91.10.2026.06.18.06.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 06:21:02 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH 1/4] remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
Date: Thu, 18 Jun 2026 18:50:54 +0530
Message-ID: <20260618132054.11010-1-udaykhare77@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-113779-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:udaykhare77@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[udaykhare77@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[udaykhare77@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F8C16A0752

In qcom_add_glink_subdev(), the device node reference acquired via
of_get_child_by_name() is stored in glink->node. If the subsequent
kstrdup_const() allocation for glink->ssr_name fails, the function
returns early without calling of_node_put() on glink->node, leaking
the reference count.

Fix this by adding of_node_put(glink->node) on the error path before
returning.

Fixes: cd9fc8f1b35b ("remoteproc: qcom: Pass ssr_name to glink subdevice")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/remoteproc/qcom_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..8af90d4bdbdf 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -247,8 +247,10 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 		return;
 
 	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
-	if (!glink->ssr_name)
+	if (!glink->ssr_name) {
+		of_node_put(glink->node);
 		return;
+	}
 
 	glink->dev = dev;
 	glink->subdev.start = glink_subdev_start;
-- 
2.54.0


