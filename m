Return-Path: <linux-arm-msm+bounces-12470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B85862A9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 15:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82551C209C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC8B13AEE;
	Sun, 25 Feb 2024 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6GgmmRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767712E67
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708870373; cv=none; b=aTPuU3BFqXMCMrfCta5gpwnNIxYBVN6drh+Oplj839IafnkFGA3imaR8dAWgjCABOM8nGD46OlzpqEEWNeUMD0NsL3MJcVcfa22arLuJas7zLL8L2UDRm/EisqxE9MCPfgxLC3VUtOIVfxVTI7tpGdWIZlunLAJ6OKnTr1dpUQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708870373; c=relaxed/simple;
	bh=A4/oTwY5JpAU9dbsu93L7dZvCPx7K/2ZR18bKOeKyl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arG/Q/ep1S03LHt9aB0Fv36gyTsGsue5FAS0reYj062E16MbXKIwRh3poj02O7ZHLHQr6rlabn1YcLGnTpD7MyNWnp+Ag56xr3gfz6dam/jzfRcJfNKUonAAhb/iSJ+qA1nRkPLHgK3JNvXGyo9gL68hZruavVdpe0Iy8CripKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6GgmmRJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso36828571fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708870370; x=1709475170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXkFidtqGVYDP8/cl+5cTf/LoCCSdGW5wG6DXUHuPiw=;
        b=L6GgmmRJhNanYrJ5R04m4b3jVj0CrURPk8lw67HJcdubb4L8bs/mGNGXZZXahZwy1Q
         KPYrEbp+c8iznKUq9TzGWZPuv4pFzm4LRe9P95IuXfmbrhZMtIQbLkEDJ9280gCeIWts
         Jr3SMIKO5zlfsVivvCT8+x0mihhp0D71escc/d05PGJPw7ICTnqy6xnRRH1lpAxFhXeX
         3jroP3dzYQV4hJvm6yMdchTMX35VHVEqXsM7XlJOr99RQiBAvVhVK5F7HIS2/HL9U82W
         xny1MIV2sbqmmsX/OQfqLZxOd2RlHQVizn+l4etiAWssC5rAwq9HVlPCyE3vslYUIWVB
         kGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708870370; x=1709475170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXkFidtqGVYDP8/cl+5cTf/LoCCSdGW5wG6DXUHuPiw=;
        b=oONU8hkbqju+BO7dZIof7sK2DKwzJD/2K3TIbQ7gDsO59y84einAS2qxc8KLflqcc8
         dL8uxsfddw4nnpgroEwgjepskqg+HfHt/sMxP0NssRR+d4EsAzuHIx/ShgHccM3/ONUv
         3wiLpiZzwZmAN4HtbcTcdLoMFiU8p+JlZUFmwr+/ThZ3YrR6vxWea9MGsHB7uhrFunjb
         0PY5Vqs26NfzlJ4ax8mnDus1NTak2Gh0fXZVJcSl6nCU/Ysqcoisc2fRnmB3BzFZIPfh
         yJSURyDpRP7skmQJH57GeYDcNqsI7KB7Rj5nEu7rLfZmWf4+7kFg39ZYBFrJDE8B9mKZ
         u/ew==
X-Forwarded-Encrypted: i=1; AJvYcCWCCmhppMh2wkXfRKggXKekXxAfIq6PmTRmfU5fhbhO9Z3A/Fjt/0vPSVyxhy0XBs5pwLr++ZAJyYYf2GspkrG3+WGkrJKPzffJbN39HA==
X-Gm-Message-State: AOJu0YwsIvA16vALz9Lt2+Ui+KYqKJ8w9RL9/DqAJ3cPlusrqu4hVzRK
	8RKSfG1e2p0yndGYGiPbpLl0e28bx4unZ+K9hXyseTCg3RoTokPSXK2Ua1Tm4xg=
X-Google-Smtp-Source: AGHT+IGZ1yVlZG62WK5s8XgMXseEorjE3oDAcLvokJCsoAwczaJfRkKuxwH8PNeZCfgcle6av35Q4A==
X-Received: by 2002:ac2:5388:0:b0:512:ec6e:9f2a with SMTP id g8-20020ac25388000000b00512ec6e9f2amr2791473lfh.19.1708870369931;
        Sun, 25 Feb 2024 06:12:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 06:12:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 16:12:46 +0200
Subject: [PATCH v3 1/3] drm/msm/dpu: make "vblank timeout" more useful
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-fd-dpu-debug-timeout-v3-1-252f2b21cdcc@linaro.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A4/oTwY5JpAU9dbsu93L7dZvCPx7K/2ZR18bKOeKyl0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfZOXUMpqNliF8fh0oH/0RuleHVyeXPPDGe
 FISdoya/+aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1TuEB/0Z/hHj29uzA3HA/VxFscGLzDGqyZUj4/ANTvm9EjAYa0jQ1LJccv3i1tiK0jnqxIWiFoc
 wnYLHUf5Gnp42YrF0h8S+uPIOX5nmPadqvtKmBuY8GzoZs9/IYY7ggAMzbGf3HnQHDc4y6/kAbH
 1QNNrifLpUq5wHtBq3a5QE/uZO+cXGp4ozHDQM04cEUW26qvjCcR6bMADk0Ft777z41tCostXqI
 VLDhiefC7by6PVbjx5VTY5fVKqRr1rDR7DNWIy75ZRDDVSml1SirAMOr9nydO1UNltGDhVZgcGu
 ucU+IKr4qLybtRBJaNN67n4kqWQAKakPMqnsRgbLBCnrO3nT
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
To allow us to identify the DPU block that gets stuck, include the
actual CTL_FLUSH value into the timeout message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2aa72b578764..6058706f03e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -480,7 +480,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

-- 
2.39.2


