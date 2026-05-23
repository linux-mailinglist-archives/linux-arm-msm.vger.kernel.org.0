Return-Path: <linux-arm-msm+bounces-109483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KmGEbyvEWqdowYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 15:46:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE15BF196
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 15:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9048300383B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 13:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525F739B943;
	Sat, 23 May 2026 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSnC8s9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B6270EC1
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543989; cv=none; b=OVTQ1U+hZJdrZpA1G3WQbfn0m+gpECk4FZjATylmDJjGr6Uy33CUxjFyBCVSl+hWKLsVdcR/oanSzaj7o3fysCmNVI+Ri+j5Lxb61OYKD8ODPoQaciOH27xZwR6EfPYWwbAuZmkdEU6wyvp9iUg6cGbK+a43os7cwHSkvE5xGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543989; c=relaxed/simple;
	bh=TuoRW0fk8BH8i19fTw4p2gVMYvDPYiQGDUZq51cBrFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UteU94TEsd2nU4dFiEqcHqP4Vo0Ht1iGKvJcD3L+SrAnnOEIecHhAi6uD/9LeoiMokM4DhN+pqLPXTCtHEh0Kq83Yy6IqR7uIAgbv4s66xfg+1qwPFK0Qy6SnOn+62cQCowJwMk8rWv1WD4THO/XQKuoorg8+rggAnafWjg99qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSnC8s9P; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3938b4b7656so7990081fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779543983; x=1780148783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpGSKCQuP+N7v0JoSz+WqN0/+2XSxcdCYc55wbyxyw4=;
        b=qSnC8s9PTUWd8vbTdoq+wRbz4TznyrNyOUNsbvPUHqWKUb56uqgXhJfF+3zztJDEgR
         oSE3IEo3N5cpjAFOT0Wnf50F+fhgFDA43DW0mnoq8enNfimx1/kppWRoJ8dIc/uqI4Og
         tJlHTJcjAZos6M+daSEgb3bM/otdy4GQgQSjVo7d8gQREPjg/WpgmF4ov44Sm0PMgh98
         LS0Jj3cvTSF4D2rIoN9otnyQqbiybjIF0dk3PiLbnqtXmwsyC+ODFXuOZa6GYuVi/N8T
         Q0/4DYMX1j4I9W1HPJ2wNBJaVscrKZ2RjgBzhvzD/Hj0bwdQsRTxzDJZAfZI7x0xoGYH
         MbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779543983; x=1780148783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpGSKCQuP+N7v0JoSz+WqN0/+2XSxcdCYc55wbyxyw4=;
        b=idGZHC/I/vKaymieXVT8Z9XTNpLVawV3ynFuRAQL3Roz1RJ839Vp7Oc1q3X6dC/ssX
         2KnDXL1S9G/8jFrWCCByf4QjkjXSTPUIxE1bF/jPGNMLM+RiwTCxsO7+Ezj8HxMzf1Ta
         PvfiA/9dnaQNJrueZfB+jwidr+jsG/zw16Vdem/RXqmS+TIaECMvepWZzm6IVgBsFcdq
         AF5AvMwLi5alA1ET4OJp2b/jfKnPCiiJ4ukPLNs/L6qNwGVSsog+w/XQW3lA+LxIb6yQ
         fOTBH8njEjdWRSq1tWvs17c6G7ngGw9jVvPUZjOfgdfXXukkVOiqPw+qfK79/wx+w2K9
         zPoA==
X-Forwarded-Encrypted: i=1; AFNElJ/RB3OLe8LKzvWWZmEjBvWBeE1jgcRelbKORlWysO/ZPtlXKH4GJ9OTQ4zOt8ksGqdg06UINTzFwsMIO6kK@vger.kernel.org
X-Gm-Message-State: AOJu0YzM6l5qPwhUeER1I1iz56XxJpymu6jxk7/OU+RASqNnvn/+mczb
	kU5wyQOjEaTxEsrwsyWYWhFGrN+j52yiBXYpsvh0w/+8GNk4yKlzEOlj
X-Gm-Gg: Acq92OGF2p8nbBJKzGuKMzFKTb2eF0q3y8Hp1zmCl/d9RSKz2S7YbUSvBZTb8lFRs5w
	o2Pkpy499OB+o4FQNJgmztEuZ7TD4aBZgA04cQdhIVlGUIVv4BNXWSu5vGP2O5iFYHrh0j2zMOv
	+IF/UbhF+CtFLG8WcAMcc4usrmd2zgFVijfsjtzUC/erelufPZnme6wNf/M7+0EqJX0E1DOTWF9
	QH8X6Quh1t9pVxQrlR4mREBUnn8H0yU0bzbUsqkTOaO2Bedt2p4YozvvPDHgCYuGfizbyinVvLa
	kAaOacc99BejUHt4FBSfvRgGsECcoiFgO5y5L1Y+8TNoC7dFv17ucmfE1IdtS+aip8MHxJHCU5G
	tXREL1FDv4tNn9KgJ76koXUMG4wDDAWTd0l4xTn/r8semUnBFjEXNSk6kK2fi1ll9vHdJUsN1Zu
	NZuqQpraKxOg4gP1uwiNbq+UZddPNv06PE0Js5MAT61FlDBcsutgfx4xnsPw==
X-Received: by 2002:a2e:b895:0:b0:38d:ed1a:a135 with SMTP id 38308e7fff4ca-395d8d0a36cmr12185891fa.3.1779543982936;
        Sat, 23 May 2026 06:46:22 -0700 (PDT)
Received: from localhost.localdomain ([213.230.112.147])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2d61fsm9624941fa.33.2026.05.23.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 06:46:21 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	hcazarim@yahoo.com,
	linux-iio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH v2] iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on driver unbind
Date: Sat, 23 May 2026 18:46:13 +0500
Message-Id: <20260523134613.4930-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-109483-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,yahoo.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 35EE15BF196
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iadc_probe() calls enable_irq_wake() after a successful
devm_request_irq(), but the driver has no remove callback or
matching disable_irq_wake(), so the wake reference count on the
IRQ is leaked on module unload or driver unbind.

Check the IRQ request error first, then register a devm action
that calls disable_irq_wake() so the wake reference is released
in the same scope as the enable. While here, drop the inverted
"if (!ret) ... else return ret" in favour of the standard
"if (ret) return ret;" pattern.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v2:
- Use (long) instead of (unsigned long) for the int<->void* casts (Jonathan)

v1: https://lore.kernel.org/all/20260520190924.12774-1-sozdayvek@gmail.com/

 drivers/iio/adc/qcom-spmi-iadc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index b64a8a407..88f6be210 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -481,6 +481,11 @@ static const struct iio_chan_spec iadc_channels[] = {
 	},
 };
 
+static void iadc_disable_irq_wake(void *data)
+{
+	disable_irq_wake((long)data);
+}
+
 static int iadc_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -538,9 +543,16 @@ static int iadc_probe(struct platform_device *pdev)
 	if (!iadc->poll_eoc) {
 		ret = devm_request_irq(dev, irq_eoc, iadc_isr, 0,
 					"spmi-iadc", iadc);
-		if (!ret)
-			enable_irq_wake(irq_eoc);
-		else
+		if (ret)
+			return ret;
+
+		ret = enable_irq_wake(irq_eoc);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, iadc_disable_irq_wake,
+					       (void *)(long)irq_eoc);
+		if (ret)
 			return ret;
 	} else {
 		ret = devm_device_init_wakeup(iadc->dev);
-- 
2.43.0


