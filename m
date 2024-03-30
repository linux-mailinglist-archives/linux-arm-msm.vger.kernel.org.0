Return-Path: <linux-arm-msm+bounces-15802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451E89291D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 04:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6559F1C20F89
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 03:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054627470;
	Sat, 30 Mar 2024 03:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r327lq0z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1166FB9
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 03:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711770806; cv=none; b=uW3RFHcKbWfLnOo8W/5DRpuH77AxYRrktV9aFjFlVTRySTqxMAw+zqi4cj9R6oovMYgqS9IdLaHH9FXkrgaZY4+4YFrXKtjKiEI1D78A8wxIV9UAr3Om2sJe+w0dK7JoGX2eAAYk/2l+z4CN7AVMZlNSQ3MW0LoapQ7y2J127oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711770806; c=relaxed/simple;
	bh=rmxrPkNwcnQ5eicm+waZz+484lVk8rSYWNsasqg9gss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XiHSFt46sxkIM2RWd881bmf6OyzXoh7fMjLaHfB7tph3zzHoFOB/ihaCpzBFLxa9fuLzUUI+x631+bXF+1zWwd/Brjm6tgF3mum9MROT9ZsZnzNJ88Hpp34SQmY8R37WEc6KpsKFMMwVYuNfIHdiftkxcLutJ0o29V52ElYum14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r327lq0z; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d3746950so3064469e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711770803; x=1712375603; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HhadJWBqLYlQ+JGSckxPKjGceAzGEjZXZw9f6mT8Bs=;
        b=r327lq0zYLf5zSedNUion5fFx9CNO5tN4rCYoTOHuuyv8atb3m6mt0bgbOR074CjMx
         y3B+ifVUaDGVTtc3X/Ou05yQDHd/0cnSvf+4oDwNBssnuS2XVrGuBTkh53GAaMb8ZH/m
         INtxgker9z7O3w0g9nC5fqAPOmArUj3dTZaXRAnab3cLnncI7RNFMS9vh0e+b7ZFVcEa
         lnlPSq/T/a9Vxqg37GycUDsKmHAxLjMA0uqsWNuUK/RgPMcbhs209AT9fPPZZUsuQLwm
         9ZHsxph7gDKqDfF8VnOBOZ7ptEHwN/wfYv38TcxbxddafbGrqlTBoLyw7702dBHPQwTy
         4dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711770803; x=1712375603;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HhadJWBqLYlQ+JGSckxPKjGceAzGEjZXZw9f6mT8Bs=;
        b=M78sUJzQrI86PAMsjkSGUAeFwxoVY5VD6YDps3qZh0/BvJsXl+NpopWYR6kQQoctKe
         eFvd/cIiSLjjp6lEGkINDNgFfjjedKF2d7OGJIyNN8ikzkBaYFHn24UA9dUUIEVzrUDU
         FMjY6fiF+RF7cgrDI+aay/sQwWvll1QaR81n23f1cmEZOvJJeQJ9JmjqeAAQ8i2OxJii
         g/j8Ftm0N8fhYs0RMtSOQ+ukIlVer/4KFq8UIQhj6xxImxq57C5XBMozVxpB4y2FN+Nv
         +TGDFzZbZzDYi1t2wAzQr18StvjeSxTX/ieL9zlAvR39RfXf5Mx1oBjTsq7DYOJk9W5D
         IFqQ==
X-Gm-Message-State: AOJu0YzKvktV8eXHzM506n1os8HRvvTVrIub0U/DI43mjGBABmndlEuL
	muV4qCBXRREprqyIp22dALUNSz+anYXBvcx9YeuavaBa5GFUblBIE1s38EBj0wQ=
X-Google-Smtp-Source: AGHT+IF/BdmF72FuCVFZpAOD1mbipHH7TP+BtxKqyBNIdVW2qZKlCm4ZpvPVNMKLIuuO2I4jDwVshQ==
X-Received: by 2002:ac2:41c8:0:b0:515:95cd:6802 with SMTP id d8-20020ac241c8000000b0051595cd6802mr2339097lfi.64.1711770803231;
        Fri, 29 Mar 2024 20:53:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g6-20020ac25386000000b00515b9c40223sm799275lfh.157.2024.03.29.20.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 20:53:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:53:22 +0200
Subject: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
X-B4-Tracking: v=1; b=H4sIALGMB2YC/x3MPQqAMAxA4atIZgPV+odXEYfSpjWDVRsUQby7x
 fEb3ntAKDEJjMUDiS4W3mJGVRZgFxMDIbtsqFXdKK0Vuv1ETgeuJGICCbbWV9q7vu0GCznbE3m
 +/+U0v+8HNtHKY2IAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rmxrPkNwcnQ5eicm+waZz+484lVk8rSYWNsasqg9gss=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmB4yy6zupNXEuQMfp1M8C95DUpWr+L4OjZVQIe
 zfcDrGI5WKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgeMsgAKCRCLPIo+Aiko
 1eP2B/46YLDaoiuJtieSNIpLNqjx3fLskcjuMG5mbDq5Rf0uWWxujyg3SEK5Veffez5b0HQPOu1
 JKFFfJgSRoO3wKRLtjin6cz8CG/86mtQngGOkQJcseDrDPzFNMejSuzT2G5Bt9JMrGGj+VuPWTa
 7DkgUEPnd7gutF46/ePfykkNyUaZJZvPO/osEc7oK4/hompeGCP6oHohlDy1QUowGGwM1I7n/Vn
 rPxXQJBDO0+dHLwOHxetR8Pt+MMYNVpFRK4CbSQVtuWMm0mvQDepUIW7HESyjtn2osuxpHOyxH7
 r6KqVn4wFleYuZyx1truyyVRbxSn4S3zArxd1EaYklYuPoys
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is little point in using %ps to print a value known to be NULL. On
the other hand it makes sense to print the callback symbol in the
'invalid IRQ' message. Correct those two error messages to make more
sense.

Fixes: 6893199183f8 ("drm/msm/dpu: stop using raw IRQ indices in the kernel output")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 946dd0135dff..6a0a74832fb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -525,14 +525,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
 	int ret;
 
 	if (!irq_cb) {
-		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
-			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
+		DPU_ERROR("IRQ=[%d, %d] NULL callback\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		DPU_ERROR("invalid IRQ=[%d, %d]\n",
-			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
+		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
 		return -EINVAL;
 	}
 

---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-dpu-irq-messages-5cf13fd7568c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


