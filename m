Return-Path: <linux-arm-msm+bounces-81050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E3C47926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B4B4421230
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC192475CE;
	Mon, 10 Nov 2025 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRobEWLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073512405E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787873; cv=none; b=Ukj82LXiIsVS4/dUUG2jXddiAu7C6IWBNPiaZWZEzkMYnbMNUb0/cXcu/UJglETP0MWdwYk2Uxdmn0Umg1amzyWxacN6glJpYUXFBpv400aVlM9Ch7kfhp32X7itg3DU1zCD3RA7EM/iKaT+3AmZyz2mGXP7YW8YAy8Asyw1jvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787873; c=relaxed/simple;
	bh=ngcsiD/ajXiiBpABsVazTz+tJLwYwSvVxHi2KUe+7xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FYY5GGY35V0ZGCJWw9aIKi6VcrTrvAKcsi5Yu9VX68daezjx2byz8tHle0ckZfHkTJ2KaL2xzUS+nZ+lYp3LbWDdo9U6WBSYFzoekUTscYADhrqI77PxzPSRDv49lvrvrHveVnHfWKNtRvFTpBBY0oZjV3RAUMvgtyEEh+CE8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRobEWLC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298145fe27eso14191665ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762787870; x=1763392670; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=proAMupxnU1cqn8ppHXktvWmCFOk0d+KB4vZ0hwkHKs=;
        b=BRobEWLCJRfhuDOYGUKALEazHMIJFkWEYJgBqcXpsd8mrOgqkXeo+tbLEJlRaJgEbz
         jvdI+pMH7NvExqPrc+fFUIy+Y87ivqBViWbln7Brepiz6cebZAJERJk80PTxmxh7dIIK
         Nd99w4kKir9A+PkCsyJr4xZjM1kbkpj822j5EqOLrwi9QkaH9gsEFsA75RdRyyOPJly4
         foJbYam7tKkUdt7SbIJbonkrD2pZO6MY2wAmCiu89j9T65QA4SzxjXH7TNNdKBVYHjWz
         EVX0HmQrnRNQMxL+n49ow8wAbUOqcAQzK6GZ8d8BovUEmuJHYlQh5q3ro7/OC++5Yyt0
         POAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787870; x=1763392670;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=proAMupxnU1cqn8ppHXktvWmCFOk0d+KB4vZ0hwkHKs=;
        b=Ok9qqrQjPbM6qsO0unjgHjVxM3fz4p9hsBCustV2MMeBGrNNbX6LYyhVs4IgRTMFw5
         Uj5I0DEVR/748Za66r5poZLzoG6aQR+0NfYXOdTMX9tbQAcqNRyHCZJF1f1qYhaDd4xI
         mtnUK0ck6cH9J61GY1g4WAhHkHLDefqjLVcU/gYtOTJufCa2mPRtD2zahLVcYQPWfUj4
         0NNy/fbvdtM3/bsXfnTMoXdzjOrf0/HvmRhfN0S5f+mtqy8h6FXuq2boS86BzMKreEnH
         CJrUvBTNCe9WFAeiYXGPUXZZr4IqDdkHA/9gw5zWSeetj1ZokL0kMSLZ9Sm9UUHvUJYQ
         Kqtg==
X-Gm-Message-State: AOJu0YyF5yycgO3fr9ZfML1FL+z7TFlBWja5Ms6izCH4Z4kxX4iBRicJ
	bxWkDoFO3qzrKdgAdrRspLCvEcciTSV8qt0/tThaiTUNmsfXlje+zsU1
X-Gm-Gg: ASbGncvGxdeT3ZCbLXsWKA65b4J2Qn0xIAIam+44JA7xyDd7oE6P3wqdeBET/4F+370
	VjvNdYlm3JfNfnvWrW+Nj/IuiVjAQFAkuMRa/Bv0kUd2MThMiSvH7HdpJt84AorsTjqbfGCbxpi
	gMFSCQWmlvjBxpniP+PutAdn0nsIaIwIbWXwDQpKnOzosJ8jR/GQcftOwhHg1xMki4xIvoBQNQq
	zkfzNkWfsoKnhgrc/bRz+e/mU3ys7LXu4ERXk+0argVl16KoWH/Vq/L2hg6ya0g6oGH20PQdPCB
	qy2os4B9RXtEPwL1yTS77VxX+nrO9fVcNDT6mGtdPQMmN/oonhBYAtUEbzNW23Xbnb/5tmZVWjw
	eSOcsx3qZwoeYL5dqCEmxRiOQoE9XtNQaanElPp6y25zbvPFR3XCP8o93wNWp5Lno2xgncvSl01
	ayWXxBefa9dQ==
X-Google-Smtp-Source: AGHT+IFColOTEFc+YKuJfWoz7iYZVyQkHiGnmwgGT/THEbSZlWqrZVd6iPqWGf0bCjSVP6LSnEfm3g==
X-Received: by 2002:a17:902:dace:b0:297:e59c:63cc with SMTP id d9443c01a7336-297e59c644dmr114215475ad.35.1762787870219;
        Mon, 10 Nov 2025 07:17:50 -0800 (PST)
Received: from aheev.home ([2401:4900:8fcc:9f81:b4f9:45ad:465b:1f4a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c6b3sm147976145ad.24.2025.11.10.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:17:49 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Mon, 10 Nov 2025 20:47:30 +0530
Subject: [PATCH v2] tee: fix uninitialized pointers with free attribute
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-aheev-uninitialized-free-attr-tee-v2-1-023ffba9ea0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAkCEmkC/5WNQQ6CMBBFr2Jm7RhaaUJceQ/DopYPTALFtLVRC
 Xe3cgN3//3FeytFBEGky2GlgCxRFl9AHw/kRusHsHSFSVfaKFUZtiOQ+enFSxI7yQcd9wFgm1L
 gVEaltUJt4IzVVDyPgF5ee+PWFh4lpiW892RWv/cfe1asWEMBTd2c785ch9nKdHLLTO22bV9A+
 ZMd0gAAAA==
X-Change-ID: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=ngcsiD/ajXiiBpABsVazTz+tJLwYwSvVxHi2KUe+7xI=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDKFmMTyPKQjFeOe379RKLJCf2GU64vwyMLnUfwcPRkvp
 i2R17PrKGVhEONikBVTZGEUlfLT2yQ1Ie5w0jeYOaxMIEMYuDgFYCIqMxj+is02uvih40zJtqz9
 X4yntCVqKjb2i1pu0bqkrdmyy+OQKCPDgeg1WYmx74ScDp3h2WN48kMOh/jCRfwdxfJ/djJyp3/
 lAgA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

Uninitialized pointers with `__free` attribute can cause undefined
behavior as the memory assigned randomly to the pointer is freed
automatically when the pointer goes out of scope.

tee doesn't have any bugs related to this as of now, but
it is better to initialize and assign pointers with `__free`
attribute in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Changes in v2:
- initializing variables to NULL at the declaration
- Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com
---
 drivers/tee/qcomtee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index ac134452cc9cfd384c28d41547545f2c5748d86c..65f9140d4e1f8909d072004fd24730543e320d74 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -645,7 +645,7 @@ static void qcomtee_get_version(struct tee_device *teedev,
 static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 					  u32 *version)
 {
-	struct qcomtee_object_invoke_ctx *oic __free(kfree);
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
 	struct qcomtee_object *client_env, *service;
 	struct qcomtee_arg u[3] = { 0 };
 	int result;

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


