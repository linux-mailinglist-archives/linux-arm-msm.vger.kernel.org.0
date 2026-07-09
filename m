Return-Path: <linux-arm-msm+bounces-117826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgBKKRwVT2r0aAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:27:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02C72C461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=sQSu0Up6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B55FB3021B25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 03:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2493403FA;
	Thu,  9 Jul 2026 03:27:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1762D77E5;
	Thu,  9 Jul 2026 03:27:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567642; cv=none; b=S3P66ABydJDAmE/dPCQf3xN1sQ1g2F/NhvldCnOYCBeYbnr20xFNN5p6PrXsyZhqK08xYxv+ao8HII7VrWf2qc+gZTiSFGE9cjiLfN+ZZjYNO2MHdI3pCWgINy+Ldrc8jPrkwmPpt1KLmOVKraMAedQ23lqgH7c8Sj+BMZ2X7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567642; c=relaxed/simple;
	bh=5q6IKp8NWuO+mOAkqzdM5WrL8V65dmw8cIVwkMaDawY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QHmNR6PhyD/Vk1qBSmaloimXFqFf+ME1WFNW45S6rtEP2Sc9HQ1zbyzBLGy0A5zytuJ3O5rB1tIr7k4N0eLnlUhwjgDXHLz0uBnDARybpkC8RnvQYYTOBhH0YRT/c+z7fqsUkVpxfeF9fCrRAqDJaK2D6CpCiZSIDp6nB8vTdj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQSu0Up6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D0B4C2BCB7;
	Thu,  9 Jul 2026 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783567641;
	bh=5q6IKp8NWuO+mOAkqzdM5WrL8V65dmw8cIVwkMaDawY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sQSu0Up67jYX7vCEPZucbTO/LMRi0qBKMjvxEO0F0AT1JusG7+Ww+EkkG9JigOb9A
	 pybCAdn/HXf5kRqY1JwFm66Ia59zGkLuwntNSgt6nF5BWNbK4TgdDWsz8TmyUbtYH9
	 urmIrjDvT+fIU4UmAzieE4oD4L/Kx3CeBEjjPruMJMOFaltqIjNbGWkbWUtLYO4VKE
	 90rLygyK8Ek+geQVjC5QpVYOX6eBIfiQe0ZBI0pkCPrUP5AlsU5esafhlSgRHt5Q3t
	 YTTYe6ecgfmhokq4/uDJp2YrTl4Nkxna03l4KPOAUORDE8d/xDacn8ohqy70hyynaj
	 TNXkArutkJ2ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC92C43458;
	Thu,  9 Jul 2026 03:27:21 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 08 Jul 2026 23:27:19 -0400
Subject: [PATCH RFC] remoteproc: qcom: q6v5: Only print handover error once
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-q6v5-handover-v1-1-be0e6cba0b13@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3UKzMlNdoExKfllqka5ZWkqyWVKKSbKRmakSUE9BUWpaZgXYvGi
 lIDdnpViIYHFpUlZqcgnIJKXaWgCo/mfAdgAAAA==
X-Change-ID: 20260708-q6v5-handover-6fdc6bd4c265
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783567638; l=3032;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=WRlfOb7BJH4o0RSa6fkA/yjtgThVqiPMGxbi8obWNd8=;
 b=JVR7n/XYUHkKIyj/tQfYG1a6mCkyNlzGhoLwffr/0okHdWF1GdMkjmjJ5soa6tdsKHxUl/+p3
 SU5Xed8HCi0ApqYqxWzSG7XSGsfKB4cvRAuY6T2bEIildFd4qYKfObC
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117826-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:esteuwu@proton.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF02C72C461

From: Esteban Urrutia <esteuwu@proton.me>

On some devices, firmware for the remote processors can signal a handover
more than once.
In the worst case, the kernel buffer will be spammed with this error
message, leading to the kernel buffer consisting of just this:

[  106.305033] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  106.506070] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  106.707103] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  106.908612] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  107.108158] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  107.309944] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  107.510795] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  107.712183] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  107.912834] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened
[  108.114217] qcom_q6v5_pas 2400000.remoteproc: Handover signaled, but it already happened

Instead of printing an error every time a processor signals a handover more
than once, only print an error once.
This way, the error is still present, but it won't fill up the kernel
buffer.

Fixes: 54898664e1eb ("remoteproc: qcom: q6v5: Avoid handling handover twice")
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
I've been using the mainline kernel for a while now on motorola-bronco,
which is an SM8475 based device.
This device's firmware for the remoteprocs, specially for the SLPI,
seems to signal handovers way too frequently.
As of now, the Q6V5 driver will print an error each time a remoteproc
signals a handover twice, which leads to the kernel buffer filling up
pretty quickly.
I would like to suggest replacing the call to dev_err() with
dev_err_once() and would like feedback as to whether this is the proper
way of handling firmwares with this behavior.
This way, the error would still be printed, but only once, and this
issue would become much less of an annoyance for devices with buggy
firmware like this.

Regards,
Esteban
---
 drivers/remoteproc/qcom_q6v5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..81e894cc8634 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -165,7 +165,7 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 	struct qcom_q6v5 *q6v5 = data;
 
 	if (q6v5->handover_issued) {
-		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
+		dev_err_once(q6v5->dev, "Handover signaled, but it already happened\n");
 		return IRQ_HANDLED;
 	}
 

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260708-q6v5-handover-6fdc6bd4c265

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>



