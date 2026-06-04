Return-Path: <linux-arm-msm+bounces-111087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QymjNRDMIGoF8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:51:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9D63C1E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:51:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KfmcktGR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111087-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111087-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 873E33008221
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 00:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669A521FF23;
	Thu,  4 Jun 2026 00:44:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7243212B2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 00:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533864; cv=none; b=JW/E3obWEhmMBqaSckX1Lz17Wp90G0mTgyUB1B77BuRnd5H15OD1FZvyWEGVma5XKRfr3IOj/Mg+aCMW49I1ZCyNEjgBt4TLVli1rKCIOMbXXxBJFKgu/eeamkAcMBPwmw1lq8MuGh0YaMJ4H0KYLtyGGmIC4MZFjuRssHkM8xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533864; c=relaxed/simple;
	bh=EbX6bgGsKAiDRJmfJjqbrg9YSo1F/W+zJDbNod2tE8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a6QspKfxbbHTGDmmb5067dW1/4RJcL7K5HsBm8ufYmq/o/4jATBh/cutTm0WwaTExEcFkQd2I6SVVAeleouWxbcDdNCcOULxx1DKGAqovsYomGEkTA8UL2e3vwKgzR66N6jzFsjEf6holXKOso7kH5qeLUN8PyaBOBmOlH0iOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfmcktGR; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-137ec563a95so152374c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 17:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533861; x=1781138661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WU4xiLlGmzG30XmCR7F578csFbX0/SAgOHAfdp0NzZw=;
        b=KfmcktGR2zLvb4rt7Mz/LAX/WIPNMXWJRCIVsp7UHzas14pTQoh6c9J4Wkd+PkROo5
         Lacf4qqW/hCPA6wZ7vcgltKM1za2edMsP+kOhfuhE/k9QJ9skZnrgKa5jUBCNfGokfO0
         7sqA2NGj3DzzRadbHsPofvN45QDkxVQ8MyFvCIiF83Ic1s4mSB1pqbumv1qJ6qXuGV3D
         eLWe/c4Z1MMN3XDNkWkvAHeNAdKTJaHG6eGBOwLE9v5isvxcFtm0to+vhzS4hXhjc1wM
         rFgT5zQoHy4EbRQDo2hO5r7P7p78W/rxIpBYISZMAbw6kw9gJDuB/Jpe+l7nSrusry10
         hxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533861; x=1781138661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU4xiLlGmzG30XmCR7F578csFbX0/SAgOHAfdp0NzZw=;
        b=FxIDb5x3PIiyfCLYdSeMsY29zDacU6eE0y/Dg64NpA23ZWJ/cUcbXMW1uFXGDYu0AO
         jAjnOuu9efvH/e1k6m+3r0n4dCwoXWP+ubYj9K45YXXgT8oDXPvp6DWzxvKZLDGt0MLy
         B4aLG5WtLAAj97Zd6dxM7FD4owthFIWlCoMTaFO8sVEq6z2fFKyJNQzUplEF5cpIj/Kp
         fuxWb7VIkKjdIBFLYcV6Wai0clE4LYt0/czB9U5pahRkRUcE0+oDMt9F6R9111KaqNDS
         Xc46TLhACmq1ifvlf2osFVCJC7wInkdSI0eKBwInxUHgJBJytsb5KawOJn6xR+YFxlNh
         PAJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GRhubZhabUk72/TFR6zBtOpBqoJDBaEh9AbbTLVRv2UNr85JT376dR97NI9mZX1pdrKPuUTTGV1DsMgvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzc4k9c/jI1HgQ4oHVXjz4YDuhrN6srcu9KxlUn0nJ5+HWMikp
	5iw3UDOyj27wgtLLBYRwdevWMV3vgDmawvDN4zAHd4RMWwbJgW18t5l4
X-Gm-Gg: Acq92OHSkbUkV61XAmdZndksjVpcpsjV1YwZm6YV/8pBTpTU7qt8qRilM8ahylXX4/o
	FY3bX/CQD9fRqVII827ukxbXIRj/N4qM9420/dupfOaSbWgRkMB2bir/jeNdL42HVWQOKA9uQVB
	S5h1KSOQYhXX4/0J+Yiph2yQBPJl8/u/wfLYUBiEk4fj4aH8+06XKP4ISeRJyG9rC2m4Ku6dTPh
	lgjGkIp2b7+wMRdYOD4yPRHPoUpV+F67YPtN6ymC8V6Hwk5Qk//GLiLefThDnV8HascmKj+2vya
	AX+02eyouFfD3xqky7bXYhCSp6MC2W3178rtADrGODQrJFayy2R9LiPN/b3tg2JdCyP8eVY22/9
	ZtjvYNXWyLOhJEWciVvxQtNNj1wuIevBoeYl30sgjlRlzeAdGrr8xTTEmnl6F1M9PUBVIBZIdSx
	gLBPYpWvlx/UKoJ3J66ziYGosiz4DS4/dDJ3a0PeOC7iXDpbaEvgHY5KpgBWnv8ofv+g==
X-Received: by 2002:a05:7022:48f:b0:136:d029:459 with SMTP id a92af1059eb24-137f6bf40d1mr2620539c88.22.1780533860796;
        Wed, 03 Jun 2026 17:44:20 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm3108271c88.4.2026.06.03.17.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:44:20 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: fix runtime PM reference leaks
Date: Thu,  4 Jun 2026 00:44:04 +0000
Message-Id: <20260604004404.34797-1-dennylin0707@gmail.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111087-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77F9D63C1E3

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

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


