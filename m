Return-Path: <linux-arm-msm+bounces-19597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E72868C142E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E191C21D62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 17:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DAA54BE0;
	Thu,  9 May 2024 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfFTYOiu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A258129;
	Thu,  9 May 2024 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715276392; cv=none; b=OpLxGof0xdwgwKsnTw73L3dnblaqolzBeMk0YCu78WPcUZ8wMuXqKKzNgPFu27l0hegIaf3YLyCWJMtf4CQk17epv+1IS0YtyCbFWCSbQkEZ7apGdbkZkoh+ocoVUS1PN0Rqh7X/KOQ+TJZ2SaiNeJN6mGBZH7fvBXqg0CiAEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715276392; c=relaxed/simple;
	bh=YTB6KEzeAZsAmkP2CLbQmPMJ0EqwYAIgDs8/wXrXgHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QbKpKS1ttTNqGI6nbZoEA5fc77pGAD1uZJI08ltRw6lTBOYG3ODF6Ci75vV7h2+OCY1lNB97NGoVjRviTxOteNFf7Ths7gPwCdvJzSFO/eXfhO3C2pWAHL2xAJMVUeMCi+r6EqFpxZB+8cIG9+oK2KqRLUTQoak/wYEvclsg80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfFTYOiu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34f7d8bfaa0so816550f8f.0;
        Thu, 09 May 2024 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715276389; x=1715881189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXUU3H+PgMe++t6s6Yb4nLqL9mCXFnF+1t6Xu9YIDmo=;
        b=EfFTYOiu3T309EXBDl0znafIHHfeOX9PylHLHSAS/x72kSl8U12NrOq7Vece4vgeB8
         0G9uk3G6EKpTA+iXz3fLWjXn1zEC+W9viUqVn0TrK4c+I0mlx42h7422OAapaw0Ha67a
         h/Ms081UWOET3XfwYPpnFjMlDJG6gBsH6cE3T41aQFCE4HCyrRdciJr8zkcSZpIuG7w9
         GKnAyxdYIJo+Ep9livjpoK/puzhiOJK9xEbk6ZCgUvOSnxPc1lDWLM5H3VuWqHNXG1ez
         L/oAfHrpDr9ysoa5FWhp+Pl/lSWdbx4uzQtW69Uzl2JW/gAmGvlELqxUh2RmEE7VO1jl
         1Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715276389; x=1715881189;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXUU3H+PgMe++t6s6Yb4nLqL9mCXFnF+1t6Xu9YIDmo=;
        b=b/0SsvyFGr9YfZ08FkaQTVSv7JZrKQESctGHR5z6J5Dorx+aN/7+JrV09B+BDIM4Fq
         t1UPaxWC7TI21DwhbFFCzIAxKWWcK7Rg27toBoNI2qVNf0ZNEYjJ2keNIejztrTl61Fv
         Ei/ikZnx70p0b6QbwAIoJySRFkpNsQUNbaDDcc2PBFNJ3E1YsVt4yEbRvXufgZ+VuQxV
         ZHzaQ2dNAiyN6hhfD+8p1v7ZFkq2YRQGT5DbJSIqbVBPCa6vnSODZzT9sfrB7rldfMNW
         7Tr9/SBFRynb5oIV5cOadysTrtqpgQn3cGUxZQhI5OTeX3YdNsoS+ngKXGvJPngqQFsW
         8Hdw==
X-Forwarded-Encrypted: i=1; AJvYcCXPBfRGoYnjXlNR3gwA1Lghx4IYLwPkKwDf1BD3y3cG/CDL5y1S9WGiXIQd3L9wCqLXBbQObETkgDwH6Y9FXoEl9/v2v2NCY0qP+idX
X-Gm-Message-State: AOJu0YwHxIjZTKcD1DwXGbMMy6XkfflQBvw8tkYNIqpTq9LlJdpb88va
	/6SoaFubYLvbH5dPrHNEJM8VTHLsJU0WmWqaXNeLL2K2DODUj4Ys3vol3Tq3
X-Google-Smtp-Source: AGHT+IE/7GfRfJfa/usca0jgdG6bN6wknL+/x51vAqqUu0ualXn47t8uTJpGHDXedlmsL6jkzbA3kQ==
X-Received: by 2002:a5d:550b:0:b0:34c:67d6:8dec with SMTP id ffacd0b85a97d-3504a62fec5mr244132f8f.6.1715276389048;
        Thu, 09 May 2024 10:39:49 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu. [81.182.220.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bc99sm2268546f8f.11.2024.05.09.10.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 10:39:48 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 19:39:30 +0200
Subject: [PATCH] drm/msm/dpu: fix encoder irq wait skip
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-irq_wait-v1-1-41d653e3784e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFEKPWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3cyiwvjyxMwSXRNLExOT5NREc/NUIyWg8oKi1LTMCrBR0bG1tQD
 MGOmlWgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

The irq_idx is unsigned so it cannot be lower than zero, better
to change the condition to check if it is equal with zero.
It could not cause any issue because a valid irq index starts from one.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..cf7d769ab3b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		return -EWOULDBLOCK;
 	}
 
-	if (irq_idx < 0) {
+	if (irq_idx == 0) {
 		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
 			      DRMID(phys_enc->parent), func);
 		return 0;

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-irq_wait-49444cea77e2

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


