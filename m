Return-Path: <linux-arm-msm+bounces-19598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0498C1461
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0F951F215E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 17:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261A0770E2;
	Thu,  9 May 2024 17:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aToF1tZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4EE2A1D6;
	Thu,  9 May 2024 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715277132; cv=none; b=YUCIu441DJWoLThXNg1CTdwFVeE3XDLCVRMrxRLhRukjTvJlFWTszApyDmvZBbGlaw5k2iJ2H+PB/kQEo2mpGKugLWsha+soikBCuEHY95WY81w0BZA2FgaRv9pnnhivJ6CqUbBv68z/auddybuGkaFlW3Ou/gH6pk+vP2ePNXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715277132; c=relaxed/simple;
	bh=yRv5a6JPOHzZlyufG4uZdYs7EM11RxwpKwRhDDDZCn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qlE7ngx+0Ep2kxDcBBjOb0uPIZ9RJbnaA0GWjNCgF5wYzIZyoOvgtGSome+Y/TTd9/MkIGqsQ6jVSqZrIunAFRF86DSjHOx1Sft98yyirLgCydNIm/n7COoWPQvkx0QA3oQBN0/D2kpjMgw4L6TsSLK06qn1I2ArmxcZ1g/rtyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aToF1tZf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e9so8694045e9.3;
        Thu, 09 May 2024 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715277129; x=1715881929; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAgOX6MEQ5v7+oviGufGYxbrE3KtnKTcvCIobKG2wxo=;
        b=aToF1tZflZ3IPsSrh5zXGdJh/n4VZZmjNlkr8V0OK6H88nazkRbwSAm5qmXlY365SC
         sptGmU3w3FHXsVUUvhMjIoWJN9IyKvdXEoDLkyz4jjEP+jSlVukvlw7WMe9cmLmpzdez
         AXyNISyqoM/RKIXUZy6OCJpdC7A3NSvPoohMiFgRN+BuVIsFIXYNC9d33Xn3zbCC2mfe
         FJFevASIVLyBg/RmyR4bYr1tuETUYhWLBOMplBbxG/mw/muTe7jzkF5rjhHq69D4WeyL
         ogyYFKBslthzhWNboSdfoTNzG1TcCnDkQT5OmC9mL70BlPqxYmq0BI6+lpJ3bDD66bGw
         6N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715277129; x=1715881929;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAgOX6MEQ5v7+oviGufGYxbrE3KtnKTcvCIobKG2wxo=;
        b=KHeFxDdAKMsTPc2gq2u//7ARyerafgbCQyOKEd6M/tFsU+fCtS+xg+LbWxdwykRMFW
         cfvMLUfhuYpKP/2qjebIAwW+O3LiQF8hG0knjtghPXlnTvS+0MJSaOsonoJbEdhdO3jU
         adJ58Stw0COSpwwQaezRPDQH4XEDD2ttunN2Rlq+YlzmtuOYx1+HzlYugA6sxc30xw5C
         aADSVEQ8HNhem2LYvvtTN7KHPYdxsgWTsLTnPnB0LP/SeOWM2wFKdl9Yo89KRIBOv014
         TeyCsqQjKrnUMVNP9OU9qdDJPXM2bcYRX5XBPPqya4v7MD8cjH2UIkcUBZVMxFq7dpIv
         7nPg==
X-Forwarded-Encrypted: i=1; AJvYcCVsBYCWaA2h8BcR9FrOAnT3q2adTz3Cs7VGi5xPw2P/fdPvL1FqHma4EibxZtSx/GOdggDVBkhsbpUcj5PkOVunjqRUTYPTWgPf2gax
X-Gm-Message-State: AOJu0Yw9yJXkp3+rUtLFElIJNNHM5hZU2OTXx3X2eEW6Pt/sDx5WqQW/
	/PLlc///jqLjFyV1Xi4VcK7fd0yVV/iRgjIDuwij+womLziRftAs
X-Google-Smtp-Source: AGHT+IE8innbNBc8AiX5EWTRT9KWJEll55U9Zj/JPSJuQs7roZHsNPLnxuehVNX8x4EXgB8XLCbJ6A==
X-Received: by 2002:a05:600c:4591:b0:41e:3272:6476 with SMTP id 5b1f17b1804b1-41fea93a333mr2899295e9.10.1715277128756;
        Thu, 09 May 2024 10:52:08 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu. [81.182.220.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88208cb8sm68014395e9.47.2024.05.09.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 10:52:08 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 19:52:04 +0200
Subject: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEMNPWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3eSSnPjMokLdREuDJKMU80SDpDRTJaDqgqLUtMwKsEnRsbW1AJa
 /gDRZAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
so better to skip CTL irq callback register/unregister
make dpu_ctl_cfg be able to define without intr_start.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 489be1c0c704..250d83af53a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -298,7 +298,7 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 				       phys_enc);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
 
-	if (dpu_encoder_phys_cmd_is_master(phys_enc))
+	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
 					       phys_enc->irq[INTR_IDX_CTL_START],
 					       dpu_encoder_phys_cmd_ctl_start_irq,
@@ -311,7 +311,7 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 					   phys_enc->hw_pp->idx - PINGPONG_0,
 					   phys_enc->vblank_refcount);
 
-	if (dpu_encoder_phys_cmd_is_master(phys_enc))
+	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
 						 phys_enc->irq[INTR_IDX_CTL_START]);
 

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-ctl_irq-a90b2d7a0bf5

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


