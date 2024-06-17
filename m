Return-Path: <linux-arm-msm+bounces-22853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1590AE93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59B7BB21E2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEB3197A65;
	Mon, 17 Jun 2024 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzE+SCyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D151186294
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629417; cv=none; b=qxaV5IMC9t8jX7aeeX5o5PEcbedNb0gDX8tvhO9Ue2dcbZ9E1M7VflGEOoA0j11bJMXxMyvOQO0WBaSi9DWItS7yg3jkL6iYkdnVrsJyMkbpuRkAifzsxBzZ/pqWYGVRHWw1yNFdGbetZPpV08Qx22DvP7UKVw2Uv2C702LJImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629417; c=relaxed/simple;
	bh=YWvpQ0ab4Dp6gKq8jwDSX4NydsgeD85hsgBWMfw0Wak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fFU0h6LPvzYePQYicnJsPgdRvhyLc4/gV/d943vdQWaLaUtPzdaFnSsZwXaG5fFRutYpzR8gJs6IuD1cbPRfS0ECX46xtmyNywEEE/kJ7vNFBx3WQh3p038jQCPNS9UOBX52ejjjHljQOkvgwGtbJsuNBZ7BP537WJm+b3NdsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzE+SCyt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f51660223so253496966b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629414; x=1719234214; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0h98bfk6InRRrhm6wwIHnjZdloO4BC8T6hc9Gmbf7c=;
        b=AzE+SCytGUOjt/YFp8MrG2VCasMypd9BFoZYkOCW/Ql95Z5emayfBWmx5nwZUxc13L
         9Hw3I9YLfC1PaVVkhm9uH0dblqzlW9OpJaHQAb1H69nk5ka7eWmJVr3wIohHXh/7aWz5
         ItkY0ljkngwrWhdQeeWdypO9icEavIKAh4jjIifvO3NAwAJDyr/wkM+axEQeEwXuhaWn
         55ebNukKSzFTMAKM8iu8cj9CYt5JdxOrQlWkqoPLWQCPU6b9Xe43k00Vw+hvEBFX1Nxs
         /PaD8E09M6jAHgFSHbf7VVyOEOsB1KdO2r8NOTsLvcEDKREnL68ArAZ6zexXX9OehnFk
         WxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629414; x=1719234214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0h98bfk6InRRrhm6wwIHnjZdloO4BC8T6hc9Gmbf7c=;
        b=Ez/rmi0KYv/MjmpGX7rVA5xawsWApxQhdOfHf53KeB4GBrsrUEUEv8DDqb6vJWx7SW
         tofv3pkqcJm532NCisWucEwHYwxB3amRyvMQoENNdDPOu+kfj4gwdRhqcy5FdkhEMyHh
         ndOkSSmj9+F9B6k7gAVXq7X7CMUllWgi1KIxZn8oX5gl8QF3J59cS+L826saOrk5PHVd
         /MXyzljO8FrH9BGixArtLaJKsbjku4qOg8l/V+8Cj49/GsKaudU2NM8SqCZuSuO5lWyF
         SPiLbKo8aKNzwV8iZClIqc4INT43awx6FierLz8132Q+R0Zn+3nvPMZyqeoQtKGP1UVY
         a7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMGxDaeztjMuAw+jpNlPx5Jb/EctxAbY8huEyQ44J7l3JzJAbgygQeCxzaXIv3LP8+QZ7fwzsGh8Q4AOTQXL9ItpfEju0s+kxPtnxYIA==
X-Gm-Message-State: AOJu0YwD94fwWJ6j8aMBFW2OsoXUN8gK2QxzxdRGoyOyZo/L7omb3+FV
	Pgse0P75RR/3GyHFpAHE3Pim/VoMyTlhkcBSOtke8VmoIRdmef2uN3yRgXhV6hY=
X-Google-Smtp-Source: AGHT+IExtTHGNouiNFqgjEiT+LPP433XAeDYx1y6ZS3ofgzCUaUo3A3zQURDTqIS8cL0nLldaqPNSQ==
X-Received: by 2002:a50:c056:0:b0:57c:6338:328a with SMTP id 4fb4d7f45d1cf-57cbd6c7589mr9110762a12.30.1718629413597;
        Mon, 17 Jun 2024 06:03:33 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] ASoC: Few constifications (mostly arguments)
Date: Mon, 17 Jun 2024 15:03:18 +0200
Message-Id: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABc0cGYC/x2N0QrCMAwAf2Xk2UA7q4K/Ij7EmGpgNtJ0Qxj7d
 8vu7V7uVnCpKg7XYYUqi7pa6RIPA/CbyktQn91hDGMK53jBguTGyFa8Ic3N0GUSbvSYBLPVDzX
 HeMzMp9BJCXrqWyXrb9/c7tv2BxQCUup2AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YWvpQ0ab4Dp6gKq8jwDSX4NydsgeD85hsgBWMfw0Wak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQZw8CQ6TtEuwrDOfeyUso35j7jNCqTLG3G5
 N7+xDUTMyiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0GQAKCRDBN2bmhouD
 1zYrD/wM2IO5gZH/cQKpnk2qBqusJLmMij0sMKKL+5bcwpi23FojEa+GuWh2EMwPnjTj4utyPdh
 7JyboAxvTe3MZGlgXPUZr//nic+0BYW3WSW2dSWyS3VNGxTMjA8C3VMl7miscFV5+tjWrIKG/a+
 NDQzoAU9ilfXFt3ZWvOxUetiq5VTtYUFRMhLtYdOUzI2HyVSTAMvOAOzplMXLw0Kn1NM4zjOyY8
 33Tr3e8c11tHUS8Awv97pIb8lfTuQTgT8C9oR4zvRRQUXvP34ADYrAbV7Ydf8+J5nebLRFoJD43
 SNXtRXhICMRfQTXFZPoKoVE0tGA+8uNNhGVmwL9cfpMI4MIo6lE1MS5Q7v+33zdAdEo8jzCfRD9
 mpcj8evTj7sZkVbmZ6HMHj7wZgwAdto+7I9K4W5Be0yisk2WSDiUrpo88c/gEEqNr+zJ7WgRakk
 zfD7QmCqNEGROVVso0LlINeb+qEiIWUAKol8e0JDrt75EycYs59LTFfFmdI4Ax2s1zl4m1yx/8m
 Cfk2cLZ+24AvyedFrIbf6y+NFPbCXrV14Pjc044trBQlKBO64vdetO0eFcHTD7sTiDFgjHlRqvv
 9XzFHZRmmhR/46sCgsTx9t0k7DsM7QpepXg1Y/w/+eQELXsW6XWyG3D386IXRB5d5ber3QVrd9C
 NNtbwNuw38cNWKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make few pointers in ASoC functions as pointers to const, so the code is
clearer to read, a bit safer and allows further constifications (e.g.
placing some data as rodata).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: Constify of_phandle_args in snd_soc_dai_driver
      ASoC: Constify of_phandle_args in snd_soc_dai_link_component
      ASoC: Constify passed data to core function
      ASoC: Constify DAI passed to get_channel_map
      ASoC: Constify return of snd_soc_dai_get_pcm_stream()
      ALSA: Cleanup trailing white-spaces

 include/sound/soc-dai.h            | 26 +++++++------
 include/sound/soc.h                | 19 +++++-----
 sound/core/control_compat.c        |  2 +-
 sound/core/device.c                |  4 +-
 sound/core/hwdep.c                 | 10 ++---
 sound/core/init.c                  |  3 +-
 sound/core/memalloc.c              |  2 +-
 sound/core/memory.c                |  2 +-
 sound/core/pcm.c                   | 22 +++++------
 sound/core/pcm_compat.c            |  2 +-
 sound/core/pcm_lib.c               | 41 ++++++++++----------
 sound/core/pcm_misc.c              |  2 +-
 sound/core/pcm_native.c            | 76 +++++++++++++++++++-------------------
 sound/core/seq_device.c            |  2 +-
 sound/soc/codecs/lpass-rx-macro.c  |  2 +-
 sound/soc/codecs/lpass-tx-macro.c  |  2 +-
 sound/soc/codecs/lpass-va-macro.c  |  2 +-
 sound/soc/codecs/lpass-wsa-macro.c |  2 +-
 sound/soc/codecs/wcd9335.c         |  2 +-
 sound/soc/codecs/wcd934x.c         |  2 +-
 sound/soc/intel/avs/pcm.c          |  4 +-
 sound/soc/soc-core.c               |  4 +-
 sound/soc/soc-dai.c                | 14 +++----
 sound/soc/soc-pcm.c                | 26 ++++++-------
 sound/soc/soc-utils.c              |  8 ++--
 25 files changed, 141 insertions(+), 140 deletions(-)
---
base-commit: cf32e2eb8404572eaacd219dde4e703fad349299
change-id: 20240617-n-asoc-const-auto-selectable-formats-13fcc5000044

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


