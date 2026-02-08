Return-Path: <linux-arm-msm+bounces-92146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPEEFy8MiGmyhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:08:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB844107D4F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38C9B30773FA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 04:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E2529BDB1;
	Sun,  8 Feb 2026 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hgxq1nOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591726461F
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 04:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523474; cv=none; b=jDbsMwfDukLzZ6IiBH0ZfntMkMbAsiRM3bOomF9FmCznIfSXvXeSe8VeMiS5OG6/f3pyqWdjpgrDKJNJQfXw9TwvAWTITE3FVtGJ2YkhzDI8HVdFpsxKx9qvSUZ+/nQRf/nOsdMaVR4Yy86sOfxY4Wh717lJThlCmSqjKKbgKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523474; c=relaxed/simple;
	bh=XFJ6n04/sV0RGWx96Y0deEcCBY9lYJ4aO3gH79dt61A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRvPSm6RAIDZqQq2hEdXIqbCdB/zxqlLMx6MlwMxOS2kCOxq43LSBawvQFy5TiCPVz0Rio+bHsGkKueDeeyu4qvTV2yN5llxzIky1TRNKHeyjtiqe3I6N+DHWruquJTZ8bWT419FQ0pWCaEwsi07qFlpVE5t9LwEVOBwW2R/0AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hgxq1nOq; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1270be4d125so4010303c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 20:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523473; x=1771128273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeTwNqi+XJ/8HLrMMWD9b0KlELdWsXmDwflMIt0OPRI=;
        b=hgxq1nOq02T0QogV3fyJQfW79F0GIaC8H/BZ8cCtW4RhigiY0Wn1h7UyP1o9ysdari
         Gs34ygCFmkrJsi+ZuC+a6NFi0vwuwWdV9zXOeOXtaH3IZxRF21p/jnIJFBJXWN7JdAq2
         bAIMxaa4bzvi4Gj6UNhWWsQe8apDV4/pY4FKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523473; x=1771128273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xeTwNqi+XJ/8HLrMMWD9b0KlELdWsXmDwflMIt0OPRI=;
        b=qfyL3EWndkeYNDbiR01YgWuSda4nxfZJxH/jUjkMhPBMmdwP2e8JH+hV21+A5ijaNy
         UWf6i3YTYp4PJrkzoxeGwZxyQTfpMps8tFW2pukv/qj9HEflJMARxpIwrT7IKWzNzRiQ
         klAms4fawPxIiecU1L67MTOfMnXRDbjcdtWsWOzBpW56CkJKNnfOffwtz3FfYuXlcs+h
         BQsL+YEDPiMbE2tW7tqz/H5x2GhHSIn7IXaHfW2Ne+IaS+xefTSt0gBQwxNauclL9n0X
         H8C2WkQyWAJnJjj4gGV1RzZw//23jwuehMn7zfHpmzpaAAIeHvv2J7G7IwCjuFt6JpeX
         KGeA==
X-Forwarded-Encrypted: i=1; AJvYcCV4grcFoXpv6xhDy9zeLs8geJg2jWMgUJmbwwTmuPl5XwW57oRn0KbolevyqySwKQaAUCi+CfJkgzREOYeR@vger.kernel.org
X-Gm-Message-State: AOJu0YyCjNZCURRla/hHXAbGbK8YXHWFBTmjGjcIGKn/G4VAvp0V6W5u
	71ZQyxVzgTNB/XwWgfH/E4/KIJSWHWcxvlrzJc2srycoZ/Sl/OOD9LtF++AqZRSnfQ==
X-Gm-Gg: AZuq6aJZ0zs1LR1pAwvN4gxcWi8B0ZMmAZ/3/xxdagHiC2zIiRpCTKJDjJtDsg0n566
	FaqXjqFzRzgRQzMUBqtZCg+iI61r9c1h25efIkCQSekKydRgr4CISTDIqfD5sC7SH1u4Uyrx4ht
	Z/JaEnXWMwk4ShMKQilU69M8Xw8GCotJIT7GI4fJiOozOk10ILI9EfbESYiP3jUbmeUAxNZzvMK
	uNizfthMsv6VcyuxjNv7tL3Earfww+roqeQEbJ60YcLRje8l7ZUlwp9ShKAHBtB77ebZNkMAwsS
	6FghfgW8jaJWHCq+OcKOE399+TkUDXMNoJQF4y1giPp6JgzSSvlrhcoS3E+bO7bmPah+89dfa8c
	KnaSMP7aXMOt7FwTg5N8npi+yuWKvhtzPR5dvP/ub+e9WxNufzF+JGhFk+AKmWsIzSTZfuc+9Dd
	xMCyBH2iAzrI9s/3OKWt7rT/nWjaOTsqIyAUih6FVDaeNWlJGDgVob/vH7e8j0ofrTgMWcx4Mjf
	ZrW/d4YYQ==
X-Received: by 2002:a05:7022:7a6:b0:123:3bba:fc4c with SMTP id a92af1059eb24-1270407387amr3855209c88.38.1770523473030;
        Sat, 07 Feb 2026 20:04:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:31 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 09/15] rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:31 -0800
Message-ID: <20260207200128.v2.9.I6973a32c3fcd6d2edebdd6fd868fe0a046420ed5@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92146-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: AB844107D4F
X-Rspamd-Action: no action

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.53.0.rc2.204.g2597b5adb4-goog


