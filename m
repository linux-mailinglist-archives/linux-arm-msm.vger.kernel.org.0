Return-Path: <linux-arm-msm+bounces-6553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F081825D3C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jan 2024 00:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D37EBB22893
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 23:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC419360BA;
	Fri,  5 Jan 2024 23:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YT6YAHVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD6360A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 23:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cc7b9281d1so725221fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704498613; x=1705103413; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgIr5KjeQ801ktUcvEq9tOSFsZbUarwYEDM+BV8WLFA=;
        b=YT6YAHVInHs/bJP5lG0FPUcvm3FtjDcTXWb4ehVMppo7UNNZ69xiYhXcMVosCmkiXE
         RrvFcpddWLXKKtrKAlONQNIpTF8jXdyHjnQ76WYNYJxxtoyc+5Ilth8IPFKX48sajmUd
         lYxbvmg1cJbIWRFZjfS+g4vUqYWmhtOxzFXsR52ABPHUGWnpgzb7z0r+/5gzSOvOgWfs
         7U2H70PRyZlxPC3V5zLL15Pp5ARtvhb3KfIppX7K8eq5c7KYSYZWitenYSM6MvMuK0IH
         mxjwtowBZGwFxdIrjFAFmGbdWMLYzTWsRQisEq8yXdisOWUBJ39WMzso3TBfkMTSMXn7
         u4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704498613; x=1705103413;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgIr5KjeQ801ktUcvEq9tOSFsZbUarwYEDM+BV8WLFA=;
        b=X8kYBW9BeMki1nM1T6F3C5PsTBwlSus3wvEpUN0uUGqlfJjzLxRq+LETxvqvcgPg4/
         DQcMOLxEy8G/K075le9KMGJEKKrCzBjWXpSVKiGiUKQS8mE4sj+YKMaYAOKJYmopt7ol
         zcntmT88b+jkjflaZns6yhg+gBFgXkAlyxLH/puTbM3XnJLQypdzNLHsQCJ+zYttPnZE
         ZJEw+EqOSDsvxUcdit/2fyCblI8voEVlci9V6VdH/g6iu3SpxCjIhD6PG7WPhjzoH/3q
         lRWNazYdNQvKtVHQUADAJFw9hBxBcI1G88IyH7gNaMQ8E3qYzFfpXADaqERTsW+89mi0
         qINw==
X-Gm-Message-State: AOJu0Yy9+76sGN5jHop/nT00DwGZvs20a5twEj1sXk/fBZvGQ/F+liqI
	tQVyY4V/MIXdgc/1GW6aHam/bCN90SDVRMnE3ROPhRra53q8UQ==
X-Google-Smtp-Source: AGHT+IEeBbWCgqwqpQYOR/iZ1DVjP4wiVNLe6VxZxGScfvx35vnY4HypTMhHt3kImH3vRzo4e9Vr8g==
X-Received: by 2002:a2e:9ed4:0:b0:2cc:675a:10ee with SMTP id h20-20020a2e9ed4000000b002cc675a10eemr50853ljk.78.1704498612830;
        Fri, 05 Jan 2024 15:50:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x26-20020a2ea99a000000b002cceac0fdacsm465056ljq.126.2024.01.05.15.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 15:50:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:50:11 +0200
Subject: [PATCH] drm/msm/dpu: make "vblank timeout" more useful
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org>
X-B4-Tracking: v=1; b=H4sIALKVmGUC/x3MSQqAMAxA0atI1gZSlTpcRVyoTWsWDrRWBPHuF
 pdv8f8Dgb1wgC57wPMlQfYtQeUZzMu4OUYxyVBQUZEijdagOSIanqLDU1be44ncqtrSNDekS0j
 p4dnK/W/74X0/OpMcKGYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YlE6Y0Xns3P31n5Refq7dS9qQ/5BgtlDWj7ZX0gAmHE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJW0SyaFLLT16qHzBkNy9w9VfQQTtHjumXc8G
 ehTggFWw26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiVtAAKCRCLPIo+Aiko
 1Y/XCACauqkupaBDpfAh57h+imFyIUuQC+PVqXl/Xj6YmYMMfhgQSaWUbh+a7qObFJKzI/rc+Sm
 Tzqf9gSWXcgGZCbsHKj9K0f0eapMiGVOWCzYncRwOrSvDfZJ34Q5j42eRkpsFdl+iM0uFbOV9Mq
 6e2RRnhEhHBxMgge7rkFNXZhjhAjI4PL/wVtAB/3M82FFy125DUo0nmUb3RNfomh+UXLJCPS377
 ahwF4ewfR+2orJ0zHbYWIaxd+5d7dqF2sD4fbUdHMmq6P5z0BqGg8Cw4/ptyTstV3Zx9lMoPPCm
 mAEvZOMyhdjwZwssqGYGHpggNu8Nnn04tznaNUy+aAcQkWCp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
Include the actual CTL_FLUSH value into the timeout message. This allows
us to identify the DPU block that gets stuck.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..fb34067ab6af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -489,7 +489,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


