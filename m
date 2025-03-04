Return-Path: <linux-arm-msm+bounces-50164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8E8A4DB9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 12:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D23743B1AF1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C7D201024;
	Tue,  4 Mar 2025 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whPv99s3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430320013E
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085881; cv=none; b=JAAvXMWVAIyrDDHoGHL5GEelx82348D/FTQX44GHZZC6LGvECtw0Vhnv6MwFg0otUnpabckNVWzEZNt1/Tdo9gFdgCj9s91WCEEIzpoUjS549v0L7ywhgrM0inML61+AiNtpK3rB9T6Lvb44EKpgDjB6J+du/jBazaGCHjDgdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085881; c=relaxed/simple;
	bh=OOlm6HNrfX6e8YtvAb7GXOiQezhdyWO8PXRO+Eqpahg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNBhoZFP1sU/V8ubemXqXm1gSrFNbeB/rJVHtINu7TrT6H2q0RZTFHiJSa/62ZHqNFdZBlI72vpbKJRfUl6L/hDugyevBSejCdHcOnQJ0yCmf5FyKsYe7HZgLET8Wog6u3Jzc1z6xQ3OIAXRo7zYZOqvVgeNmjZeXNwApuZMzz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whPv99s3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e4f88ea298so6952610a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085878; x=1741690678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECyziH9vC+Bjbefgj+dSQZiFMSs3qn0VmvLNDRi3E2g=;
        b=whPv99s3ZZXLV09HG/qXihTThG/hPvVlI3lPr04mnk6DjMMa2Wma2pDDbMzWsRChk+
         1rXFd/wXIUUjLZ8uMZg6zYCeXqDY/Go+0shiokNZ+XZJAdG/36NuBpJJvt0TWsH/vtKZ
         aC2MGq8aXxny8Jo8V+v8sHbD8kunq4bPUHWsk9QePa8/dAMVkD0kTmYr/ZXxHP1GW7oZ
         7cnZN0WF/0exB80PQIOTFNv4+5SGrxQS5B5/PFO8bs2/sI6YJXClL3sQUUDU0dufqnvL
         a1PyqMtyIu9ouqFtkoHeSLgjmqJL8fQMY7NB9pOVrqE3s6DCEL8u+Zibbg1jbL6c9CB0
         Ar6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085878; x=1741690678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECyziH9vC+Bjbefgj+dSQZiFMSs3qn0VmvLNDRi3E2g=;
        b=DI0BMvTEwnfjBy3WLWuxK7hZIvck/SFDd6bBUY1f4GDcGst9h/CDxrTy5AWeutsLeI
         lTkPzER4OwnUFRZ+0MMAYsuxQt20kMVXpQRyGf9WnnCgufA1Pz6GUHzLt2AN12JgmopP
         KUah/zo1OlrFGZe/jf1yAdE3FWt+HfoLrOkPJ4HVIPLBFMq/dWdDi8oCqNpye80gENoa
         kS3r1AFKKzcklZMJqyWRTdYlNEo3/Wd/AMym+GJ42MeeFP5qjIg9FFOjHkqzR8EWm23L
         LAvFnYVeTvRDXYMuis30K6Dn2QfI4HMDEJ5FM40d7+A/uXqmVDZ24jWT5+dneGyrJDGd
         f0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWesbVx0wJi9B+QLj6gd8n7pvBoA4IWkYZwtvHzeTFXK0Ungk3zuuiorONKh05MeP9t2wC0OdLuBg/LzauX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl7cbs2kCydXcSZ2P12/GJuJeE5hrtzHQ1pAdwdiOV0Ur0XJ5d
	1rr53Y7Sk0/A0Ulb799n2X59ba6YgmuWCrakkaoy4XBWsaqdKRJcwV6Ba0Wpevk=
X-Gm-Gg: ASbGncvCoVZwXC5PYBmOnSrs3Pw7TYqCOH44/Yo0Zi+lnjf0VaEGkj9jJ/dRuSi1Oj4
	U1ChdmfgZUIZKcvpfEmuNJtQooMsUE/AyG+1TOC9qNBJifzj/Yz8lRS2ZhJX/PjD9cytSSjBXgi
	TZKOEMwuJOV4+bEzJs9uT+zIB152VrZFLHU07ASa8K4/pngYZhzq5E8XUllN7vo33V9eQNVxYSw
	hsCyhT0dTN9uKRXY1/Ji2DFmq1dQbkPOQeMzUbTbK0Z8hTBn1bjblhI59BvTXDZJDuu4LCmaRgh
	nwOq+E3L9uAy3l9DD8gosBMH080LWl9avlEesLVWP6u9rPAt8kOrMU4EhYUt+6Do2v53tw==
X-Google-Smtp-Source: AGHT+IHfeHT/FTjffKPwdBKiP6ewQQTMUOqoklnatPZdqtNFAdsCpP2K8dPS2Eccu/L8rXNPyexCvA==
X-Received: by 2002:a05:6402:350f:b0:5dc:58ad:b8d5 with SMTP id 4fb4d7f45d1cf-5e4d6ad5fa3mr17089784a12.9.1741085878276;
        Tue, 04 Mar 2025 02:57:58 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:57 -0800 (PST)
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
Subject: [PATCH v3 6/6] ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
Date: Tue,  4 Mar 2025 10:57:23 +0000
Message-Id: <20250304105723.10579-7-srinivas.kandagatla@linaro.org>
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

QDSP has latency of 10 plus milli seconds, Which is difficult to acheive
with just 2 periods and fragment size starting at 128. Increase the number
of fragments to 8 so that it fulfils the dsp requirements

Without this patch, DSP playback pipeline seems to hit few underruns.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index aca0a98d58a5..aa6bd359300b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -18,8 +18,8 @@
 
 #define DRV_NAME "q6apm-dai"
 
-#define PLAYBACK_MIN_NUM_PERIODS	2
-#define PLAYBACK_MAX_NUM_PERIODS	8
+#define PLAYBACK_MIN_NUM_PERIODS	8
+#define PLAYBACK_MAX_NUM_PERIODS	16
 #define PLAYBACK_MAX_PERIOD_SIZE	65536
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
-- 
2.39.5


