Return-Path: <linux-arm-msm+bounces-111160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0LLHBYk4IWpBBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:34:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A7663E072
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:34:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XXbLxKVL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111160-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111160-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB9FB306B393
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257363E00AA;
	Thu,  4 Jun 2026 08:25:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD639B97F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561534; cv=none; b=LKgUF1B2zfU92P1rKmDfbmDSm+nAyNYVSSzLNRr679ytBWnodhXfmOK6bXhbHMYuMjMXhOhVq2zlTCUOzCrXTzcYVVaVoNXvCAJC4RJyuUJiJ6tJuavz8OYwJvbB0xp+C3qX3+WxzJuFMBj2t28aTLJPV4Cfu6kG/nmcuqvY5sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561534; c=relaxed/simple;
	bh=GNlfIQn3/4sj74l0bcAd1OCnJv85ehz8xRgjB3l7X6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I0eAsjjMG/DyJuIV2oN9rY8u9BFfMkZ9spSnZg6tcBIOAGP3Z88+61IJqAdVmJfLqhMvhnEsgFXqds4oPAkfCH4zOm21+LT2YWGZjUibEKkfvlUWUjz6HXJqIfvy3dAGT8CMiXKwR0yKXr+fE8mhi3UMYxgsYEyHQEN04u5W80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXbLxKVL; arc=none smtp.client-ip=74.125.82.195
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304ec41197bso452663eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780561531; x=1781166331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al7V+0dBM4yLTh7JxiBYF8Db9WJHRQf85PY/9QPCuro=;
        b=XXbLxKVLKa6Picp0p2Z7ddO/jLVr+icoub5TuAom6IiX8YK64IAC1XSTxkYW5ChS7h
         GgIYlQWp65BoFopZMDaIZoc0wVu1GwJDQqFC90pU38SHB3wTNoABxF/n8gW/Oc45WprI
         Tl1yq9LnhiWsVexLHjq1RBYOo0oOwARB3nox0WtHoraBFjU8MWjhRRm3ASI8J2jUo6I/
         m2KCmh13PKNkCQPiw4WuH9sEpeBDOul5iGQR3d8Pp3e5lWt4LGPT4NECouOFEnALEJ5C
         W2DbvXTuWhIqy68sHdVwRuGj5LhfxCQFZGjcVeWvcFhT084Efen4nq7HxrO8kZW+qiUc
         cjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780561531; x=1781166331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=al7V+0dBM4yLTh7JxiBYF8Db9WJHRQf85PY/9QPCuro=;
        b=sUxinM07RTSDlsBsBmVTiseOBfyQlR93y2wiKFUbXFrQ6NEvC0a3hchlja+CAF5e60
         Jjw05royKzqL0gJXBUBSVFibEc2XLDwXhWXyfRDI3DpGqjoS+fgTQ772zwK4hX8/DH/e
         U6ruFzRPojuEjJLr18rpzAcMsfPvKiADet4mFtHoMGulr3+ib0tBKOPizIJxNvCwvp/y
         f6IhZywouVWCQFdlBCauKh0qWfDB6PnXVcoiNlGWHxW2EksxpRbYxd3cVCwqrCeOgKxB
         Xt6Z+wXahR3L7mNActHiE0bgNrBrugQ7+XdAYHyJFjfYt3n2VLOnB8cvkstULlOdk2+O
         osaA==
X-Forwarded-Encrypted: i=1; AFNElJ8Zox7y/YHnvPlcEFVcL0L5pWUN4Y0NWCu46Ynp02PEc0DGZyCJbkU4Ft7sgKUzTJ6B0sbQ5kwO16/w4doS@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlEsH3kIkGydt07HocawevgiuNvaNFpIZsR/Na2bzWwypxOdS
	GFHhPEcHsbJ3ezL2Fri6zWX8H1sF+4gkdZURTTkNoPaC9lMTY1ILO7HJ
X-Gm-Gg: Acq92OFsZnDPv2lPtzfsoSj590eIQvXu4iJB5H1f6xdCu7y59eSUFdDwKctP+rfwd9e
	O66wgVpmK+V8AzspAtkzHauxTBwwdrh9YRq3Nx1gVIPVamf1LbPuWaM/eGiEzUiFI2X3TQSH6j1
	bpJQpzHbd+j09uPy+BuFbR5TGZZ4mTyQaH8F4a2qb/N3PoxDk3w0G09Znn04zX6+T09T+zlvZBw
	Ce2P2P57AT+yOE3XuN0lJGYCvWYpnECWOwvGwol43OkzH6xRRy3B07l9R16jrpQN0XBPnzJQ8YP
	/PKoJI9398M3NdsnU3VLg9uY/9BnJKh59O2HvP87YKUBLCBk2WnZ8NqGt8BX6fiQ2XjQ8UtNn8q
	vNHJOVGY4k3YDSykchO99jYWC+2TWKxjxteNDZvzeS5T7T+4wASomxQ2DZ+3OdeBabA8UlXfHxD
	m/TDc4I9SeP4rjf06WfVKDLMc6scZEujoYZzWMRcTua09c1j399qWk16ZNB+kXK1UZkA==
X-Received: by 2002:a05:693c:68ca:b0:304:5db8:da95 with SMTP id 5a478bee46e88-3074fb8754bmr1843173eec.23.1780561531220;
        Thu, 04 Jun 2026 01:25:31 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm6014312eec.23.2026.06.04.01.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:25:30 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
Date: Thu,  4 Jun 2026 08:25:10 +0000
Message-Id: <20260604082510.45733-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <v2-message-id>
References: <v2-message-id>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111160-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66A7663E072

Use pm_runtime_get_if_active() before accessing hardware
registers in the threaded IRQ handler. Skip interrupt processing
when the device is not active.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use()
- Handle negative runtime PM return values correctly
- Return IRQ_NONE when interrupt processing is skipped

v3:
- Remove the early enable_irq() from the PM-inactive early-return path
- IRQ re-enablement is already handled by iris_vpu_power_on() after power-on

 drivers/media/platform/qcom/iris/iris_hfi_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88..59040cce8cf1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -100,10 +100,15 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
+	int ret;
 
 	if (!core)
 		return IRQ_NONE;
 
+	ret = pm_runtime_get_if_active(core->dev);
+	if (ret <= 0)
+		return IRQ_NONE;
+
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
@@ -111,6 +116,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 
 	core->hfi_response_ops->hfi_response_handler(core);
 
+	pm_runtime_put_autosuspend(core->dev);
+
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
 
-- 
2.34.1


