Return-Path: <linux-arm-msm+bounces-93012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JUjEpZek2kr4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07C146F08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D6DA3014924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 18:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1B7318EFC;
	Mon, 16 Feb 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W0yeIQJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9A313E17
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265510; cv=none; b=MhOjGY8QWVlhtudJelQdzFuwidhhvc9Rn2zfQGMVma+aJ3l0MbIFEH1bLtU5La6I8/4iexPZBki57ccxjc3cLKiMITTzbHwAPfpvybhL63+z/sfP1ZiXQX+gs1FPh82QmI3EYpkxdNYAFYpL9ioQIgszu2znQWoVIoeFCO2RIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265510; c=relaxed/simple;
	bh=qmyrR4eAQ2gYoRBvP6c/rsMJF8jOCsHArbZlrZc6las=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aakLnL2AjAIIYGpZTgrEMKr7n62awacO82D/fXYoj/jUOsm+JPptSys0uWpWIgaUkgp1SzAODXj+zWonAbOfCepmC2jRnyhJ/j0wGyraBGP4Y9GRyGFQFzrz1LfXwoTQ4kPLDez27x4sqMsA/gs2EpmzcuCAsB/hsp7wzF7HjEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W0yeIQJt; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-127423bea4bso541101c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265508; x=1771870308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymwo2pW/jDGizs91i5oGR8wtWgbsstD/NJbYWAn5wMM=;
        b=W0yeIQJtjjtMuy0zvxC9P1NlJNa6l+S2ER8x1EQL6xTxtNk3FnbsoiWDgxBTSs+Lbo
         4z9LLfa9Kr9nP41y9rPRMqO2qfPuDqJGGwIGcdJtPO7L3/q1Kj1DD6z32C7aeCsQJNiq
         ECgEK+4eqVt2FzMYB246/WGDJKuOhXy0JEjOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265508; x=1771870308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ymwo2pW/jDGizs91i5oGR8wtWgbsstD/NJbYWAn5wMM=;
        b=DBRiIfkwOWG0pwJ28MpqLoUv12ypgJ/jV8zTVk/5q66Wq/OIkRNqx7zSRCxXRZI8Nd
         JyX08+p9WLJMxiiYHD7hSxuQS2V9Bv+RvhQzyuqDRauUwv37Z4ubsAkeoPLLuM7t0U9I
         kcWWPPtEtEDXnT6II4FEPXpuXFo407jN5TNeOIR3Tj+b/Oa+G5z7432zscL4DlFQoTWP
         OCpIEwS3rDfuQJO3d+LHjJdc7JrzVhUKd+nuayjZ35Q6XGDmVFdb97CM1fF698tUae4T
         DegM1MD4QZUh58g6fuRGbFO5lcS/0eJJjHtl8qGS/M1dxYSvPysNVqHCK92NcUE2q/ZF
         +JEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIz4Xs6vjkLaTEP3ju5TUkMX+EMHPSBOgYE/VV6za4wY3S5Na2DMpBwveyz+uwzs9C6g854N5hasFX1hnH@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqTJTarO+pX4x8N1wpYOzLZTJLdHEBSNvhM2qDCXLIjTaG8rh
	NEkr8snATkoUQYchlGcglQwB1NROHWrVDMEX8ksACN6uyGvHSZ8m7QWPCf2UqhSgJw==
X-Gm-Gg: AZuq6aJaUIfW4Po+aAR+4KgFb6+d7+F82vLo29YF+EtPVQUDQ627ay92gfKQaWp1FKp
	koUOnB5LofadZA+3dhvu/DhKHAC5SIAOeViZvLHfYr3iVC5sLTCkHLowXmtIHS76xb2LriAyTON
	Ox/AXCknWJL669ovw2hJL311N0lU/sopmBGi5omh5OwpffqV/v/Yoh906RPAuwxGJzjaiZwb4Lf
	ozYEkB8bGr905OI7EkbrGkaCSYwyrUlUGEsenX6CQ7EhujaCcc5Bpt3n8xv7F9WFOMXWVBsuTa5
	1P/+gH2/RwjPnJZ8mmgMvC04Q0KI4Qd31ETR7xNgOZu/s74ik93VpmfuGbN4yWp2EC+UirT6TBZ
	GXo0CnctkH3GPYFzZ5dhzC9O58tDMtQi1060KYRgqx8L0uwMXGeVOIc1luhEo6ZziT7tjcyO4la
	K+xkFyKbn8uR7NNfN821/TRDJJUX1znivLSVl2xIabZRe3+VQwk/5Algs0G8vP2HLJjMCN0+RbE
	XH7+H1BzOk=
X-Received: by 2002:a05:7022:6098:b0:127:34d9:9635 with SMTP id a92af1059eb24-1273ae33a4bmr4464871c88.30.1771265507844;
        Mon, 16 Feb 2026 10:11:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:46 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/15] soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:48 -0800
Message-ID: <20260216100943.v3.11.Id882cb3027e9d3a948ae95dfa6d310e3b29faa38@changeid>
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
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93012-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 9B07C146F08
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
This driver is used on my sc7180-trogdor Chromebook. While I haven't
stress tested with it, I can confirm that the system boots normally to
UI and can suspend/resume with this patch in place.

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
2.53.0.273.g2a3d683680-goog


