Return-Path: <linux-arm-msm+bounces-8097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1183A376
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638F328E675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4147317BAE;
	Wed, 24 Jan 2024 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RG9smOQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBB1799D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706082347; cv=none; b=rD9jQjDthP67rzWhadOSGVI1WpOKHrGl/HB/Y++boGNKkfTmEUxPqgjIL7b9VFp/15YFe1krn39EY4HCectPJ640TPIWefryG+aTFIMy09YiLL7CgYjKTkIjR6OdkO7SeSiGEKZd9t/A8Us6xZnNDnrrdoJxS8GHZHXF859M9eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706082347; c=relaxed/simple;
	bh=oMxlIYU8lOKLFt0TEL5h53mUDoaj/hO9QDpO+Y17nsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HuEEgYyn5JE2LB2Lrbux/JsSyPJKeQpcaMJA4YfmPa7bz486kKOcdz3w0eg2T67U2Zcq2Si4L5PceCF2oZFKpX0FMXEmgtw4nmjnOFDkfdt7VoYrZSNMOzDblSne9aP1FMp6Av9wAJlXo91g+2lJXc2v+rhODEvgwULu9juBYJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RG9smOQd; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a354a65afso4468004a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082343; x=1706687143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=RG9smOQdM7OPnO+Gi/ba99FEng0dex79k6Z5uQqqOec/z1eMvh/QKdLkc2hG0gFXli
         JIoA+lNHrs6G8isF8m4YYvMc6IjNaUrUzwagOOQlMHIV16NjjAgz5gtkxgAGEiBcJSdW
         g+ahdJdZJzHX87AlLWt+SsPpgaFdoz3LUcQLrBbCs7RyKrywPRhuYxB+OSy9v84PiglK
         NDTNLtdyzsNyYEdT1+F1ze+0uB7arFSX5GXyKlGFz7TqksQd+G4i2monnIUzfFv0XhPL
         cs2E6t5qZN7h8ZP+A1bXaQS1r7882EKnqwkcGd43JnV68hBftK/g/6708Kf4zK1oDX2X
         AE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082343; x=1706687143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=MTTmB0FG1K/IMYm2hLXFwF5JZjaKNeVI2O2zLyWa54sGviHzBwdFNDhP0x5gv0S/ph
         FwCHI0H61lgMNz6z+KkLSe/AIbil9RcRdXh8MDRPtOUJTEmcJZiJFc4qAAEXlh1khFF5
         aijp01h+gVQZRMOuSdW4KdObZADgUnWV62TPVgpsTwy7YTcrtgi1C/0kU5rt59Z1P3MX
         WRw3la8C67nX1QW7zQ6Nk1qZH/AoIeahjJKKGyGSoagpWEJZBJbBQuVjfGsnbno3zZE2
         9vbrdRvk7nrNiRHTAy4/i9S2jO0fBFrXrJESQHAPh4Z7qZyS6s1nXj/XqHnBs05Tewob
         /WDg==
X-Gm-Message-State: AOJu0YwJ5Rx+nDkcHUqVSS9TkSBl/ZsWXBpTPbzMS/mUXgsh+1WapnT0
	SomWD6y3Z3BIlBDUHFwk+mMw6WoBrOMYy0id+HLM/pTFCPE9YoYFeb1kGgUFUWw=
X-Google-Smtp-Source: AGHT+IHjvR2GP5elLnS6zJWZVP9iOwh9lBECo8gB0qAFYYejK9jRMliygooQE5Cn4oU3IbvZ9gNFzw==
X-Received: by 2002:a50:8e44:0:b0:55a:7cbf:a801 with SMTP id 4-20020a508e44000000b0055a7cbfa801mr1929863edx.79.1706082342872;
        Tue, 23 Jan 2024 23:45:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id c4-20020a056402100400b0055c8a30152bsm1306951edu.83.2024.01.23.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:45:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Wed, 24 Jan 2024 08:45:26 +0100
Message-Id: <20240124074527.48869-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


