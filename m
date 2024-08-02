Return-Path: <linux-arm-msm+bounces-27810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBE94640B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 21:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046081F22973
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 19:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A345FBB7;
	Fri,  2 Aug 2024 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFpzf32V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56C4D5BD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722628061; cv=none; b=re+jHUowG2RmyoHLqjRp0HiTSVzobCc1rNaQv2li1KtChX40gE+5KIyl5tcsjNYKKI/bG8IVPgA+ocPYUAaF0qMEuWZ1m9hPaxizRsbcxt1aJAX36Myvu95y7RBKE/MhuupaCyfByDoSxdC08SWYTaUdCRulAewJwDJg3lMVid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722628061; c=relaxed/simple;
	bh=CZjSqPH+rj057dW3MGJr9d/4aI78HIu7xqrI+Pszc6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oe/ySoDCiTlKskYj2fhtW2dLMVaQBKmYHDp7uglQSZg/EWsAZTtVWM0PL1adKs/W0nUxzzGr4bMuWo6gabof/pBpfjSYVARe8hUFm5/V4dLDYExeyXr5OuolxahnBxBaV7lmRPPk/i4UoDWHXHa112xlDdNJGbX7m+xxk2oy6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFpzf32V; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so12184955a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722628058; x=1723232858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEhmfd96SA4u8ArVJ0CnfF56Mf7XuLe49/SsadrliSo=;
        b=BFpzf32VVLFE0fY9gVIFoRedlsjdWKg0MBYT1wm90F70u4tqnSknn+WVz2AIf0Pawa
         ri4EJPgL+z94/poun9I7r3xiubWU87I8vOW2oLCv4NqsZ4yKeHQTA5uQNIOP2Ixp/2EN
         vxFubkKo48S6UyHILrBY3n0o+y3W2d0EAIpYw5s4ugyjLEWpfEO8AvqyYTb4fMp6jPXB
         1HwmM6FL2J652Zr5/4TgzxI17idv4chsFTR+AUcUdXTdu3jJCSz/kayLC7tVm6UyUeT7
         Xcz4637SgtwTcy7Fb1H9jz8Xak+Uv9TuH1wbjwI23guLjdMuYdfsgFNrqCRan7cUvPDK
         0YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722628058; x=1723232858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEhmfd96SA4u8ArVJ0CnfF56Mf7XuLe49/SsadrliSo=;
        b=bzYfdocTgIfFf6a3vwzOKZbxzIYy9MfbK9HDIGSZpAPFe2YXBwELHdXJk/UPYfKGtj
         Z1Y8q65+AM0xv6b07HQjveM097d9U4Yhmm8Bk0Hd7kQ2GZxSglC+WuVx9JVW34dd6eFm
         zRW/ivvsfrj7aFo8srxpXvHX/rZnCTC9IaMahtenKna1pbnvmPGmuaO47o74w9GSlnGp
         51UxjFYVncj1UaY6D94thiToFqRFRoBoToCwqPn6D/Kd6Y1Mjv9h8pbP2ZEvp/hWsrJB
         8wlHJi1M72+oy7MZs8odEjldiuVZqj9S+xMUpQg7WHhPJd6cTpE6fCeMJBAr1fuZ326c
         CR0A==
X-Gm-Message-State: AOJu0YyfDZLDPsqmChzQNqhifqx0YBofxQLhBppGotAvIhyz3cFOmUur
	/b8198CjKN1pN+fNWupGpxz5Y46g4n1hU+jxglS9mrS5OfgfAdyoxrAyzzI2D6XulMmCWx3fL7l
	K
X-Google-Smtp-Source: AGHT+IGE4H1l5ZsQO9E8ceCmygqDIf/qjenXKaWKCLGw6BamqRCWYmwVW9jR+CpmmBFPOxP7jM8YAw==
X-Received: by 2002:a05:6402:22e5:b0:5b9:3eaf:5bc with SMTP id 4fb4d7f45d1cf-5b93eaf0729mr1053960a12.10.1722628057999;
        Fri, 02 Aug 2024 12:47:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839b2b556sm1440939a12.25.2024.08.02.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:47:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Aug 2024 22:47:33 +0300
Subject: [PATCH v2 1/2] drm/msm/dpu1: don't choke on disabling the
 writeback connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
In-Reply-To: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CZjSqPH+rj057dW3MGJr9d/4aI78HIu7xqrI+Pszc6M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrTfXVU98v4RdmnOEY+K+nRJyLA96hWSyJIZSr
 MswZGwbrPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq031wAKCRCLPIo+Aiko
 1ZxzB/4gpy2NQ+2mx80O3Kz0q+HVUPc3URApbvAha2Yb7GvUpdAbK1nwua1IPGobkTXNh9v15ei
 lf+uzXbapFyKVZnkGIQ+X3bSZTkbmmLkJ/TkgCOUv2ucDVfz4DvvLZEb3Jplh7J6IoD9N8BQPYQ
 JsRmN3zHQvMQeeS1yMH4w9tVbaxo+P/G9y8bT2kJW2p4XTKs6DvG3kFgGW5bEyZz/uSySPxzjBM
 VOy1s55OHDe8smm7pqZd1lFxnERRK+7YyPddOSVRs42aCvkdpGXviUjQv8EfQnjO4689p8G0xBL
 ye8PxKGpZreVH5mlA7rRzii5EU58m8gRY/kLjQY4q7q/MIqz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

During suspend/resume process all connectors are explicitly disabled and
then reenabled. However resume fails because of the connector_status check:

[ 1185.831970] [dpu error]connector not connected 3

It doesn't make sense to check for the Writeback connected status (and
other drivers don't perform such check), so drop the check.

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Cc: stable@vger.kernel.org
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 16f144cbc0c9..8ff496082902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
 		return -EINVAL;
-	} else if (conn_state->connector->status != connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
-		return -EINVAL;
 	}
 
 	crtc = conn_state->crtc;

-- 
2.39.2


