Return-Path: <linux-arm-msm+bounces-35055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C29A493A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 23:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B622F1F2570A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EE6191F74;
	Fri, 18 Oct 2024 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnSVngvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D51190685
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288170; cv=none; b=bjK8Ymd2Vj1MZ3jxCBLZMxjrXagJJGRanRnp5+g/G9xogN4dNkJ/puY2s1d9h8KCAfYcZfbJZw3ZYQntgCydoL+YYVI/PfWBL4CptQ4iqSlqoj1kSaHM7mHkyex+Xgj2T93MviDk50BTnlrY012t+Fh9g76WqkeB2QiwuLGfDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288170; c=relaxed/simple;
	bh=pZFlU5ikCJDIckLBlIAUq/awzCCp0+P63uSXEOzs+Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAUUb+OJDZY9baRpyBfJ7YfQfFORbheQDApfAH1sFg8FjZhKcrkTKwiANpL6myTjarKkmpbSvlggOkAVHeb0YzvrPyubJwZJqwTNyyqmjUccOc5cV0KV9liceTzHk1a88T4nRchX5JzBhfo+G3hv99DCVj3nGk1CSaM0o6gMr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnSVngvx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so22638791fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729288165; x=1729892965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaBPMg1AmxsxPM/D5Hee5JcN9a25p5bXN91ymYiIy5c=;
        b=RnSVngvxN4JjuEjR4yf2LQw34TsyqkI0bb1WsAncHKYRk4l7w+KWJ+wSJyJFPR6cQN
         kRGgWxKxjAeBxmX9Sec8yIegirMdFfFJiNV5XrPjcSadtMn2jXQV6WqU5xRQjSQaBina
         j39cxjpxrDTLyR1UxEp8O0efEldpLfsPdqFj2By6ruH6LzWVHadF1uDST3zNsjGbGSQc
         kNfWPawAX8i30H6tqP0oJJvu+7rX/aHq44TF79M8eHFmd/vTe6iQrxpHHAMadlxXQ3CR
         JFosKo9E677SlKYvurYcp2lZ3Wq00Bb+QKd5TCYF4NtX2Cu0pGK1hYvtslVR8yk0BuVx
         FeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729288165; x=1729892965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaBPMg1AmxsxPM/D5Hee5JcN9a25p5bXN91ymYiIy5c=;
        b=NEShzPJlUUdl0YWdLaT1jCp/LYWkit56ZJCTxMzj9maGvKrAxYbDeSGfY0XcPzy70r
         ZNpE2kxv+xn2mE/MCoF0+GUKMEAdjHT3sewVjGbAg9wzPmIyccSm8y0gQQuTL550Ky88
         11/RfPTJJ5NhdNb2pQvZYOCppl19GUq+C/ZfXnNmmBxQ2yww5S+nXRkcpV98E3RzFnzl
         6zrfCxlOWhv5ABW4RzHO+JDmkCcS49nwZTVM0Yat9yV5E0Rq2oKdTQZ5u9q2sQCZgQ7Q
         A7m+BP0fOGk5Uyjj2f7zaprSPX+xPbsN1DL0D2ditp2WEI+s659hi9xAG1p3XqJp7BJg
         U8sA==
X-Forwarded-Encrypted: i=1; AJvYcCU28MNCgHcr57OwpsJZdY7AU99v+bhSdpQSj9c9sOGG6nCbDOAmb+6ObUgxnzxqcdXv6+3GQOvOG6C2snbu@vger.kernel.org
X-Gm-Message-State: AOJu0YxHWQLk0xZSIrJhN3m/fQwzadQHZNCtGYVJVAuDCWxJZacKCVwj
	qd9sTSeIDXZJmw3ksiJiucY/w4ojMQiU3foNOAqSo6AvnwuAn2mhgCSQ3UY8dkA=
X-Google-Smtp-Source: AGHT+IEwsp3DJLispc5Uu+bsLkWA9jEEfNgUg2fe0AkZdKhNFZlyKLrQPTa06UtCmputrUq6ijp2uw==
X-Received: by 2002:a05:6512:1598:b0:539:f886:31d6 with SMTP id 2adb3069b0e04-53a1520bd09mr2482354e87.2.1729288165534;
        Fri, 18 Oct 2024 14:49:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:49:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:14 +0300
Subject: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pZFlU5ikCJDIckLBlIAUq/awzCCp0+P63uSXEOzs+Ls=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7rQ9bvcVYyXhH4v2nbOrW+V56fz/nM6Ra8qGUUzfkmXz
 NR4wOHRyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ+Gaz/2LKWimrkK2V+Hly
 9qLrbbUCO2cI9V7mf7l3qX6f6v9FgsWWBgt90p1C/+yM65wm/SHu3mEdAWNz/tpN4YYiFU5P1vc
 0LNFboKga0HF5U5fM7Oq8he8cZR9Fnt0edGyC6mfnsgcMTi6zmD7rOf7ilxVcwJA4Y4vzC0HHLd
 MPXdjRzXE74Nnk09ndskoTuzzXxz9uDuWW/r9NneNNSYEmx8q/Byp6Pau1Zh6cd+3RXtHmmmmbc
 rM3H4qPaGu5djjsyMtNhm3VfVzLRRbaaseJJq1Zx7iN3yRoqYnCtKbvZ4+qvz/wIeGu38/XHoam
 8w82aNZNXnNxQqlatk+4mN4BlsZ0H2OThUov9TNsDCoCAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
bridges in the chain still might limit YCbCr 420 support on the
corresponding connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index ab8e00baf3f1..aab9ce7be94c 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
 	/* All the supported connector types support interlaced modes. */
 	conn->bridge.interlace_allowed = true;
 
+	if (type == DRM_MODE_CONNECTOR_HDMIA ||
+	    type == DRM_MODE_CONNECTOR_DisplayPort)
+		conn->bridge.ycbcr_420_allowed = true;
+
 	/* Get the optional connector label. */
 	of_property_read_string(pdev->dev.of_node, "label", &label);
 

-- 
2.39.5


