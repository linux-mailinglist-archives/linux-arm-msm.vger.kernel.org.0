Return-Path: <linux-arm-msm+bounces-28649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD7953892
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DAD01C2374A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 16:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FDF1B9B58;
	Thu, 15 Aug 2024 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMfwcqkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1C1B4C4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723740551; cv=none; b=hUFtg8Ueg9vpuNCMIC1o+P2NMJAw365uTcsNBmJWqgWfML2FCPfMKzVTYmTA8rI4I9jhwq5O6BK+mWVsDZiMIGnj4caF+so4d0j0oytJNV5hXepvX7f+T3lrYHuNve6GHQQTpZH6AvAHBzpTIS5uRz+dJNnJ4CHO2/NeLweBYbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723740551; c=relaxed/simple;
	bh=tFpXS3GuOZgmyhYlErFt6pCIn0BCfVCnojKLEo1Xp0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tsPG+Eq/fK0kW2drygD+P+aHLQFaL5nZatnc3Jvk/k8xrICbJKizDkTjouVDSjQ0RkJ0cbWjisPi6TkmTU3CehpfO33AKG5QUSH0AVdkHaew8rJincUVprMGNGDurJj1XvTgOFwD4hVqkKxSNvWKjJvrdetHgOKDOJoa9O6t/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMfwcqkf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42812945633so8329325e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 09:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723740548; x=1724345348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y6ZvBDWCoaIRtuHQSX0AStS65o7NOQvjseSgluHUkE=;
        b=mMfwcqkfQlUgOaWS3OuHJ83CBtbbXM7DPLGP0GF6x6DKkiR/Ere7/xoclbQV/FwHha
         voP6yTyYr45avBTadEyxtJGw3GhUJK+cjsJdYWDc7a7yRelDzyGnQU0AunkZw+0JvtyE
         J3rNbZyoHL5CYI54BE3dQoo0Cg1eZSki0OHXWzgBVYOFIr1D4MwrwB9+ilHeqWIergyf
         yfCrMq9U5SmCt+foMzAEfhukYewy1puW5OEQqr1gz5XGtIQYah58lXSUtagCYHR9qE3T
         QmcBr+OWeNWKqK8XqhuB3te3EyK7PoC9Yvlc8FWZjXkmdPUNKrCkHYCBlDpTjQ70K2Ou
         JTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723740548; x=1724345348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Y6ZvBDWCoaIRtuHQSX0AStS65o7NOQvjseSgluHUkE=;
        b=MgBh7tdHikR2j5gc6tonlaXfwzDo6gF+MrsiWSKxayuCoyWQ1ZOh5cFG2F/YVoloe3
         1ni+Erkez6lfpfB8F2PAJCt12D+35MgZGzjOQ5/uY6YuP6CwJQMnUAD62bziGkrM6LSK
         0jhHLCrwXsaEzn+ikgbHDczb45blN1oruM4hNr8HI0jjqN23+w9yz1JSkM8OJyr8Kduo
         wcJ5S09seoNXjdjodvzs4jhRxi9TNg+XPBwKwTE6yUcZD1kRqbMSbXJvJpkSCFUA3PLJ
         JegS1eYav9G+PJJb6t8Z1l7HQ+HdxoQpNTm1b7GI4IFvyjtg8Ey4LDIBMc6N44Zp6W4k
         Gugw==
X-Forwarded-Encrypted: i=1; AJvYcCWq/XwLcy9BtmglgGrBj87I9l8fv8TvSLSmCNbyeafWVbHkGjL+Zi7PKuK92O/2y2xGq41JUBf2Xlkx6W/E8ogSFHBmNbUYUucAAHhPKQ==
X-Gm-Message-State: AOJu0YxO3JdDxOMFRafWEavumPxzv4d2fu6IGiQPHHDRcn4zn4+eT5dV
	wVsSjTl+N4/4QHj+XjOJO/3TBw/XdO64KvKNqGsguiPYMdJQm+GEK0CbpAaUtBI=
X-Google-Smtp-Source: AGHT+IEBnZLAf9YOI60yg1r6SCUktEL5+20HiBAaC6yEF9ZLknx9q0499kEGmstkp3oNB17v8y2TrA==
X-Received: by 2002:a05:600c:3108:b0:426:61e8:fb3b with SMTP id 5b1f17b1804b1-429dd264e92mr45940385e9.27.1723740547705;
        Thu, 15 Aug 2024 09:49:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896bf0sm1940718f8f.73.2024.08.15.09.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 09:49:06 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-va-macro: set the default codec version for sm8250
Date: Thu, 15 Aug 2024 17:49:03 +0100
Message-Id: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

sm8250 and sc7280 have lpass codec version 1.0, as these are very old
platforms, they do not have a reliable way to get the codec version
from core_id registers.

Add the version info into of_data, so that it does not need to use
core_id registers to get version number.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8454193ed22a..e95d1f29ef18 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -228,11 +228,13 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	int version;
 };
 
 static const struct va_macro_data sm8250_va_data = {
 	.has_swr_master = false,
 	.has_npl_clk = false,
+	.version = LPASS_CODEC_VERSION_1_0,
 };
 
 static const struct va_macro_data sm8450_va_data = {
@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
-	va_macro_set_lpass_codec_version(va);
+	/**
+	 * old version of codecs do not have a reliable way to determine the
+	 * version from registers, get them from soc specific data
+	 */
+	if (data->version)
+		lpass_macro_set_codec_version(data->version);
+	else /* read version from register */
+		va_macro_set_lpass_codec_version(va);
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
-- 
2.25.1


