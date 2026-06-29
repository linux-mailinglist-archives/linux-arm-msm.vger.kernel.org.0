Return-Path: <linux-arm-msm+bounces-115011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cQ5POMNZQmrj5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671F6D989D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:40:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=GGBgxMf1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115011-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115011-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319883075435
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A39402B9E;
	Mon, 29 Jun 2026 11:31:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E05401497
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732660; cv=none; b=VB8N/3zPMizSocbDHLxBgwAVfEZG1CIDz4t014sFYvUWE82Mv4xXyHrrFIsYLZEX7zqrIcWFKZmSmIIu1Egu8A3tfIFxPosp0RLHCe3s3L0/JiToJ01A8UiT1VW+MlEIad4Kxjm8iJS/n/qqmFScfGW99HJIh78YxuV7pRX/HxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732660; c=relaxed/simple;
	bh=aGuMKUQmxb48Y5Tzunx5RYEssJcocgsBIKxGX87PXRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqKQecTydlFIXgjfh7HL89I88oQ8QGHAuyTYrUZsKjW7MEYuFqZfI9e46Jq44e4qlozlM8yCvWL7YDwzYwyAD+rpx319SpS4dEIuzyLqsEd+/opxS/tjc3Y7KDQA0VFYa9em2pFwXclBwoYjf6Os1/658OXRNC6HCp5ANRaOGTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GGBgxMf1; arc=none smtp.client-ip=209.85.167.45
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb7467a8dso959094e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732656; x=1783337456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTtLPL74GADi3kWDd9SrAAeq3VH8vL4XzQwNytgsK20=;
        b=GGBgxMf1KYW4Yum3WaMJEoNVkGvwckLbfYMmqJBATiqyzwUboSjkc3uo4BYvTOUMFo
         XT1fhrNkc4VlKVD5Az5YD+1XVciKjsXco296yeQNmNKl53Glv2Hh2p0awTblhR4Lgf6i
         acRplIK3zVkAuVnKKPE+K5TC46s3tbETiVkvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732656; x=1783337456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTtLPL74GADi3kWDd9SrAAeq3VH8vL4XzQwNytgsK20=;
        b=iLbHpMUYwYMRAW+ttvu3+KCQodBlwVtwAFWEGYBRm2AqLQbWpOl6b+PjX2mLerDDRY
         9FMqF7lPV21o32hLiik2kb4/IexnSOE7dQD96rGTFcThRsvy+45uFs/MQuS6RG+rqTq1
         Lr5abGrKK7E88FrSSmvF+Z4XYeS+dTmISA3w2z700JzuGaMoH3oFCyueLUp1F752SCeW
         ZlQMEzt0diWSiMfs3R2RjP4s9pqaMTK6J+2Lf1+plRF4IDkJAyZHDS3mrbM8WdTexsEq
         8b8fMmpsiM/PJk/7JCYfdOCcJlhrWT/dBpOuGCbp8IubTOHZDAQEp302j35C0JbQm6Yn
         MQmg==
X-Forwarded-Encrypted: i=1; AHgh+RrK8rusdbaSTHXTW5qtRxVE2KLrXnvMgcav56rcOxltY93EZUtLfegHh9x7dWRFhv94El90JvBR1jJywrA0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70Cv/oZNWMulH5ZBWTgy1jDlg6EazI4DbDkHEdAOc+Q8J5iaL
	2LTHfEKKXqnC1l8VlFyyaObRg0pCBq0wAHvAHbp3eZl1UpYhEd41pUGzmoa742sXPg==
X-Gm-Gg: AfdE7cmMrurSNCrWutvYvAeC/508a9NLXLtN2rPKubxZx8y9+KIcV+6TXD+cgu6ww8L
	CyxsJqa9U1/+q/Qdf13E86xysUeMn0fFLjrvrkWkBPB70lkL54qxYogMAqQJ3D4uZFLysDRyWJz
	cIyYDz+OEw/UM+v+m8T86esyk3AsNzJF/cRPzMgv25CRY5QTJGuYiIi3kAvJjysgljsE/MFQ1eE
	YDABBGxEGRsmnemJtTug3cXpepPY9c8BUwyijrXDZEaeUvUPp6B+ktpb5CkszXgYHSHvDZ/HKMR
	P3HHoN27L0IFVVR6N0Oqi8pgDzOH0CBmxVQAzWLAVirjpnk90oR7V6jF3ViwUUa5XZMHjpwkWwb
	+60cp3l+rNqkSpvwTA78kFUaChDYzegvSkXqhd2KTP5MgQBTWVqaWgYxnDIeAYdJVrQdBJnOQBj
	Ndrdr3yoMQCkQIqpTEedkULRXPRXvFQX2dIkR/Uas/zM8ntbjP/+ILcUPS+CzsUNwUFSrL
X-Received: by 2002:a05:6512:1092:b0:5ae:b62b:68b2 with SMTP id 2adb3069b0e04-5aeb62b6bcemr1256585e87.2.1782732656034;
        Mon, 29 Jun 2026 04:30:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:47 +0000
Subject: [PATCH 6/9] media: dvb-frontends/helene: Rename priv variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-6-5884c80ee3b6@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-115011-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5671F6D989D

Coccinelle triggers a false positive where it thinks that the priv
variable in helene_attach_s and helene_attach is the same variable as
helene_probe. This is due to a bad heuristic in cocci.

We have reported it to cocci, but until/if this is fixed, renaming a
local variable is a good compromise to fix this warning:

./dvb-frontends/helene.c:1049:2-7: WARNING: invalid free of devm_ allocated data
./dvb-frontends/helene.c:1013:2-7: WARNING: invalid free of devm_ allocated data

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/helene.c | 56 ++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 993280fefc2c..5fbb466cc8af 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -995,22 +995,22 @@ struct dvb_frontend *helene_attach_s(struct dvb_frontend *fe,
 		const struct helene_config *config,
 		struct i2c_adapter *i2c)
 {
-	struct helene_priv *priv = NULL;
+	struct helene_priv *pr = NULL;
 
-	priv = kzalloc_obj(struct helene_priv);
-	if (priv == NULL)
+	pr = kzalloc_obj(struct helene_priv);
+	if (!pr)
 		return NULL;
-	priv->i2c_address = (config->i2c_address >> 1);
-	priv->i2c = i2c;
-	priv->set_tuner_data = config->set_tuner_priv;
-	priv->set_tuner = config->set_tuner_callback;
-	priv->xtal = config->xtal;
+	pr->i2c_address = (config->i2c_address >> 1);
+	pr->i2c = i2c;
+	pr->set_tuner_data = config->set_tuner_priv;
+	pr->set_tuner = config->set_tuner_callback;
+	pr->xtal = config->xtal;
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 
-	if (helene_x_pon(priv) != 0) {
-		kfree(priv);
+	if (helene_x_pon(pr) != 0) {
+		kfree(pr);
 		return NULL;
 	}
 
@@ -1019,10 +1019,10 @@ struct dvb_frontend *helene_attach_s(struct dvb_frontend *fe,
 
 	memcpy(&fe->ops.tuner_ops, &helene_tuner_ops_s,
 			sizeof(struct dvb_tuner_ops));
-	fe->tuner_priv = priv;
-	dev_info(&priv->i2c->dev,
-			"Sony HELENE Sat attached on addr=%x at I2C adapter %p\n",
-			priv->i2c_address, priv->i2c);
+	fe->tuner_priv = pr;
+	dev_info(&pr->i2c->dev,
+		 "Sony HELENE Sat attached on addr=%x at I2C adapter %p\n",
+		 pr->i2c_address, pr->i2c);
 	return fe;
 }
 EXPORT_SYMBOL_GPL(helene_attach_s);
@@ -1031,22 +1031,22 @@ struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 		const struct helene_config *config,
 		struct i2c_adapter *i2c)
 {
-	struct helene_priv *priv = NULL;
+	struct helene_priv *pr = NULL;
 
-	priv = kzalloc_obj(struct helene_priv);
-	if (priv == NULL)
+	pr = kzalloc_obj(struct helene_priv);
+	if (!pr)
 		return NULL;
-	priv->i2c_address = (config->i2c_address >> 1);
-	priv->i2c = i2c;
-	priv->set_tuner_data = config->set_tuner_priv;
-	priv->set_tuner = config->set_tuner_callback;
-	priv->xtal = config->xtal;
+	pr->i2c_address = (config->i2c_address >> 1);
+	pr->i2c = i2c;
+	pr->set_tuner_data = config->set_tuner_priv;
+	pr->set_tuner = config->set_tuner_callback;
+	pr->xtal = config->xtal;
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 
-	if (helene_x_pon(priv) != 0) {
-		kfree(priv);
+	if (helene_x_pon(pr) != 0) {
+		kfree(pr);
 		return NULL;
 	}
 
@@ -1055,10 +1055,10 @@ struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 
 	memcpy(&fe->ops.tuner_ops, &helene_tuner_ops_t,
 			sizeof(struct dvb_tuner_ops));
-	fe->tuner_priv = priv;
-	dev_info(&priv->i2c->dev,
-			"Sony HELENE Ter attached on addr=%x at I2C adapter %p\n",
-			priv->i2c_address, priv->i2c);
+	fe->tuner_priv = pr;
+	dev_info(&pr->i2c->dev,
+		 "Sony HELENE Ter attached on addr=%x at I2C adapter %p\n",
+		 pr->i2c_address, pr->i2c);
 	return fe;
 }
 EXPORT_SYMBOL_GPL(helene_attach);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


