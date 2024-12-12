Return-Path: <linux-arm-msm+bounces-41612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE969EDCA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096C11889CC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6491CABA;
	Thu, 12 Dec 2024 00:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoLnSKYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685F3201
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964454; cv=none; b=C8+KgqlugyNUXrK7B99xrorUrBBUocFypi/80yGIaIH1/Pdv5ogmXeCtA3n8JgXNDV/fYHd6ZRp1y6gtaQAgWAyxl5MnFupVFd663BrvzjA8oLFIBJ3MlybKUoNNn6wuAAfHLv+1DmTcgVypTr5c1SuCrV96IfqXCxYZE0IoOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964454; c=relaxed/simple;
	bh=u898HNuc/K7hFwQQGL+EvvHfte2KLKC60+utw98E/KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe/QY26FQ16pdWH9sO2nDnJL+FFsCS+olCzCia90iuIoRX4o6QUJq4uUJ6HRSFxE3ejsOeEqGUUkTeWDZigDPGY0he0Bb7AyuOfoHFwpzMVKiBkHi0zSkLTk0isgZldhOwSQi/TmTb36tfqPzrHFMTnkiuxExI42GD9ky8virAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoLnSKYN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso224475e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964450; x=1734569250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5l/l7iG742JLVKp0vJqekUsAPOA4worydu3RY2wX3E=;
        b=WoLnSKYN1ihH08nxzVQBTy9+Ydi79QFSDVzdhdKAKM8uRDD510RlYBm2pBQvYBSVFp
         fnW4qcjhA69HD2wJEf+ocBjNAqhOM1m2kJ3e2U/G5vCwCdGVv78sZZpxtM1Gn8LR5jQV
         ldYUCmXJXShCpCicXNc+KYyVteEuLDFGv/+n7x+R8af+crPEb3uBfWm2e1rlu9WfpfEz
         4lgwpE3FW+bXusyLoPpu7J6fXjznwFA9Hf7LuQVM1bSgYGFCll3kGzlpXJjAS6L5ah5r
         HfkYYILUfqxBKNPVwShWPz7dtPSo89xFYm2LH+fFlm0lyueXUD6QpHMJI/21wzVMfNTI
         qX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964450; x=1734569250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5l/l7iG742JLVKp0vJqekUsAPOA4worydu3RY2wX3E=;
        b=bFqFqXruETX7IjALW1sKG9A4xW9AmRVmpsyvwIu0t+rRGdR2QUgpoaKJwT1dCF0Wif
         E5i++OIEOCHecNAw3Ml2sZBEbBow9SQaZyLNSpYz0HVNA88cl+VRnFqtxqR/Sim4iy46
         jKOVptDDAT6BArSk6+NbrEaehHuVmeq3cOAtBUp1phS/s0Q06epLZevU5KRd5lBNUgUy
         weDfytVl33q7InNNGa/zGKhSAtRldND1mVOnepLxmfu54dpb6i1X8Ldwfy7FnU0V40lr
         GFlelFQS3MqZK+nxZtnX+iv93sxsfKNLPgqbyLhtX1OCgo/FvatSdQRu24wGcwmva2/m
         qkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2bLpk+Ah29+wuwZqS79PQprRqu5efS+7ZnlPrpJx0lY5OSOxXs45I+hHbMRIrPrtKuy2gO0oq2Xgz7bIl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+47nV8PBW/ThYErS7A65gXsOgks4STB18Z1U66zWUk4saP+YS
	CoMTUkApmWvkhLKOqJJxQgc/W/+ABN3JCgd7GKWTXDlPyLtGgA5YmyoZo7xUbcU=
X-Gm-Gg: ASbGncvrMEeJstmK4avJTgzwP7wSPTOc5J558AkTQMK5JE5I2dCGvUKS0eZgqbvyXVX
	wSHHBsl9hhSasEju4xHVwMuB13zXo/nCHGRh5pagpwZPAwQsWr5PPpxA3c2YWbOyyYdWJW4RVYa
	YBQ7asy5DOX6a/B8/4gVz53yyo+bYmyjVcnIl/NKHuPRoKimKjKXu+sSKi64CcplIwfIM9Vzs1z
	Nf0lpKy0KAScLUDdohOMyc/7hmgJv64s9v+2DkzktpJPzJ687/JdPJTHwWpsvtizkldk0QN
X-Google-Smtp-Source: AGHT+IFaSvB80LMIRhJfPUgXzGzChRp6atkQc01wtRMPtU4/xf5ktaw4y00amu4hB9OYaIG7Ryvh3g==
X-Received: by 2002:a05:6000:4405:b0:385:f13c:570f with SMTP id ffacd0b85a97d-3864ce5fbcemr3040782f8f.33.1733964449908;
        Wed, 11 Dec 2024 16:47:29 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:28 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/14] qrb4210-rb2: add wsa audio playback and capture support
Date: Thu, 12 Dec 2024 00:47:13 +0000
Message-ID: <20241212004727.2903846-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issues with distorted sound and unstable volume on playback were resolved
and this patchset also includes support for onboard DMIC and thus
capturing feature.

This implements the playback via the following path:
RX1 from DSP is connected to rxmacro which communicates with wcd codec
using soundwire. This goes into AUX input of wcd.
wcd codec outputs analog audio into wsa8815 amplifier.
Capturing works through vamacro using one onboard DMIC which is
directly connected to vamacro codec.

Special thanks to Srini. Without his help and support this patchset
wouldn't be here.

Previous version:
https://lore.kernel.org/linux-sound/20241101053154.497550-1-alexey.klimov@linaro.org/

Changes since v2:

-- forcing single channel output for RX_1 channel is moved into drv variant;
-- added capture feature support hence some new patches and
   updates to pins description;
-- sorted headers in wsa881x-i2c driver, removed excessive ones;
-- removed of_gpio.h as suggested by Rob;
-- removed wrong bindings and updated already existing
   qcom,wsa881x.yaml as suggested by Krzysztof;
-- removed unused pins state description as suggested by Krzysztof;
-- reworked wsa881x-i2c driver
   (initialisation, pm, consts, some functions, etc);
-- usage of devm_kmemdup() in wsa881x-i2c probe() as a hint from Krzysztof;
-- updated commit messages where required;
-- not using i2c gpio bit-banging for wsa881x i2c;
-- made dtbs_check and dt_binding_check happy.


This series depends on:
 -- HDMI audio playback
https://lore.kernel.org/linux-arm-msm/20241204140027.2198763-1-alexey.klimov@linaro.org/
-- and LPASS clock controller
https://lore.kernel.org/linux-clk/20241212002551.2902954-1-alexey.klimov@linaro.org/


Alexey Klimov (14):
  ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
  ASoC: codecs: va-macro: add sm6115 compatible
  ASoC: codecs: lpass-rx-macro: add sm6115 compatible
  arm64: dts: qcom: sm6115: add LPASS devices
  arm64: dts: qcom: sm4250: add description of soundwire and dmic pins
  arm64: dts: qcom: qrb4210-rb2: add wcd937x codec support
  ASoC: codecs: wsa881x: split into common and soundwire drivers
  dt-bindings: arm: qcom-soc: extend pattern matching to support
    qcom,wsa881x
  ASoC: dt-bindings: qcom,wsa881x: extend description to analog mode
  arm64: dts: qcom: qrb4210-rb2: enable wsa881x amplifier
  ASoC: codecs: add wsa881x-i2c amplifier codec driver
  arm64: dts: qcom: qrb4210-rb2: add WSA audio playback support
  arm64: dts: qcom: qrb4210-rb2: add VA capture support
  ASoC: qcom: sm8250: force single channel via RX_1 output for qrb4210

 .../devicetree/bindings/arm/qcom-soc.yaml     |    3 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   19 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |   17 +
 .../bindings/sound/qcom,wsa881x.yaml          |   75 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      |  126 +-
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |   62 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  132 ++
 sound/soc/codecs/Kconfig                      |   15 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/lpass-rx-macro.c             |    4 +-
 sound/soc/codecs/lpass-va-macro.c             |    1 +
 sound/soc/codecs/wsa881x-common.c             |  123 ++
 sound/soc/codecs/wsa881x-common.h             |  426 ++++++
 sound/soc/codecs/wsa881x-i2c.c                | 1352 +++++++++++++++++
 sound/soc/codecs/wsa881x.c                    |  493 +-----
 sound/soc/qcom/sm8250.c                       |   28 +-
 16 files changed, 2384 insertions(+), 496 deletions(-)
 create mode 100644 sound/soc/codecs/wsa881x-common.c
 create mode 100644 sound/soc/codecs/wsa881x-common.h
 create mode 100644 sound/soc/codecs/wsa881x-i2c.c

-- 
2.45.2


