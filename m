Return-Path: <linux-arm-msm+bounces-42886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3139F8983
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A02FE7A5C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCA4482CD;
	Fri, 20 Dec 2024 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JovlaRKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064AA364BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658123; cv=none; b=kfxyn6yfQM1tNqLAl3jIQJHs3D3HLKpujpFEcZBUqhP88XKwW5DbOO/8S4jd7p96tdAAarorrDwj50chVwkcwSxoAkBWg3iNLElpS36Fjkou+qeChotOoYVAMq/Xyrhfx3mTQM9zlvAWFtPeU+2kNXRjQxIyZFgHAnYn0296i20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658123; c=relaxed/simple;
	bh=dZzh3PXS76i6xnboEA79w1m+EII00mpCa9Y07Mzie78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adyv6Zhk6a3ipXcRQzQ2/iRCPpWw3xIWt6JCbzwoqBQjoZnCPU63k/LwX3p6Ukg2F1wO4cil/lNO/pPWDnXyICvB3nz87Q7vxJc6t1N9DVRSFdvbyIoy+YHRVf0TV14gRe1bnARuaRYotMJGnaBHKtsRDhLdxiiDvo8GOpr5Z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JovlaRKI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53df6322ea7so1606149e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658120; x=1735262920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNGurZx5APr5o8b1YKpzmXoTLfFEipQsrmLsb92m7mw=;
        b=JovlaRKIDTfJefd/T0szl2myZ43St9vKUW3JmKj5R/gW/btRjlIRnPWjMw1H7e0UCI
         pOSU7JYJBJjrJHIixkRvgqDSmtvD4qm3teN/DBng5vrDPR2nFXjJwPkGvZH3cGXOMfXf
         9zUPtPLYvjLgw0zu0BIEb2ZHBdtGVziTqAoiW472BDKZ8bueGqH6nVIRmmKvp9FImTW3
         DdAS4zRxU3IbpDvAFett6WNlHxjOuy1LylHFbqv9PplhBIb+6U9M6wiPHcOVlKCiqqH/
         5i44Wui2eGDmrTgL3+7c0D9AWrdfyV4ktqT1HbNbIIoVbSJ7U+qVK6YKdPGIaUn/cgkD
         YGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658120; x=1735262920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNGurZx5APr5o8b1YKpzmXoTLfFEipQsrmLsb92m7mw=;
        b=UBi5buveSC8JTFe5igdOrGOxPJPHKs2reRMbS5bmag9SkgVw0LopcOHuExIGBatyjd
         M8smvv+vfONOUKVPaGOLez76+RDt+w8nwP6K7b5REParMe1DNz6gn/qfCC67afHOxUPn
         ItsYrz2XBwEOt0tUbqtJ3Tzyik2RafaN00XYdfSZQw0O52NtkXrOjlG/LoVHz2q2Jxiu
         bEGin2ds6DJuk8Hj9Dvk9h45iDJ+MA++VURiXX3kHkxHOt3OHvFg6BPtDb7myFEs4CIw
         IpvkshecI5MOVyF2vDhZuo1zxCxm5dDb3X9nJHF6ALB4dIRdS7wCCdoxRrCTkSEoUcYg
         WwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGKZQZ5p+j80+Jdv/zWy5SiF4K7Yk1FBrxIm97LR6N1RI3n/o5Tu6+Db3gTeLlTtKFz0sHBFpNwY+HpnnL@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOYIiAG1kUYk55OyfvEDZIdxMhxZucNz9Wm79IvHwp2YCppum
	wWxyim985ihQZIaMBP7l73makOmvNYs2aUGoaGGUIegreVhEUeAF90FSRzo9KCk=
X-Gm-Gg: ASbGncvKIgDxza5PChGqQPKR81jUIC4tNKptWfyBc6qtuXvqayXV7DsftwVO6mCh06p
	35hIhpjQhTSR0GEwZS6Xs+hE7uNI/4iGwKRgtJn4ySNtbqbJjodn/lDefh8zPDzkRZVLJTPsAqs
	icBI2XNHHSPowBVk6bclw6KAvPuChduy0I93cr8E4umsjcM3r025mroW6QbGkKl0bg3NcfCz5QV
	J2MERtI4pvVjsADYVzAUQi8B6cd7Z4BXVNh1IiAtmV1t5bImmm8P/Kdwz+jlCLz
X-Google-Smtp-Source: AGHT+IEzZsIs9KHrk+RQNoZgbtix0ubEjo1ieObMZDI8gSvt5gDisA0jhTtuC/z1S2rpaDu+Y3v9hg==
X-Received: by 2002:a05:6512:1055:b0:542:232a:7b2c with SMTP id 2adb3069b0e04-54229548e22mr177814e87.29.1734658120251;
        Thu, 19 Dec 2024 17:28:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:32 +0200
Subject: [PATCH v2 4/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-4-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dZzh3PXS76i6xnboEA79w1m+EII00mpCa9Y07Mzie78=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rKCbtco8lmN7xdHszWyrTvlH/Va6gQOXnhca6J55/M0
 p37RvtvJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmIrmfg2Eiu2lo8Z5c6RyX
 Hbeui8duXMSxykPaoNlh5Uo74cSQ5uqnWzdV58azlf/mWDmlbH5Hw9a4FIdH3driHWsvxvwUtTB
 2axMLkbA5VPRimZ5xj8qq3a8Nij+x+VmWO2rJh+u8rnQUObWBkedeih4j6/pp3YZXONOZ1M7yBy
 f5V6te134k+J7T2fzD8b3y0+6aCbYnXhDc95szle/A+kN1O2yOf2FakcvMOTHkFnuigg+PuaCog
 +rO4Bt7Y9h8w52CuOoWTq9z15bgdqrv6k+ZtEKD40bKgWWtT5YvzXt1d5JHaHjAPG0+2eeHhaqa
 LsYr7n67PT+z7cyEmZ27tCWysvutb34uDlu2guuBSSUA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..e8916ae826a6daf30eb08de53521dae89c07636c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


