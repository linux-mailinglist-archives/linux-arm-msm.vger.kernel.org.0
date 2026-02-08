Return-Path: <linux-arm-msm+bounces-92148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBPpKnELiGmyhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:05:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 028A7107CD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 811113003725
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 04:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0516B2D47EA;
	Sun,  8 Feb 2026 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JewUcUnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016B2D3ED1
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 04:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523480; cv=none; b=CBD5WmrC7U0HkBfLb8Yw6o1TRBVvLwSd4CrucPPE78f0S0H4iWU7I0+zk5ROgxu4QjN+jEVE/Tg1SxGYo8JkRVs2wDWI7LoW2hLA1bOXzSlX5rnbwXl0dWTw9xaG6RXBG1fZHiALaZmmsAloHNXU7YZiHRNpBEFIlBIPY94Zols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523480; c=relaxed/simple;
	bh=Ml7u4mN4bbcyRsGnR1dXDGVW2z9xrPW4BKd3PDwYeFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqA1teZGuBm+UZUqLCmizFbs83uc++tNKC/r92CHcwv+GI9LsD9kSs+aDyUP5btxHRq8CbaDpTIQYETVwCX9ww6t9zusmOCUb3oIvaZZRuZyKPjOG5iISDEJOaELD99ynBqHtZQdUdhi3Xj9vetYgJeNOgSP9N/CGJDPw5cAdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JewUcUnO; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124afd03fd1so2657435c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 20:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523480; x=1771128280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11XHbq/AgNOnUOiTdM58KM+JxnC6t9mJBJNAw1b2Iyg=;
        b=JewUcUnOUJvHBopFK/XurjrDegdUJJgs4OXsrcu29EC7h/FpvRwP8ar9YVf0D9Sxib
         CMK/bYKy7cZt4+j8+okDWBwWpOcI/D+GIKdsoB4HRUfqO2U2ZgKPnZqqLjY6fuEUmuLr
         wxkqE6nd2HyJDVGB03e/+t7XuLs3XSJ+4wkqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523480; x=1771128280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11XHbq/AgNOnUOiTdM58KM+JxnC6t9mJBJNAw1b2Iyg=;
        b=GoGTP86rNtFVZG+IFrSIE8D+MoC+K3cxjMxezMEq4H/gubH+jL3ODm6BwpIkToAyAJ
         XIUkFTKYAyeaEEtv1h6Vo/tcoW+pwwyjbuqoJyjqneC93snqfGmRfQza0POcw3uezO6Y
         h55dMOGjVQZlsTxzSk5khyookp4iJiw188cvr+Qhj4zXtlxZBezwIKdT8kvdwpbsUFCZ
         2uuA+eEprQO0iOT5yuefa0Eh2xn6bBQFV33wRUDw1+sUbV0//nHs9Hg2cBT1S7g5CwNH
         /LwPdDkSxw3bJImsFUDiczkjSow0UuCLNeONZeg/q3X4i75UBL/MuuqlI325iJ3DH1bV
         6Blw==
X-Forwarded-Encrypted: i=1; AJvYcCXAOCcR43fGG23wSyb4pNkh3yEiWiUjSd7PZLbiaFY3fuSX3EbOEbgQNIMT+G6FUNpP07bJq2HiuspoxsKG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OK92gbjH9/Y5P0r/DdFa67nashEFEJrwKVX4pto1rDul1001
	P+F6okh9da3kLpq/lHkWG5f+NuGuHMg4iDjaNMKPqN9ZYTP3l2iHn59s9oS9Pz3IFw==
X-Gm-Gg: AZuq6aL0mIU4ClLVen7xthdYbPt5q2OISBnoP6TU81z5gCY3ya0XzfGU5AMM98PXYCD
	MiyAu4aLOp8nCqjloAYyZ6xzY9Nk8RCXaHK67Q3k6bsd7vOfDhKOmv82Gq6ChitttYk2OMVV2rz
	c+i9tXDzE86dzsWMVZ7231r0WdofmDI0U1t3ZmpQntFbckGOCIEOL5EEFUPgeKiAowGZDY2WY6h
	KSy2f9uihWAv9XItHnVGcQGsI1T7hZU3Lb9XAEBvBkY4fR6G6yjvQIGB0/CR7/uwgt26jebK6sb
	VUIRH86FcjxmeVcTRo+hhHaXdka9+9AO32ouzea6r8XbXgGIiU8lJO/hoSnC7V7KueBkaVaN8qi
	b9f8Hz6x/ZGlKt0Tgvrg+3NB1tNiJAdOncWXK+N8G0B8H74jca0qT1LWJmMZTPB68H+jUxaMkJg
	UbKGLkH7TnHboEjW9cUjrEFmK8iX/+YksW0NHZaMJzNsD8wfG/8a5bEk9wyLuws78juDcq8b4=
X-Received: by 2002:a05:7022:660f:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-12703f54339mr3576543c88.6.1770523479996;
        Sat, 07 Feb 2026 20:04:39 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:37 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/15] soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:33 -0800
Message-ID: <20260207200128.v2.11.Id882cb3027e9d3a948ae95dfa6d310e3b29faa38@changeid>
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
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 028A7107CD4
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

 drivers/soc/qcom/qcom_aoss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index a543ab9bee6c..2ecab93239d2 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -97,8 +97,7 @@ struct qmp {
 
 static void qmp_kick(struct qmp *qmp)
 {
-	mbox_send_message(qmp->mbox_chan, NULL);
-	mbox_client_txdone(qmp->mbox_chan, 0);
+	mbox_ring_doorbell(qmp->mbox_chan);
 }
 
 static bool qmp_magic_valid(struct qmp *qmp)
-- 
2.53.0.rc2.204.g2597b5adb4-goog


