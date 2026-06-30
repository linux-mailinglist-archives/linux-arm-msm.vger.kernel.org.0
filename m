Return-Path: <linux-arm-msm+bounces-115492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MJsJKKjgQ2qikwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:28:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0976E5EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:28:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nstg+tOa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115492-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115492-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1902304A856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AC83803EF;
	Tue, 30 Jun 2026 15:26:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED1377575
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:26:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833205; cv=none; b=dVUqe67edfl1CxUHMU8nQDKnqGIfS6iMAVMUz6/zqw3jRZmHhBmGtqFk/Q58FNgkIDfL9FnAC1363eGqaVxMU4fZLMnKLumRXFzR6eoNyVFIPvXfTf/kvx+FLuKFRUhMn5LVztEERalHIiFQlL6XnimUbZt/lwpQrhmWUsmoOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833205; c=relaxed/simple;
	bh=doSc5723l2PG2WxzuN3Ze28Lq5RF7ENx8sRWIhTL2QY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k0nW/YS/rhwuzcHw2UKAKVIlkM+etjwAdPrHUDvb0n6R+w3DdO0ktswybJzDigQAKxZGXHLD/w7mmn5YdY2b2YKTfXUGnMts0H5XjCzmiUrL24qPaZfN92mcoSK8KGE/7nJmiaCJIcqO3vUNG02JNd1/Ih7laUrPo0qs+Tt3uA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nstg+tOa; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-30df5854e1eso647003eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833200; x=1783438000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d35k5C/hmD6Rx5Ssjkeq6spgQa2fwGIsCqaARISvLAs=;
        b=Nstg+tOa1wJunxqH4j+NrpyIeTHVEEfilyQ/vUAG9/X8I4dnYK2LhjEHzaYfXT83so
         lpd+TrfwYLbIX2Lzz4eenjlOvECNI0TZj2s/E/ZcP12JkXQgtEafUamwzDzGlKG1SqOc
         slwvaEK+e3Gqx0QVcyvCqy5ULjD/UGgmAaM5yuSfWRz9dy2ZUlHQapzTc/U75M/nMV7K
         wxjJnQedPUBdO4ua42wty7llHUz7eT4Y3U9ckVWJv066CVOc76zWTwJ6m1J1mPEIiln0
         lWWhskJSyt853zL2GhofrpOOfN1dfsmzeUFHSEtTlG90wF+rWcEjhhOGvCujmvaR0cYs
         7NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833200; x=1783438000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d35k5C/hmD6Rx5Ssjkeq6spgQa2fwGIsCqaARISvLAs=;
        b=TBsTtSx1oOysW6AjPeIAvIO7QmeVd2yFmSuedJxHdEYMSXvxUsw7wGAwQ5ih2w2Q6g
         uzCMhHLuYdB2ZXiZ3l4QYUnRbvMpZhwF4ogdUGp8TVf3dW2hxBkz0apHkjpkEB+nzyCU
         hXWlrYD4/Do1J4C/fWTVeIPlLYcufOnf89pcoLP8NfSDdM8NfsSHhLTsM0s7GDaS/e1M
         pXLTOvVOKCTdZMcGPi+sN33A0Dudd6Zi1QznZyi7sBAdSuhVZGInnSqSTn5SWmU0JvN/
         gh4//mvivI85AmHdovwWxSnPMcweElXt+n3bKAVvQKQS7L4cfcG6YEKsXnQL3PqhF1PR
         +5Vw==
X-Forwarded-Encrypted: i=1; AHgh+RojKOdpEVwUUIROFoaJjRRB6/+8hOMrXU/PrRAwXTrRhUZO4yAB+LY0Oxim8MM0cVOuXrodLaP68A5VD6/n@vger.kernel.org
X-Gm-Message-State: AOJu0YzlnIDnyL5ohrd/4MTift4PZE4xjDuf3Rbqy8rBrkOvItm8uWHV
	cDK9Z48d3IEB9l68eMxQRIoCmSRXjM1UIkvNFOPSU0PlkCgjeHEhpIfl
X-Gm-Gg: AfdE7ckOi1iNFo6vrB08Mo5QUBgvC1ntzEdvsHHsN362OMC7qoGbDzkxF5tHe5ESwEz
	KQuWq96RPfJxWx308EqSI69+hg/+gCY6zMcom+xInoj8trVTj91JQr7GX7piCtqfr9LuyZWTvKy
	kMGbf8anlYHjt+//VymArFa7Gl+8ACg5gQblx8iWkAek8eJOUYUK/HjMHx35vxtDcJkl4SOGBkW
	FuGyZNfTW5ve7OAqdfolXwKz6Dq1KXGSyiWGxjYC14FKGn+PmR2E0Nnjf8WzhbL27DHwsbyAEyS
	YMPa01ad+bmF6Ogv6Z4YLP5kv8PxBsL9T2Oqa2WcPCoSyy3+2Mmy3tw/7LheC1jc4siOtXShTw/
	qUqGOzC1ECnAComC9MO0ZM+XHCZQ9R4tIcsyNnhBCBBxTdtk58OezyE+z8tyZ/GXIuhyGrEn+ll
	+cDBQqlpJX9+RGHX7xRMfaLGMQnYBeHcpqEE/NQ/EH6G7Y
X-Received: by 2002:a05:7301:46a0:b0:30e:d6b3:ba54 with SMTP id 5a478bee46e88-30eea0fc2bdmr1153386eec.17.1782833199855;
        Tue, 30 Jun 2026 08:26:39 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc21casm8995033eec.10.2026.06.30.08.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:26:39 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v6] media: qcom: iris: use disable_irq() during power-off
Date: Tue, 30 Jun 2026 15:26:17 +0000
Message-Id: <20260630152617.568-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115492-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF0976E5EE5

The IRQ is registered as a threaded IRQ.

Using disable_irq_nosync() in iris_vpu_power_off() does not wait
for an already queued threaded IRQ handler to complete before
returning.

As a result, a threaded IRQ handler may still run after the VPU has
been powered down and access hardware registers after power-off.

Replace disable_irq_nosync() with disable_irq() so the power-off path
waits for any in-flight threaded IRQ handler to complete before
returning.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d9..538659284c7b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -236,7 +236,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq_nosync(core->irq);
+		disable_irq(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)
-- 
2.34.1


