Return-Path: <linux-arm-msm+bounces-11100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FFE8554C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BBD1B2396C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB7E1419B0;
	Wed, 14 Feb 2024 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgSKhGjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3413F01F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707945896; cv=none; b=NZi+lBucZ10esJuNNpHAqxu8NFPT1ZBHiK0Q/XElJOGKLPmX6qq5jGxOyJABZqKB0jbtfDtwRLVrzbez7/I0vQrvLwNWcxxJvMNXSYtWxfXjGB2aoAAUp11N7krAeC45Tutmb5HYmS6XHUv8iu9vdfkTopW6xM1hH+DcD8il6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707945896; c=relaxed/simple;
	bh=5Tw/b7l1kr/h2F2qgYnDLNZGPYKGg44QwawYWk2mUog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2YbDhF4XjrkDJpotBMQngpLOTmd0f1+AkP5AQc2hdGyxOhAfIpYb4648nS4cvhWym/x7M6XGumu/QZNKZxc+IBK5ou8EnzoucN3/MRbZsckpiqhJV97q41Q/d3IPa31H/a7qhjxmsIcSZAx7KQechxvZQeYnVViZt0tR68cjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgSKhGjw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5638c4a8c92so275168a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945892; x=1708550692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2FDzftpfovRyT/jIxjwVtoriiUTru9KGRsKJHoPXfo=;
        b=GgSKhGjw59xKFuW6a723PFduuqWP/Y6Ml1eSqiE4WN0ZTSbBWP8inndsq3ZJhpspt1
         08YVAHbNTOK4zFWE/jkwN7VWfJviCGQQ0J0ZqSVcCVuUaxk386T7so59j8ocmiJJI8Dt
         UXjpOJ6hqlTUaTsNcAyP/p+zGCU3e8g2o2DwVoJO8VT+OAdYxUYdWsoqeIb1FixPcQ5l
         KDqms7P2lAuOlJ1lsdXOri9rnG/6W290iHRgpQTrthcQrYAPzKcXSr1j0SgFjqJTV/6Y
         kuV7bedbFhiLaNoMs9YfEJ7A3bS935JhwXoOp99xgpcbnYOQsi2S9Uk3mSpj+IUT+eCR
         UmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945892; x=1708550692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2FDzftpfovRyT/jIxjwVtoriiUTru9KGRsKJHoPXfo=;
        b=p1NWSS5m3q2SAGu2syMbedbW3YT32bgm8A4FGhq8JMIyhTnXo0lUCtfnr48oWuu2AT
         mBjHjN+BMUYbxwlH8Ip1hJRjjdVAs4VWXzlH/BKrsOqtDaou4l6MjOHRLX9zxl3DPyk8
         WlMvyB24w18nL3iteuGuSxLlttuxREcxAS4PNSZEeQC+fhXF4A7YPzTNJzIgj2pGy1/C
         ygx3/vV+nYBjpI4e0/2TfCgXHcQpY+PyIaRtse6DTlpsWalpvRX4GlANey+1aLWblBcw
         46ssBESVe9mX8EFwLbg9leWCUKbAynUPjNIbOnp3hqJgcnJKuXrJgjud7Qxf4PjXzs09
         khQQ==
X-Gm-Message-State: AOJu0YzOaeGC5s7VIxLqAnlMRX/7tFYgtIaKISZuZlXErsijCBHLNvlF
	+p2CBBYaw1YKX7hrL0WoGraj2LqctQvgGzYAS7ETtkhkNfYyB/s67zGL+EtSoVg=
X-Google-Smtp-Source: AGHT+IGSxDbsMBb/2TufiH3/BR9JZl1eEzV76QUjgMEqN/2cIyreLuFWCYgbIagxvjV/jJLRdN07LQ==
X-Received: by 2002:aa7:d8d0:0:b0:55f:a309:172f with SMTP id k16-20020aa7d8d0000000b0055fa309172fmr3100285eds.15.1707945892573;
        Wed, 14 Feb 2024 13:24:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2YtKtbACFjloqX4om5U8iP8FOi2NnTR4luh4zbxQLSkWxIHddQD44G0t5rFS0F1HQdArR4ybQunM5Kw/WZXpYluEAQ2hVvGBY4QQRJXya3LS4USW/U3mkIpxnZWrmXm8IpWDrbovHlJ8gZniKnY2LdiFzTsGSjt7f8ttGbWehAYX8OEoRfZie0K+DNuwek+jKjzASW07m7As7pQfaLUmybboiUO1woq5FVLfWXpvErpqHCocBIvzpiSHHzy6NwvVf7A3m+Ar+RDoVivayCbnNkgjS5acCPOxJAz/207TWDrvCUaJCFcBWIexboCzJtiktS9bGvcusJG94hhoyZQxQFMKM/KXlwx30e8M02X78AZX3mb0sb1c/UlNbUrLQLPKLN41BPhi4gbD3ZquzVxmIdlMZHNeMSF0h8QcCARe8Y0lKLqPaRgXxsQtsIOeFohH2zXeD1lpQWi92EAnUUQ0Of1KcajcHcjaHOvBFKicfXGRkhpP7tcDyFQoDPbQyRBgYo8+BvyEBqqBp92wRvEaFrd7HfIM9dmzE0Gk84fSdLYUYcLn4Jty/nBb28sZRIFgHI6GGkQ//vGmfcCBYk9R/9kW/+V40vAnzNXJDZd+gOiBWG16WJ+7VlHbTXxJ3v7c7FxUxGweDCafwpQEegUP6GiQySmkjzrs8WbVxlX59bavDNS8uYOtgyOyP3hcr0NM=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id r16-20020aa7c150000000b0056399fa69absm257298edp.26.2024.02.14.13.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:24:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:24:32 +0200
Subject: [PATCH v2 3/4] drm/msm: mdss: Add X1E80100 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-x1e80100-display-v2-3-cf05ba887453@linaro.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=5Tw/b7l1kr/h2F2qgYnDLNZGPYKGg44QwawYWk2mUog=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS+ZCmdeuBZDpWVaiCNfS33naLTmirh+tLr24
 B2ihy4+f3SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0vmQAKCRAbX0TJAJUV
 VhTpD/9vc2CqCEUoA1wxAZdxp0iA1hDgKrHj8jXq/5y65u7f0uZto7QaHe0F8VmZO6CaOyQgnj4
 EkYgILsAw27YHcSzb6kkuO8Swra+qUJDguRgiDDbiFOdCfsdunFEPF/hZQxquIVwFWERvN2TZ7a
 qinRYWdU3snlcIG/vKKf3nsF79VrbzZk/hg/ZdHcrKBcIQcCyEf6q3QvegvGMQ4IKwQFdu5qwz4
 CThjuN+hnDF3GaL4U6Q+iAOqhrLTKUhBlVd64tPc7p6vJFGhP1hHIiS78zjMdHUApNQIIKraLoO
 8o/As0fYAOM67JOyrjvW+wcvPzhLQxGYiYc3agQEd+iCrCOky81ITUOlXKOLzK+K8oNCofmQTjp
 Um0E1fLavqO03XkCx9mBCMSplmJJdw3VdawxkFI8hmvfBz/Qdm5PQ67mxBpY+HxaQPggY4CVtFv
 88dtILuRki+FU/BqXDuz2pj0KylldU5Nf4PZ7jnerOBchNYS/Jx6V8ImDCXjDjrgfvatkwSVvS9
 Nwac0QvhzlHuGPc6+TVM/38MG3FO70ttjkEbjn7DPzCycv28e6cxu+6niw432h4FJUIDyWYlrQf
 q9YW2AugjDpm65eHA9SS19oxnyQz0R/98bUyjo/PCFZoVHW+25g0ebOxAhsCCOHdMo/j9P7i4XH
 BzjPp/PbvnDEwIg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add support for MDSS on X1E80100.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 35423d10aafa..6eda501e2a1a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -636,6 +636,18 @@ static const struct msm_mdss_data sm8550_data = {
 	.macrotile_mode = 1,
 	.reg_bus_bw = 57000,
 };
+
+static const struct msm_mdss_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	/* TODO: Add reg_bus_bw with real value */
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
@@ -656,6 +668,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1


