Return-Path: <linux-arm-msm+bounces-93011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AlyMHtek2kr4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCB146EEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78E0E3009E31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 18:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1824830E83C;
	Mon, 16 Feb 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dk8Cke8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB32EB841
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265507; cv=none; b=RoHBaAayrx5AGPn1SlyOz+Kjoyvm7m8iPDcAaCyVs2V3dm1YoNyFU4XoUDp8cyKgr1CeWtNVKGcvCA4ZNLj8cgUlPTVXatPmEQjseK+pKSJbrYOaJpLhLA4btaQDf1PifhB3bwrgDKNlUKOrBLayHEoTtmvR4+9CpHc5NvQFUio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265507; c=relaxed/simple;
	bh=CDxrp4OucdMFl3rFBhyh/bKVYZGNXZao6NNebXzLvRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kr/Mm2zaFalwYIft9BeZo0H5MmYSWEGhCTMNk8ltKe1u81vjS8kwuTofS064RDHeBDSXGWOVDggtCbvUQJBjOfnttz9xBhKpO6fblTJV8GKCd119Rh9+iUD4osjCuSRe6Kw3ye3X44qOfYdLvjBp/7iGvxrqY8TQayt5RFi+z80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dk8Cke8Z; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1270adc5121so4507009c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265505; x=1771870305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSRSa2qBwyo4MKgv7YKXiUq526mCXszwG8DRrzAIIQ0=;
        b=Dk8Cke8Z/TooRCn/hfbmy2Jqps+817Qjh7KHgbwuiyfGH6jWu1hvgUZOi+lakInbfw
         nhAtkQdhK9OPwDa+EcbzjGiVOy88XBZ1o9oFOE6XBh8OWTySvCB5BRdy4VPJl8d/udjn
         FEbngNnr/i5CJmkPLqxnIJErCVQV40F5F2drQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265505; x=1771870305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSRSa2qBwyo4MKgv7YKXiUq526mCXszwG8DRrzAIIQ0=;
        b=E53e0XAMo/bJJdmaG1oxVw54bzQtp4DHemOMnB0R/kW78qzPtQ/52/IhnAW67+tnDM
         xPpJAhDt21OKwSm9gxneNXWwk/vzRRgk/EDJ835WLNdnCzTbRDTp9mzHQAg1cINQMotB
         gEPrzDFtq6g4MZT0pLOchXoXorSIoHagyltRimPQI1fk8Jo8SHAVclU+uJHhe3afKzcV
         DJ6HG5o77MCqqWvJb5pmYAvEKTFCsENs+qJrAjsa6rwISLZ2+iuVaDYhfnWUaxX9EAsq
         GgbM/xqRPLqwdh84QItzdm7NLIOpskAF8SiV+gKrTBv8ciPh1mrhW6UhNoR7LoW/DvOl
         iYGg==
X-Forwarded-Encrypted: i=1; AJvYcCW4gtYHAwdyGsVyaZhAInaNke3HNcJLQ+fIcnSylg3pXjvvlYlCqN/RB6BsrpVZrLX40bTp7fTPJQTuz6eM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73vT3GeOoHWJe20XcDbjrWqpmEDnNsEeSOv8lx3TVzr6+qfWD
	7ETsSkfEDMYigejmHdigUmTVmpe84qjvfV3LCBWZYISYiR3A2F72HKFxwTr/dnaN5g==
X-Gm-Gg: AZuq6aK6yS7FNhHMwgFlSqCdd+l8JHvDILUCfieXWxE2d/NM2chXBAu71FjK/eBV4J4
	ChZ5fsI7Ygm8kUtSo82ZeabSNT0b/0tr4UNjqqvAFq25WArwPpGZNlLzAIU6il+x+Zc5Gf4EEWl
	JpBtFlClxpredEKFo19E6R9qSZMrrsctsSpPMd0rryNWkqDKNvckXqw97/v0D0/8xIcIYpXjb5J
	jQxYRVdNZDLmAL4cONgeiw4bkMSv10rafu+zLyumV7M9ErD89r5+Lm41B0ARdlQI9kU230OkWQx
	gKQJaq5tOxyC8tgHTbhTUyfXeZmRCPt+ULXbBu6Dnc8qnpSMTvWtmP95x+tgNlmiQLZPiGqzMcf
	CWHgcdjKOdhyegcbDccdk69UOoo+G6zdxChBcp6ydQ3odbpIjQ3SUQypB4XXpVjcR3t6+JW/BUe
	PPjqZgdCZc/d+KEdVZkmdV/hxCahiB8U6Kh28KVkAc3AZ5jnALG/WLf6874ayeDL9rCzZecSiyk
	7y5YcHk5gY=
X-Received: by 2002:a05:7022:926:b0:119:e56b:98be with SMTP id a92af1059eb24-1273ae92b3bmr5486503c88.37.1771265505096;
        Mon, 16 Feb 2026 10:11:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:43 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 10/15] rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:47 -0800
Message-ID: <20260216100943.v3.10.Idbe327f5b4ce65a284b55033627d0819e2fed21b@changeid>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93011-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: EACCB146EEA
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

Acked-by: Bjorn Andersson <andersson@kernel.org>
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
2.53.0.273.g2a3d683680-goog


