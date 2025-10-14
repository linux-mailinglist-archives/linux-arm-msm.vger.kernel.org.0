Return-Path: <linux-arm-msm+bounces-77198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F7BD966E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A66C3500D4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C972A314A6C;
	Tue, 14 Oct 2025 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTtX8568"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81083148D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445598; cv=none; b=bmsbmyISoWqp6IDF7Zx1t+zNVa/gQYGA5HWtGMe+Gg/mRoS79S5jBI31de/dLFLCBL88BaTw3MsSDGc1ekfOaOwFO/9hJbdd9v+PdaLsy+ELfxIwqiSxwcodMy0jglX/OAptIASzh0i1R1pylXLPX3ZGlMS7DbP4v4a02ZkM2bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445598; c=relaxed/simple;
	bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d17IMxOPzGaoDBNEcNXtzzSCxkGYMzL8q9WAf52lDbFf53l3ZY+yLo4wTmZChFKLJekb2Ke07yS5nQANh4ek1qURzG9QYZK+9Qk7xVtgbyB7DCx56y1SUJ/9xPfQHKde3uNigSv/J8KMqrMzWEUh6vbvOaGCDzQLIsD9PRAdDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTtX8568; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so57099155e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760445595; x=1761050395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
        b=jTtX8568FMMcLM+uNfA5rNmnbFr743xZ4UOPJpmHipXlreBFwrScRGZCgMvOX9a0vT
         xxn5X0124Xa+abeDVK/sIamJdFAlmpAuCWipfyborP+PjJGZMDtDfT4eASqRn/Z394sr
         G2tvVJkHGVMN/ztRlqM7E9KWiMqcKQlFhWk7MN+ehnNKnN7UkYg7pxxY74y4xhr+EGoy
         ghze/qr0vK8FHZAnZU+3KBS5ZohAo2sPPlbtX8xJRJB5wNqNQmvhsFBxmuIYNfXdQRFc
         KdhwEeaztJj+z8xlf9gjzbUEYVeWS72Aswnwwu8PA3U9uzq1peobLUSwusA71FYjE7Va
         Dl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445595; x=1761050395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
        b=fENmfDfWXAtvKKPO3XXIKMqKg458Jw/xIPsBkuXoc5iOVo/PxoGeDkKrqtWpZNjpwf
         YmZikWqCDS0mwVcUr96TFSdmEzz0GBKfP6e6IxQKBMgJSwYwsVCQ9ufcWQGrY4pLWYCQ
         zrsDrWpt55Vk8BxJGEKEL9fZJ8rar+Pe5ePwL+XyIRjzOydoK3drf+ZxBN5EME+GfDdG
         NEIP9x0D6X1qkYtSiEd8XvFyosE72Z5O9yjj/AnNWh7Wr9n1G+FZAclsNIk0EkffF1SF
         rFC7jMEuFLuNx69mzXhJgm2YbPgGFlzhIZADaWgq0+kju6zdtQ8RU89FwJhLBF9nfYiV
         TnUg==
X-Gm-Message-State: AOJu0YzgicPXpaymlxXSRCgLMMDVPcSpX6Qqtdk7gGEQcu2aayp0cWwA
	DkHRcmIYFUFxREji5zzP6xUmAIb2gyw9sOvLLoTt3Px+UnHSkLoKaKVZ62bc+/N3qhlmSilYKa6
	fQ/+R
X-Gm-Gg: ASbGncuH/mXt/RCsjPfvbKe1MfWkDZQEOsaF+jZl9LNcb0mdnxZP67O7Llpg73GMtfH
	8ONY6nLrcTEp3OaSbvERu/ztADJSuj7VKFSvJSj8WYFUZFg8V1sOU52SFyVoBm7mU0Yjwo4Wdpo
	FpNqNpQmf3Rj9squ68DVM8aUO6557/rjQt7oV6cSHVUtashSB77kNtYB0DwrncXWVrLcJctLwme
	68OcUdfzCuBD3wccMU00smhippyWJW2Rp6aBwjGr657E9ICyx7yXdqna1gFUF3ul/3LaxkJN9U5
	A6i6qrQubyS5+59sE5byJJysduLCAbYm9hGzBfiwL6mmGAY+zoPR+OsGoPuMWJ+DHW/e5X6GYva
	9gvBqmP3/3+jdOZf1vzZ7c+6VImhmuIGihxPh1HHMsfI=
X-Google-Smtp-Source: AGHT+IF94TkmrblUuMOmKKw3sDw0waUXWJ6Sn72cPvNn8ob8Njw4rB13rXYCle6cWXXhQ2X4WSqt1g==
X-Received: by 2002:a05:600c:1547:b0:46f:c4a1:1da4 with SMTP id 5b1f17b1804b1-46fc4a11f37mr63636725e9.8.1760445594948;
        Tue, 14 Oct 2025 05:39:54 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:39:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:29 +0300
Subject: [PATCH v2 4/7] drm/msm/mdss: Add Glymur device configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-4-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kSC91TA3eE2/FLce9JDXX+AHYC/aYLGbE6qH
 N2iL/WtXQmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EggAKCRAbX0TJAJUV
 ViKoD/0Sl157HvmbXuKIHDPa3XoBGzAdukbIe2ps4MXbFV6J6LNYoC90LVs6GeC+xTT6W8KVuIv
 uUJO9EJCnjsYddbeSEzuA1mREDoYnoWyXcX/bTvFKAOCtcDMEOaJ67vfF8Vu8pbCvYjcLJx/OqM
 1o20MDkMgza430gTOYMyqXa2gY5QreP1kdOwC5GM1DJdZmkopVYBYDqW9K/jbsIvpvwWVeq3hYH
 KQkWMON5+SlObVOM9AUBEl7P03csVQ7Yt79Y44WxGFyuO7ZgEw7sLfa7P5TMemoq18YGDh0TLe8
 vD5xP5vsp4mo9OiYbMHHKOHh6YsA89Py0da7gR8FinkIlVMck7F4npyorCRFcoZg6/Dr+SWWNKG
 LBUC/p+34urTE6t/bjsLZDeoj4dRXdb7tehEFrpIIY8Ve7JRvgyKOtSr3NO8VZMA7dHe3HedcgW
 LwfMMyA5Vti+iAQVPyo8cK/S9KNJkDhgthQSEqzPtFj9yMwxUg1GK4/Yq+aRjO8fXpvVQ5n0ZX/
 +ogmfphhy8Tka/TDOGfteQMc/U+GRR7PmxkW/MfKbJ9fIU5eWFrSQ9eqD6LaKnMZdLM2NTPyw03
 tzGCfR7w/wgnuufAzwJIqPydCpqdPc4BqCk1VF47snbP4jmqwMc0gvLsBBsbFOXhjDYmyHwklAF
 AN+FcDKHpISSmHQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add Mobile Display Subsystem (MDSS) support for the Glymur platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..60bd6af83a8846f2ad751ea625a20e419c80638b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -553,6 +553,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.48.1


