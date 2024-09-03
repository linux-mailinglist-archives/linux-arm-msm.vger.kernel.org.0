Return-Path: <linux-arm-msm+bounces-30504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D6969937
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA5B1F24D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662921B983F;
	Tue,  3 Sep 2024 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vrieUW9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50F1AD256
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356203; cv=none; b=FYYTXdMP5b7QxVhb9K0WQDNg3rUE1cAtkvMCXxyvVV6KQdY0kzpo98V78l7qX9V7ZCvMkq0bGYjjSzpXWRd3hBSJc+QF1i/fYG88LoPlrsxf4PrYFFCmiWDbaw1B8K9E9Tpt44G09ZOpg91+VDZegUJulTxM9M8SG2PE5qlFhhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356203; c=relaxed/simple;
	bh=l9la1v0zUehD2cTbZj5grL20PvMsJjIx3qzzkBecL00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTqMhsKeOOdSxX2jlJ6O2u5j4EHKvct5nIilRPppH2vBbBe4lo725mvdZcg/qnwSjiHE4C/OjZsalh0vuXyN3R8NNCFuvUrhV2vzVSBdkegdPWJra36ZK2TrB5L60MTrv53dix1IZJSi8Li1d5ITLFYLAUMVv1IVcXQAu02NSwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vrieUW9k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c3400367so1837497f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725356200; x=1725961000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUig6PMN77FfWMVlDW1tFQu8YNW+SV2Jr7UO2hwr6hE=;
        b=vrieUW9k+uqWKnVm1UuWrKN9O0+htRt21pVCG693wC3BVMOX8efDkRuYXGLeoZ0AXj
         1E8UnKkLgHYMj34dWNHgHjPhBsnSUs4/4ID2zC2BrC3UQCgrGhcMJ90LAUNu5vn1hOmW
         Ls9iokxp/4HwkE6mOwMkFcT73VGph9M4l2dPPjaOn2433Aa+1Qnlpf+H8Pqt0r4m4rIS
         Y3vUD0dywkV9JtpICHJPOvUi9jtEaibaxwvaH8i+dFU+2wIfOV3E+DPZ/PBUbLJRYkN4
         CAmWpS5bqlBdZBA2RkJ6nie5eUF7p2wkBvGeXSyVpJWmdUILEjzxu9sORi0EHMwhMSHs
         c4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356200; x=1725961000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUig6PMN77FfWMVlDW1tFQu8YNW+SV2Jr7UO2hwr6hE=;
        b=vkkLHdQyIW37SwldMFLjj1174ZanBxkdkb9TiQXrjEERwIvXew6ggXguCO4f8cj7zr
         EQHtSRQs/gn3CQMlxFat7zAByFChVIGhCfN6uaC7T5jODWlRWYBAal/jCPHrzBZTSZgI
         txua7Jgn4wQTiJiZ/XjiAKu7Dyo8PbPsO/MsY6LR5ONpcF3KvbDwB1mSIFPsgrGt/LNK
         HGIDXNQn4c2zbq3ofESCl2XhiKdyf+2i4ep/tD7jA8R3E67lZpp9bchZIXmM+hOSabO1
         2Bvg6VcoEsT8A1HGgLG1FBW+uw0NbMesomn9IYf2HdYA6F4llZrQfQP4cgGXXegZoqZJ
         aeAg==
X-Gm-Message-State: AOJu0Yx6JD+CBFMdgSKA64/udUgZqC1RV7tcsaksyBoTDRa5g3smPg75
	Pia+CjlixVwEItBa877WfdM32IvPRWGed4xeIbIbu2p23o4898AjFTLL1FqVJHQ=
X-Google-Smtp-Source: AGHT+IFC/d7s36B8VDRRB0siJljwsah44aMKCzW17pW4yn2cf6YkAVprUlhE33xt5YCFHls4D4CBZg==
X-Received: by 2002:adf:f892:0:b0:374:c64d:536a with SMTP id ffacd0b85a97d-374c64d543emr5427571f8f.27.1725356199126;
        Tue, 03 Sep 2024 02:36:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e61d:37d0:a59f:d06f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-376914bfca1sm790793f8f.18.2024.09.03.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:36:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sc8280xp: enable WLAN and Bluetooth
Date: Tue,  3 Sep 2024 11:36:25 +0200
Message-ID: <20240903093629.16242-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This enables WLAN and Bluetooth on two boards using the sc8280xp SoC.
For the sc8280xp-crd we add the PMU, wifi and bluetooth nodes with the
correctly modelled wiring between them. For the X13s, we rework existing
nodes so that they align with the new DT bindings contract.

v1 -> v2:
- fix commit message in patch 1/3
- drop drive-strength from the wlan enable pin function
- drop the calibration variant property from the wifi node of the CRD

Bartosz Golaszewski (2):
  arm64: dts: qcom: sc8280xp-crd: enable bluetooth
  arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855

Konrad Dybcio (1):
  arm64: dts: qcom: sc8280xp-crd: model the PMU of the on-board wcn6855

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 166 ++++++++++++++++++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  98 +++++++++--
 2 files changed, 252 insertions(+), 12 deletions(-)

-- 
2.43.0


