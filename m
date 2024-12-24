Return-Path: <linux-arm-msm+bounces-43198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2569FBA32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807EF165382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504E6191F7E;
	Tue, 24 Dec 2024 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mq4wJk6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F57191F6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025103; cv=none; b=RQew5Ydabthz07lZz/ZzQLZAgq7lBmDrErRuuvhGGZhMkClKzg4KcTn9LKFoXfVSmMx7OurZdKhXu8iOI4BGmRktRM7jfnOjMmpOIyOqNJYoPJQWZE7usC9IKZK3trJnB8H4gHgLoVtRd2jJjUryEVPoihB+kjy62W3hxkdeQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025103; c=relaxed/simple;
	bh=r71J1XTxvY9JHuEadXJXhCt6MvOmgQqaRuvpY/3Ig64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kj4001G4AmMgrmu7L/aA9Wu0lVkhLPfGeuBznBQ7Ow/Xtjq+VgtFNtcsFcw6QUMcHE7DEbKYjUUQMC4bSWWphK7LFLwaV8LEgOmSY0RIrSugAnSkgQ9mhWTNQp3tzyyPG4onywv+Bo9O/c5TIscWxJSO9VZmyd0LrHHRKEXkkKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mq4wJk6Q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166651f752so53119875ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 23:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735025101; x=1735629901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHCCWOGWVzcRMki9j1D1cT+IzNg+cnlvfL1iBnozW5E=;
        b=mq4wJk6Qy2lFoc+4YTpEJ92HWYz1HYFG8lGYWvGt+W7uK8ViUM6+054a7XC1zucxwE
         7F0BpZeUipnqI7Z09uNSEKtyfjdRLMVJfNnSAeG3oBWdESpDPtli/p0vbUdMqGpx/goC
         shnQmIRZA82PgrwkImfBJ2JNK59ipCXNff7b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735025101; x=1735629901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHCCWOGWVzcRMki9j1D1cT+IzNg+cnlvfL1iBnozW5E=;
        b=rmePiEex+cZKWP+NDEzO2z1as8LD3NRNbM9qtmWSDz0mx+eqdhsLijEILaH4LCdDLj
         zWzzyPa4Jwji9xIXwR8eYRaclyhhxJJDlfTe8zkuBLGxuImFwqiVZb9YhaLfYOp6bfwf
         4EUfM9ip/p1F3UXbwYZ9Gvmfg9T6ncmnniTIxa7bbtUzUSDWy39LtFmfj8n81grjGGlS
         uXhjTe9wPb7gQxntakpRS+Z/zY8oj8fCVQcKwuh3teis463NBzp+BWcdWVAUlese7XQI
         R3TU8bzoIyDkMp7R47aLa01FDBJdzPOL6q6rq7ad8+OFRHO8rWpH48611g0ZZxGTF9n6
         LM/A==
X-Forwarded-Encrypted: i=1; AJvYcCU9OWZoKtVrjrbtnOXhzLPgNjdE5j5d6oeGvwUYTDxMA3I4q8qAXDiFBF06wq2HgZwhuBMdQqUq1oSKBzs0@vger.kernel.org
X-Gm-Message-State: AOJu0YyuKAomuMkRfdvLBDsplDtfGEDA9bSidO1KhXBfa6sRPb7BEXKd
	grvoEQ49QGaTK73C7bMUI9NoQ3RIx0rbNJvzkwqQY7ikzL8tZm8oP1M0b3e14A==
X-Gm-Gg: ASbGncs3ugwybVRtt9r8hcHspsXCjafv2a7XcKAsgYFvnz00NEYRutgolD93qhrESun
	JCX9Ck2uXFOl6fgp6BRLidlRtBnytaoEvaweeMXPp1Q6Rzic7uhcbwKKLC+tl7g8XhXqgJw3unn
	271LV8ijUlj6vKY5GhANABvXzo5FN0BHKzc3cIb4CPQLbAuIuhpsTTmpzW5LDsjOywRC/rQSSwN
	da6tiap2IG4yhLrtW2kJDi73Vls+a3OU/DnAwQSgpyDLydFSmIgT/ehplA=
X-Google-Smtp-Source: AGHT+IGl9hn9Wwz/ecoWpCp/JPrwph2e+noe6flvRfLHj8P+fmm7DzkHqeYBo9FsiUo3Zhh0Rq7K5w==
X-Received: by 2002:a05:6a00:4644:b0:728:fab1:eda0 with SMTP id d2e1a72fcca58-72abdebaae0mr20485234b3a.25.1735025100953;
        Mon, 23 Dec 2024 23:25:00 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:de21:da72:a349:25b2])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad830b05sm9038425b3a.52.2024.12.23.23.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 23:25:00 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 2/2] media: venus: match instance creation and destruction order
Date: Tue, 24 Dec 2024 16:24:06 +0900
Message-ID: <20241224072444.2044956-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241224072444.2044956-1-senozhatsky@chromium.org>
References: <20241224072444.2044956-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match order of instances' initialization in venc_open()/vdec_close()
and order of destruction in venus_common_close().

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 18 +++++++++---------
 drivers/media/platform/qcom/venus/venc.c | 18 +++++++++---------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..9f82882b77bc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1697,10 +1697,6 @@ static int vdec_open(struct file *file)
 	if (ret)
 		goto err_free;
 
-	ret = hfi_session_create(inst, &vdec_hfi_ops);
-	if (ret)
-		goto err_ctrl_deinit;
-
 	vdec_inst_init(inst);
 
 	ida_init(&inst->dpb_ids);
@@ -1712,15 +1708,19 @@ static int vdec_open(struct file *file)
 	inst->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
 	if (IS_ERR(inst->m2m_dev)) {
 		ret = PTR_ERR(inst->m2m_dev);
-		goto err_session_destroy;
+		goto err_ctrl_deinit;
 	}
 
 	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
 	if (IS_ERR(inst->m2m_ctx)) {
 		ret = PTR_ERR(inst->m2m_ctx);
-		goto err_m2m_release;
+		goto err_m2m_dev_release;
 	}
 
+	ret = hfi_session_create(inst, &vdec_hfi_ops);
+	if (ret)
+		goto err_m2m_ctx_release;
+
 	v4l2_fh_init(&inst->fh, core->vdev_dec);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
@@ -1730,10 +1730,10 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+err_m2m_dev_release:
 	v4l2_m2m_release(inst->m2m_dev);
-err_session_destroy:
-	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c1c543535aaf..c7f8e37dba9b 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1492,10 +1492,6 @@ static int venc_open(struct file *file)
 	if (ret)
 		goto err_free;
 
-	ret = hfi_session_create(inst, &venc_hfi_ops);
-	if (ret)
-		goto err_ctrl_deinit;
-
 	venc_inst_init(inst);
 
 	/*
@@ -1505,15 +1501,19 @@ static int venc_open(struct file *file)
 	inst->m2m_dev = v4l2_m2m_init(&venc_m2m_ops);
 	if (IS_ERR(inst->m2m_dev)) {
 		ret = PTR_ERR(inst->m2m_dev);
-		goto err_session_destroy;
+		goto err_ctrl_deinit;
 	}
 
 	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
 	if (IS_ERR(inst->m2m_ctx)) {
 		ret = PTR_ERR(inst->m2m_ctx);
-		goto err_m2m_release;
+		goto err_m2m_dev_release;
 	}
 
+	ret = hfi_session_create(inst, &venc_hfi_ops);
+	if (ret)
+		goto err_m2m_ctx_release;
+
 	v4l2_fh_init(&inst->fh, core->vdev_enc);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
@@ -1523,10 +1523,10 @@ static int venc_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+err_m2m_dev_release:
 	v4l2_m2m_release(inst->m2m_dev);
-err_session_destroy:
-	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:
-- 
2.47.1.613.gc27f4b7a9f-goog


