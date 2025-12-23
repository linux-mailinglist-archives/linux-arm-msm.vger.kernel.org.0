Return-Path: <linux-arm-msm+bounces-86310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C2CD8F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71ACC307A873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F388A33C532;
	Tue, 23 Dec 2025 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G3qOYndV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF6A33375A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484185; cv=none; b=KuNQAlmE5WQXYPQNU8Ggl6DN3/nct5ny3U/gkA1DHet6xUiHBewoYo+6e5GTnsfpPa+iFwdEKZWHbn3QORWVQaBB7m5/1Nf+6XGzcgMHrJ/1p0vyBqE0PRWXoQsz2ur22zUsrMqUz/5TOeu5KFN8yWIO5X26oN4dMh1ZiL6ZXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484185; c=relaxed/simple;
	bh=wVdqZWqwmPY1Cu2m3fV7/xu1uBeJqysomH0AL/l4wI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKoVn9Yc0EDNrNb+kLMk4rt86HPPVctNhYhomVowQP2UNr1UDDlMY7zOqnRLJ0KaR5usUZGR8HHPcSpONHeN56gk7ZTeojotbZuBKFeD4x1MRSmM6txZnQxFDYub1fEacfyBm2To13FN1ymfGid6TFEH1ZE+lDlqhE3DLfTSdQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G3qOYndV; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59583505988so7371782e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766484180; x=1767088980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUcTnxYD+aiXPNA8mUA20oia8cBhXKH7lsGlpr1Fxss=;
        b=G3qOYndVuQ4s2VCSt4oVRfLSY+0xTo9uELuDc0AViedGDIsbMCW7jr0x3UAXQ6Bq8p
         qYgmypmfAjZkh3REqkK5mSqqXr/2Yh4QVxtV4zhYRuXbZVgLIA2YhxVV2/e97m9XR97m
         rChSiy4MgPcrgflJvTgy3qQoApZZlCa9ZxAQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484180; x=1767088980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUcTnxYD+aiXPNA8mUA20oia8cBhXKH7lsGlpr1Fxss=;
        b=N9TVQYYDKDdOGEYlo4t2ecXkSwpfik1UA8wJwfuGzGYjCgaT10RxibRZ4lBZq9fmj3
         UlZopHK2pOQY2ma5JFVMoZ43mpN6AKS/xeXTA1hX2Rq+pA6MS5siOvyww753DQ5i1BHP
         3QqMYzbyVOyQXgQRp1a67RamUhItEZUD2iO0IkUZHOTyOTQcyLuOALnpD16LesZ+wZN9
         XM7tAA84Hkpp/THjahwtCvJ6qgr+6NTLWjPfxooJCCjxb9rlHBGi3dI3jXM/3jsGF4lt
         YGia6ixIdBzU5I0XfWViB4k9KlmG5nTQr0A7wwKWeFFQ3kN/Y28vjSRFA9f3cGP1Ffx4
         aVSg==
X-Forwarded-Encrypted: i=1; AJvYcCXbwVhKO8jNoaAufHowajBYJAeJaK3sh7E/sH8bIZMsAVONmKkMHeccNidAGA8JKKovzOsNrVvx9AUrsv1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxPdSybk6FJDmRVN1IAiWVSqMa7VbU4WQAO86AMZWkK2mgoizUE
	AURNcaubqv5HThqE97BIwLb2Mp8jyAfxaA9t7TSleoUoUaYaIazJ/ljoERXa16Sk4A==
X-Gm-Gg: AY/fxX4NeP9PK4rNX5PJQoOTLs+uNStKEQddMp6uJaf6gF/Rp76RA4aohuad7ZXA1JK
	DELfSKIa3ICtTY1NDRfucMKiHSRe9bXqslBmUwIczigZ/uDMJKv75y7n1/kyfx64LxTCOzk5YVg
	fOoe6tfuQT3YuwV7qbwQVa+IbVaK7C59wHiTbIaYnUsmG1TO/4Hh/haE2PzaFX7Zd4H3KHJZnnG
	5xrsvojBXJluNLW5aP5TLMklwaBzRvCc3XRW7cFZlXGRGzGi0kQ65Wi6k9ySUg7sRrHSkc6nG0K
	HxXGsKkNdBghbODn4CmK7lB5P7T6RvSW+04CdhqsV6WfvcVWEzSvxrx1ok1GbXOoTvOiyg5bbLh
	KAnq3LYvtX8i3OUh+Q8l5DUYJAyQemgjzx/B+0dC5E4XHDQ0dV00mm6KH9MZFIS9RcVeXY3GwiP
	LJWbkvwrL/mRLVZaZZmRpwAKJLTHOY0REJ0jjZ0H2hyuWxCc/MSN9QzpSxVZgdrNluytG8e4cPh
	kQ8hV8z
X-Google-Smtp-Source: AGHT+IHUtiYy/b1w7aGEwapBzSYDcplHqB3pOohRpr+U+rLexxqRV9AwzsCeEnjx4WC+rrCtt6Cywg==
X-Received: by 2002:a05:6512:2310:b0:595:90ce:df8e with SMTP id 2adb3069b0e04-59a17d042f2mr3900726e87.5.1766484180563;
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3891990e87.43.2025.12.23.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 10:02:57 +0000
Subject: [PATCH v3 1/2] media: iris: Document difference in size during
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-warnings-6-19-v3-1-e8f56cb204ec@chromium.org>
References: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
In-Reply-To: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
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
2.52.0.358.g0dd7633a29-goog


