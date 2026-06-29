Return-Path: <linux-arm-msm+bounces-115010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GZWXOzVbQmpP5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A076D99C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=CGHx4THy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115010-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115010-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5F5C304351A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA7D401A3F;
	Mon, 29 Jun 2026 11:30:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1603FFFA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732658; cv=none; b=QH8+YpE3VNQ7RXJmPZGtY12cdAE9KtIahRHdEyJ3pavMD4mvZftuXmrhfaTgDwsvacLd3sKD3TG0N2UC8g1G7a9IKQGcAJl29v5ofAeMvrahMGHR76qAgC185s9BRAldcUdooaRC9ikP4azEdph47dzPN1IPzTmC3KWUZC71nEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732658; c=relaxed/simple;
	bh=I2H5tinn3brqMNAoiayDqdeQNYpC874+PMUqa9KGe8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/LKtIM9izZFrb2JNlpcEKLzHUTtMuC+HlyXNYpag3RU8OhJNjS2GoSIrOml86brFkpt9XSNE5Ptpc7apPiGUtNoaQylD7YiAmGG+Xhko1SO3b5/IKGXneQlsgfxMF1+hRLvLR6N2/VWMwQfxhLooqYp8m+i+MTvBJ+5pKBC/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CGHx4THy; arc=none smtp.client-ip=209.85.208.179
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3995e22ef81so33840691fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732655; x=1783337455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET2VyfZbT6w4nMLaDtcHsXYFQy+5hvSsWtzBLWHwhrI=;
        b=CGHx4THyomG9KgMvrrWJ41aw/qBh9KEy6drGrwNkm5GNy8tDHs2Lui+1I79SVbgJua
         Za7BUWJjoFLCciyEYvWy0Vk16Ik6fNE7eLzN+RWRkOojNCKS/r/N752hkIbFmIn/JBgm
         QhA0OzcZSPwSe5x+cdUqrx2tcwIRLH99EoTnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732655; x=1783337455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ET2VyfZbT6w4nMLaDtcHsXYFQy+5hvSsWtzBLWHwhrI=;
        b=JA/yMzvZko3oNKdTME23KefRWv0aiDykIOOW8qAT5td0QqlLVRh1rxCALEkf7pv3Li
         qJso0ISPZacvkkGsIYZxLap4CsnSnn7H3qZyy9pi6cDToIJb1SRwopg3AItJNX29EtJP
         VL+RnuiPzNl5XXRHcjKxyUhYIDHmbzGSBIfkCJoVhatY+w4UeAnzFrgChR3L4/d58pLD
         W0NZKktACXJcRFD9CpI8LQGwq5acc3LQjec/NuMZtsK+ip5DoyAzJhc+iWCEFhIhmoI4
         OoAC+2iSL0JIabrpGmLh6V89OTlUgcechOksV4UCLRwnG8rA8IdHFI1zX0dP5n0RajjF
         gbWw==
X-Forwarded-Encrypted: i=1; AHgh+RrH6obhqBdZrnjhEJoE8fCQ3cOBWNizqy6cQ6IjB6PWgQOpNXHk/80Oy8uaU2K69zhu2/suMJFQL4kyy3kP@vger.kernel.org
X-Gm-Message-State: AOJu0YzhA4Gly5v23fk0Yd+KEcig7L/SSgBO1Y9Pd2q6hoVA6eemGCOO
	hWjvYhbPxCiDx0M8ZUAwM0Ztrk6SbVO4iLJzhnBm00vmxzztVexwDTW/q091bZ79XQ==
X-Gm-Gg: AfdE7cnrtJTmT+WbV3ohhsDBedkHKU7cXXZrpkC5v7LomyF0Ucj4g6X3+JydVzZSN3R
	2IAk8XlErvhh565vkvx7BBtCBO/pf51h6mw9dfoEa5Oa7PRx50PWTr5V7ynNy/heIuunZK93VK4
	OM4AMOTsZJbTAD9RAVm8uEqaJReqfVOObBTBJYJNDQOUlmMebfM1x4PkBhDSSXBe34urPbbfUWl
	tioWZZD27je7sADmuhlZj+FjHR0AVJYKQO5YIbTzbv9NBtsmObXTnJThUJleX2AgD1LUJVpk1Vv
	Eq8cktqyDdH1Og8ei6nEGukFE8K9tusUkjUyiBhcarb/ir5NME3J2n59kXztRYK1nTan0mN7EEu
	G5RuKNe8t7BVE8kpG6+yuO9dA5PPlAhw1YgXwA8XJsGKz5ko8YNaCH3LkrPTkRFwxco9S3pSaN2
	Jjmd40ui23gjNNinSbCaE9zAiHhPWzjgshaKUnl3j9KEoS6DMPLew/tdr8h6dE/sJHdusB
X-Received: by 2002:a05:6512:4285:b0:5ae:b7c1:f7a with SMTP id 2adb3069b0e04-5aeb7c110e0mr863055e87.30.1782732655026;
        Mon, 29 Jun 2026 04:30:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:46 +0000
Subject: [PATCH 5/9] media: platform: amd: use refcount_t instead of
 atomic_t
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-5-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115010-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90A076D99C1

We are using the refcnt variable for refcounting. Use the refcount_t
type instead, as it has support for saturation and underflow.

This also makes cocci happier, as it will fix the following warning:
./platform/amd/isp4/isp4_subdev.c:394:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.

Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amd/isp4/isp4_interface.c | 4 ++--
 drivers/media/platform/amd/isp4/isp4_interface.h | 2 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 8d73f66bb42c..00a817909292 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -375,7 +375,7 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 			return -ENOMEM;
 
 		/* Get two references: one for the resp thread, one for us */
-		atomic_set(&ele->refcnt, 2);
+		refcount_set(&ele->refcnt, 2);
 		init_completion(&ele->cmd_done);
 	}
 
@@ -455,7 +455,7 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 
 put_ele_ref:
 	/* Don't free the command if we didn't put the last reference */
-	if (ele && atomic_dec_return(&ele->refcnt))
+	if (ele && !refcount_dec_and_test(&ele->refcnt))
 		ele = NULL;
 
 free_ele:
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
index ce3ac9b9e5cd..04db71cd54e6 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.h
+++ b/drivers/media/platform/amd/isp4/isp4_interface.h
@@ -68,7 +68,7 @@ struct isp4if_cmd_element {
 	u32 seq_num;
 	u32 cmd_id;
 	struct completion cmd_done;
-	atomic_t refcnt;
+	refcount_t refcnt;
 };
 
 struct isp4_interface {
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..2a8bc1207843 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -391,7 +391,7 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 
 	if (ele) {
 		complete(&ele->cmd_done);
-		if (atomic_dec_and_test(&ele->refcnt))
+		if (refcount_dec_and_test(&ele->refcnt))
 			kfree(ele);
 	}
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


