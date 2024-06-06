Return-Path: <linux-arm-msm+bounces-21902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA68FE4ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B47228720F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D489515FA75;
	Thu,  6 Jun 2024 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MP8erYPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54414E2C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717672283; cv=none; b=H/AiIIjLcxieVstyLsr+/hSxnMtVYt+WMIVcT8BRkZD0sAwef+5Yr9HpI5+hNU6B5R1Q4tTOiC515HXLnZ9QXeqnMek0CllS5QRvnG8pP3kshpNzk/FL8JAdZKvKdFFCr5eRgr/mqltcXL4srfd9IZzpxVyHZmSIi/MaaGTJzeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717672283; c=relaxed/simple;
	bh=Ldc+cMjnwRL8nNUZJjSiU8UmJQHSwKHt5iyZLBbi+zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BQUlQmimlBB+ASMpwnR/xwZlbxKVsld6Iap5QMh/TTcyuUgpbwwEgKO0esU0C/UdXzED1dzWwtQQWvusiwZ+gv2rMpX9nBRKmT9e5XPROkAboZ7Xu5sKEQfj5JH5sphxYV0yN0wmG1mlq+sCpFOqJfCDePJADSNiebajJzU1tv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MP8erYPA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6265d48ec3so98489466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717672280; x=1718277080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pswOTtwBv3zIZovO9Qr4d5tz863/qgk3gUc3EVk4oGo=;
        b=MP8erYPAxZCYDrghlVdEcXdIJ64xeGaOBDcxngLv50zla+5Dof4tHRKN76UPrKbDlt
         AQF48L8OakYzXe3RVCq8TEMBMGOUIYH49k6E8ojLNCEQ+r5ANAViZ9ibreZvsDoMWmvM
         fFJdIqgvLeZ21cv6c2CDpMR0CvRDYsECbQ0j/fix15PSVhxYM751uZUnzc1BjNP+WxeD
         nse4rIoLl1Q2/ru8A6MdneGLjgmj54BlxYnc0ZOL4nyfBvleT07DdZh6+tESkOWuDVGy
         3ijPe4vdIAcA/ypdD0MA17LOflDQeYb4kLsufvr5Ze6HH0dYE9BXigaLpNFgomDRaDD3
         CakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717672280; x=1718277080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pswOTtwBv3zIZovO9Qr4d5tz863/qgk3gUc3EVk4oGo=;
        b=MCQ7fwyjeZDoMlycgb3HtuaM1fTZsTa9UsRPnp5fVznsPmTgSyiyplgEOOLcQ5w5tV
         VZ1Zt+OfVHnsW338NrgA9AeI8NLhL36rq0WjAC6/LwJSTZsBXaRilaQN+9kerh9Qv+aP
         lubYh8D38J5tSTlZzidZSjjlaQcOPpXbh/AnLY5Og5qoCk4/AYhYxsrZLRIMh6Z/WSQk
         G/Eq7sqfX4ogfGtoGzWydu2JVNcREG6sywnouPwGfF/RKQq6JljBySkJrRo23WbSM+4F
         Cl0lbYZzimL4/9RdISN4gLv1cWgKmECD9DFKskE4sNFFDeQBYe6EEaELYlsutW1cHf75
         gm+w==
X-Forwarded-Encrypted: i=1; AJvYcCX/hTye2vWzm7sSFVbrzknq7YIV+ZzaMzhfdScIWkrfhExr7xL4eABhm4tacC8VK+NvCGShGoqUhB2CQ0lLv4RYgYi6d4zkEI9SQmtFXA==
X-Gm-Message-State: AOJu0YzihIxKpIIkHuipvXJWUURYivE97OuUOunu2+R/+iMCXqFQIgPi
	UKt11zy4LTVO0AJBc7D6dhzqf8ixfev9XJeOfDCaB8gaGiCmRIusRjqZdhcdZ9k=
X-Google-Smtp-Source: AGHT+IHmyWxJzfXZI/7TrL+CVbTgNs57aPkmFDQ9Y2zmJIYoz1GTSYJenkqQ4Qfqa4czEODu9Ho3+A==
X-Received: by 2002:a17:906:d181:b0:a68:c2dd:8ce0 with SMTP id a640c23a62f3a-a699fab8b68mr332921166b.13.1717672280445;
        Thu, 06 Jun 2024 04:11:20 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581b5esm82609166b.3.2024.06.06.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:11:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Jun 2024 13:10:49 +0200
Subject: [PATCH] drm/msm/a6xx: Fix A702 UBWC mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-a702_ubwcmode-v1-1-283fa9588af8@linaro.org>
X-B4-Tracking: v=1; b=H4sIADiZYWYC/x3MSQqAMAxA0atI1hZincCriIimqWahldYJxLtbX
 L7F/w8E9sIBmuQBz6cEcWtEliZA87BOrMREg0ZdYIWV2t0mpIYadX+MFy3OsDJEpTWMNs8RYrl
 5tnL/17Z73w/J8xNPZQAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717672278; l=1178;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ldc+cMjnwRL8nNUZJjSiU8UmJQHSwKHt5iyZLBbi+zM=;
 b=D3kFiXSEs1918VgiCdBOZ1/YGTXUMjoAlJK+iua109QgkNzopKU7GVJI8O2igJRd19wo1U7p/
 7ywEF+9sq67AJ93AEDcLzm+Qa5Rj9iheryNjZC3qYqRiEwp8rV5bqSd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

UBWC_MODE is a one-bit-wide field, so a value of 2 is obviously bogus.

Replace it with the correct value (0).

Fixes: 18397519cb62 ("drm/msm/adreno: Add A702 support")
Reported-by: Connor Abbott <cwabbott0@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/CACu1E7FTN=kwaDJMNiTmFspALzj2+Q-nvsN5ugi=vz4RdUGvGw@mail.gmail.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 973872ad0474..5383aff84830 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1409,7 +1409,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a702(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 2;
+		gpu->ubwc_config.ubwc_mode = 0;
 	}
 }
 

---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240606-topic-a702_ubwcmode-dcc5fde0f330

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


