Return-Path: <linux-arm-msm+bounces-5885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A7481CB9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 16:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15BEBB23345
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 15:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF27223776;
	Fri, 22 Dec 2023 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYgS+xPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CA2376D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-552fba34d69so2129500a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703257308; x=1703862108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx3v1qGZeqQnkYVSrY5RSwpGT9fxdZloG/62JqqyTmE=;
        b=dYgS+xPsMLUMdnAhOB4BpD3CsRBuYcoZ/a+ph7FCZ/g2I1WfER3aCwYMq62GgQ2ZYf
         B3LeTwmpM2bdXvZkutwfaXd80+SX9nAbGl33jRRq17DtLPFs+TydW6R73Bfv7gyfXD6r
         8/zelrMX1nGTg48NnFEmOrZRUJK/hdr5JtYj//qNxTROnc0MdDYg/dpdTVAGXvMPFs+o
         Kpr/FKgTtH9vGjzt4zBo2zW5vqKSoZLpJDthPlywZk4YV/ywDnofpTojBEElTdnr/p9t
         22OANkJ64nbmOkJHTK+anIoLPzhZ+2RHymlsUXMU11tD/IVoeskbeVa0FytrPk6aK2/9
         Bfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257308; x=1703862108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx3v1qGZeqQnkYVSrY5RSwpGT9fxdZloG/62JqqyTmE=;
        b=d0tzghP+1rBzUL7+TXyXjsnNe8COae+1pQ3FKdfhWksBUgGVxeE2BC1j/Wrtav2oo/
         N5R7lNVcP0Yhz2ed9TQKILFTtxx1N1U51ulUv/eUlsTRt+yLgggfzBa+ZSZhjvP3lNjj
         tOfSpahir4j0DIpEShfAqt0h34EtnSmlIhSM3qalMybcBWfeioLn4nYg1wRg+cPJtYwZ
         PQ09CH+QjVC3cxqZqAEG0iNUjW+qErVQdVFHF0Hv25quVbJuzcuxtcLtlUVYG86FdbOj
         bG42hrtXSKxW/rJsDTvWFN4+J3YRSJuNO3AovD/7z34vAt47Ax6Jp0Xj4CY6uBWdVSEc
         2Fow==
X-Gm-Message-State: AOJu0YzlJYjB9gAFtckiVn4xoLu1NYsOtDylAVnXrVjTfwNRLUmiVN3Q
	M4vMR9txm1WdvbIZrePZnoaNoPQCJ3AhIA==
X-Google-Smtp-Source: AGHT+IFSkPoU1vTjmyalz79sN5kxTWIe8tnjANHRIdEWKTqQBOahgPnI8lq+LbB2c3LndM4iYEf3iw==
X-Received: by 2002:a17:906:eb12:b0:a23:333b:129a with SMTP id mb18-20020a170906eb1200b00a23333b129amr888281ejb.53.1703257308319;
        Fri, 22 Dec 2023 07:01:48 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id h1-20020a17090791c100b00a26af35c171sm1275671ejz.0.2023.12.22.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:01:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Fri, 22 Dec 2023 16:01:32 +0100
Message-Id: <20231222150133.732662-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..4b4bcbeba9c1 100644
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
 
@@ -37,11 +41,14 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - powerdown-gpios
+  - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


