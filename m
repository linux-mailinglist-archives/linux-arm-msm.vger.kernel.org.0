Return-Path: <linux-arm-msm+bounces-111165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3tEQMGk/IWqeBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C363E4C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:03:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pbApc5ei;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 988AC30800A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265543F7A82;
	Thu,  4 Jun 2026 09:01:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211C3DE443
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563711; cv=none; b=fYKWinPNlKullcmyRUcD2xqTGVaR3smTlVjZxAGBVM7/yiF7UKkxyW+bOYOz+5rNvSD6TVveA0U0khPuOWRjWvsfPh2CiSZ9n6XvfQAJQXH67N2T8IrHqPNbg4x/vScyJ5bYC0b5/RKZv/CpaZOJCsVHl8IyZtU0vUAL3/YkQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563711; c=relaxed/simple;
	bh=tevFvEzdnCkxOqdw10b+jO4O9VWLjSDW9X8srrONk4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjQmEQpBx8gt2J28evfqzMJobwz9JSZzzIrBXQCZDXwJr4hvqg6wmYzNNzKq7v2ctSFD1WbwE8Dh0IeqFN5e8ewZHd6lfpAfF9tbHvanKo2VFOMaY8iruzBBdDWxM8jZdcazJe+b7rBXd0OhMwbyfgVoWcW9EbVVq/5moyIBdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbApc5ei; arc=none smtp.client-ip=74.125.82.196
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-304e83724bfso491347eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780563709; x=1781168509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpExvBqJEwYgCOZtnj17mLYXW37IIUimvoP5yk4TgGc=;
        b=pbApc5eim+XP8m41vIx/tZRlpQcSYdQUBxcwM5FOCS3HXFlRMxqWPlTruvFjfQO992
         yReIc8lF/B+xXSOw4D4Za2nuVdEyGIXNP2h7LcH+2Y1CR/u2cvUvAYqHgbR2e0hjXZIw
         KTKbMwK9qrpaQ6ueAaAdmTmJtW/dz1TWJK1mg+LY/Omwkft9IDwEzq8DhVevI192xKi+
         hNm1mMGYx3g1DHIkZjzXupRO77TLbnDKtA06oYbxHuyFxwxFFnBav+UXqkyBOuhgh7dT
         +GOWAuDAeLdzaLJTlsdWBjaSGVLm7PNQ+WVwBwLmIIiuCRMdY7C/5oX/fQsvRp5Aia/g
         rhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563709; x=1781168509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpExvBqJEwYgCOZtnj17mLYXW37IIUimvoP5yk4TgGc=;
        b=S/4C5Nkpt4uKvBWw4fhAOqAVdh05T+z6qnD/o7Ycj7zJJklO56sA4Dr9HrC1m5slBS
         Ylx2xFCFQOZQvuERUn3KNMTVJQBgQYQjhtBGlDX+vC70vkAS5Skarb2AC8dUDTolAUcB
         hUfXtwcmfIwwbwTssx80Z3NjJoicQ4T9HbV60c6V5mhuEMCPx7gFNIcyUslp49EiEeWP
         3KgnJ1iGV10BIcWHjFU165D+Ff31NemMhIo57c0ckqyu+nUuYszcGO+4ntqYotT33mga
         1NQkgPtnqe9ad/P4pVQprKndEu7D7vo26DJ6N+q8mVsJtb5e2AmKJf7l7C4k+b04cDFG
         iNJg==
X-Forwarded-Encrypted: i=1; AFNElJ+xa7N+XkfOTZVw/KeotTFNqi308PUNtoeJ+bh8tRIdqlEea/r6S9pPOnlVb3QbGULcxdiG1wTpb8P2sp0g@vger.kernel.org
X-Gm-Message-State: AOJu0YxWd/QoiygSbOWx3A66ZCMQhOqZ7reDqxFqSLYia3mnE/W+IQ9f
	luax7sZd/VGsgxJ4mwp2kALJj7K1qcFeJo91POpeD0OLQvTCoRxIcs5c
X-Gm-Gg: Acq92OH1OlhaCRxbXTknQ3elstxnS2bCWkbMGTxdKZKBL/CFQQtn+EUo9CyGB+204LN
	cTozhKtYAvDcVul6HqJ/0jhBbPJkvrefxnqBh/wwBpH9/TXbmN4GGcubEr4UVmCKpiA487j2ZUf
	3nUGCvaXL0MFZx3Z09V6voqrW8bGkJ2y5GuYY02Al6OlfbBCMe0S3RAQTuO3vAgtcckZbaMOA8n
	F+X0ADeWKXzVP+12h/TMVSXzB5kYyhz1Mmszk0ydYqKXtKaFz9YIu/y7fjVJFswEY2GU8g3KKH7
	msZU+p2leh3sDXrqvELq+MY9sO+u51S2qKJmnNi2rnslACUIUSCzLnTfN5+66oIYjzVoSTWACbg
	637+ieZ4HI9N0Q/aSik2hgticFIHHAaZYHusoaqw/qA6/AbHoxIorutCjRZb+jXa8W/wnZ3PgmV
	GA9gnRvCw/1GVFA5mRTjeW1FOZ1FVa1FKZlimAc48/mkcMmsS84x6AHJY0P7AnHtbd1g==
X-Received: by 2002:a05:693c:25c8:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-3074fa654femr3760537eec.7.1780563709153;
        Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4892717eec.29.2026.06.04.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:01:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 1/2] media: qcom: iris: fix runtime PM reference leaks
Date: Thu,  4 Jun 2026 09:00:58 +0000
Message-Id: <20260604090059.46355-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604090059.46355-1-dennylin0707@gmail.com>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111165-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 984C363E4C5

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..f5e3341e1430 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(pd_dev);
+	if (ret)
 		return ret;
 
-	return ret;
+	return 0;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
@@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 	int ret;
 
 	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
 
 	pm_runtime_put_sync(pd_dev);
 
-	return 0;
+	return ret;
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-- 
2.34.1


