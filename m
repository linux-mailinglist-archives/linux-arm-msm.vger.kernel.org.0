Return-Path: <linux-arm-msm+bounces-50163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B04A4DB96
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2BD18913E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B043B200BB5;
	Tue,  4 Mar 2025 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbZ5SdHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC3200110
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085880; cv=none; b=nOaubl3lKy0XNnfKZs3f7I6s3Bf1Ui6OX0tOZRlK0xOvWxoKaeDa9GKitiax0No/bQSpg2Xq7J+1KjTczuNaGqG6nLU/y8DO6vjrm8nOXFAgI376x8QQHHyuQLO1Ttz1Wq6p9AlOglLdTMg47avHTH7ymE9Pw0UYBiY3tsY+BfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085880; c=relaxed/simple;
	bh=U03Y8+otvCPyp6B90WiniVnGB768hd4h2QJoJ4PjQL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VoZ8PWYGUN2I8zlZ1MmuMrTJTxBJXnXmIHzGbpa4FADHZIBDvED0tDvDtheFIQfkURiV5inG8bbsWa6ii4bUolQA0Rx0L23V6GG73MAGcdfhhBLADgYujK7uLj4x1RQl37t3E1/XsLACKqiV8CgBk+qQI/j5tX6a9OBICgle5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbZ5SdHZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so3017109a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085877; x=1741690677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpWmkRDsOmXj9Ho1jnnfhy87hBtzpfdzQehUQCbXU8k=;
        b=MbZ5SdHZ6du5n6P1A2wKrr3gGiJWeafYrl4Cm1/jv60/XP43MWJByDr+gsUG1xv6qf
         t4fAmnBRvTe639oUT+WQfcMnThpiFoz9qtGh0H7Mhk0ONrJebz72zGmhQdS6xNd4Sl7z
         1u+XRI1GId5iNsWXwEsplhBhfEHdfY2061wVyBk/Q4XL8p1VGFtGHc7QJtyfOJruSaqd
         Yp8c1Za29YMCe+uZcQo21Aa5OkemRqXCexFAAac22FAvb4Nsgcael3tCONnh8StMgtv5
         RUbpff8nRxjNj8AovEz79Vvt79Z+gWeUEskZqeUlcpSLefCbfyXry+wRXOH0JyyO4PUM
         brnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085877; x=1741690677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpWmkRDsOmXj9Ho1jnnfhy87hBtzpfdzQehUQCbXU8k=;
        b=LmnNEriSDaTJ5L23ObLigVfd6C+peqTeE2r4ZS3WZtmLo5PvSI3c8XmJ1RUY5jS5wz
         JTACjwkAurWfc29SehpYl0BctPk1+daNzUGrSfWsXne8wjRHC2OJMCepk6r+6ynvOrOG
         aHQp+cJhbs9FPQI5igs9sNd1BzAGC5Fl0gfLzSB6XDLzeo+QbCvL5I2e+We07Ejwdvtp
         d7AL+QEsT49BmKy0c2ffrfz7PG4R0BCIcPZzGxXyIDXxUpyYu4+0D6cR3zbTM16BNkrM
         1/vaIdMBEKLF771QnjAnc0/TlzAe5eU2IUWeNJGLoeWB3v2EwTTDBw0CbnAG8rNl5klL
         riLw==
X-Forwarded-Encrypted: i=1; AJvYcCXXCjAJd87bzNNrzkpt40bqcC0ZqMVMkgCNdPSvPKXdlxeeQJo8bxrfAkEH5jrcfeVGd+tuH0oyzq6Kjz2E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kHVSrxPRPaBVBto7NaOeflBeuwLuyKWvulp34sOeA9sXIUpf
	pLvzFQVYoGeLoWyh4/GttM9CoG2AGK4heV9OdXcMl4ubKA/jM5UmcMraaxmOkuU=
X-Gm-Gg: ASbGncuB+PEQSMhhonE3ujD2bWsqqRQ9mTsG3dw71A6wv600JEm72Lws2elB09SDhGd
	wn8aOuYYxNVcF3kUWPAhHdKkR00Kmuhpn1mRiJKiI9CSuIzh4K7BIhJghOjhnzcoS4rY+1TZJPx
	fFkzwKQaLBW34l2E3dNDqjet86gAFs7sxaaPAvoHoPq8qqs4XrmXT2TQihYpj17Q2w5YVfqCP/R
	ld898+1etFd+8QCFW8xKZL0ieyCYycgqzxz9B0Wt6eIq4VmXBsOdbe6rMbtHOT7NZ9zmaF0aQVk
	vzZTGYJ9ZlW5dpkVhFp/FANdfN+c2pzqhfbZFZvC1fUnxAKptKHk42n0vSSoLF5YGYui/g==
X-Google-Smtp-Source: AGHT+IGeygA0lA5u++5TADbRIt4j3Ll52BOM26+v0dT+XCymoz2shCvC0jL3k2lSpDpggwQ5CUbTmg==
X-Received: by 2002:a05:6402:2794:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5e4d6ad3e21mr16124141a12.7.1741085877089;
        Tue, 04 Mar 2025 02:57:57 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:56 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 5/6] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
Date: Tue,  4 Mar 2025 10:57:22 +0000
Message-Id: <20250304105723.10579-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Period sizes less than 6k for capture path triggers overruns in the
dsp capture pipeline.

Change the period size and number of periods to value which DSP is happy with.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bb761ee0164b..aca0a98d58a5 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -24,8 +24,8 @@
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
 #define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define CAPTURE_MAX_PERIOD_SIZE		65536
+#define CAPTURE_MIN_PERIOD_SIZE		6144
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.5


