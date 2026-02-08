Return-Path: <linux-arm-msm+bounces-92149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCk0HnsMiGmyhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:09:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720E107D83
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8214D308D04E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 04:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63682D8379;
	Sun,  8 Feb 2026 04:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YJzv1Ite"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827CB2D7DE4
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 04:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523484; cv=none; b=oFBYgOrXqaEub/dX/nhrTGtmdmWwtPAN//ktFr8jtRqnjl3AxHeNCxtiXnl6X0uf+sc8mBeOwYYUVphzmJ7kBpiaDo15Kh16aK8Hv0aFrnBYiMHnc/qvGXHVqZe74HlnPXOR0n6dqCcVwWsar86hYSPpvQK0DStex3N4jlnS93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523484; c=relaxed/simple;
	bh=SWVYxfhi7Dcfk51X4QoCD2Wwg3Cgacsl82Cb6EpvNzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFWkqXZrQu8d58KKgesdSzBuRNKkmrEpSlFf8hls+TktzwdrV8i22nbrEaW2VPPmppL15FHWpFGVcAMRtqHvA+igj8rysU0Yqw9p1bsJ/njjgfaOrDXKKsQM6pI7DjCjSgFBW43NHDz2i0FzSkA+CAsXiO03Obg1Z8XcDuS3JVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YJzv1Ite; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124a1b4dd40so6661850c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 20:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523484; x=1771128284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naSNPUx+BkuxDTEggI2WXPi5YGqGZjA04QrJqdp3Ffw=;
        b=YJzv1ItecSZj/XM++k0WON8Zpv7MwMyjEdJv+REOZWW2dCys8Ck6hJn4JfVs5U5/t9
         zb2PQ3wzmHFnEHmJwyvWI26vvjWsL9OtRyp65YwWAKWPeUfIHC7In85AnygwH/+i0wir
         LchdmbilJ5mPD+O9+snBvkJfoVy2vA4Ku/pCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523484; x=1771128284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=naSNPUx+BkuxDTEggI2WXPi5YGqGZjA04QrJqdp3Ffw=;
        b=hgGtlH041UOZESIzvsBerboI0JPuxCl0FT1fXHRYghhFt0IG3A+KY4i88EbOJcaPuH
         ZwqTxEQW/XunpwGhpvJMsFyxZ4KJhenYJgCEdSMenLr+4l2UY1ClpEG32rgLxeH+Km87
         uOO51N8ElHoXDK4NA7KYvdwNjz2TPDoqcIMUwIdWjUi44QSjOq+1JeQi8uI73gkdNBRR
         vPL3JkMQWNt/9DL17c11+PLzDUQHTRNMg4M+YZp/tbC44Q7rTHHCH3pkDWmyNSOMT4LG
         8aBNxFLd0+uGMmNCuCNQyVuN5xNRqEGVtl7+cVtRbl8DX+GdV1G7VnSh09JlDiMUES+w
         zdyg==
X-Forwarded-Encrypted: i=1; AJvYcCUoL+vm65H3LVaK5WabBD+12hwq7/1rmDW4MqZaxjU4xOgcQB9sNJWZACcZUMxkgw+3vj8EdNjUGYEgUsw+@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4F6gM42zXpqEdzfLvDp/In6Zc9lgY+7zX0rEh+wBC1lEesvv
	UctrGPFx0aE4hhdbNxDf8nYBkUS8VxygvluCEVREgSFwGqGcdXW2dTvg+OWmQqkZbQ==
X-Gm-Gg: AZuq6aKpHA4moX4Yq58wh8F4L7ReEDZguoZNzVD6fFPvqR1xQPMTetyYLv8axTrjo6c
	2lV//43yB4x01YIp9firnyjjqg2/YDFVBlrUnao+rBoyWdl5f/mIkwba39kI3s8G9wDv+7kXwuF
	k4YnkhKnuzqmhcqYolWivkSL7EJBOEp2/y0Rw07KT5U8OEgMr23d3uD2o5cDRmeqhEhWFsydEdK
	kUqss94lp0mZWbll2v2HpbAaSJTBymd3kBLakTThuBHPHhiVnx+REE6J0xaqzSMsvzjSGUvXBbl
	1OrAjgJnFCZgaucN08RVo0kp/kysFdNB5LY+PMoD9SHBDUN3+qWcDb275uHa24mQ2v4UGrwdNN8
	IYGXthm+lUIt02Xhk11D4ScSG8efKivRAh/OAxZnttfe7Cz3E/MJHDGY1U3YDgrN6Uxlthe9MrO
	GYzxKOIBFHtkZzFRR0Ax2M7qKon1W6D0vkzmx9R9taO2PrgUBHkO60Xi59gHRxMk7ed9xols4nm
	GBAKWKl0A==
X-Received: by 2002:a05:7022:2507:b0:11b:9b9f:426b with SMTP id a92af1059eb24-12703f9b0e6mr4093184c88.20.1770523483646;
        Sat, 07 Feb 2026 20:04:43 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/15] soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:34 -0800
Message-ID: <20260207200128.v2.12.I4e47dc2356edbaadac7298ddd65dd649d9b5ee16@changeid>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92149-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1720E107D83
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

 drivers/soc/qcom/smp2p.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c1..139307b66a47 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -169,12 +169,10 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 	/* Make sure any updated data is written before the kick */
 	wmb();
 
-	if (smp2p->mbox_chan) {
-		mbox_send_message(smp2p->mbox_chan, NULL);
-		mbox_client_txdone(smp2p->mbox_chan, 0);
-	} else {
+	if (smp2p->mbox_chan)
+		mbox_ring_doorbell(smp2p->mbox_chan);
+	else
 		regmap_write(smp2p->ipc_regmap, smp2p->ipc_offset, BIT(smp2p->ipc_bit));
-	}
 }
 
 static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
-- 
2.53.0.rc2.204.g2597b5adb4-goog


