Return-Path: <linux-arm-msm+bounces-24609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FE91BC06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE97B1F22933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B515533F;
	Fri, 28 Jun 2024 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dz+L+4qP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20AC153810
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568720; cv=none; b=eoCW0azT0HA3+fL0XXxW+BHQkT8TS/KcCdUL9UrSRLdrfCqWIGpGSTYrbfc8DP1R6l5q/j+2qNaYQO50M8k0a1xZ7l4zsBZ2R+znqHvf73zHvpp+p8b8GdV0oFJB/TVbmFo5aBwtzNV6Syuwn6lhICH9kAO5Tu4wNhLLnDXQFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568720; c=relaxed/simple;
	bh=pXcJZXfOduG19g33CWHG/iY96S5LfDhVExDtf7vtU/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqdz7a2RbafAq39x8MVed16ZUH03fHO0WWZmvjQ0++mXqiF0ptFhxhWJuYIPtmMg/cktlUu3CGOSS4taqgXM5MqBhCf66yOuxRD67sUGG9YWKiLcqnpIcbtgbZdAiWPoB68ig4lZFxrydsc89UKf5ZpG8GEiTm+79eEEu+arWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dz+L+4qP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424acfff613so4679035e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719568716; x=1720173516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vj7f8gpSZwh6TRqOjZfbXgm8n7bo9ud79bHIhbKk/yE=;
        b=dz+L+4qPwmPobYllr3Ngniq0eFwp2ZRhEcpIjKF/wsgOtH7w7+CJdSwwb6tw9uceZ6
         0gNEv2TnNOGY0S/7/jSLUUo6QMXz5JsJih9oMXRJRv2EnkJCqB+1zFPUPR55fNm2eoNh
         TKgwNyszl9N/5pSDd/Mz7Ee7tx9Zz0YN8nywJCgq/rP1uVYgcCloYPKJjTUF1eBSCJYC
         ZHfppKjW210CVIh4mMrJ2LFkdx8Kh3nvNoXbyWAFbOZnmMaEZ4AV2vOxlMDMqw4hfK2W
         oEqhYdel/moqty8EVX6zfjw00sAi1IIZkHjQ7TNLPEsDU3kM3fcqFy3Gw+vbIwdIaj3t
         f8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568716; x=1720173516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj7f8gpSZwh6TRqOjZfbXgm8n7bo9ud79bHIhbKk/yE=;
        b=bttxg31H3x6iEgxbU9ZKTycET0iJaPU+l4rUxm+YXoKYjOiIs0QXq8tL+1itNYEeFk
         69I26PkVvFVtOdPIngjSpwnfdMTlcOE9lNwqGdFYlDHEZYuKnI9KKNUeZkV4AFhmHe8X
         hjhSBWqKicjMVHaSIX7e8WPuaVAr/gBF/atvH+gj13XoxIcou+rwlsT+d+6OwZxpAc4+
         S7FcIzjCGw5QqbSLHiA2PvAx6OzBWv5mMsCLRVfh4DYlF6eg9yIqc97SkuVGDQvRLDBi
         FtdD2a1XWF51Hj68wp0mSskC2InTWppfkQ5ZIGTu/YV69JkHADX26xt8HrP84W+lmZKg
         N1lw==
X-Forwarded-Encrypted: i=1; AJvYcCXbcCDpqxxmHMvplrm9sotGs9T4qpQp+YgnZ90wt9hI8bXUIzfFd0W6Jl0sCecNnr6cTxN5KVMGwkWCGvTq5UqQ3Dch6+c7SABmms7DHQ==
X-Gm-Message-State: AOJu0Yw/LaSKlus5W+QWCXw8G8cVwAPcnXeifGYnp+v6+bXbqV0iGJ6k
	mSIEkdg1X2dv9ZTBlQlMrM80VcqF57jz8pTPyX/MiSVb/cFD27k5GsXc75whfsc=
X-Google-Smtp-Source: AGHT+IGOECgt/Tx2J3NULa0P6WR60IFU9SZLYVOKALAhoMlIlXENOp0BXYMSZmaQsxPOdOKobn4xsw==
X-Received: by 2002:a05:600c:1e1e:b0:425:6a52:eaa5 with SMTP id 5b1f17b1804b1-4256a52ec38mr15858465e9.41.1719568716326;
        Fri, 28 Jun 2024 02:58:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e13d4sm1760802f8f.56.2024.06.28.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:58:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: Fix using NULL pointer in probe() dev_err
Date: Fri, 28 Jun 2024 11:58:31 +0200
Message-ID: <20240628095831.207942-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'wsa->dev' is assigned closer to the end of the probe() function, so
the dev_err() must not use it - it is still NULL at this point.  Instead
there is already a local 'dev' variable.

Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f619b06b8aec..14e0cc4fbff3 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2798,7 +2798,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		break;
 
 	default:
-		dev_err(wsa->dev, "Unsupported Codec version (%d)\n", wsa->codec_version);
+		dev_err(dev, "Unsupported Codec version (%d)\n", wsa->codec_version);
 		return -EINVAL;
 	}
 
-- 
2.43.0


