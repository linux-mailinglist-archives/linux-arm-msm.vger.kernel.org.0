Return-Path: <linux-arm-msm+bounces-24440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 084AE91A5C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C0E81C21860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3620714F12D;
	Thu, 27 Jun 2024 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CyMoeFw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273B14C58E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489362; cv=none; b=Wto0OOj2ZKYoR+dKrioNkdeaAMm8wpq3G+p1obcVKAwn417zWUMZCj6EXEtwcUhHoPDborZgTEtGaM8Ly04ITDifi9SFrJEs/XZq7qAwBmR/SdX4b7vJE/nESiTUBM/QIX0akLfPwon3WteMVKNajDj100c4O8fuHgSmPZQBK4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489362; c=relaxed/simple;
	bh=Y6a+CFWgHPXv6qT5Hp7vM6uhEG/AZf1fZ0Ct7WBiP/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lx/tu+2EUQ06SisIT+2hkwNGqIA3Yt2BClnTIvEVu5ieHdrcPBAnxpZfE7mGlON98UFjCLNZy6ubWnNeYdM82xebaBRIb4SDEiqyIvkZX9H+I++9MFZ7nupHnuqfWeMNl8aZojKdtk5MfNkMATYTCLUBkF16XVUfgF+QZqsbsm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CyMoeFw5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3636c572257so6322132f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489359; x=1720094159; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YnmAO3MDDhvSz55Ee35ZPJLjBLn/4qKkbnLt4Qs0cQ=;
        b=CyMoeFw5y3JjPWidmTQzu27i2lq1V0p4cVkRxy7TRnh3WdoxxJ08Gr5YSwloJgReMS
         79lYjJZsXdMCuum2R3or0pQ5bXP9nwOOopKNWCOz8v+t4JNS+SNqsdKsusKNhvN/QOu/
         VpvRcOliMLSm+YzN4AcvOwb3RU0hwOdumMDIL4GWaufLjk3Iy/ZyvHJUC4z+rKc0yqQw
         P4++n2UfIojk0WAWhaZZxvNB7hf4yLpbWHTJNFVU8J5b3p9ewoRYItTxmzdj/E/L+gs2
         t761/kX3mG47kGtNUgJFKUQT3v7jS29KHjgfloLGnmo4kr1wlyrmvcbfzVnXpK0FI57Q
         Tg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489359; x=1720094159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YnmAO3MDDhvSz55Ee35ZPJLjBLn/4qKkbnLt4Qs0cQ=;
        b=q6IWWq4LSS1nIWO8x7IY9uvKUQrqpXEmcdzo1IOfKKfh7tVX0u8p1H3oJ4nypnR9KY
         2aRnFFFB+E9As16AplqglgzsuG6o3nHNV29wJGlMYUSDHdwGB2HYTdSo6xX6kp6gj+ow
         lSCeVCvd/Qp6om9pyMoDCDiQ7JXhOkfdHl+O7VOagWYX2T3JvPwi/qpCLfvSN7W54BLH
         YP8Hcf3HwRFSWJPfG04JBt/9wiO9Wgn9XfCq8bqIfXmNmhx7qnETnko4i8ypSTL5SUIf
         XpH7/7HZDZ8fp6OlbEaqghKmXUG/wzUnxUpQoIcCAPMDYXA6Oq2tlTohLQMLYSCxBW8h
         tz3g==
X-Gm-Message-State: AOJu0YwRsvsrTZ/zvJOZWXvZkrV/a4KBWuN4JKsPuWV9G115CmNrduvh
	NIXMlUVH19SulAyxJvw9sPQBY15VWL540jcfqwiaDph9jMw3B8toZNkpFxXxF8A=
X-Google-Smtp-Source: AGHT+IFCcsrDv77XmQBH18HYnTVf9w5zIC4CEAbu4wPpEDmsx0NRwUNfy6dTe2MXhewFcCnLX56l3w==
X-Received: by 2002:a05:6000:4594:b0:362:c7b3:7649 with SMTP id ffacd0b85a97d-366e95eaeedmr10169584f8f.56.1719489358695;
        Thu, 27 Jun 2024 04:55:58 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:55:58 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Subject: [PATCH 0/6] ASoC: codecs: wsa88xx: add support for static port
 mapping.
Date: Thu, 27 Jun 2024 12:55:16 +0100
Message-Id: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRTfWYC/x2NQQ6DMAwEv4J8xlIIKYd+peJgglN8IAkOQkiIv
 zf0ONpZzQWFVbjAu7lA+ZAiKVbo2gb8QvHLKHNlsMY6M9gBc9IdV8rI4WV83xs3O4KqT1QYJ6X
 ol+ew+bRiSIqRz/3Zs3KQ85/6jPf9A60tv1p6AAAA
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Y6a+CFWgHPXv6qT5Hp7vM6uhEG/AZf1fZ0Ct7WBiP/4=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNbQVTHgiekg0lErk4gt5ZWmMGBmysToq7S
 t48/kIo622JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N6V/B/9AkRh3hlZAiigVdic/fNvxeVo66fZnqgO/Q8IAgdIpjMxo7qSFqoMZFmordGgniBjUHUS
 kfY3HrEHUV6I6pPpVzVn2AFmv/OXXzHO2qN7UEYWyF4CfTxpjwEVMjMHZTUOOF9l9E8ppfCzjoc
 jc9KYXFGb3TREZx/wLZ+7Q5kMHnhmYnrGZv3Ch7vLjN3dVaZ3OYWOQF71+08qwJrlg5oaflKgwL
 bk1YKD9vzdOO56TkEI5Gycsec2yaWwUmHDsSxW859bUdeUQTLPCxw4+vyRqOMGIuyEP9W615rKM
 UJSgbtUu4Jt296ZnPZS4OVbCgHyU444GWLGHdEbdx3igEKRT
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Existing way of allocating soundwire master ports on Qualcommm platforms is
dynamic, and in linear order starting from 1 to MAX_PORTS.
This will work as long as soundwire device ports are 1:1 mapped
linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
are NOT mapped in that order.

The result of this is that only one speaker among the pair of speakers
is always silent, With recent changes for WSA codec to support codec
versions and along with these patches we are able to get all speakers
working on these SoCs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Manikantan R (1):
      ASoC: dt-bindings: wsa883x: Document port mapping property

Srinivas Kandagatla (5):
      ASoC: codecs: wsa883x: parse port-mapping information
      ASoC: dt-bindings: wsa8840: Document port mapping property
      ASoC: codecs: wsa884x: parse port-mapping information
      arm64: dts: x1e80100-crd: fix wsa soundwire port mapping
      arm64: dts: x1e80100-qcp: fix wsa soundwire port mapping

 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                 | 4 ++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                 | 2 ++
 sound/soc/codecs/wsa883x.c                                | 8 ++++++++
 sound/soc/codecs/wsa884x.c                                | 8 ++++++++
 6 files changed, 38 insertions(+)
---
base-commit: 9935be184a55dd84fc3275094f2df095491f6ea1
change-id: 20240626-port-map-ef50c3304d4a

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


