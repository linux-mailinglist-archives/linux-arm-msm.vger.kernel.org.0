Return-Path: <linux-arm-msm+bounces-27548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA794332E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35851F27460
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F721200CD;
	Wed, 31 Jul 2024 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZI7nsOtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AC17BA0;
	Wed, 31 Jul 2024 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439565; cv=none; b=SobXDxTZBXFu1SXMVE2ehIk5+kGQGDxVf7Tlidhkgy1UC/Rxj8mZdYP9aiG9Rymn0Bo3c79MRluyW8simB7nK0AkUt2e+eZPIgznb1fhZAGBU57x4h/9tKK/myvqjW6ECMY39oIJ2+/zcx679svNaQOHvtitig3twhs5rLExVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439565; c=relaxed/simple;
	bh=UphWNVZYlMYttOLUSGt7chhQN6dwPnt9BAjSq7UQ/tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s00ZsIl2TlmJCNnUIBMLVnUWfj9blS+bnJsMJKLN6iaGtjcYszT80G/EKfYZUND6+hdMbmHfU+SewFahUCD6GkvO0xDPWXKUunjkDCM/Qh071d2oyQhd+Odg9JEbq6vkVy7Qo/lmr74ePnINAM6Pnv2n7fujt094AnqrzAk6Cxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZI7nsOtG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so49296295e9.2;
        Wed, 31 Jul 2024 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439562; x=1723044362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RQ2igsSgu9UFJsBcOr+mrcxTGh+1fHmdEJppZglmtA=;
        b=ZI7nsOtGiVWRt9q9r0W3cFq7mlnOcbu/THp2Nn6yfDu6cTmq+07Rc9Q3cUCc+HrA6r
         gplrjo8PL7fOxcGleb0L/R9tDfB4UhH+Nb0oO28mMQJoxg+Ce1ozgjyyf31Uay7ZY5MJ
         /xdUACHHsy663q1ZCvpTYfjcOmFg1MZFdSlpoFgYkYiHE1Jp2KQh19I3I8Imksw49wpB
         ax0La7nMGbgIdA5F+yfYHG6o7fl1SxV0V4TaG2Z08hei4HJlef2OVARTp3ePjWxCZBTk
         Leyx7JTqJQZ1hvdTTfN4F9vlda71cjioShChXiSZw7LH3C+TpvyyqRxsuwPh7ZPv8TMo
         Nzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439562; x=1723044362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RQ2igsSgu9UFJsBcOr+mrcxTGh+1fHmdEJppZglmtA=;
        b=KMwNRTyxuTun0VJ1bGeGd+34gAeEga5/gIce1t8erw+LbWM7p3TXZDdnFPl//bpcwT
         G96eSxOcAuvi1fZeYmNtevjWIBEamY/HBeGiHIb4EOfS+RB/jVmv5x1CyhZahOBP2v1+
         Z6ym3Rc8mFpfK21SVDpUe5UuP7cbaYf5HDgqc2qd2AS5Y29jNEGtfYju45RxQvo9ytyT
         To8qNO590UZ4EfXIGmsivN6ba7s1YRllI7hX5PtReKA8ubxE1mH00GTQ4KkAdfAhMhfN
         B6MTbEf/LCwxtKHXvKRByL+1tAhL6D7IQuIIHAf6nvB1VeIW8ORUbgbjEp+96IJ8cDRl
         6ZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYFX0xiJZMYpmQYE14f6pq7t4xOsyVZoA0NfT00mc47fTkCdGLy4oprtz7KUKiH1y9TKRaVnjKUCf7I1HJKf1LVb9rInGrk0lPV8nEqPZGk0vU05GQxP+coC7rqk4RSDhaYGH/et1yGD5O6W6JXZPmv2EiyIkb9BgrdFWjZLLz/LJYKmRhRNl86mrgprvSGETd3VoST/CTeqDV9L0zLau/1w8eHQ==
X-Gm-Message-State: AOJu0YxwfVr5IfrlueX+LSqFdikreCE6HL2LM0xbL0wSg337KiM01gWZ
	XpyL21x5W5nLA+GD44/sPIa9ThCphSuAAMxXnzVeGH2II9wfUuQE
X-Google-Smtp-Source: AGHT+IH8SmEzgsU5TS8q5NHJu0t7KaDmruJEjzuMDt40zq8SuzZBjHxDJtmKvuaYlFSFEyogD0rI2w==
X-Received: by 2002:a05:600c:a08:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-42811dd43c9mr126256445e9.29.1722439561517;
        Wed, 31 Jul 2024 08:26:01 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:01 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH v3 0/8] MSM8953/MSM8976 ASoC support
Date: Wed, 31 Jul 2024 17:25:24 +0200
Message-Id: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRXqmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNL3dziXAtLU2MIbW6mm1icn6xrZppmaW6caGhsaGaqBNRaUJSallk
 BNjY6FsIvSi0sBZpeAhWsrQUA3RJ1fXsAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0

Introduce support for basic sound card setup on MSM8953/MSM8976
platforms, document new compatibles and introduce support for more dais.
Most of code is sourced from msm8953-mainline fork over github
with some changes implemented by me,some basic changes are 
mentioned in each patch.

Changes since v2
===============
1. Guarded ioremap on quinary mux with checking if resource is not NULL
2. Introduced compatible based reg overriding in wcd-analog driver
3. Separated PM8950/PM8953 codec patches
4. Moved reg/reg-names back into top-level and rewrote as in comments
5. Separated MSM8953/MSM8976 QDSP6 patches
6. Added Lineout patch

[1] - https://lore.kernel.org/lkml/20240723083300.35605-1-krzysztof.kozlowski@linaro.org/T/

Changes since v1
================
1. Rebased dt-bindings documentation based on Krzysztof's split patch[1]
2. Resolved clang errors by guarding ret verification inside if
3. Switched quin-iomux to devm_ioremap_resource to not fail on msm8916

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
Adam Skladowski (4):
      ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
      ASoC: msm8916-wcd-analog: add pm8950 codec
      ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard
      ASoC: qcom: apq8016_sbc: Add support for msm8976 SoC

Vladimir Lypak (4):
      ASoC: qcom: apq8016_sbc.c: Add Quinary support
      ASoC: msm8916-wcd-analog: add pm8953 codec
      ASoC: qcom: apq8016_sbc: Add support for msm8953 SoC
      ASoC: msm8916-wcd-analog: add lineout output

 .../bindings/sound/qcom,apq8016-sbc-sndcard.yaml   |  27 ++++
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        |   6 +-
 sound/soc/codecs/msm8916-wcd-analog.c              | 145 ++++++++++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                       |  88 ++++++++++++-
 4 files changed, 257 insertions(+), 9 deletions(-)
---
base-commit: 31c2a5c4bf3673b0bf098f358ea931b9ada1e7de
change-id: 20240729-msm8953-msm8976-asoc-65f973a13165

Best regards,
-- 
Adam Skladowski <a39.skl@gmail.com>


