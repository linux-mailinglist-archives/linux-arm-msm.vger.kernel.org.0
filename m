Return-Path: <linux-arm-msm+bounces-111631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eeTSLAn/JWo4QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 01:30:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0BE651E6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 01:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mmf+b4bb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111631-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111631-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F3F630293C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 23:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C3733ADBF;
	Sun,  7 Jun 2026 23:29:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E33337107
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 23:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780874947; cv=none; b=AI8IrPzXOdb66783qf0ccWvxQOIBsgYFpRQdeJ0SCn9v4Jy42PnEbRdpQw2RM9GbCPXHVoedtBOSVIwBX1Mi6Y+oslPZhsTK6mtLUkCWfqAIeg89pJzqxnEbxQmWZSwbEuWPb1ZpbjLxt07kbkpAmZimvVGZCM49GuKfnl0Nrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780874947; c=relaxed/simple;
	bh=Qdn7lfFv1Qy9y7QLkJ6IB5ugP3HJ7KhQ77rqkSIgdAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=huf7NgOnHSYH+Sne8L1YxUr/xiaARibR4fWMGZiIh2fOnVrAiD05q9VAxMfoO90/WtD6s201ewNhCE5pr2nSQd3BGOnlp/NABXsFDUqbFHqpWm6BGAXKPNKLRMjHM3GPzrq+oWSjeCYSIQXFI3RP1eQV2d+/il2jPNoHRhWdON4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmf+b4bb; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1363e78746eso3884286c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 16:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780874945; x=1781479745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb7ZJjfKb99h5+YHieJkW6NM4/xOtMM48PIruUZX4LI=;
        b=mmf+b4bbR1lSOK0qHt5r4p5O6oABcLgznR7CBJHsDVo6vU+PxV+/mHpOYURDarYgEr
         8ujCQfsayAZaXTa/sItNdP2Y89EJFvtvwC+TSmONcxDYfqNAG1DBW3U8jl6UavY/5if6
         KWMBZrx5sy5YXomT5FtNkcyliAcNoIl8sTT7xyw6f/mbUvtguBiythQiMvQvgxRGebnO
         pQC2E3iZwODYpe/YG79S6RWoK7sRPcmW6fUpU0mnQoUczsrKx5bKdoHMH8/euYSMrjga
         gcaYEEp4CZnrNwzn+93pv5jN+zhfFD7/CMrEeI7HnYthCPTJFKRDheuG8sbKcjXArysV
         k0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780874945; x=1781479745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gb7ZJjfKb99h5+YHieJkW6NM4/xOtMM48PIruUZX4LI=;
        b=TA4u17WmP/n47YFByrY4zqBxrhjTRKnac17HuCKnfQMN7B4b+m48/omnOrPiJvdQ0X
         J/XJ6BLceIemMF6c9hxNewhNC9Qx/aLL7n+I5IpjXTlG7LEUg/MhLYG3SX7kxpxisbXm
         GZ6LJEU8qv1ZizG8l5hFyDjy9T83Um54eMAmxKOUC1NnNoXVPFpdZPb4yCldMM3Q0XcH
         CP/aytH5VYNWx9f0Nm82pI0oCxkRh3CNQPT+t8lnnmHbOzCprJE0+0A2WTJkoXl0IhNX
         WmXxQhn1+7JjjQZifhRuURPJxyOZ4AgmizBKoPTcBYG6o27oV4gZqfqu1ScNADiq6+AA
         YdbQ==
X-Gm-Message-State: AOJu0YyivrIBxqposYaiPGumnGbSsauBLn076Y9bZMpQszzHLujmU+yP
	A4c7XhPofkbI5LdWJ5pQpNLb8FrqKW/2kgaSj5wRFa+7vsdH85KhbZ2H+7B+sgk+
X-Gm-Gg: Acq92OFEVCXU4/DimRCUGlWufftXOqiZAvEnjf3JnCd29W8PRcbpBFgQwAWEdIGliPR
	cYLy+TCvhP/ECGfinY5Lewd86gWFtkPI9sTQ/Q2tcvDHp/GYoaN6u1M7iOHhSfg+dnfgp3kFx/+
	dKl6290tzfuFv4aNSoPYvJMp0SlBr6HRDZSoxJ/i85W8vGX7gXbskYvTsywmdcBpFlnqp9DtWPu
	FFYc6Einqi7w3chYJ+NcPsWWB2KXsl9zeWnGUI3PKk49+bUhOmh15KY2NTwD+VhB16kYQabl+0q
	q4JrejWDuBXoPR9l5d5Bw+DkVeciGrVjvL2kxCgxKjl1Ko8D4ybwBhnabkhjF1katyC4HTZgluo
	2JGkN61amltv3HFH3sN3xhBpxHhdILQ5HDI6Z7nN4uVLqhattkmFCIrBNh6lXQ/TxvOzy47gm3R
	xEVrRVAxb/eYNvX2RmlgS8ThmQoTGDXetyMy86CqsP+9YPYOydMrilfRgb9uBs60YVqw==
X-Received: by 2002:a05:7022:6899:b0:137:edfa:6f34 with SMTP id a92af1059eb24-138066834b9mr6466787c88.1.1780874945236;
        Sun, 07 Jun 2026 16:29:05 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm11324554c88.11.2026.06.07.16.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:29:04 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vikash.garodia@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 2/2] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Sun,  7 Jun 2026 23:28:41 +0000
Message-Id: <20260607232841.79275-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260607232841.79275-1-dennylin0707@gmail.com>
References: <20260607232841.79275-1-dennylin0707@gmail.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111631-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D0BE651E6E

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

Use a standard rollback path to release the OPP vote when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Addressed Dmitry Baryshkov's review comment.
- Reworked the error handling path to use a standard goto-based
  rollback flow.
- Roll back the OPP vote from a dedicated error label when
  pm_runtime_resume_and_get() fails.

 drivers/media/platform/qcom/iris/iris_resources.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index f5e3341e1430..9059cbe8fe5f 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -80,9 +80,13 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 
 	ret = pm_runtime_resume_and_get(pd_dev);
 	if (ret)
-		return ret;
+		goto err_opp;
 
 	return 0;
+
+err_opp:
+	iris_opp_set_rate(core->dev, 0);
+	return ret;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
-- 
2.34.1


