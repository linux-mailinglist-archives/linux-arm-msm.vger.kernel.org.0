Return-Path: <linux-arm-msm+bounces-77015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5B8BD35CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D76A34E1762
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3934F257827;
	Mon, 13 Oct 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T7ULooxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2B22A7F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364821; cv=none; b=iJ5TnYVG2+xcN1uBzeF4vUoCvqrAl6u8FfpyT6OWvbheqY69iXW1KcTuaZDmIbrwve8+R3W9LzbV45N9fLQP5kk21u+9MiFh/GsfQQXGA+YcA4qO5ShoMe1glZ4RPbmfpv7NaiZOjxYTzlDDeAsnq6oeWwo0cpL6tZiiic8Ipus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364821; c=relaxed/simple;
	bh=VrwVxnBJbE1HH8epyWBnfON3AOVOOL93Wc26DKJqcVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EVPoP5bQsG1vGvNksQR7MtzKISMm8c2gf+Ihi64CMTciTF/ElwYMHYVoK2X+6WlLVcXs1fi+qrZv2c0Y/LkmTsdDEIYFfaM4sppxhesTJ2aHbdHvmI/TddlmxadEtda5FATq4HrUqLo2Jk4J9fNEVJDt1NJVssXzwuKJ4Yg/UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T7ULooxs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59054fc6a45so1055375e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364818; x=1760969618; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMoJohml7hT26UAcl5VOsiah4+MzHyU0IYmm0KpSVVE=;
        b=T7ULooxssY5ZM/BQm4id/0/6TPr3Yw/1jqyL5rk93NrCojhaq5EsU4NeaFcGmCUvcl
         NVlQRvUjZpR9ADpWJPMP5QS99k1AxPyHVseAaQVaDoKBtBSDe89YP3aLAVAUUi7g/m+X
         vmiwn3aBSr0fKh204I7+94nDc7Sfxgt1o95Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364818; x=1760969618;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMoJohml7hT26UAcl5VOsiah4+MzHyU0IYmm0KpSVVE=;
        b=wP4DA94v95o/5GTNxNg0WsIswesm2BLRWeLq9mr1W2zS9lm6FaI0znAGE2jFe8BWBF
         PjFRdHM3QVn5MuPIa8fDLNg9q0EuXSZn9/HequPvFC3GTJ7OIVZTfhkzqEKQIX7ky9A8
         v3iv45icKvGcpjPFc3INOCYA2svSHxedyoOceEHLvSa7gcycnOdcqr1IW0IYNPeZjTWP
         egwV2vagKjA6b2qJRmN6sCAg23RJ+0T+QLVML2MizDWfMllnFhFm6tJ/3WSQ1IyRgZn2
         9hUlECeEh0/vUZpFQg97ZGDGRXaasUc32GpllepUvBBh5lAtPrQbVrLplMXGI/xjlPIK
         VISA==
X-Forwarded-Encrypted: i=1; AJvYcCUGkKmbMqki3yTavJn9ouBgftvmgLR8wV/Icj9smGDgP5+CqukDZH6rW2Byu8Ke2h86IdxYMXWnDwHp+2Pu@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuCFALh4/NfPKc45LOB1LLpOAvIULqH9T264uDz1oUyJ+D2YW
	U6jdvFo3noOQhpsONCDJzrg+MhYqOk0sUFsxLuycroeDG+R9mFhyVi8YXYSfOmGDGg==
X-Gm-Gg: ASbGncvP6eWew/b/3P+it1V9m2UWXhcz19pYyGfLZHa0hyi7K3S2GqukQRGFLoIC1I6
	w1MGl/suudmJXbBW8D7gPmDaNuokdEkwlVBEUHWEE6j/JIQuvAsyYydKQYn9NXcO94jLivGPVaD
	YrYSL9nk5eGfEH60aOlcDxO7T8dnuKmpxnuNaZWF4Rj85intK18g7uQvHvSsEi9dy1X6w4MW+zd
	TQuBPi4cZtxrfMsD6IXUHSr6tSwsnRxDDCqvcCNr6Xq45hZ7WtURyjVLh6kBT+yVU9v4ieIDyz7
	YuJNPud6gWmbMcwdSBlIBbfoNezYqfJW3JTxLaqkFL9ncTtYz09+4dR/yIQsWFkn502VBNtGLpF
	pr2TzetihP745FHOilLJ9yQT2OxmqpKKbqQjk5s7Uhp2aLOxzA8KT9HhivI0tbou3fDKb6sLEBJ
	U5023E7cLzhq2fOOJx6fD2FrgbmVUH
X-Google-Smtp-Source: AGHT+IE2EczYKFQFN7sMxN2/+GfInkv+GHaLvdo/s9X0uHJy14+SUpjLLq4nVeukL3Rqh7NbHKU/DQ==
X-Received: by 2002:a05:6512:3c9c:b0:577:494e:ca61 with SMTP id 2adb3069b0e04-5906dd53f00mr6801047e87.31.1760364817682;
        Mon, 13 Oct 2025 07:13:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f91c0sm4168722e87.41.2025.10.13.07.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:13:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:13:36 +0000
Subject: [PATCH] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-v1-1-6242a8c82ff7@chromium.org>
X-B4-Tracking: v=1; b=H4sIAA8J7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3cyizGJdy8SUlKQUI/PUNHMzJaDSgqLUtMwKsDHRsbW1AF8mgcJ
 WAAAA
X-Change-ID: 20251013-iris-9addbd27ef76
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
a normal division.

Now that we are at it, mark the fps smaller than 1 as invalid, the code
does not seem to handle them properly.

The following cocci warning is fixed with this patch:
./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0294725860305254c4cad1ec88d7e..1234c61d9e44c632b065a5c44d3290f6e1491892 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -371,11 +371,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
+	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	if (fps > max_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-iris-9addbd27ef76

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


