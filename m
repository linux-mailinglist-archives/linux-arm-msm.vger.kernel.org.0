Return-Path: <linux-arm-msm+bounces-51911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA114A687BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CA317F9B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133A8253345;
	Wed, 19 Mar 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psqRCYKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566362512C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375874; cv=none; b=FU5/y/i6ba8QJ/x3mwWRajSJqHlaMdMQzjdIRfz597fj+353ANParJgSg7Cq++99QuVt6eYc+RIDTQynImvwb2cgACpa611QFuDRghwRCKaX736zShJYBDhGkVB6BbNzLP0B55NDOz6cphZeqsXwl4so20yRfsofeAx0EzEnKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375874; c=relaxed/simple;
	bh=VPh5eje9bAcWDgKXkvNDiNcxKVyg6L/lyX536kltyjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=po9tpdixSjNm4k2FpFTr+pmSmZ7MJJ59/WcVICLVcvIL4gAeks18o/XNHrRndITSkn/yWcOvihJiQlIzWespBanpV4X1DwvwVrHRlEJXGOmayWS5XQ6m+l/c3gXIzjiFIM4gXxb9A3goVBBQEBWQE9vU75Ynkr9ZTX0X3OIthhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psqRCYKa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5402538f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375870; x=1742980670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu9AneJ6jeTssLgq8R/dkhVI+8UdajKVGpFrU+v3rj4=;
        b=psqRCYKaXIvspoe0E0TDmR/BP5gsCMay1Pp6vir0zKoYOcoJVIgyw6O6Can4x4lTuB
         xFUf9vS6zEPzeTbMeqsrgoOw7D82kJ/nj0CNKqY1SECHlexuxaq3ugKMRpCKoc7T6Ss3
         JwDrUxzGUlRCegKoJ5qsWyN+jkUhNTgHiiofJhedVFhvS+KRdBZFwEP/A1yvGJiXCb0G
         VZZCmA78GLE1QgUQ4XBpC4gOPn1o7ccJZelqE1eVZMFEkUmEsCX8SxCCobVKoepC4kP5
         ChKxR5c7w9pdjUn+zB+n1Byc3Owa9bRdVQVj8RxT9TL3BSXsNjVfhNBA3TOqcy95Js1M
         kA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375870; x=1742980670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eu9AneJ6jeTssLgq8R/dkhVI+8UdajKVGpFrU+v3rj4=;
        b=MR+zcLdT1rf6QRleXQCI6XxreLGiOZ0r5cUqqurQaZ61Bl/L6cSnMkMnxzOoOQUPak
         QPtZ4h+PIc6FR4l/w78mp+5Xjh46ZlNhLl3AqO1+FqOsnunt07vL6J4nvo6Fc/zbukz4
         6M4pKqQT9ZpVQZ+xl2gPUhpRQGhxGg0fXHKsi/J211GdTbR4elXZuesjITacOmYKzMOy
         OkyCl6Wsfa1N01xGnK7rzO4AbFw6HC7U67hjlMal0w6H/7MWpMlZ3qEwlPeOn3VyUzXK
         YCNlSGK3NL1ZToW5BQb1065DdOpkV3RDEc3ZabunYwTGm55ul3LYTyFT/mQgOT1HVab5
         FTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX42ZsrHENujasem6xueOS9OjKwySXJ3wQkBHQIsz3dkyANS6zIO5deyoERpCooscAmwHIPW/Gi9epnLaar@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3CnLbsju/JrtOBL6q9WPo+4mnXAJ7d98hFIA4Ze4rlUeOjFlX
	K5xKl79GLw+0TAC3AoIcKCLTxIRDOsSEWogfFsLKvIc/39P8PuIcnYa9dL7Uau8=
X-Gm-Gg: ASbGnctVpMY9r1J5WUvK3DJMo8U9WuwluyP+US2tBaVh9w4g3QhaxEBh7vkzx5J+T2B
	HYW12GRcsGBBl7kESoF4YzbeewsD5h6NWj80sEF5jLC4XXoHgHv84a/XlXGyvYYCG1kGmDHaZEt
	nz88s2u6/R58l8W0XhE2UUZh/7/JQumnxlYYVGpNDqmBz7OgDP6BQlbeDnfKPHtLi/owJkgHHRZ
	INGNROpVvbj3rBopvJW4WWaGflv984zkKCt3IANaRkqRBj4HR2GRrKPGr7wvRHzKsqPKe/HYUkb
	h+0mBFaOMNYupE3FvfzlPGSLJgOVnlAaYvM+Ha+ZQmWIZDyTvHGWEtYgpYt76nunRIKakQ==
X-Google-Smtp-Source: AGHT+IFM+lzR/VCSJcNgqIaD4wovGQBkSyZQxDj6HuZig4PP75GSKCAEII3ZXglrni0En0micDVRvg==
X-Received: by 2002:a5d:6c61:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39973afaa73mr1518826f8f.37.1742375869548;
        Wed, 19 Mar 2025 02:17:49 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:49 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] ASoC: wcd938x: enable t14s audio headset
Date: Wed, 19 Mar 2025 09:16:34 +0000
Message-Id: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
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
   
Srinivas Kandagatla (3):
  ASoC: dt-bindings: wcd93xx: add bindings for audio switch controlling
    hp
  ASoC: codecs: wcd938x: add support power on hp audio switch
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../bindings/sound/qcom,wcd93xx-common.yaml    |  4 ++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 18 +++++++++++++++++-
 sound/soc/codecs/wcd938x.c                     |  7 +++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.39.5


