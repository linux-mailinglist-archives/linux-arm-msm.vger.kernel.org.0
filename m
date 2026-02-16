Return-Path: <linux-arm-msm+bounces-93009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLfVLmhek2kr4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B8146ED4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDFBD304DCA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F95B2E92B3;
	Mon, 16 Feb 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JgbbkxkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE32E62B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265503; cv=none; b=Pd4Sl/+MhHfsyy2zWh6CWVv0tTu9jUlzYgjTBQQisFdtGXZY/Da0zHAJTWRFDi0Wi9rCbBHoiJCYsFSmPv9sUYA46Jl/ZXYJQAZnLD3/vlj88LgyiPTVgyG+KVftEgQWrJ1KRMmcZWO7AxpEQdz2uOLO1NEL8xvbGhHqZvm0qWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265503; c=relaxed/simple;
	bh=fNEzY1/433eDdGyIXd3gTHHwaVm5VhatRxpUEgl5vp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EpClzx+ha8RabQRwnpQvnmTS14Q2eyEhDg4KSM63mozFOR3+2XcEgY9+sUBBJzISEwvz4cBzSW6hfa6w/yWZhqokRy1/CPZIaAaKFqOhPOJBtyExd/HQ/hJGKIPwmtqI6SAdiSefpRCNtFsjhAf7fdyKqG4bihxsJxQUN9xABTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JgbbkxkK; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124a635476fso3831363c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265500; x=1771870300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqyxcmWx7XZ4iXbnS055ZItFgkfiS2n3W/xrPfsX0Xs=;
        b=JgbbkxkKARzwrsc6jY+mqTuh/7eDCd32HnIi3MKzRe5RHXEgFylaYNVJM9bYi7vHyn
         QSz0DitwTZHtGX5/lZfV7FgXCFllvATL1RJXXtfArG56j1lEuw/F/z6qfYdHvGIjDo4g
         jdMJeDNNTXQdoyjmoLi8R6lZom+xEuA4B5hlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265500; x=1771870300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqyxcmWx7XZ4iXbnS055ZItFgkfiS2n3W/xrPfsX0Xs=;
        b=IwnERrNzYWS8NDOgCM0z4QFdyUOPctMaNTqXINjagU5zqxN/ts4DuY3jiiZRc5Maxq
         AHiNhl/BaCNnzaeFZMQ/6F5DwhpLA3uFL1Evn15QzAnClsb9hWW7565ntlqdQlaCapCj
         VPIbzXL7OXM7B2+pAKqCQIiUWT5hp5ExGEOY5j0lnYPASe1rc9Of9qpwye+3xhpi2/Gg
         XfSoHQrt3SgLgK4dIBvFp0sVs2WJTkFvdS8wYcXrn/WOQsm/Clq5Lu297gSr1mUp1DbA
         rP6EuSPetMdYQhvJLTfIhyrjBucDmSI0nFmvvF5CbwK+xCKZFbvXT3my4exbFPhfzLmA
         B2cg==
X-Forwarded-Encrypted: i=1; AJvYcCVMM3uGsVRr2DPjiOEOzfrhDZp47gdlS9+RYmoPJs3oMA1h2jO5nCXqrrgAgZUt9/eQvffhr+w+Jv5LZOn6@vger.kernel.org
X-Gm-Message-State: AOJu0YyYGiPhksX3Yx/e/vqWHldb3kfW/1g47p7XGY2ytoI3ZkXH/9Py
	T+AAGIZgH7Pkk2obSOBX8ANbCNAznqlCL6OxC5Um9rE77W5TTI+y/9V023fuCASwzA==
X-Gm-Gg: AZuq6aKas/Cucaj0vGBkNyNA7zdAGoXDG+NxB7kL8t1baYApiKZ/5PpIdDbTe2U7Yzq
	kMa2nSRpgGXOgxa7V5obeiGxKdkAZDd1+ebdhqOPN8k15v3aaEA/UrrezPo6cygdGrHkYSWS95N
	KMwszpIwyl2cMzPoy4EVjK289jVbvRFJGDJdUz0yPytmQu2Eoq36cm5GG+zJNkjwSt7HPdhBWBD
	SphhLRPvXbvpadoRvuh9pZx8d9Lc/DqD7JqktBHtx3wWGyGY7+HdcptMM8dfbyvbnMrh6yToLHl
	is2dl+7xgI/4rpK1ndyrxWsGCxAqa2FernSQnMulj1fYMGK+AYL5x42pVAZCQLuNaEJNGSwKU18
	fJ/SJv2Tsdy0mep9N3YzEHyPmRPWwBUEt04+YloUM9smEAKjO7FTGRgMDdm2E6xJK1+8nQK4uMi
	oXqo0ypdSGrjcR2zpv2WhcPPhR9c1cTUsvwIZWIhYzFowS0wNijfRnMgQdkImfidYlUEoja//NW
	/3dmap3e18=
X-Received: by 2002:a05:7022:a9a:b0:11b:a73b:2327 with SMTP id a92af1059eb24-1273ae2ef59mr4312457c88.30.1771265500459;
        Mon, 16 Feb 2026 10:11:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:38 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 08/15] rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:45 -0800
Message-ID: <20260216100943.v3.8.I700ba93ec437db5100c0076941d8470344ea9995@changeid>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93009-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A9B8146ED4
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
2.53.0.273.g2a3d683680-goog


