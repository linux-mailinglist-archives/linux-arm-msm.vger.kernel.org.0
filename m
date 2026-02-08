Return-Path: <linux-arm-msm+bounces-92145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGOsHRgMiGmyhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:07:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F14107D3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FCB0306D492
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 04:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC3F2C237E;
	Sun,  8 Feb 2026 04:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dur/ZpZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E52C2360
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523471; cv=none; b=RH5wNK/TD0T87sfaQl8oT0HTbD+7mcWh+WUr81+6IdIfRyB3bRlPtURRYtz/WWCYfolsLrzyn+SJfOJztgelk5I1FycDjY1jWCFRqBbCONA8TzEEvgwox8k15sJhVom0X6n4+Hg4VZvpcza1fKenD7Q4yhgf8K/c8qlffDRDQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523471; c=relaxed/simple;
	bh=Orbri32xHuv03gpzS9cVteJyifmJeQFoiQPoqhr6j3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhUl83MCZNKtp9yKvwV0N5bcJiUXYR35oCTn295wRLFKKY/gh2xYHG/P7yCW8GlUFBSbFzFQe5hP1xXJJU3uC+bzW2pABLR7nYDFn1Thcb41pDrCpo5S27GX+1fya/ypHvGGDrtEvau6DQI+MCapMc6YfAm+FsP6QkPqwtSHXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dur/ZpZu; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124a1b4dd40so6661596c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 20:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523470; x=1771128270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyL5nxa/XcZnD8gJCLsBtvC6TjJ39RzGnqL0OD02oLA=;
        b=Dur/ZpZu/xLlOINpbgtdb0mJdPH1RNQFYiLpqTVxUlIH1wHWRTnNkAcEZw5XWF49WG
         RKJcB7pZ7HMX+q92sa8wts9P4w5uU9++bp4U/S6Lf0EueAr+FzZhN0LFy8Zi3Nuz5oeK
         S4jTWgqgXBdy+PaZKiao5HbW1d3eMn904MuvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523470; x=1771128270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyL5nxa/XcZnD8gJCLsBtvC6TjJ39RzGnqL0OD02oLA=;
        b=QFL2XLN2cr4dl6j+Q0Yo+O2y2OjS2hKtmTchultZWTKbQtdUDc4h8253twhQD/zFuK
         08hxCVZig+zJmRn+vnIGtdMONvBMlZK+fTwZe619jfgH3XK5U/xPQO6lTmW2hn4bXTnN
         NxVDcWypUfBnJX6UJSrgU9vRWP35KK7MpIg0EJpjuAggh4NYwGVqQPsFWaIrWtX07PKL
         ktv92r4m3OXNypBqXUKumGSioJmtnjBDZC+yiWy0OoOLfQLE4ZFiYECr37BqfoLCHzam
         8Z5bWiWnvfGFNPIhKr9u5EDxV3lRQnHJ1l42tTJ/x3QFxlZbL6IpQ0/V2wh4sRHa8vxv
         5ktg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Go6Uk78jx1Txc7OGxZWeBUph3uaivrOiajbjvrVzeZB+9UkHBFS0ZmsGKWRFxXKzcW+fEbc5le7n0crS@vger.kernel.org
X-Gm-Message-State: AOJu0YzALa/SGqsO0tq7c9PTtjx7BGnV2LNWtJuE+YjFh6HWUWZBvMJ3
	/qYHKixbO2zzaWm/t5Mmt3EtNPsabYey70vqzwZVu/MU13BEY7gCcB/7yctSkocKi/CHGavBCVj
	gzyw=
X-Gm-Gg: AZuq6aLVZuULQukHIUUsbWUO0gU+1ym2ght4PQPq3UrQpfuXHd3kR83EXL78eBNkSsZ
	jPNR+B4k2PWCuxORBWXMyWBNVkkZLfpvjtq/DHP7VzFFawcFALj3M7B7lviqQgfpRasoaxKiMNl
	SHHKCWz+2K+5tmkhjnU+RVNUsuMIOvJ72meVQ5WVQBaVzW69F5cwbXjlVMmWw++r9M4NKUNU881
	DNKjNEROQrauglMC2gQufEDJX73/VNoHeFBsWfk8KLXpGvYGRAiBkqoSjVTO3+nP7GoSUTj216l
	wMX21CGD2/r1+tGCaRfLh3TkKlHNOCTlqKpS36ws8HqMDw18IVXSnPCDBgm9cm5jqFuZMkh+MVx
	yyNYcHOMpXSvymGcbJ6A0Q5g2m+FsHef38ZIVjgK3wg7EaveZKPuMEHhHim2PyU/kbb10LBgXIh
	9QqyvinKsYfQx47ZqM1njzyFlLCIoy/hDPVOnwHsmvmdTo3OvMylzRbwpQ0t7wZ1k2c0sKf58=
X-Received: by 2002:a05:7022:6ba6:b0:11b:8161:5cfc with SMTP id a92af1059eb24-1270401e496mr4235997c88.36.1770523470198;
        Sat, 07 Feb 2026 20:04:30 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:28 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 08/15] rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:30 -0800
Message-ID: <20260207200128.v2.8.I700ba93ec437db5100c0076941d8470344ea9995@changeid>
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
	TAGGED_FROM(0.00)[bounces-92145-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 14F14107D3E
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

 drivers/rpmsg/qcom_glink_rpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..4cb9c36adcd4 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -197,8 +197,7 @@ static void glink_rpm_tx_kick(struct qcom_glink_pipe *glink_pipe)
 	struct glink_rpm_pipe *pipe = to_rpm_pipe(glink_pipe);
 	struct glink_rpm *rpm = container_of(pipe, struct glink_rpm, tx_pipe);
 
-	mbox_send_message(rpm->mbox_chan, NULL);
-	mbox_client_txdone(rpm->mbox_chan, 0);
+	mbox_ring_doorbell(rpm->mbox_chan);
 }
 
 static irqreturn_t qcom_glink_rpm_intr(int irq, void *data)
-- 
2.53.0.rc2.204.g2597b5adb4-goog


