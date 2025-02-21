Return-Path: <linux-arm-msm+bounces-48795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D0EA3EBEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 05:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A2C1164803
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59431FBC83;
	Fri, 21 Feb 2025 04:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwdRa2E2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D771E7C0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 04:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740112830; cv=none; b=s1lmAzk5myEDkO8QohhRO8V7mG0n+TvFs/PGqe15RIp0UrG/CTBVBdT2MzF6IxO2Q7HqukO9PY0suAi15IHdODQZSKX6R40np1V/iUhfxXhwGSa7lMHyJ7KfO7EZa1Red5GRF8Qz/gF+BOngZi/HoNvVoT+3Td0DpNYabmLYBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740112830; c=relaxed/simple;
	bh=A370FwgmOcGxdQpV0Y3cC3Eh1VAs/X7rXfoHTYBE+vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c27XvsiF9qBSzzt56ciSFmhkoiEDbGwIqW8OKD1iRDWvUHj4JVeGytsvGoQADSKtsDs9+T8Mw/t1hThOnfEFhqZ/SfeJGBL4o8b7aEEAt3UJOmwbEbTOCUKYnrZVQv7+S8sWjT7nffWIXFduaCs1UFdvJula6WtMbe6yXcCar4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwdRa2E2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f504f087eso1418269f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 20:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740112827; x=1740717627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUxQ8JHeZTOHPECNht+upnWJNGmFSV4ta5CH2/NFhzA=;
        b=TwdRa2E2FgdYdAtyqMcPFqPuo0MSIr7+RJaRe4wls56hcgiWr8Y/NKCQhViJ8mcxvZ
         tsyI+5t8ZhSEDFXUmrKoKijK+p6N6ECwfzWYSeiHFc3Vb0LeGA/0VVsIvl0s9XCQJSGC
         iKiDx7/V1p+u4/ImWVaCjqkqTIOr8QTFiXvDGaPo9oPvXfzyYYwO5Afk14SexuLMkM6g
         5NgjukzjXAD+Z7+J7P3pFMv0INDG4xeng0RSUnhrfg7UaGpWY0JUwUDlRjdKul8+un6C
         ZCKENt0oniKziiLGEZaLUIHybIVNLr/njTb3uhQQICKQdauOnANQVu5w81oqdOKm776o
         P+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740112827; x=1740717627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUxQ8JHeZTOHPECNht+upnWJNGmFSV4ta5CH2/NFhzA=;
        b=TtY2A1IGs1y2Wns9oXF+vYrHhqvvRaX+HDeoJImA0sfrR5cd/bbZ+narie/voXy+/6
         7NxbNjNOvxB5PIhgYUKiLKldIGoU5O8oEko2WmgRTg0JuVK7YSaeA85HbB5ItBUm46a+
         23diOQ5IJsRPz5CAQTJzdjBXpRUSbNvvP5eMs4rV/6ayb0oqwbUgBkl01zYOgWoddAR4
         s4KiDFrYlgh/vzuITryIsnFt+9UtNUsS/uxM4usIpY6D7JSNXzYZrLuwzc4COZdiQPnb
         pSx/fDlOfC0fPjdvrfFvSTxhuLYQ1QL59FTVXgaoKkLJr1uHYGZoCpKq5+vp0ggdxkGk
         BslQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdczu1qvUFSovqxQcAxcvGp4vDnpT4u+wUZRuRWuH3iJg5HSiv6znTMWxN5DKJewPA/4en2EVl2MeOXTC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ru3Twdvpd58qyVv0Jcwit0OXFd4YHWtnfbq+2WMIDJHn5S5e
	O41dPd4XXLL0zBl2pDA3YGbe0GkWod1zc2k2KnpYScwrl9H+mPvNNYRNPQEjbsc=
X-Gm-Gg: ASbGnctHI47ZzXVqsuuYkBLj2WMP3hrL1wkl0dxpEfsZltjnMxKV7qakDu/+1KBRgQ9
	ioDKrtDnfEv1y8tP2iUUZ4mx6GO8f/QBeY/Wr8+fLTr4ZhAEHdgkldO6pzCgLDUE9GqzyLZYSKK
	1eN9J4uJdQR6j0v3paWDALVoQc8DLA/dMW6vL+PG8Tbg73m3NN0JHYDKK//2fKJxFlAYsn+qpdr
	N3qtZ0bZJlQIrmZ59Cv9YUuSHMjSCmz5iptJ1bDFvhwikZ3enCQjSW1s+c4IQTuom7KhWlHKv67
	8MXXQZ8mtAToCFtfaWa3SayfMjBoEemwjGn/0Opqlrfp
X-Google-Smtp-Source: AGHT+IFZX2tGs3D96ENsDWlpydZ+9vz8q8gMCtR61BTdHRxHTAdwzjKTs3WtllXebpcvU3jdBD83Ug==
X-Received: by 2002:a05:6000:1546:b0:38f:3c8a:4bf4 with SMTP id ffacd0b85a97d-38f6e7561cdmr1272842f8f.6.1740112826930;
        Thu, 20 Feb 2025 20:40:26 -0800 (PST)
Received: from localhost.localdomain ([2.124.154.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915688sm22618671f8f.57.2025.02.20.20.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 20:40:25 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: krzysztof.kozlowski@linaro.org,
	abel.vesa@linaro.org,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	jdelvare@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
Date: Fri, 21 Feb 2025 04:40:24 +0000
Message-ID: <20250221044024.1207921-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Temperatures are reported in units of Celsius however hwmon expects
values to be in millidegree of Celsius. Userspace tools observe values
close to zero and report it as "Not available" or incorrect values like
0C or 1C. Add a simple conversion to fix that.

Before the change:

wsa884x-virtual-0
Adapter: Virtual device
temp1:         +0.0°C
--
wsa884x-virtual-0
Adapter: Virtual device
temp1:         +0.0°C

Also reported as N/A before first amplifier power on.

After this change and initial wsa884x power on:

wsa884x-virtual-0
Adapter: Virtual device
temp1:        +39.0°C
--
wsa884x-virtual-0
Adapter: Virtual device
temp1:        +37.0°C

Tested on sm8550 only.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 86df5152c547..560a2c04b695 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1875,7 +1875,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 		 * Reading temperature is possible only when Power Amplifier is
 		 * off. Report last cached data.
 		 */
-		*temp = wsa884x->temperature;
+		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
 
@@ -1934,7 +1934,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
 	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
 		wsa884x->temperature = val;
-		*temp = val;
+		*temp = val * 1000;
 		ret = 0;
 	} else {
 		ret = -EAGAIN;
-- 
2.47.2


