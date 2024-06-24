Return-Path: <linux-arm-msm+bounces-24028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A65E91587A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB38E1C223E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EC31A08CB;
	Mon, 24 Jun 2024 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3m+0Gvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1D1A08BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263631; cv=none; b=ppLNzskYzvrUAldQ8kdHGsEmTUKViGMlRiVYW4EQ74kbdgmiS8j3S5quI9dMQ7GRxzz68BYyXSMrKbPeZ0PB7oDWItnctWbpR2hKZL4sIbnGY+rwTEegu2kT9nfNp4PRYeHtjqCK19T39I30VB4jWJGd0RuVL/HRt/PNSeS7FFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263631; c=relaxed/simple;
	bh=7vP7o0FochLbD0Xxzl9C2B538GRcwP3COb8crkPmUOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/Ma0Wcd1cBpmXpb32bJNsQdRtp12XMUeCYknn7tAn15QV8f+rGrAfDAacWMljKUiQPtdHPbqUtuERPGfd1YueOKVDG9gT/RCPhBftfFRN/7C3E7zzGojwWl6IrFee2L1JDr3Esduw9k60hCPBPY6MBg7gCiXEpFCI9L7CCi66g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J3m+0Gvr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ce09b76e0so1786124e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263627; x=1719868427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
        b=J3m+0GvrMZxTXAI9AIKVBOhnTP1/7Uek0KxqrBU4RYXHuUrJTbREww8nChIHA9TFt5
         3LF3zbpxcBJWvhQBkDU4hozXV0SNkV5N90Ib8rMU7J31nDVzvC+CLpBTvLpKDMLaxKd9
         IDpS2tR1+cOBB9zhSX8Kne1IWH6giN4Cfv1JHpTzZ2haTvlfOum6G8Gn/WIc5HssNSer
         e+LeaahTdhsVjEB0+DY/VORnVXqWCBMzOHK+6Eo63JcPmbjK1T617gema0cA15Q9KViX
         fqwIb9HvODlFUehtIrAy1+s7jk9RXdxI+svTzSUpKch+pfE16IBO2R3P/1Ot7mfseEsI
         FLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263627; x=1719868427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
        b=sWDTmsZf4yxMlvVcJIcDbNSrmQEhFsZ+IxWX5PQ3gs8L98S+usQxxWEKBH7ZSwHoM2
         7a68w3VYiMuUcIUYBjJkZ0agTkhkFZ8KoLaflgXNvu8K8EbsfMraALwtbUgyXEez9lne
         wzwl5Exc/7Q3k4ae3WQ2z1zg5JDgdWhCLgFP6zfVqT5+I9QYQCzkPZ/p2YA1VmiqivAk
         25C/jEg4anRFehiN+ghIHE7yom8nC8kYquUUeGRgLNNt2R0ajncfY+eRc1n0myQRHSZx
         mcpUt+mjvzHuByq8YhHBx0gAg4K4Dr3MXfjpPxKOoI73AFfE7DfVEv5qX9AZYWF9nf/9
         e/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUratTLYHG1QGSL73pZmMi7/tLLJc+Zi322BC/lXTACmkVPDXayHiEhfYs6Pcldxqq69llKEQ9BHngYk8Nau1c5Cn9jXBnfZOKggHQwew==
X-Gm-Message-State: AOJu0YxMShXdHEPaV+sX4n+0O5/Ad/sZvTEaFW/E6MP9LVvYKWZ55ME7
	JkTgZTtYs/GSp1GNw6rlhmYlx4F9Tj0PmUt95y4j9D3nY09SObbOyyAuHQLUK8A=
X-Google-Smtp-Source: AGHT+IEwwnEhYl95QqDTbCLmeV/4bzp4M63Zy4b8eegGdrh8TiiSCNUzZrU/Jfb+Oa1fUkPxJX3HBw==
X-Received: by 2002:ac2:4474:0:b0:52c:86e0:97b5 with SMTP id 2adb3069b0e04-52cdf34655cmr2015909e87.16.1719263627711;
        Mon, 24 Jun 2024 14:13:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:42 +0300
Subject: [PATCH v5 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7vP7o0FochLbD0Xxzl9C2B538GRcwP3COb8crkPmUOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHjmcqZL5bh8Vey1taJSCXeNBj8b511MU54
 qCCasjSnJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1TINB/9xlBhS2fVzyaXFtuw9d8tMN5rB0L2hhdoYdifhgvf4g/MNWuwlgGfwOPl7jKcNblqMqj0
 ozKXND4ugksr3fPBlRlaxtITj0/rT7jqcPvijl7zBNupG8Rulzw4jrhdR++cdnmDLeouYrfVDed
 vhgZbrlmhmkBvZOjAaQkvVT1/+PsKsj9QNz4X0ZmMIpkPuMwgmPKXf2U3XH3oRfi7eCgs1MG6/T
 kgcCRney7KT+mzmT5MxbeC6xqa2IwmSJyr0WXXgm8i/5on6A5vad7zwpBK/QywGtEV8uFUX+NIB
 3VqiUXUYZllOU5c3R+PrDwKz6T7XQcybosxQm3E2nij78o8w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
zero-init of the hw_ctl array, but didn't change the error condition,
that checked for hw_ctl[i] being NULL. Use indices check instead.

Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5d205e09cf45..7613005fbfea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1186,7 +1186,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		if (!hw_ctl[i]) {
+		if (i >= num_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;

-- 
2.39.2


