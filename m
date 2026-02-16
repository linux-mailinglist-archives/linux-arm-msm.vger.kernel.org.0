Return-Path: <linux-arm-msm+bounces-93010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ci9NHRek2kr4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1EE146EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C45530517C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 18:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18642EA159;
	Mon, 16 Feb 2026 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cRYNPB1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C6A2E973A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265504; cv=none; b=n3kcCNHu7YMgKD0amUY8T0jZUWta+y0JR3/y+7UIUVC+AjK8FMzI3NELsXZF6wv6KNNsF3Gn5nOHa1gcOkR7hSCuS4v0/pVlmfKVZ6AN9IVCSWYbJtfd34ixrTSVjGV5qpoAvT/lBt9oLu90bqWALh0/ZyE1Ti0vzqKFwRAQhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265504; c=relaxed/simple;
	bh=1LwO0v04lIfnNg2Y8tO3ZD/AcNQmoxD04js80NYmaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4l5MfeD/HghJo25iR6UwOzjB8PRRw5nupeq396s7ZECHpHDP6PWURniVvUtXMR9MDjO9jr2R5MLaLuse696U/7cOaH/u5meUFjRK5QQnbY9lCjnB0M37CUKjtFCYaqgZj/ASlUHIE93C2AMcBOXjRNBUz8VfSi93w1xffQmE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cRYNPB1A; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1248d27f2b9so4363580c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265503; x=1771870303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McVpUeglzEgOwVzdcsjAkstJ2kz3KalaGrnYqtVtRLI=;
        b=cRYNPB1APEtIU0So2QDoKNkCQS7tQJDs6p2bpeoyGHMRLTksWAeITTEYb7lLWGSUFB
         0Io7r2sAI7XCxnvEO4PkS6uaauR4sEEAs0DteGoylzPCkA6GDp5d4SrUK/kzM0CkaaN3
         x/l8gpLZ9hstQZsE9EqlFyC64odw1/Gt2cSsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265503; x=1771870303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McVpUeglzEgOwVzdcsjAkstJ2kz3KalaGrnYqtVtRLI=;
        b=KmwUpeA6qilJyhr3b6ksAmls3+h6L+Ih2hTR7uDyxmOP3K95L6nNFSPEMp0pOdXK3G
         rYToXGP90rRZdVUMMrVZbQMr1GyRKLgZ8UJZ3ksULPCurcd8W50CVr50Cyl2IjFUwHH1
         hco0YyodCyPQGbWNqtWjrvBYLcGs1kQBvf9HOlGqP8w20LkKvnHPo1217nmPHKrRTjzI
         g5atYL0CEqbPdziUXKEinEEOe6zhjfY8wDWGfc+rDm8DKfAp18hTCz2bpQJEniyN/gtR
         labZIkILq6qOrzAEpJY2ZWAC/dGTxNh+nRlU0asrqAX8y9wpTtpM2vLUjIpdlKBh2Aht
         pkzg==
X-Forwarded-Encrypted: i=1; AJvYcCURA//G28MaXd0HmG1zVZCwgc3BRwomwWD+bajWanp7Lg4SulFFFrfgNWpT3pVNejuPQMZw2mjfrsbBdVu3@vger.kernel.org
X-Gm-Message-State: AOJu0YzYzfBaLXrzYuEnqx2HBNtttWL8kibh4IncDny1xgWbm0guAMrq
	gkVpfBnZR3bF6Pqjxu73zUaVeCKuksgpngCbaGhaEjEcB6WYeXrxM3aINGo/abECbQ==
X-Gm-Gg: AZuq6aL/FEglqMxMWTg3ZKAZPrwxVsMDmLOJm+Gsth1qfeniM4K5Zzh56czReN08GIy
	X/CryuSRG/AvxJZ85kVcRHCGFxhhCd1x8ZDBNLKqhuL2d8mM6MS3Bs+VJGf9ZJgXML6drgbCijZ
	ooVBn68JOGLv7r0wUz01tTcGC6Jb1Le8VmjP3PSBoowFfi/yKIfdbJdSofuVg7Tri5YpCRlaLrd
	EP/f76Bz8GFTwoc8CdKw3bdKhkzFbdK70fi9AlgSG5MYpPwbqc8aJkG3S7nbRGNmh6uyi6VaF+z
	uMGa+38/eYj59tXlkWcLqJ9EqMVfMIWghl2er+GaLgDGLqQT0OCHKBLxM6lOs3idiJEm1YX/Ju0
	JAznnbAWl6B3GN2uG4QVV9zpmyEZRhk/iXkkMQzec1RBUxcakhV1LQF2nspBGVeLI5QzaElAych
	wPXsTGHhvJunlvA4Exs3Z9SRktJl4Kn8gG/vxGXG0BMMLfPvacoxkrQOZHkBUOdh7v8DkxK51EO
	H979VjPnEg=
X-Received: by 2002:a05:7022:160a:b0:122:2f4:b251 with SMTP id a92af1059eb24-127397bf3femr5004979c88.21.1771265502576;
        Mon, 16 Feb 2026 10:11:42 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:41 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 09/15] rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:46 -0800
Message-ID: <20260216100943.v3.9.I6973a32c3fcd6d2edebdd6fd868fe0a046420ed5@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93010-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A1EE146EDB
X-Rspamd-Action: no action

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This driver is used on my sc7180-trogdor Chromebook. While I haven't
stress tested with it, I can confirm that the system boots normally to
UI and can suspend/resume with this patch in place.

(no changes since v1)

 drivers/rpmsg/qcom_glink_smem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..f2a6d94e72ea 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -197,8 +197,7 @@ static void glink_smem_tx_kick(struct qcom_glink_pipe *glink_pipe)
 	struct glink_smem_pipe *pipe = to_smem_pipe(glink_pipe);
 	struct qcom_glink_smem *smem = pipe->smem;
 
-	mbox_send_message(smem->mbox_chan, NULL);
-	mbox_client_txdone(smem->mbox_chan, 0);
+	mbox_ring_doorbell(smem->mbox_chan);
 }
 
 static irqreturn_t qcom_glink_smem_intr(int irq, void *data)
-- 
2.53.0.273.g2a3d683680-goog


