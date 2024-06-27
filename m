Return-Path: <linux-arm-msm+bounces-24484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3A91A97F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F411F22800
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ADA197A6E;
	Thu, 27 Jun 2024 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bq7+O61t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DAE195FEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499487; cv=none; b=n/kKI1nwT78BAdpLxTlyv+Dv7ecvMjJ5/h9qGR1F3ve6vU3R9Uqc+LS7bWFs4yeQWJMM+Vcyodk1yZpB5HyAj/FmGfWskcKkN3MVeaRU1OYYWxRtIyqVFOlDkE+CgxpEHb3FA2eX+HVrRxdITmGwRvnHiYlI0OeM+jJ6opGybvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499487; c=relaxed/simple;
	bh=TUm0RaYqomUaGHfxczMiGxcHyL3VSRfdBI0wiwOJXjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TrYRhYFrHEHMqs9iVGTVkf+wSbgVczTCmB4+lQBhTrzq5/EtNUPS2BytXrXx7dDxoxkHDvnM2caaA+xm3EWrj+MSsJw+HTnHyAQMRsmG1T91Urk9IdNJX9CzY8DdcZzha+uC3D3gsBq2Nw8cFkpfmZ4V8eR3jYWTJm04zOE/TL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bq7+O61t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso23641675e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499482; x=1720104282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AmLpAWmlJIdMq/VoHVTuZd9JbEM9j0iTEvmVKd3mZ4w=;
        b=bq7+O61tOaBeln+H44V0RXUNPKUCaZV2HS/jU32awrS2YTpPYXbTNiqVufRo6/hC2K
         nez/FkAvyMeE0if5sX4D/YHyqNzzXJ5cWhbh6JtxnJUOdArUam9x9WrwkmHbvF1EyI8F
         6HtpwOi8CI8Js+uaP8d+SmVtzoQb6b9eiLXPnAz7ZYVtcmSgC/nJblC2F2//Z+AGjazS
         r0tD6aExt84FxgpiiEAr0EpcoGXwC9u4d3XiZqmqbD6CP/DZ81tFy99HLfcMdORC5ymN
         Fy17BEmjNGqsrQq1tY5QvpwtvICe9PuGMwtLRHQL4jRnqlDc5bxvleNmQJa6LF/ybiRk
         1EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499482; x=1720104282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmLpAWmlJIdMq/VoHVTuZd9JbEM9j0iTEvmVKd3mZ4w=;
        b=njMNEECVfJCNzNiYHd//v7Hinan4ry/GqUGeKl+UedDqncphaNdqMo2kzxecIlOY/9
         9WsDOsrzK+TLgnbeRKu0QUgYBF1viSPMenD9NyJ1xvwxM5xDzT+zty4WHm5aX2ywHrXb
         mYOWWj14j+vlNn8oXgAwC6Ohq0Art5v8yPBsAC2Y6YyOAmBTE/NadgpZrLJD+q0bVHVF
         +VtegrAeo9DRpADVQe9CDwCSZ6XpxmrhQvPnXDytTaOYPw1m0ZKgXySwFL1D3VfBXrFo
         rsSzLLW9biuffVlNortBCkZhPx+M8EVPUyROn2dDgigDMI3WfPuu9LxAAdUjgtMcJHNO
         nchQ==
X-Gm-Message-State: AOJu0YyJ9+lfp+EFR1HZU3Zp1LYfhIELtTEK7LJaTRY3F9TLgePx3IAq
	CFaiDpgtfAHa9RnCDc8RGCtiRxhZLSuDZTFTuwoVUQZJRwDSiEDiAOoPrc5o0gA=
X-Google-Smtp-Source: AGHT+IGovERBfpldUSDoy9yj6OyIfZTUPkLDC3sHsnVcAxkg0Vg/RCJP9nojWITLyBFMPwHPCMaAEA==
X-Received: by 2002:a05:600c:460a:b0:425:6976:f5d6 with SMTP id 5b1f17b1804b1-4256976f94bmr391785e9.33.1719499482639;
        Thu, 27 Jun 2024 07:44:42 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:41 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Subject: [PATCH v2 0/6] ASoC: codecs: wsa88xx: add support for static port
 mapping.
Date: Thu, 27 Jun 2024 15:44:37 +0100
Message-Id: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANV6fWYC/22Nyw6CMBBFf4XM2jG1RURX/odh0ccATaTFKSEYw
 r9bWLs895GzQiL2lOBRrMA0++RjyCBPBdheh47Qu8wghSxFJSscI0846BGpvQqrlChdqSHPjU6
 EhnWw/X742DhgGxkDLdPej0ytXw7Vq8nc+zRF/h7m+bKnfyTzBQUaV9/rm5NGKfl8+6A5niN30
 Gzb9gNqRURKwQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=TUm0RaYqomUaGHfxczMiGxcHyL3VSRfdBI0wiwOJXjs=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYjFzYED0KcuZ2JaqXktrm4rVyEowwWxnc7
 ZMDozvIgn2JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 N5JDB/43Bh6z6Gxcpdr+eCHQGR8F/SIcmOhRRJob22JEBqE9fxst1E4BmGL2OWc9anSJ0JiQvkG
 wDIlBGjV1kd2ClZwCkihYlOGZqDyxLdstSPAqpthkcIiPFejtitraxcVTB6sKMsdHRduPfak3qS
 qlE78YAwYpcjAq3tZyO3XkgrsuaJU3CQlZjaxe5lky/jxbnpINsDWMv8ZgyVFZziwHTOw6IQlWP
 blVTM+0Ha5AyruwnFkVODH/aJ0JgMS5n/LcsSVU7qW8mmlC/f9K27eXosEO7HhQcNiAN9LdM8/o
 /VE0NoeMHe8r9saW0v5K8xUmAzVcYdrw/i7xMiAdl4CeMkAJ
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
Changes in v2:
- used dev_dbg instead of dev_info
- Link to v1: https://lore.kernel.org/r/20240626-port-map-v1-0-bd8987d2b332@linaro.org

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


