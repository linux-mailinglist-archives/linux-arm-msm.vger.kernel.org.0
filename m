Return-Path: <linux-arm-msm+bounces-40457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7669E4FFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7369169907
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA61D1D5162;
	Thu,  5 Dec 2024 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qoSi1QZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04E1D434D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388033; cv=none; b=GKZvjA3x+rDtlYQMkrcTaQ6C5wRaWNlgymlgsy39pepKYDWTIoMp8ELMULVkIZz4wTFJDvL09u60/ckTxXkYRg9XIbJnx82BS3lFtp3MZWPsL+nYYbJbeNRxHBR0y8m4ezt050NRvlo2WwuE0zq54I02pu3Zu3k5o68HooGF1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388033; c=relaxed/simple;
	bh=VXAHZgsFwE3gVMNHVJ2Z6U10+Ur4Mnaa+RQ8u3Z94VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YH6EY5WdmmGKlvcd/WL04XXjxHLJVFx5qXjnNtmfe/zbL94kyMQNKnbpWq26haC7colbY+d2cW5Qxe041AQPp/VqCCxAD2h/3ckhMWbATfAueXA4HII1PQY05co4hxCW4yYhSoRTD30AmJOy7lWi88Z7NtG7j28EwhE7b4qVGvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qoSi1QZ4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4349d25eb5bso916215e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 00:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733388029; x=1733992829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OmUztXtNWohIcewPdYnom5QGJ43Ux3+mIBMeP3r1+s=;
        b=qoSi1QZ4WxgekJpcOJsJ6ILzm0WtBdDpLJqcDA4ZAPMN50JLwdtYNz0mR7fSnwkEwk
         ibfd7aG+qh3MOrmI2TiaeKSTKpmOV7KBVt7acaUSno3IV2Q+NT2qqbVs9mxMPFv98UAd
         3nnUXSnEBzvGawHet/SgEipOgGbbenVWwmOzAd48dTR2MP5TolLucl4KoXmmIMgwsqOV
         QU+LtzKbW68CQwqrpfQBF3+cQ8zD3dwfJcI3J5RQmg0wnumViv67FcHnl+C32Oo9pkqY
         Rri7gRWAZJAoLUB6sNyyYURpdh/XPAEzSKUeLxCVUj8RXNfcb2PZrystVTKE02HwK6UY
         46BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733388029; x=1733992829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OmUztXtNWohIcewPdYnom5QGJ43Ux3+mIBMeP3r1+s=;
        b=tTPowK5S52Vtf5HwEZ3yUk6+3HP4x0cg7GgOSJ+5IZfrUc42w114nV33X+6vA7IG6W
         uedfJn7exufBEHuQmmsBO486LAVDRFBETS+/5ScfEXf/jr5pxps88shplIMH3mpC8Ci5
         d/YnQfZ6q5auh+iTdelGKHLHMJI7XPGwu6TtYKzjK/8bfmHCvC5PZRHhkri8NR70gCtT
         WLbMfnzfDixOyN18cT0o6J06ax/OjEj6uamaRDzL58NmcXr0Vt9F+Fj3SdMGwsn6hw66
         djr898M9U+wTzFOSKgNIHYkTY0o3FdCB0PSmEcvh2JNFKhJHqe7rkqs4tmHu4tzn2Z/J
         CX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPoiNsAQ4DQ7TgNcyIJM2jg6hYqTCGxZI9RbbztcXVdW3mQF0d4CqYbgIWSyI9xhBu0Jy+W4zY5Q6/CLX4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2XhhvSpDMLi7NSbfPznM6gf9om4RYbUtQL1oRGeN2CVB7Spz7
	K3YriRZC1WOnM9yCJkiIbxU2GVGWbh/WTrKF4B6oSvsor51mtg8Y6aYvWM1vhW4=
X-Gm-Gg: ASbGncuKLy/i7pSh3KPuGm8i4LvO2jtM2YpR4LeLQSGBY1+NzbP4jsg0sF3fWE/Wb67
	H1LYafdKxk9IwFrGq47GDKFpwewxG9O9w2RQwnoa04ZFRyh28tUh0RuhNyCB0kbMqBeXewba+qh
	1x7rsy8wHeyCmpKGQLSRSMedyvIzt9N6xmlF5cLtxsGhPxlg6k6sb2lPaQEZ2V9LuT4RvigRilU
	oZG/ynM/ftznJwchmK6ww+ZSw0vyIQtrZVhetCYw7K/ymy/DDNIYCnl413gb2NE
X-Google-Smtp-Source: AGHT+IGSkYgvAgwhu7WSyQqH3Y+yt4UQ2jGt9iuwru2727ErGBAZvYMWIUUnfNAP+kzH0fju4MoCbQ==
X-Received: by 2002:a05:600c:a07:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-434d11c7b9dmr31086225e9.7.1733388029090;
        Thu, 05 Dec 2024 00:40:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0dab9esm15935965e9.22.2024.12.05.00.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 00:40:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH 2/2] ASoC: codecs: wcd9335: Drop number of DAIs from the header
Date: Thu,  5 Dec 2024 09:40:21 +0100
Message-ID: <20241205084021.35610-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Number of DAIs in the codec is not really a binding constant, because it
could grow, e.g. when we implement missing features.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dzmitry Sankouski <dsankouski@gmail.com>
---
 include/dt-bindings/sound/qcom,wcd9335.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
index f5e9f1db091e..4fc68aeb9e04 100644
--- a/include/dt-bindings/sound/qcom,wcd9335.h
+++ b/include/dt-bindings/sound/qcom,wcd9335.h
@@ -10,6 +10,5 @@
 #define AIF3_PB                 4
 #define AIF3_CAP                5
 #define AIF4_PB                 6
-#define NUM_CODEC_DAIS          7
 
 #endif
-- 
2.43.0


