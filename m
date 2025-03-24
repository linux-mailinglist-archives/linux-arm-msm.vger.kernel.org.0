Return-Path: <linux-arm-msm+bounces-52338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B2A6DA9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DBB16AB76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA9D25E83D;
	Mon, 24 Mar 2025 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFAdZV+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3464818FC80
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821265; cv=none; b=IT/ug0nxnWmm5S16Max0FQxoxTGsmlGQyaHJVDTt4OnBQdMF7gSQjfSeTGqgz0fTEw5cmq7Gmsry8RU71DwiKAnU7hFKgekMqsrLMretbdu0/g/+ABOQH7tLV6KQLvttHSAubMdTiaMOnVsNqT+7JmfEj54JJGUo9a+e9EBCMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821265; c=relaxed/simple;
	bh=e+asD1/kySHtQyB/lOfwPMKIM/FlqM0vMt5Kru0ld6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HKFkxJW2ZcYdrRy3QmZyGJCJ92gcQuMxJxrTGFG3Wl75/Ku2t1pgM583/qkgR/50vjOczlTzwOAunZb+7j2Q/g+3M2WxJQ2uCtzsa1U4vUFGiUKrSyEatG/OtmfJNHGtWKdV0y2YrU4GV6z16Jen4Yoy5we0lWs8ljNKe/UpABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFAdZV+b; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso19400985e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821262; x=1743426062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+jNjLycT3ZQAOIz+8wQ7nvfI7CnYsytMJ+JsnPa5OA=;
        b=mFAdZV+bDi0iz6bwZ5pecxN6/FbGc1z70UReMoutX/Y7slqZlANgGqfy5xmCQ7J5hU
         RYVOwq4y0RjQRUeUDKL1SzFeQMfwhfXx1OgIXPS4rEF1ps7VTsWElZprHtwLMHtJxhAi
         8/TB/2swa6ZGLt/lnKjduRH4LQoa2j2JHIJ3+UxZrMGMJwcScQFCT6a8CwTo3IsTokHB
         QDN6pWogktBClYzCL8a/oov8+31azCFMNEu2xAp4dkdQfO7VKgiatblWfbLq8y8Z32+W
         YMnGSWHREtP7pfMmtk7viqkYmUeE2qC8/LujxL67Ww3WV2v34PX8uBhTewZVOyNYBc3V
         EdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821262; x=1743426062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+jNjLycT3ZQAOIz+8wQ7nvfI7CnYsytMJ+JsnPa5OA=;
        b=r3t3PQqJ+U3OiIY8A2YkgQTCZSTgSGTqU+GJ8m8F8q5oaHbnb6PvXbh0aHfc2uEdp8
         ZAvn485pWTZ0LzXIYpTr65gbzPm2uzzqgShQJ9NAmGpYhpcwRYugoEg9KEcjCUadRayA
         BQv8hz5Jh4d4E3ItZXmj/c5u53Q1nV3Kx8v2/Crakl7ykHaUs+6HP1FTk/pF9/EY1KvF
         wujgyAzsit0/910wdti0NJYSDsW+mKquuRzz8j5obrNSQgHNyZr6S8+3nI2sGwfeoEK7
         5c4HN1rMKMFs0paZNoFBIQyUxhODZdov2a1JAy+yv2Mmny4ip06GZb39NA4ikLExG3ra
         FlAg==
X-Forwarded-Encrypted: i=1; AJvYcCWKyKZunSvXCK4JsbcQEcqmj7w5/O5uzzt1BiD8/e8+5eg8oQvaPB6v115DweTAt1I4W+BSTVv2HqIGAszc@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZcx/Ew9xvAzHUVLj088u7FXstRwkAycKEimqtaFM4P93NOdp
	4o6t9/dEN1nvR0Zm3nBFnOFmDjiNtuL1oxc4DLlAZO8GYfgJpiPYSzh7/euQA4o=
X-Gm-Gg: ASbGnctN0dDPnDVCVDdss17fyNFCkqjuE5qbCXhEj1NcX3fkfGWrTV+Zpm9UC4pT2NX
	xW4jnSKQTGYfGgOudcn441fOEA0DtT9O4g/rMrT58dN2G4r+OApJHCdxHZs9hVwcvNKKQTLiMGC
	pZYw9gGuCpd+k9jV6OENgbIFbq/UGvbNPky2CUByy2KZdwp7sXld9Y6x5TgJgATNGL4aBOEbGYV
	p0u5fZ/V6bpkvbjEHnoG+p7utBJAHVkDrJxEGPVVkV0FNvIJYq6391EnMpqqeSvzl3eySyJkS7g
	gGkMIKA19fSh/CqTho237Xn6oFUjiZ9edGOV54miQLRYlb8qjLuWzS/0LrLmhZxMfjaSGQ==
X-Google-Smtp-Source: AGHT+IGz9IBknBvdoHaX2dPjOfY7K08ie1Ra/SNOt48wwrRqkVCUOOGWrJ8G2YTKz1/+6y2ctou0Eg==
X-Received: by 2002:a05:600c:299:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43d509f5a52mr93992365e9.16.1742821262372;
        Mon, 24 Mar 2025 06:01:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:01 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/6] ASoC: wcd938x: enable t14s audio headset
Date: Mon, 24 Mar 2025 13:00:51 +0000
Message-Id: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.

Changes since v3:
	- rearranged mux deselct to do better error handling.
	- reused mux_state for gpios as well.
	- removed tested by on bindings

Changes since v2:
	- udpated bindings as suggested by Rob and Krzysztof
	- cleaned up swap_gnd_mic callback
	- updated mux gpio to use dev_err_probe.
	- added Tested-by and reviewed-by tags 

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.

Srinivas Kandagatla (6):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  6 +++
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 ++++++++++
 drivers/mux/gpio.c                            |  5 ++
 sound/soc/codecs/Kconfig                      |  1 +
 sound/soc/codecs/wcd-mbhc-v2.c                |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                |  2 +-
 sound/soc/codecs/wcd937x.c                    |  2 +-
 sound/soc/codecs/wcd938x.c                    | 50 +++++++++++++++----
 sound/soc/codecs/wcd939x.c                    |  2 +-
 10 files changed, 84 insertions(+), 15 deletions(-)

-- 
2.39.5


