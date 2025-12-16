Return-Path: <linux-arm-msm+bounces-85387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C47CC4041
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DDF43056569
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB04435FF70;
	Tue, 16 Dec 2025 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B/HC9NIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2B29BDA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899751; cv=none; b=W/QzS0j3bbc83wohx48zrTEt7z6ganXSzL4olbt3Z5CmZHpG7BBWipbMYRjB8fUBvoSZxzGLk87k6Jc9I/GXYz75aqACdURuoU+Ww16ho9+lBbTx36tQBNqWJW6OhrARuFZ0859bufwbp4TmoSpJIdx7Q95T+Xo92hfEg4aUEFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899751; c=relaxed/simple;
	bh=4muiAjHuAD7dYIfr73MQ3yyzrOuuTQnuoe/uC/hHsIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOxvlxI9nQObuwC94uYnChCJ1L3Ml36JKO4BL/AqwBwuAfeQXr/oXgGYF/tfHtI6qA+jSpaGIaez77x2L1fHXjz+laokUqkLHYCf5MyZHAJl8T6T81m0Qtc4p1eXBP0cIfNPlhyDaxgjL6PnFevN4rGUQuK6Mt53aj+8qRKsFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B/HC9NIU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594330147efso6014905e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765899747; x=1766504547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibUqxEEeYAT14DRs/j/XBVBOJBPbCX2lWNH1mmAv5Jc=;
        b=B/HC9NIUdh1wRKaBzYMX2S5UMr7hU5Tgc69VRyDFxvEij9t3byELs0Hq0t2FdbION/
         OCwgeSfN8UPajFlQGVnyFqQmJrAKv1QQNMOqrgYRg3LGG3EIKgapnYpkJ/5o0H/3PXp+
         ilBH/xRthzqeMS4ZfHHQeHN/P52NwhDgmNr84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899747; x=1766504547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ibUqxEEeYAT14DRs/j/XBVBOJBPbCX2lWNH1mmAv5Jc=;
        b=tmAOcFTgZpz33f+olRYCwIWJ23uonBnqh/WSeZ0rRMWvs0QlJQP3xfNWF/fIpBl+rB
         lINNF3jEOZrA6jQf/GQMIGIiewyEGj7RgMVQ7M7cCOemim2qsXc61eyyockbsAPJJjPg
         5eBDuetObBwLlPPKLzuUMs9BhU73d7AO4HMRpJlm+lejEIj0fkgroNLXb0pto9FeYmDE
         MNGXs8JXzcdri8Nhmkzutb8rYSVYpRrI4icBWLPPRNU5TcT40T7hcmzVhqdoMje99LW7
         1l7cW0Jm/+gDVQfez2TFWYGCPzYACcYL29qfRCi3o7DkX3ysZAuJAcgk7BjXBx0yjWjK
         wjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUgCoQVqpW3PX31mNtMZHmzVWRxekh6Ms3mdyNnbW8g6+a7pbxMk92yEpAFTs7M1/ca9PHaH+3b3A0rwmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfcIMEgVt7AUFSimB6Z/ZFgZ3ftdeez3mwCwU5lE3JA9a8K0i
	nswfze6rgFyq7eS/x3YATwTdAvk8f+darzAckZsEVu5IwZu6irwJfL850KRLf7MKqwrOPKDln4m
	vUrF1hA==
X-Gm-Gg: AY/fxX6G5b/AH8rag31cW2w/dt9ViF043RvuwyhcHgf6heXmxeTK5L3MCW+l7KzPWJA
	4eCpfZMIAUAAn5RxBg1OCRetro1QLO7mGn8bS+ZqfGrPr6o+lR7uwiwMZJr11RCApfbTFpg74A5
	p7COquRcqXP2c4IkEhZJR9nOfptqQaoZ6o/BhmKE4YpOFkO5EmgaQissJk9z3dFvMynuJ2RnxAx
	wUJh4XmHxQccm1KCtN/5ceM0lKKKtAhMOdVmxYt3IzL47KRBEaNFRUdIVkFyb5x6RT8yEgfD3J0
	D5Uh6E64ArpOYGLmg3KDGoZ6fAAaIFu2R2Yrs4jGsTDYW3or1vXJX3JY5cxQXvek/j5JsfOXd5K
	JYuWxWlJYIIdd12jMaVqmuRxxnPIYFWKuY0a4bRwW3GOcXL3J8Oy2E03jQWUDcOwty70w90zQi9
	sS1g5nL6I7d35QqR1cfn4FNriR5CYGIw6Y/Qi372BMSghEqkOPtiWMWOG7Elkn5p5fi3CJ4HdPO
	JB82nSq
X-Google-Smtp-Source: AGHT+IEZ1MJ3LD/5MNrLllt28+1UFyOWGkybZY0pOHALDmg5lcghAE+VW/yCL7VugkHpkWECOWBwBA==
X-Received: by 2002:a05:6512:1390:b0:594:490b:4493 with SMTP id 2adb3069b0e04-598faa83effmr5186905e87.41.1765899747397;
        Tue, 16 Dec 2025 07:42:27 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4b8sm1003489e87.31.2025.12.16.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:42:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Dec 2025 15:42:24 +0000
Subject: [PATCH v2 1/2] media: iris: Document difference in size during
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-warnings-6-19-v2-1-12075e3dece7@chromium.org>
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
In-Reply-To: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

As we get ready for kzalloc checking for invalid sizes, let's add
documentation for the cases where the size is different but valid.

This patch fixes this cocci warning:
./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index f9129553209922fda548ca320494ae6ae797854c..c120ea3594fb5d0f40d6b9a7c67ffc28c42109f0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1212,5 +1212,10 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
-	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+	return &out->inst;
 }

-- 
2.52.0.239.gd5f0c6e74e-goog


