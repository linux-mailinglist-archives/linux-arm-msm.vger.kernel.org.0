Return-Path: <linux-arm-msm+bounces-111109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2yyFIyT/IGrm+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 06:29:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E345863CD11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 06:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CfYUl+It;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86F9030071D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 04:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04323B2FD4;
	Thu,  4 Jun 2026 04:28:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF393B19C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 04:28:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780547314; cv=none; b=Yeqbd0XIXeir3Gyo0V1Z8szztOOInhOcx/s87duviZGdgjkM4cpxk0qBgzRM6zQaOJ/chKH4hG/PHSZIrROOmPWuO4lQxCB7rzZ4sSW05R2j7+nGjZZ1/cMMhNgfDbBip6iBmphncDtAhO4hUrwQ6LROhexmBwrINao6/C3tHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780547314; c=relaxed/simple;
	bh=kPHuJtTQ0hkRfy7p73FhicO8cUg/8nIs8uPAoZveIcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MeEMvlqAGAXdGkcOBo7booc4FgMbBf3wRzKG8FMOqrK8+wn/p+z8FkXtpfO1ZYJqKnJj6gImdln2MLYpN4qwb0itRJ8NosXCxBK0oEp4agaxAzKeCJUdE6cJ1iRajtmBiz9d8uKnAI5xcMZUFfr9A1jOlprTwB9kC8sTZi4deSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfYUl+It; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-30749947917so559900eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 21:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780547313; x=1781152113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Krv81UtJqbrKiv64g1xvINw4ke0/xXMSb7GtZ8cJeM=;
        b=CfYUl+ItPiv6tYXi9JK0Ni8K9rm3TRRkgSNHBoo+RLWZ4JLxVzzg0LO5lJ9RuF1N9G
         t4Mndvlf0odZIiTb2MIetWgBBlaXBPIKzOKPj3FiX2NEeXaFZ12aS0rvEkMbpUY/sHon
         DM1dhveQuyYgJXKln1Ths9DS4l52BG85JPyIvGA5B7ZqdtygZ7jqysLcxLcy0UbDb4Kr
         YB6o6RSMhUW/kgf+f24UDEbOTdU4WCEKCpQSQDE3I6ki3vSL4L7ZqBsiCt+EBdCUrwLi
         xVU07FTjnqrBFEr2CED1xgdw4Zsgin9aNNKrAYms5S4kEk2EPNevnoN+yjoXZ13SgRgo
         wVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780547313; x=1781152113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Krv81UtJqbrKiv64g1xvINw4ke0/xXMSb7GtZ8cJeM=;
        b=FficGtvJuDUekQ0oIgynv0PwlZsOcSyX8XpfguHJE+EPna6MjyMKIBqvvUXVAMXaLL
         xHilPAotblPivjyXPK00PW6cGuphO4RGa6r+0yzPigUaAZFoOOtL1IMeyU/8CBe25hW2
         ntmqVyLRu3K/IRZQJGvrck+84Pbq68UaZ8UlbWxiEHw7dTFXX9jGPT6wxxmyzHpe5mj+
         fUXXDWOGk8j7r/vFESEXTPiwFWE9ri1jpGqRJBwgxvwdTpRNC1Ji196IsqdmdBhYhPF/
         iP+uj32TXWFEkRrADON9F7wc8Qnca3PYFXKQvhGap5L3ciFsKFFcmwYe7tdPY+xcOwOm
         qi/Q==
X-Forwarded-Encrypted: i=1; AFNElJ84CgfWQ6yFji8lljkDg9Cxk4MT+01vKRFu9/0RJme8Wpa1M386bhU9P73wfIqjfP8/xFwAG/pOXOl5Mx8G@vger.kernel.org
X-Gm-Message-State: AOJu0Yynp6lZpQz3H/Lh0kW515DH3XsG7ucQ1XS+1D4bU3JyYZ6+s/ej
	plRTbaxfDjHxQd4mT8pAtrip46NWgJm6hN5Ox7eBncqO2BhuR1bq5J8a
X-Gm-Gg: Acq92OHjQ7vOCw5LTy6kjQRux9c0hn4q+/jmrqwJ65efWqlHgXq60giV2llwkn0X9vG
	EbDXesUaH0jBP2pNyiXxaJmjg6wTzatPAPHlBCNMN9EPXDbnauZ0PEsQ7Hk6Jbr3fVaZifx13v3
	/wlwLQ6+cOYjb0+y5mmiLXjwLAIqx/A+UZUdC6vHIhphQYVPDDFvoKbxksMBv73pPk3fwxFwZf9
	3Jhq52tYE0UZEHF30C26V8j8idz2SFc56W3RtIl32pJ1CBiXW8Wa8o0Sopg2N3ZAi+p7m3AdvC+
	cREQ9ftnTtPb9uiQ82VumUdlIDZ9JjqIjtbYy7yvIsSIGPMlSMQsJ5vgbVtlCwGBj3LZIITucLW
	T4PHH5XF84pKHHwVSRpJB18eXf/YVHWPztIwXewOOALSDu6W26NFE7nF13oqlcqSWDOm5ibXksF
	7TebgVNGOHShPImj+aQUZiiBtkmljqmYwwXYfoX/Bdk2gY6qbGW/BRDi6O4/qQH8xVPw==
X-Received: by 2002:a05:7300:dc8c:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3074f843547mr3215053eec.0.1780547312495;
        Wed, 03 Jun 2026 21:28:32 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4379317eec.29.2026.06.03.21.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:28:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: abhinav.kumar@linux.dev,
	stefan.schmidt@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: handle runtime PM resume failure in core deinit
Date: Thu,  4 Jun 2026 04:28:04 +0000
Message-Id: <20260604042804.40899-1-dennylin0707@gmail.com>
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
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111109-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E345863CD11

Check the return value of pm_runtime_resume_and_get() in
iris_core_deinit().

If runtime PM resume fails, avoid accessing hardware resources
and skip the corresponding pm_runtime_put_sync() call, preventing
unbalanced runtime PM references.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index dbaac01eb15a..a3275ea57557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -12,7 +12,11 @@
 
 void iris_core_deinit(struct iris_core *core)
 {
-	pm_runtime_resume_and_get(core->dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret)
+		return;
 
 	mutex_lock(&core->lock);
 	if (core->state != IRIS_CORE_DEINIT) {
-- 
2.34.1


