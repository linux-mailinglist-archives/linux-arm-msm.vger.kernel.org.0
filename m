Return-Path: <linux-arm-msm+bounces-51458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2222A6188E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424FF460699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C259205AA2;
	Fri, 14 Mar 2025 17:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r86B2yOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A9A204F92
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974523; cv=none; b=Tg/sEF0rVq2yhZtSiNWs9a+ipTIitj9rQySCImgyrFgqyQGbTln1ngLcGrQHWnrtaW8Bn7wBhQM0XxLZbEwlpjYR5Li5cZo6ILT+wcKarW0fU90KdqdvnPz8VKYeWr75vq4Cp3vuHvkpFNu2nGDRhHmgnztVT07hsa6WW2bjMGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974523; c=relaxed/simple;
	bh=WZz3v+vsHhPD1tXnM2Sgca+yquBEKJ/qJRDwgWjeJjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q07bgabaEbklpn7oMm49g74mWl/PKUA/Oiv/wyauk8ygUeJgV0PGYda7RxL5b1pjJwWM4US9scdB0mEW6Q6XhK1oXcVhqhUOPeSrGIvX+6o4/9NDQeXV07LXdFV+OBkQ5+etj71UDN2pKXVWxk/CwGx4HMG+eKUg0jcX2mTIN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r86B2yOL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2246627f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974520; x=1742579320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/0LkOzwwvJNcYMQhvQr0pJ6M6A5VssVoqwJh0FipfI=;
        b=r86B2yOLrp5ovBL+sphVOm7K+tIjuBHFQSZ4+WqizlY5llipVKCrSY84Wk8kFSlOwa
         jxc4o7LZHP5h1wT9oIiUfYqMwCZetBrYCywa0qOngkxNwfbFD8SEwMePLXaT9oUUldAE
         2vaHBFec4+lgB+ri/yRit/iclJ7YC3JNFIcdNQTWFfeyBvJGu2+uDOJO++VKsUgsYuLU
         gFSxpIBnvExg5ozA1LOC3LiDKy0rwzXM56xLvGvRKYWsdzKDC/ty8XxivYvWWs+ZH4ae
         7W4gYAk/tNYVWRcsTh6DDqni1hhWfg9cZuLHrrKyfcCdlZcaIpG71ftPZUhxUkgj+/BO
         FgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974520; x=1742579320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/0LkOzwwvJNcYMQhvQr0pJ6M6A5VssVoqwJh0FipfI=;
        b=iWxNYB2fsZzRya6hipHQ/1HPIAbwLbiIbeRibcSDkypeP5CimAgTwy5smLcD05ntRy
         MVWRecBAfK+482YbIg2v5JL5PKPvLOsKijZw0ijfy1P0SFpQt4d8QN4KrZutag+KJsKR
         89V2uPoerzEzxVb2p0UsWhmhQpMwMD6+2o50dMWe/gDnGH1bgjetSbbeoywu4l9eHpA3
         56NGa3UdvgvGni1enzUkUXRfe45kHjV24DzONcGoARF6zJ+vr97B1K1RhHPCvsTywNVS
         IYK4HG9USyN6JmW4adKgyHgNWuoOfaqhvy9I/4Aafj0uCwXfgZSWXA8gBquwJJWTxrN/
         JhMA==
X-Forwarded-Encrypted: i=1; AJvYcCXMb5w4pmzxH1+DmAu2bvclJuhClDO3/3hNnprsfgWsCHjIX4kKp0uATi8W0ie/VpZa1g99QUs+bWTuasTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQwL2FM6YRGsS1+0Zm3ouIt/3i9PIT9XFcLfcgLMBmHiosZUY
	uPaoYq/lNorXTeXqRfqOvMvbDtHLpIyAD783Sm5HF21Igs6zYErNH/QdTEaP5GY=
X-Gm-Gg: ASbGncuKMpHsa+GH7s5Ib6yELF3dByDTkgsJEq27rMixI89c8RahXU9ZDvWNULVk5so
	m+1icFt4VpkpDBzRLk9o+739MJp+tFSFxYpn2koHTwQQ8to7VF7hcF1yC1pvQCoYAbQvJ/nQB5x
	4t60PW0UMtdQMBfGv/L4ukGkVWnBcYZk6Wp56jZCkCK/riiQis/EXiLq3UNu2HG5qdJpM0vmdmX
	ODs2MzSHgwuk79FuFtFCFU8D8pxd7D14ZyJ6N3+a3a3AXynyb+99TLLPxw1RQFkg8LUApb7ClTC
	y8Cfxz0Z2z9sOE/d405EGjrrJ9jPn8bADBNkXzufnOYGxo0hL5V7DHfznqWBR/Rt63mLJuyYu49
	RMPeu
X-Google-Smtp-Source: AGHT+IFSURXCATif01r54d+KQHoWw2qah8uuJQ120su2MkweaWrQyfg3Zuqy7P/UA//iCx8NnbbY1Q==
X-Received: by 2002:a05:6000:1a8c:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-3971dbe80bemr5173220f8f.25.1741974519796;
        Fri, 14 Mar 2025 10:48:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:38 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 5/5] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
Date: Fri, 14 Mar 2025 17:48:00 +0000
Message-Id: <20250314174800.10142-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
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
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 180ff24041bf..2cd522108221 100644
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


