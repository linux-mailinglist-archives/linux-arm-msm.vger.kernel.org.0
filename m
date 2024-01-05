Return-Path: <linux-arm-msm+bounces-6525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B959582575A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 16:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5E51F2398C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 15:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD2E2E65E;
	Fri,  5 Jan 2024 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNGqpVmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00E2E827
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so18238435e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 07:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470363; x=1705075163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojBQKqXKo4lu+tyGs931tVbnWS1sxtV4aoVa4f902n4=;
        b=nNGqpVmqfYsekBYwNqnTL9MtQT3xGER4o/P4DD2jxZds1UhuCvHf54Ams4AMwIHvYF
         koimkBgwiWIUQhGylOhidELmYt0aBt2W23Ney5GyPi9fcLPU2gq0IIDhFda6Vil+6Oas
         BtZm9nAdGPaX6PHsXjh9y/nog6UBCiJlVx1C+IDl8C6wOf7LtBOcmvGMhHMlnCmmJemB
         iymZ4bJZZ9hkIuOjUx1bfGwS57ZD2jDi1zeMkWrbi2o5HQUDWg8wXdJmXseFhL00GyKG
         zZDyTZyt3qkMkc/DXRih0uQbf+JJPwu+VvBCdsWIQaEDBXSjiTuOVLhN/EECSBK6wJWb
         RLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470363; x=1705075163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojBQKqXKo4lu+tyGs931tVbnWS1sxtV4aoVa4f902n4=;
        b=fXG845UCUQMy3X+/eZ/KfUMBVlKm5925meT3uLSc7Ss3PUrDRFKQJyMyejJ0lLep/A
         cLK0XC/fsi1blZ4W3Zn+jWIU+GAgc2Mro1c3swOoYCfbhOOBKY7wflCeTg4U7Fs1VUiB
         pm1/p+eDDGTY2dzMdZdSrKV3Zz4kIKW1jyFYvab4xLCZXBwtc2BnR1mLM+zTQhP0JGMM
         0HFA11iFTT4rBDXMe2cKmelWFeeZyh7EnB49UsYDO/63WsfMXq/RKTrN3d4T4ecgoIky
         YzMYoLL4/F+q7KYOrGKasWqPzZfPNdWhx1XbVueGWGdZ56A8NbjevjaNM6IB241K15Y6
         OpKQ==
X-Gm-Message-State: AOJu0YzLTEPXdp+jhOvPR6LCqNJMzmSwx5m1vYNY4xpGfkWlGUy+N8QW
	vbH84oKdM8Pg1n3Z+X3ZW6NpJgvPIU5RfQ==
X-Google-Smtp-Source: AGHT+IGwV4OwKKATavp8Q64GytM17HdFfAv5ZKYAelGrsoZCfrrWxmUv3Kzk+4KdvDrMFQQkbNmewA==
X-Received: by 2002:a05:600c:45c7:b0:40d:5f86:cef4 with SMTP id s7-20020a05600c45c700b0040d5f86cef4mr875290wmo.235.1704470363063;
        Fri, 05 Jan 2024 07:59:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id su8-20020a17090703c800b00a29910a9366sm326024ejb.8.2024.01.05.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:59:22 -0800 (PST)
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2 0/4] reset: gpio: ASoC: shared GPIO resets
Date: Fri,  5 Jan 2024 16:59:14 +0100
Message-Id: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes in v2
=============
1. wsa884x.c: add missing return in wsa884x_get_reset(), correct comment.
2. qcom,wsa8840.yaml: fix oneOf syntax.
3. reset/core.c:
   - Revise approach based on Bartosz comments: parse the reset-gpios phandle
     with arguments, do not use deprecated API and do not rely on gpio_desc
     pointer.
   - Create a list of instantiated platform devices to avoid any duplicates.
   - After creating reset-gpio platform device, try to get new reset controller
     or return EPROBE_DEFER.
   - Drop the "cookie" member and add new "of_args" to "struct
     reset_controller_dev".
4. reset-gpio.c:
   - Fix smatch warning on platdata evaluation.
   - Parse GPIO args and store them in rc.of_args.

Description
===========

We have at least few cases where hardware engineers decided to use one
powerdown/shutdown/reset GPIO line for multiple devices:

1. WSA884x (this and previous patch):
https://lore.kernel.org/all/b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk/
2. https://lore.kernel.org/all/20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz/
3. https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
4. https://lore.kernel.org/all/20211018234923.1769028-1-sean.anderson@seco.com/
5. https://social.treehouse.systems/@marcan/111268780311634160

I try to solve my case, hopefuly Chris' (2), partially Sean's (4) and maybe
Hectors (5), using Rob's suggestion:

https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/

Best regards,
Krzysztof

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>

Krzysztof Kozlowski (4):
  reset: gpio: Add GPIO-based reset controller
  reset: Instantiate reset GPIO controller for shared reset-gpios
  ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
  ASoC: codecs: wsa884x: Allow sharing reset GPIO

 .../bindings/sound/qcom,wsa8840.yaml          |  11 +-
 MAINTAINERS                                   |   5 +
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/core.c                          | 176 ++++++++++++++++--
 drivers/reset/reset-gpio.c                    | 121 ++++++++++++
 include/linux/reset-controller.h              |   4 +
 sound/soc/codecs/wsa884x.c                    |  53 +++++-
 8 files changed, 356 insertions(+), 24 deletions(-)
 create mode 100644 drivers/reset/reset-gpio.c

-- 
2.34.1


