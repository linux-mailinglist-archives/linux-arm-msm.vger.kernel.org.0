Return-Path: <linux-arm-msm+bounces-11943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629A85CB2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB4C2833E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F271552E0;
	Tue, 20 Feb 2024 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFNdD+1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9184154459
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469451; cv=none; b=ZCft5i4O3U5n9GgPg+DaFf1YFVU+dUZ4kaIyHylaCttIzwRjgiGqsi+HitywcTt9OG58pmcElx0nMhtcg1TToLvMHp569ASc5ekOXr6pW7SYVqrYdvSDXT+olL/htbTl01Ww3IiFjv1YiSjb2iyZ5Thq/EwuPicTbzAm8Y443bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469451; c=relaxed/simple;
	bh=Bg+64ybndxfDs6b6x4LD2hmPzSVNqo/QK+11IhNoFjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHcXpH3udvRH44Igjm+spYMJ2Gx5OqJVssVoq6AEzsHt6qkT/L1ZZDczbeHnvvWe81dZ8WA3dHIWi5Ovtk1Rcm7p07+ZN/QDAjgcn7yj0Lnp3ScRSawNegl5haWcoRLNJ7orMbVmlVpnhU/AQd6PFJ+7Czn/cXzW9OsrnxhPfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFNdD+1m; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a36126ee41eso798435166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469447; x=1709074247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaiHKOatnN3Icf8gwgiK0T0n2HRv8NzGbPdfVNxfS4k=;
        b=HFNdD+1m6rErkIqiYIsNftkVY9r2zhWkLSMQqb2USR8r0IBLllRj3LHk3tiNtHswTF
         2Sq6JQmOJXHbBf80ksGZFh2IGpxwukA+Y13MFjLRkX5wwIigZE7G2LaSRK4LAumX6Jia
         rZmg3m8wZRGFuLPzo8q/f3g00xl6Tt61QJBj8KExAj/tcTeZOoUu+/wHc+1Xwb9NEq9c
         VeUMB6O1RqWmLJ4ZNIf5t3o4kxbfPbuLM02PRD7LoDJ5vjq6fRXZIKmI6UOKVG+zyFGy
         hzeyIDARpFw51DZoiHT8u8k/Z7iTD/OS48FdE1DSy3epGMjer3BbAyMO3KhM1Ug45zFK
         kV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469447; x=1709074247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaiHKOatnN3Icf8gwgiK0T0n2HRv8NzGbPdfVNxfS4k=;
        b=Edc2n5EA2PygnbtEc+IGXeRnyLrUqs2nYfSzfouP+Jilc5XFT0EIvhAqQtEKop1Uwk
         3SRq5G7HJT4iTuk2s9jH4IjZJeiKJo1lTheWw/Dh91M892xQASeG/Y4CPlLNskCuyDne
         x3YhJMCd9tb4MLsbkfXPHgCwoIITnWxYCyEk9riECdjxBpz8Mh7toQtBUrRNRVIjYDQv
         ioGYa4RdpFywp0g4pOyEoSmOiadofudPc5TLZW+C7q0XvaAPyX2k2dNv8dVYfjOhX/Wy
         +H65xksnTkQ8LxaYTXqY21oeKTOLz66PJfhipkPgyucgzcsC5r3wFYO/H0VHE5EygSoH
         21pw==
X-Gm-Message-State: AOJu0YwGI2j89LzcF4i3xLmgOREoc6hGCnCSemxJpZE4phXejqNlaD3Q
	7WmUComcNYffJGsIhJAnikILlZhe/j7iw6+JtrkubvY566ekljwjGSpP6LMQxV4=
X-Google-Smtp-Source: AGHT+IGKYFLq9n74LH641A+5aXYbvLwZ/7XrnLC2ffc52710JhYABnciYA9kLk++qgZ1K9d8iIvTtQ==
X-Received: by 2002:a17:906:504d:b0:a3e:1225:2d7d with SMTP id e13-20020a170906504d00b00a3e12252d7dmr6954762ejk.38.1708469447175;
        Tue, 20 Feb 2024 14:50:47 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906c18300b00a3ed811cff9sm1601977ejz.154.2024.02.20.14.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:50:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 00:50:33 +0200
Subject: [PATCH RFC 3/3] drm/msm/dp: Add support for the X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Bg+64ybndxfDs6b6x4LD2hmPzSVNqo/QK+11IhNoFjQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1Sy/SY/Li7l08xMJ7M+mWv/uESkmaPF0NsvaC
 dpCRX6qGoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUsvwAKCRAbX0TJAJUV
 Vgn6EACmcH3wtom1eKfkJzuGchzrI103o2ht9z1QwN/8SbMuJseRPCeWyeeikKSw+Po4gGZ/G3D
 0yoTOTAK9JW4c703Yi9C25hqmPQWsoBGvsbRjFVs/twSZQ1NEbVxhUL6f6BFuutOZVfw08UYU89
 tBa3qjivZque5i9drKIn4aC7FifFsZBOQQI/bhqR+ZMOL4Y3vLdlK6i2QHKp+WtAqGRRFXbMgpy
 wAVuWMEvlikjtpGTKq1OiplVqZQJoRhnT06zeeapu7UOSPLYIvar+xRpMSgNZ3uiWypOv95QkEF
 km0lOHe1Z2pdrQIc3LP+ic3fJSYZrUFT4tcuOTagiTFqVNlstMXfoXQ80xe5vf23nQt1tSW17fU
 jbh4JQRTjVGXfeX92p0NkZL/Q24BOYlvADOwNY2dB3FYPyPrLIT14vSbQRG91RPPfTWgWGjuu9M
 qTyQi5g9EINuFMtx8944XfOAMQozkqQbqGl61lxVBRD4egoukK57vxtTVTGKTGFJ90S25n5EfRZ
 HJesuuXKHlyqu6btq67skJmmUpaOjO5ngZBSns/QX3u9/bcJnKF9CQCarp/5ROFEfsFr/B4R7e5
 hS2V+HVKFaG7bWp3lOk8NH6NETTt4/y0HjvnQqGJrzvSmFCZLK8egouw1MQ2b7ulVDeA4sTJeFg
 OpYr4j0j2VYNZXw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the X1E80100 DP descs and compatible. This platform will be using
a single compatible for both eDP and DP mode. The actual mode will
be set in devicetree via is-edp flag.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9e58285d4ec6..7b8c695d521a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -171,6 +171,14 @@ static const struct msm_dp_desc sm8650_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc x1e80100_dp_descs[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_en = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_en = true },
+	{}
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -179,6 +187,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
+	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },

-- 
2.34.1


