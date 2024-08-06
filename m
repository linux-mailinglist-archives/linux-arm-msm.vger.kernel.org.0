Return-Path: <linux-arm-msm+bounces-27983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11455948E20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 13:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DBC41C234B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 11:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6261C4635;
	Tue,  6 Aug 2024 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpNbaTNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30641C3F36
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944985; cv=none; b=EL0R7kY/7UB1PZW+1Nc0xOyynA7zHh8NpLD+JiSR9BWQXjCzMI1eaEpFVheLVLu74hJHrN/KDIYzcsnEm9HjqYj54VaFFhRVCN2Q4h3fVifSzg8ApEXIBW91V1yOMcmbqtlEogvd9pTqJ5glG5OgkmzmYlFupzaRapIq2MJ4OTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944985; c=relaxed/simple;
	bh=qAxAXkSzlzsy3YZMDd8hkLWqB7BSzVrCOez5JOG9HB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fx63ixSR9svAinkgR6PJd/kAX9D5iUKd2XeQucG3pWTyyTsjClp7qnSw/VgaW8bE7vRSlbZYD8nXwk8fCxpLavOmWfB2Mx7U/7Dl08dp+HVShVBqMCtdexoYohbymsp1EZ4zmTnQ2XI1FAchTRuTuD9mT340drKxid4J08l41Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpNbaTNg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42819654737so3686625e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 04:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944981; x=1723549781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+W/spHaH4ZPrFJzwLUAvkjiFq7Yei24v520B0MhGrw=;
        b=wpNbaTNgSFvn4N3OIKPWCOjxoy7EsTRSqCUe99fyKqiJYgBYtf4TFHaHaPciyYWtjx
         bufSOD+BPB5rq5SOlYLNxHQEop/joNiToonuqwsYQ7PldYsukHAYKe1zDzM/W3J1HVmk
         cxDTGC6hiqPP5ZBNFut21NTMSXBe1o1yU4MIhL9aVuDwXAGVdxm3pHR4ukSD2RfSBRii
         K2t/Awvh2i+H63MrknPjaIBLwvtTthd22OsCuMIlmddLui9BvPfGbmcuK/fIYE8k0xv+
         KpWESIRQ6d+7xfP8LYvnQXjCYTsnaamz1mszVJSGPcKaBBlzndvBLTKTaCzuaxfM5u6V
         Vpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944981; x=1723549781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+W/spHaH4ZPrFJzwLUAvkjiFq7Yei24v520B0MhGrw=;
        b=iLwEizmA+5Rzww7NCxDVbBihNYCqhhujlg63ecvT7VEoHqZd5J1GdQvs7sdF11qSC9
         d5J95jJVmegf7mwT9NXrZCe42Pv3I74i3ti3kJINZmOzOJW98txQZyzpYSSWiC58KbXy
         lNwxB5WSX3obQNG5wUYNd2ut/Yp/3v+tUsTAOVh7GsKO6IGKBOfEOYeuzaeRbIHlLC7z
         Q7p/qBhbP+ZD14xUZGxqzt+3tV7HTxjZAMUyFMP0tNNzYzWRM+b3FzGR0D3POXw5zwSs
         4OpN708mLPSjpgUEYa+xWHbSDEBkKmGKjTrM3aOQkl/bLUvYOYDZkPnEbUgrB3MJdo2i
         /jdg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Y9JLYbMR9EgZQWXucFGJMDJKK+o8b2xivvEmazLnPOJ5FJYudHR+tcbhLFgoE44rEBDDk//LxdmAPYSu6r3nAYi4M+YSnSQPedfpcw==
X-Gm-Message-State: AOJu0Yxvc4tntwThZfd4wU10Jry3+3f692GkcT0nWe5xa29AmFbPUWI5
	yJoGm4qWVBBm3YwoR4SA7khAovD8Bz3HqbL9wyb/nkzYMDrb7ODVnFR+5FEDkcU=
X-Google-Smtp-Source: AGHT+IF2nxOVw8Nfp4RadNqv6qJ7oMtw9VFIh5K7+RrZpNtzMo+RT0FI7T/1iBoDUzrE75hfcrLE1Q==
X-Received: by 2002:a05:600c:524c:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-428e6af80aamr99654155e9.6.1722944980982;
        Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,wcd938x: Correct reset GPIO polarity in example
Date: Tue,  6 Aug 2024 13:49:30 +0200
Message-ID: <20240806114931.40090-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset GPIO of WCD9380/WCD9385 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index cf6c3787adfe..10531350c336 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -34,9 +34,10 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     codec {
         compatible = "qcom,wcd9380-codec";
-        reset-gpios = <&tlmm 32 0>;
+        reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd938x_tx>;
         qcom,rx-device = <&wcd938x_rx>;
-- 
2.43.0


