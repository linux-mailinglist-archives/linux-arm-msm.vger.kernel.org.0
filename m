Return-Path: <linux-arm-msm+bounces-84170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0DC9E50D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F7B3A430D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22772D73A7;
	Wed,  3 Dec 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HqlZFvJU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF02C21EB
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752142; cv=none; b=jBflo6k8MaBvZ2F0Aa8jj7skbn7dH244LWby2UDGF2H6xjSYVpN6DfmyDJQFVTUafr0LpG8iMr3lElRHb+vUficgTjHcZWOr2J0rrLiksdhEpgCsLWq5w9lyB8DItm4TlR84bUM9Et8D0EhHyvkDhi+9iu+AOAEkfrEyQqhcrpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752142; c=relaxed/simple;
	bh=3oJz3ZltYDqpWr5+uCLuJCyHQnDQ/0WypPYIDHiOHFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMn5qMDuDQKaT3Mu5ZbTf6PL4G62zRlWH+/V0W+1cEC3NjR9OVUpJ4OwDcy58nHWG8ztVj+KkkYG42apDxzz50H226wMUuigYRCy3BGbs4jGypJEvdFPbLndNAWF3+b+NpwSxIVSuDudediLJaRWTy9sfhRCq5NFDFqZh1P33Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HqlZFvJU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b97e59520so41880141fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752139; x=1765356939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8y22R6XWDK/GOldRzQWK9Q2C3Ir5yEJKiaGjpAlLmI=;
        b=HqlZFvJUMBtNMJAhJwVy7XovhNQjsZYMYnevf456rShaLAG89zUNxnBFi2AEt58EqA
         m59umu08WtramawEKQi6cUwIW33eeMbAps24VSl+RuJjhIBAa+wePg5dafBOxr2vBEK7
         W6liiX9uwkAT5I+4CbUZ8aEAPCqJkXg4telYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752139; x=1765356939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8y22R6XWDK/GOldRzQWK9Q2C3Ir5yEJKiaGjpAlLmI=;
        b=FWckcp7/NmyqvTtO/El1uMwlluY33JaIVDmeB0iMm4CMgUUhhDGNkl6qQp3ZYMuMrr
         gYc+FKKiANt9LlJbS/zaBOIHZtH6An8aM0dtK8PKAd+n6e8PDx0Kg3yH2F/kkRNJmv+d
         t8ixI4d7p5zr+tuVUUV5VS01TMd3XYGEywiBgoa64VCUaEkWbbSIjcOKkmpAuvUHTNNp
         LkXuvtZiUgWK2NxIiFLzxPTfbg89hiL7vKQPeEAuTTuNWkV9s3WGlTxaBh5KEFYcqXc3
         yHNTyidfM3buxTFhfGCctTKybbLa7UqFlvRsHXFuPmvFP5Ao+qtQ4qmS6cwK1xB5py4E
         vq5g==
X-Forwarded-Encrypted: i=1; AJvYcCUoCnPpz5SXz2cx6s1k7G32ayQnqvZJCn30GOOxwqaQ0K+l2WwCXp2lf4hXyQyV19agdKo+/wfqSvig1bGK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxji2yLKet3ijq5Z/FyOTtiI9O81GofeFiLcTAGre/y8w5AbVGR
	l0idpybteqo3HzBT4kzOeXI+OdnPsz/27INZBrGLESiXQiSL3YP1Ja0obZz9lSG99A==
X-Gm-Gg: ASbGncsGOj5mxExVNoBXjvVe93kTg4X9D85sPnILr86mgROxneL/D4OLNoElU3pOrlL
	qyNgxgedLVf2YdXby7X0iH/7GL0ZTTgp6Pzlf9onNzXajQDZJSIlFAZDZXzpOJEAfWUv+CpISuj
	acee7ZEyZN7p8eEK+EMY/4jfy1HgirLrobHrxQ7HCd9lFec5GFDNFMiux/AaAXxDj7FEdhWuQU0
	tjzeLTENpS49OQ7c+Ai5GeK31NynZxFKiBPchpHJdQAIavDNJ8rRq5Bvo9vWfmtA/JSebhguVgg
	RcDZmjmiDe3C0jPqymu9N1ts5V8kPPsqtRXVkOf9eYGCxNoz316/Lb6zg7VYJ0zQNytnSllo7D4
	LtbqCxb1JsZP+j8QcKEHQQhc4vzjko5n2d/gbT0szxenKipGfW5w7J2gkhiigGm33k+L+NJJDzV
	v9TACXirlGjfTRKSsv87VVjm3in0tfNDxUwv752yRBrKqf7pEx2HlC0T01vFHRmuRY7kzEfg==
X-Google-Smtp-Source: AGHT+IF3xsdoMGrgPPAVSpklnW3yTghz2fpZ17/ANQgtvfY6FupWoRh+Pdfp2OA8LBXT6KUdlKgBEA==
X-Received: by 2002:a05:6512:3094:b0:595:831d:22e9 with SMTP id 2adb3069b0e04-597d3efd920mr696138e87.1.1764752139058;
        Wed, 03 Dec 2025 00:55:39 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 03 Dec 2025 08:55:35 +0000
Subject: [PATCH 2/3] media: iris: Document difference in size during
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-warnings-6-19-v1-2-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
In-Reply-To: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
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
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index f9129553209922fda548ca320494ae6ae797854c..ab91afd0597045bd876d0411b08b5a3421b12c70 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1212,5 +1212,13 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
-	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+	struct iris_inst_hfi_gen2 *out;
+
+	/*
+	 * The allocation is intentionally larger. The first member of
+	 * struct iris_hfi_gen2 is struct iris_inst.
+	 */
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+	return (struct iris_inst *)out;
 }

-- 
2.52.0.158.g65b55ccf14-goog


