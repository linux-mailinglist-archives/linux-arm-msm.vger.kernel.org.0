Return-Path: <linux-arm-msm+bounces-12512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A3866836
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 03:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43DA1C212B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 02:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7D81AAB1;
	Mon, 26 Feb 2024 02:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XN2Tqa/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443517741
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 02:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708914485; cv=none; b=aUDIh30zBZH0lFdutQeE86D9/zlHKyLFTtYOJdZsjg42K+L1T3fSIkPqEw2IBdH9UI9I7+APF1amXg8np3Zaz7uuWZRSSUKSHTlHmEw3o6pP8MVtzcNpSXw3kiJkXbNLqsbeMHlUav3KdnfVIt8s6Seilv0YC8cFu1QcVT1wnTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708914485; c=relaxed/simple;
	bh=u/LLMAwCactui0InH0azxw69mOb5zZdT0MKFe0dxyYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FobqB26BnPNwc1XjpN2ZVkQbvuIjgqv/ovL9UIx5ZdkjO101uaL4qWyJ1dZXHNiUtsqAYjRYhoE3dTiEioWVBBxvt088ow1HZ8Mi38E3KtF3q86YG5ZS/c3SQ5hLzpxR+F5AwXXKlFSmFUmAVwjlCUCF6YMl6LrhVJzqkcc9wF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XN2Tqa/8; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d2505352e6so36631191fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 18:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708914482; x=1709519282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UIRQxSlc1BHlT1FIxTW/PhTeczKV/3fX3odMQFOFMs=;
        b=XN2Tqa/8zwMCnhvoNfs1FcIz11HAkltlEruzwc5giPt77bcgxjlUTO8cO0CvDbeVN9
         wBApWDgVdVTxT1dNzLctY0jNVySgEe93XdXPBtKCjTIhIcw3PH6UbVMRc9GxBn/jqSl8
         FIDXeeS7nVkGMJIkNCOLFNuLo5iSSSFPeY/Ygs80EUE5+lKi2+r00A+Y9zWl7cCYltW0
         bESC4qwLi6jl+e126tx6X2iFmKzUIu5igLn8Lm70Jk85rjrvm0mRQIXqwToI+vYtTpjq
         wqyDXcFeyZ4BYlwpjGxnySG1Yxrf+UQg0GdYiS4TI0DDNdwjaWDWNp9ZlKvcIZAizffO
         f6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708914482; x=1709519282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UIRQxSlc1BHlT1FIxTW/PhTeczKV/3fX3odMQFOFMs=;
        b=gZ5XI3RQ0OTEg0ysgnTqdxJ+55yvgR2IjGi1qG/m81v70XIytoVUUQOJ/5mAK5xUrj
         wrz5unjZ0NV6XSLmcQ18F0LBGKqsMRftgfgYoFThkqqBbfpnYWLDMs/Q+Wg4uipiwEYi
         o3lujkvVRhbJ8daV3Lg6ckUqo3vUN/GBFfvDUDktN1klpStYdidmBvveSoATa2R3Imt2
         AjqYdqfevS8NKW1cLfvIRiEyerUdNdTIm68UkkCCaG0zBm49LhbNm4+BP13JtGDf26zq
         eVsnruBqg7aYrPE/Bl2/xPB/wqu0879MVSEAsiGb/ThH0b1jEXUvoghK5JB0SKZSZv+s
         Bjjg==
X-Forwarded-Encrypted: i=1; AJvYcCXl/BEyqVri2V1FBNvtKt8qbZKpqJkMlKpoYawQB/g7Ds9Jqb6Kv2eMSDs8bjv1hdXaDo+o2e4bzHtPknJ6IZFZ5wuwL5Y5T5Om+AbyNw==
X-Gm-Message-State: AOJu0YzSEB7Z1alk+jqTQJjdfNsOlWFPE54WNbMK5aGTRYLjnIYnWlyD
	DpUafFL/HmlXjKJvXU43NCc1hduKzksUm3WhAh1zS4YaVExnxyH3arm5OvFiL4A=
X-Google-Smtp-Source: AGHT+IEMCMiRII/qO+zr0AXdzytH5T3PU6mkNFMj/oxPWnq4hj7ZB0UmbIODJOC5j/e3MVo+Z+F4sw==
X-Received: by 2002:a2e:87ce:0:b0:2d2:8a86:e5d4 with SMTP id v14-20020a2e87ce000000b002d28a86e5d4mr907780ljj.21.1708914481698;
        Sun, 25 Feb 2024 18:28:01 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e8553000000b002d11ef66881sm713092ljj.91.2024.02.25.18.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:28:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:27:59 +0200
Subject: [PATCH v4 1/3] drm/msm/dpu: make "vblank timeout" more useful
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-dpu-debug-timeout-v4-1-51eec83dde23@linaro.org>
References: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
In-Reply-To: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u/LLMAwCactui0InH0azxw69mOb5zZdT0MKFe0dxyYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/cv3wmpf4E4iBAzHWRmMIm2xXfZ9nq0MLbMk
 UhPkkONCbSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdv3LwAKCRCLPIo+Aiko
 1cuxB/9yyz8H/zy2dEohWWy29s9WbXojtz4t+WYhhbEzbRHqJkpqoSL92QjfIFdLuv/iJWazADD
 tuZyzZgMYyO1Qqlod5lZXLlm7WoelkQGBZzk3xoFSpQWM16HypNWEmxwkgaqyGfos3Alp+L9T4t
 weBlSTgaKeo2WlkB48Rzmk8FRuaPyoQymxyixCFUUb1hy4RF4+XCm0U3wZ8H9d3bdobv4Vu76gG
 IplHCwPOr5aNPomk0hJuxBB6hxHgHPUB9cAuFxKwp+iu6zSXJXUsiLwzFU+9L2hLEffhsycs3aF
 r/Nz9q77g0+W4klVprofqOqI38IMGl7grLFd2vfRAJfyntSP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
To allow us to identify the DPU block that gets stuck, include the
actual CTL_FLUSH value into the timeout message.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


