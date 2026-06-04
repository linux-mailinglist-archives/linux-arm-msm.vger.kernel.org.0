Return-Path: <linux-arm-msm+bounces-111141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4qakCGQgIWpp/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:51:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C258363D58C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:51:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JJvJjW8w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C85C3028354
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D928385D63;
	Thu,  4 Jun 2026 06:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037EC3CC7FB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:50:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555818; cv=none; b=ATtuNQYR5tJmWIdfboVWkhcjJ6t9JlKdZR5R+CtvDsuceuMGd32BhVlmsku+V7xLzJG7pamzfoKL8poHJX/9q1esuj+0UVVPOXW4O20zgiyjKyaWi1A2JgRlsQ0sO0XvuxvcOHI41U+Oy/UbUoOpgA/24PFmMW2ZUcStqYDTEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555818; c=relaxed/simple;
	bh=+Ly4pYV3+TJcfbNfIE1LR83GXUcV4sFL4Pbtrp10kBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9R5PF+3efd4JzjkSQ81Vi/r1vUCEGEwFXD4ahOQGOx4AgTcY9elGeDYciGebxceFOA/+h/Ts0zgnYHI8Rh0QnkCis3guxslxU1aJX2ilSsSh1qdTzkm31ayXDaPT6uEgVkcQqcP+h7stoaGkl8ttzloPzVUXSY+uxBGobbOYJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJvJjW8w; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137e75bcb5eso622011c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555816; x=1781160616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2BtRX6nWtdx+uHNReHkv6D9mlZBbHexReuAALl41Kk=;
        b=JJvJjW8wVVAftXF1iPleDSINC8QxFGIIfqeGejV/WeHIdqNf6UKegaVJomSIB1K0ac
         uwX3XL36eUc5gNqL647Tr0d85LbXE0iP/zOinHwrg7hjS8ZHu9LnluPjPXd5oUUSNkVL
         VXvGgQ/0lEVtcERKFfGmf6cN2qvCkpMW29gmusHxz3bV/ofrwgA5dVBtXiA6M2+5KLbI
         nBrAuvAdfCKXHkdUUQLcrtu8cnB4kw5GU50yIxZi3yEl/JRjdDW92oj/mCrfb+SB7IUe
         9Gz6/7Mq18SNsVi78E9jTy0AyQ7s/+15qr4kiJtKQh7AGi3M+6mcYEW7YxMG1JMLP8nP
         KYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555816; x=1781160616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2BtRX6nWtdx+uHNReHkv6D9mlZBbHexReuAALl41Kk=;
        b=ArT91fVIUfprTvh5kpXslJCs7moEnPI4CIkZ22JhYILUuIbXrxP88XpM1R4BQTO1K+
         fzFiquV+Qgd9ec2CoESQ0bz+B3n083uvHVuNWcCt4cDYr6JCshHt3wBi9xQUbXAqpnt1
         zSv6FYzzcQoYkKy5xkdPKM8XOI0hSWnHMJndmlj+XT0HHZEy0FUyP4cIsyTR4k7X2y1I
         DEZrAnkjlIgSz+3Pb6jobFhZr1uLmBihhWlPos1/FkzSpCTUir3UHPxjc6dn+BbRUQBx
         tUFQUEN+ehDM45UJHbu1Ww1Zj+F36TbNnrA5LsI52ELuZzlAsFdHtnCZXg90SBYJdvfD
         K/0g==
X-Forwarded-Encrypted: i=1; AFNElJ9trHxARizJlXW0uXPVTrSdoH/v01l+PUb1nKXi9e+fcNqURL//wGvR2Haz/uyjVuf0UOw1E3bMZNliEDs2@vger.kernel.org
X-Gm-Message-State: AOJu0YyJB6Vq4SsuEWEnrN7uxs02Pq7oP4X0a+Ts8sZvF0jDPyZLR0jw
	0w3kOjoyZoqMP4+GIO2tyRrnAzc9H3SsA7y1kLMTnoK1kqqcKGqdtmei
X-Gm-Gg: Acq92OG7+BIzrXBU0X58E3iQ4ry8uHjcwj86AknlJ/Kobl+ulTidSiPEcT/JlDO9UO0
	pBah3M34L2kcE4QcAnKWfjI8ETg7HtLZYp2VqmOocwCd3WD4OOPRI3y6XPsKwRyiAhChQXuN2kC
	2AZsiLUA753U0XIiuX1zmoVH5rTCztfNEY09trwrsbpPL20vYg/QrGRbloP+DdcKkpA4Lk9mW8K
	OWOGm9BjFwLRE0hBkR/Zfmgg2nUCIIx4664MHrXYJITQnP52oUbiDI83ZVnj3uhoa1aW88u2lvm
	1fVqfHLaFCDANjQpOcO2w83CTFSvCrVHsR0WQhAfW78xNGYpEUVL+OrRxoGAZ7eFnUIN4s7bi6r
	DnOPIPF9rfzfdzlLlhbfKkbGhvz5K9xj2rUl9TLOpe5NZZE4dolw7v93n6mcVB8qJnio+pfrwFY
	4FZEo8PBVyRw1CeUvJdDckfndaycuARLq0m2AyEUAkM+4cB7gg4r/THxr20FRcKpMSc0uxL5Tdv
	mzw
X-Received: by 2002:a05:7022:117:b0:137:f49d:3388 with SMTP id a92af1059eb24-137f6bbb075mr3161829c88.21.1780555816143;
        Wed, 03 Jun 2026 23:50:16 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm4109780c88.9.2026.06.03.23.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:50:15 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: guard IRQ handler with runtime PM check
Date: Thu,  4 Jun 2026 06:49:57 +0000
Message-Id: <20260604064957.44597-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111141-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C258363D58C

Use pm_runtime_get_if_in_use() before accessing hardware
registers in the threaded IRQ handler. Skip interrupt processing
when the device is not in use.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88..ffb2e65f90f8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -104,6 +104,11 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	if (!core)
 		return IRQ_NONE;
 
+	if (!pm_runtime_get_if_in_use(core->dev)) {
+		enable_irq(irq);
+		return IRQ_HANDLED;
+	}
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


