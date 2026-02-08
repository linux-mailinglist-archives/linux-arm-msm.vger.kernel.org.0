Return-Path: <linux-arm-msm+bounces-92147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPa8KkcMiGmyhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:08:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C47107D65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AD0A30125F5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 04:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F44B2BEFEB;
	Sun,  8 Feb 2026 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cj3qW0yz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EDD26461F
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 04:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523478; cv=none; b=YmuhhXE6hPv2Ek2dnDOHIWCH8iPPG82FsBGxeuYtfr+BK9afd8TFSjbl+QUX1voX5hH+qsAdC4JjuvnB5jquuNPzrmpAaSIIIHvuQm0KHZysLV32JmSPxVrNehmfBWqenb4rBjRoY66XJRhSMnCaZ2D6vfiHNmkzrwg3v8rB5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523478; c=relaxed/simple;
	bh=SAIOYHmewH8+YpnZCmSgyUNdDUrB0z7/bJKOh98QEn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYsya1Nu6vG5kYlfcQSdmewm8Pn2kw5j/3VJxBADQZGIiBJIbQVUrSfibkccHkUGSRnr+fXqiMMRGScsmoFcwvw/s2RFWgn4b92HYiLcQQRg6bVag82/94Gwqt6YJ6qvf6h0Y/u23GaTwAFCTMhDgmHpvJJNUpw7SwuFFXrfeP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cj3qW0yz; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso105738eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 20:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523477; x=1771128277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhq2fvDAB+z0+8+dqvd5EVUWoDgUFedDXtHNQ2aZ3r8=;
        b=Cj3qW0yzM0kMFj7sHk2DuAmK/FBfwUDIrELDp3q5Pedyt6x9lC81zMsAJXBkiXTmc7
         QmDEyVqdLqDb8yxHFi7n/3fhMMdPj7EylK3EXgySiFLOJECiTZ4qCWz6EnAXEOQ8pEwN
         Syv5+CFuMSTJMx43yaHKCTOWJoM2X+ut8+KGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523477; x=1771128277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rhq2fvDAB+z0+8+dqvd5EVUWoDgUFedDXtHNQ2aZ3r8=;
        b=vk/CNlgh+Sn72CnKG5omXWXm4ojlmxw0FFKlV5p/dnSYGkukX6Frkq6oARy6HKtc4Y
         QJDKB1Kamn1VPoEHvCBEi1iDXoJQa+V3pWibVCIrFfNivTzm9b9Enw0e1kouo4PPNL+l
         D/soo/3RPAI9tUBxrDLzjqM3qw12lpl61PAhO81cXHOTMvW1cRD40Ki9mh8yJR0oNZnh
         TPsCCxRT19SoGmNFjv1RCXeq905UqydRHfQOmkcBw5RZHa5Q0yzER40qjq7Uwf9RW1zd
         EpIyUJkGiFQx7gyWiM9CLLAzUd/RQELpP8VPOBpAZxYZduhNQnY9e4s4IPF5LzqNu4fh
         guCA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Q6Fj58yxGUClLug0JpqydhrSohxpPBD9MpbaJZTcOhkZeHcBMxNSQaweI2bfBm9RA3yVqVUMlbpEE5q7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDfLyr2p6UiuYzQm7yJuYsHQ6erhpzPqWtiYummvttAMfLJUI
	bwgWz8haNyaUeZlwkt2/v9mIE/JGo6+5sPVsyrfoUgItRlRcWWc9FLuXrBfBbi1igQ==
X-Gm-Gg: AZuq6aK3vqavh25pLa1lPiNbAnWg9I0T2N/YB0VpxCEaDYk8BTKKkmjpj+M6lTbOi6d
	EXgdyFtc6ArVW71XOX/m/3dPtJ/BSWn7zvJImrA6ubDUIxLkM7CdlCrvh0hrKOmSnFpKKNJd9+5
	gwdXr9vUfP1Q6K43y++Fz/4BmdUYmsZPTXs8H3WQJNeLMiEVEJ+S0sXnE5T+ebyalkJIhNsp5I4
	zLQJpY5jMKqWqa81/LMCicCujLZx0o97RrIwfVECnmmXh8hZ/Am55r0xeJrvqgPd5s++M5kqpeS
	4LFJHLMvAv/Azx5EtB3DH51k+yQWLZTGEnMMcTm4yHzqCSIwfiPLSCRZn9AJ08Y4OZ2wqn/wu/c
	tyHEG1OmAn6X7c70r64VMrD1XcKCOLY+NicJpfKWNj119riXqyietXC8yKh1Yd31ZMXdkPd9gdg
	qq9kwQjbSmnBJ0BKwtkF6og1dY2pxfL8/zUOFzLik6QFB+eiOcTh90dbJACJ7/kzHG/PekH7c=
X-Received: by 2002:a05:7301:38a6:b0:2b8:209d:5983 with SMTP id 5a478bee46e88-2b856833715mr2948032eec.29.1770523476783;
        Sat, 07 Feb 2026 20:04:36 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:35 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 10/15] rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:32 -0800
Message-ID: <20260207200128.v2.10.Idbe327f5b4ce65a284b55033627d0819e2fed21b@changeid>
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
	TAGGED_FROM(0.00)[bounces-92147-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 30C47107D65
X-Rspamd-Action: no action

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Also remove the comment about the only cause of errors for
mbox_send_message() being if the framework's FIFO was full since we
don't queue doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_smd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..afe1177d092e 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -371,17 +371,10 @@ static void qcom_smd_signal_channel(struct qcom_smd_channel *channel)
 {
 	struct qcom_smd_edge *edge = channel->edge;
 
-	if (edge->mbox_chan) {
-		/*
-		 * We can ignore a failing mbox_send_message() as the only
-		 * possible cause is that the FIFO in the framework is full of
-		 * other writes to the same bit.
-		 */
-		mbox_send_message(edge->mbox_chan, NULL);
-		mbox_client_txdone(edge->mbox_chan, 0);
-	} else {
+	if (edge->mbox_chan)
+		mbox_ring_doorbell(edge->mbox_chan);
+	else
 		regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
-	}
 }
 
 /*
-- 
2.53.0.rc2.204.g2597b5adb4-goog


