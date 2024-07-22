Return-Path: <linux-arm-msm+bounces-26753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E2938CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4C71F258F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC8716DED8;
	Mon, 22 Jul 2024 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ1b+XUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542F16DEB9;
	Mon, 22 Jul 2024 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641945; cv=none; b=AH4bjIyXShH4BZsH7HdKe5AX/r2WtFMlrDv907dv2fwTAn5DO3jV3wu7XngtGuVpkF6Nc/ZJl0xvn1KJ49vLj2AI62YfrytbjES1oXjDjj27xh2OJSqjUZHior7ijDvfN2lo6L4ZWMqxkHSXVxLzwZydQvqWcczPq2KShajXKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641945; c=relaxed/simple;
	bh=KRsPJdZcwmK3gbwOR0QFyaoTgSYfTVGDmjEFVejhQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DyYpqwMvaRNfLCo3Xy4whqWKlIJNFPnY3C2VCQR7784qZMNMRrW8QXb9utAO6Q5ophj0fMIJbQoGDCWY3DWTy/FdEPZNXy1x0ezc1ovwioQt7yh7bQw/7BNTsJp9KYs2zy9efE4siBK5ExPMgZ4xAqQG+18aa1TXvt/0756oGYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ1b+XUv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04c29588so802017e87.3;
        Mon, 22 Jul 2024 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641942; x=1722246742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LueQvPp7jIsOu7JwwYrAGJM7gILiYRCDnqZjPBjPXPA=;
        b=fJ1b+XUvJBooM7Uy5lEHypLNpiUoeDirm7wOP1D4Z2aJU/OSygHtU7xrI2UsGrVZI0
         WYyUslqHA6bVdzaYSOxcP8n6GlvlSi/ZY13tKb309emGp9ydC3n/akjevfOC3sEqPr/m
         VGImAAzYuZ2y3oSGSqH9tYDuLnkiB/t3NVQZuB1MyL3BPmRUtMXHipiGr3w7C7pok0uQ
         xoSs7LO0IbNtMwPDBPD8jqD/LG2Sh9aX71tjFCYKfttRbRgRiJY7gLVV7aLYkf9XSHpr
         JUMhZBf21eSjR5aTRFbqr2GG8T9qyMokKAMZamdROq+54pU7uSeEly19FizSVZHlYJJD
         VxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641942; x=1722246742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LueQvPp7jIsOu7JwwYrAGJM7gILiYRCDnqZjPBjPXPA=;
        b=IChc1jrX2vO3XpfAAbE+JGo7lLC8O9EmMzESz3c3DZqH9ZnCbasXxNkcbpw+zHMqMu
         Cat8O0o+GSRPtFMh1rvda09n4ReAT8pZQqXL8V9fOqhg8wuAcdwDPgEt8qW214EI70eh
         XPKBHGxj7cyaXQJuFUg9c594mTRXh7mgOU8fqc5uwO5ByMEh2af2mF0kqtYwYXK12tK1
         D3mw2yNkrJt/0ZkFWZ2lzNCwaE6JSwWjzk67J4vRRK6HRzOUSE4KLNtlES8MckQm/GTk
         BUDCHFL+BAe7bNmcH/2ZDFzjtx0ggtge1/bvH1w9lkcOHsTi1TiowF2DG/OSuK92S/p0
         20Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWSFBqfq0ebUXRzcK/Q2WmTW2ZVMn9XdwyKPTwX0Q/YS3ViMineA+tv2gEwjExBdegu5OgUdsrCr1eMYy67cY+1vfawx5lCG1dBJ6LEzVo+aVkiI0RtlSpXNQZaGK6vTZsGrgV7D4yGsWJpKrCzhW2758bf6SszkavgYb9u7jXrWSHI7v2It5ASXBbjIi4s+1rkYIN+2uMoYlKzLYEL7WNuEEoCDg==
X-Gm-Message-State: AOJu0YwoyejkjW4kJPLtaXYdrqRIUns7yCt9UCRz6qzM8BXPAP2dYpDT
	LLH+49NqZTTJB4p4UrDROANFgS1Hvjh5GmROPlJngiyqcVdSfxQBn+wINDlt
X-Google-Smtp-Source: AGHT+IFEAj1t++gm3u7tMYWGE3y1vx+XHwQtuisG9uc4Yr+MK+jmP04CRcVD6fbhOpk4+urwoo37lA==
X-Received: by 2002:a05:6512:2826:b0:52e:764b:b20d with SMTP id 2adb3069b0e04-52efb7e1281mr4257344e87.28.1721641941605;
        Mon, 22 Jul 2024 02:52:21 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl. [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:21 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,sm8250: Add msm8953/msm8976-qdsp6-sndcard
Date: Mon, 22 Jul 2024 11:51:07 +0200
Message-ID: <20240722095147.3372-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095147.3372-1-a39.skl@gmail.com>
References: <20240722095147.3372-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MSM8953/MSM8976 QDSP6 cards.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../bindings/sound/qcom,sm8250.yaml           | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b2e15ebbd1bc..3b5f8adba725 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -29,6 +29,8 @@ properties:
       - enum:
           - qcom,apq8016-sbc-sndcard
           - qcom,msm8916-qdsp6-sndcard
+          - qcom,msm8953-qdsp6-sndcard
+          - qcom,msm8976-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qrb5165-rb5-sndcard
@@ -144,10 +146,30 @@ allOf:
         - model
         - reg
         - reg-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8953-qdsp6-sndcard
+              - qcom,msm8976-qdsp6-sndcard
+    then:
       properties:
-        reg: false
-        reg-names: false
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+            - description: Quinary Mi2S I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+            - const: quin-iomux
+      required:
+        - compatible
+        - model
+        - reg
+        - reg-names
 
 additionalProperties: false
 
-- 
2.45.2


