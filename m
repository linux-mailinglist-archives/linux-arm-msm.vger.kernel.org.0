Return-Path: <linux-arm-msm+bounces-18017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8E8AB8BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 04:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DAE11C2096B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 02:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE72B7490;
	Sat, 20 Apr 2024 02:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XxOH/Ju4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180CB5CBD
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 02:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713580387; cv=none; b=q9UGJboU8Msonz33u6X/0q2IYcJvCijCYaWx8D1PWbhAHJeIt+iP1ExxkHKJwGytWS9il0tbZHO+M1OZO04KdJXcMswtk/d/jnXjbcMWyUXqI8aIwjagyuQ/+t+kU4HxVMMDZ365mxJxvUYef/6+SMXOgyvFzVv1qyfgsAi0WTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713580387; c=relaxed/simple;
	bh=yIKy5VG5u8KAYmiLe9XQJJZeBeuGfwXNunL1nP2gaBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlLqVjlBFi8ucPYHBPQilQondDOkxfTtX3bg1o4lbncGFunu/qGLOvakcc7EIFAM4qd2wDnln1AwhSIeFbi44QytQj2fgGiKfh64Ms1p7cmQFs79H/qFBPny0WvQ0cB2j4v870CUckt++q1qOwD4yXEicTrF0HhxRpDW8vp4OQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XxOH/Ju4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so34713801fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713580384; x=1714185184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ns3D7U89w4Ga44opBEB2b5k+fkMy5ilMmgKD+0mYkkQ=;
        b=XxOH/Ju41fczsM1Y28er86d7O70UGojILww0okr0SDLh5bn2gRSqRCOi3IFyHMUQmJ
         KXrKR5nxSkdoVOsx/uO4Fk4MMgmS11mKwAtCCfoi12cwggpZ6dzXCGnUNK5MTBv/V02R
         d8WcGxVXPL0VE9tDa6zWXe6b3b2j6gWp0XJDaWkDUQGzfp0VZ48Cz3tcl1olLHefOeV7
         J832N81iqjODdr4W/Z7x1UiVMx13STlKqOv3YzUMLFX533jaajGnwxff2D3Lp4VACA86
         0cM/X5XUZhGqFZYp5b6lZ4X15o/zxXcoIJWLC2z+k1N4Ir/43L1guDJbS77tfY7VLDRw
         0Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713580384; x=1714185184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns3D7U89w4Ga44opBEB2b5k+fkMy5ilMmgKD+0mYkkQ=;
        b=gmDUUQPYtacyW1IRs6Ed5yOHpj/t51rPJ5PXwD7zor5eatN+BvuyYbCvNQoZmM18UL
         asOgMN8zlvDJ+4Js75VcvjUORDNRwrPLVL/NwgT0CDbngu5q8QGcIeZG2IkXA7m8ae7V
         xu5yTjD5mg2eNJ7Rs93avmXEKf+4wq26J2tELlckhcXWBoTynHrBgAu3E7wm3Zt6Fs7i
         1iKlJlHxvBthOiMQomFZ8zv6457Oas5wqfozSClRjt/WFdR6CpGzctpipqGv6je88uIv
         4kGghpDu8T2FJKb3of4NGJIHWdl1YTBgtFFgrGy7ASUGLPQMmMQqUuGqWhSgxO8qBddA
         lhjA==
X-Gm-Message-State: AOJu0YyQ8urHwpj8h2Ab/XT1VjprwNU8fyVuY40ZH+khI6yQsM7twSFj
	AkA2N3gK3s9N4LYt+zQxvbt152nqX2v3ALSQ0p8hxxQnQO2Hft8lGjdzh2fOgrR0UlOSCAWI4TW
	s
X-Google-Smtp-Source: AGHT+IG3I4ixwxPsmaplHRUzztsZvIFLMMDzdAjALXBbvS+/rMtUD4mjeAfYPtC43oL1zExWhd7xEQ==
X-Received: by 2002:a2e:7011:0:b0:2d8:a98d:19b with SMTP id l17-20020a2e7011000000b002d8a98d019bmr2455649ljc.21.1713580384053;
        Fri, 19 Apr 2024 19:33:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 20-20020a05651c009400b002d87e936833sm836843ljq.125.2024.04.19.19.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 19:33:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 05:33:01 +0300
Subject: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
In-Reply-To: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yIKy5VG5u8KAYmiLe9XQJJZeBeuGfwXNunL1nP2gaBc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIyleJlJ2DCp/R/B/8g1KjRr9UcYKM48kdCVTr
 3+p2/cKymOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiMpXgAKCRCLPIo+Aiko
 1alaCACxlDsy/3INrV/gtG7PKl+wld/wdpLUyEmZkvoUlGPMCid2wrFBqyPbG02h6AMEmtNva5h
 LdNtwFdCTwbfK7dOQCG2RhZnESNeoQCd5w3Ioj/BEb63A3kKe7wHS6lb5kmoLc2FQkTkngB/Qaz
 bwhkqam0inth6CygsfsvHNbID7yXl9MPnJLH8bZru3RJ44oLjews07I8EZl+lSfKTOZTQ88Kk9L
 uhNoeLdOpHJUNDBTWDGUbd6qnI5OeLgn55eG5geOUoX6suqS+EZWGdjiuxwaG3t5qM3fRL/JB/3
 8apENvOKLPMX3V9IIdj0pH2OvA0aivLxPBJRZwVs2CIMCFgS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

MSM display drivers provide kms structure allocated during probe().
Don't clean up priv->kms field in case of an error. Otherwise probe
functions might fail after KMS probe deferral.

Fixes: a2ab5d5bb6b1 ("drm/msm: allow passing struct msm_kms to msm_drv_probe()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index af6a6fcb1173..6749f0fbca96 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -244,7 +244,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		priv->kms = NULL;
 		return ret;
 	}
 

-- 
2.39.2


