Return-Path: <linux-arm-msm+bounces-111081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Im0SIFfCIGqP7gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBE63C007
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=S7XC5xPn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111081-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111081-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D1013037B87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 00:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF96D2AD00;
	Thu,  4 Jun 2026 00:04:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8C8462
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 00:04:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531478; cv=none; b=fuL1OVr90a3v6llUnD1QTCkG3QftPbefDHK78X+t950JrNlhj4Ewgx4Y2CYdBHIBT4vbaVCkJ9eT+Y+EE196YlfFnCNDuSdSN6Prb7mKQzlt/UA5g9hgX+3B9ZaNjgy6QWHBFyu7O1uOosiqTV/saSXmmAOoW7A6qcrNUtuVifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531478; c=relaxed/simple;
	bh=sUtwdzI6Op7SWh5I8V9HQ9/AfdxkQf244p6czHwyqJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UyO9T7yhei14sc1CD0nSrtWRSlUEm0Kf8VF+jBJzg44z9xkSRtst4m4oDB8OZxX9uFeLyuUExxiyEHrJI6XvcVcWA9DQMJkGH408RSOTY1t+XY/4jDLaqdFPYNv8gP61rYWtWYp0Ci/JRLbkDANpRndKtwpeNaea+B5dj+BeWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7XC5xPn; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1363fe80fe8so185466c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780531476; x=1781136276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ekbew6l2pxhPys6qdOCmqveSwR/YfCxmHaQqXJh0Rh4=;
        b=S7XC5xPnwl+4gyrbb3EJpfGQ87KorLt0lZ42POzDnGvWdCaptdKU6b/sEBTyrTf7D5
         1wpvTvEXotB0GhLye7pJ7N4jZ6a1N128QsLrdxFg+pw1jP82p2y6ADB8BUauU4WKxsZD
         mbLkAOk4idF1EBHF59N6T9xGn/vC0n1geeqg+yJE3xxcMvL6QeL7jVAG1uhc7cJ1MJYd
         lzamFEskgxSxhbIavChCVbS8z/+P5C9vYbbEG4rNOxmoCdtyig3WYBGqCa7L/z1wLC/N
         kkFkvaTivyUWUYrzkXrTxBB6DpjQ6Z9ol2HNK240h7IjC9BIZMY2jyO2H9v4mxgVTbZg
         xu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531476; x=1781136276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekbew6l2pxhPys6qdOCmqveSwR/YfCxmHaQqXJh0Rh4=;
        b=IhIDe9Y6GUIpPBsCm4u93cf4aZDqF5XMdpKXuUII9YVfJc5SL6rdryWX+pw2aRmvOC
         0Z6XWCUF6eoMo/ZYRUOAsHi610xegPuDEqKBDBlVYcZyBKEkNt8eLQayvX2vBmMEaj+Y
         XshfEjZ3KzlHBAKB83PzmNtG9Dpk7vAk1tkTauaKxjISg4Hukll0k92oF2xRu0a8bMZD
         uB2IJr7JK931+ofunXX5ZV+mCRfRQd2KXu+hgkFAAxBaDICuSnF+s65RIqWtbAuTty/h
         w6Sm6V5vhxr1Z8osSfkXmXJbLFrumSDy6TNEVS9C2HWwmyE0AVatWt3dCtvGZlWiARF6
         kv2A==
X-Forwarded-Encrypted: i=1; AFNElJ8+Ytha6HFOSgSdAoVsee3mAWSxLegMNBN+GBa2WuPcA99RKvGY2oChPkLzhFHNHaBnNxNqKcJDR8XycYaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzcf3f0QZMs8LG1WzVSktWNWLqexB4Mi0pDIT/N1hIsnRQYPAf
	c3w8awUKJnj+jjcnY1gCLpQjV7n83F5wfk0ZNNAC7Ff3z3qsk7aPdhcW
X-Gm-Gg: Acq92OENzeCaBy80sKUSYR6my4MwP/cWe+xQIXEWPDftAHxnPNR7ZGeP95TMD95vdhh
	HgMcPn/z+iK2Mny5RTGLEn2kLm1CV32TXrPIlxP6N+15NtEf9E6sb3nFEzTbRShHl6gWsGa88dQ
	1zfGj36m5iZndO1SQu5j9e5z/GDl73ZmlYZzUwew0DcmLGmxIuZZpW5tM6yx6DvzfKdXUzL2QI+
	jeHRBJKrfXaB/kXI0QaLJYkYSZlZrU6feftKuSJwnfnlkS4qB2jbrc/DBVYsCHnmXpC05TUwv/+
	OvXVAuIevMuY50+2XwIVm4G8GYFqKk2c9RrUjsCPggoVeMOSL00swjG11/IHKT7jQsq1xi/qeTj
	y//ZBiuurg+ueDDP6tNW1FqniAVKZLKJY7quF7Jbp+ltxA1thhZdes7+LhA0HOHtbHJz7K9Z0qM
	x2soZTnImOLUDCCcq20+znYA1jEwcCOJf2ECNT0raALUh+P9jtyr26oYVGcSrVzJ17Tw==
X-Received: by 2002:a05:7300:320c:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-3074fc018e6mr3475682eec.32.1780531475738;
        Wed, 03 Jun 2026 17:04:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df77a0asm3862871eec.27.2026.06.03.17.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:04:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com
Cc: dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: initialize managed OPP pointer
Date: Thu,  4 Jun 2026 00:04:14 +0000
Message-Id: <20260604000414.32530-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111081-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5DBE63C007

Initialize the __free(put_opp) managed OPP pointer to NULL.

This ensures the cleanup handler always sees a defined value and
avoids leaving the managed pointer uninitialized before assignment.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..6b22f5cc88ca 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -61,7 +61,7 @@ int iris_unset_icc_bw(struct iris_core *core)
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq)
 {
-	struct dev_pm_opp *opp __free(put_opp);
+	struct dev_pm_opp *opp __free(put_opp) = NULL;
 
 	opp = devfreq_recommended_opp(dev, &freq, 0);
 	if (IS_ERR(opp))
-- 
2.34.1


