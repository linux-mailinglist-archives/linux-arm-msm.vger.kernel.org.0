Return-Path: <linux-arm-msm+bounces-28221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1994CC4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11BEE1C22CB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 08:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5AA19147D;
	Fri,  9 Aug 2024 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vZcAWGpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4DA18DF90
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192453; cv=none; b=HlEofeWeRr+G9DHVLb6jdq/YQjXT8MyNvTOtHU18Dft8xrkQEuF03vizdEZNchMdKFKeLmsyQebGhvJkEcYBwBs6vbxb6u0+MW7x/LgtAVW1GMBMvfeFsa9zLpslUs6eFnW8hGFfQmAxN+INSv+W5FvhFG4lx4AiE9qfcDFXU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192453; c=relaxed/simple;
	bh=AYpUK+lsd5PQ6SJlU43+rLfSAt/aIyQe9U7/8RSvafE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aouT2H+ReNR1tAPRhwhJDba/Mu91IdfKqBfBza/pD8sfbfqsmD4EbvgikSEQ6kHh1YC5ehgtYmuAdzkjlMvxV7ovRhruCMR7lhoB+Cr5kOjiN6HpVE2yQBEeLsabDPcUI2EDnY0M1TuqaiM34bP+03sqaLyqM091TpzBQTX7ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vZcAWGpi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62575eso583800a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192450; x=1723797250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzfw/96lJb4bQMm0DPGLtxg5MZTXy4gKlDaf+3Ud31A=;
        b=vZcAWGpiM81IUctCARvc+qcwMX3DTFi0ygcqF355ho+DlnGd2u3QTuru4mSggp+/nj
         9B1SyY7bVS96dwByhz7tlNmkBguR4OnhUM2F5vfM5x09MnPcdAQA06jtiFrkmWkLEFXC
         OaueYBbcj8/vqVBqkRM/ZoxPDy5g3SRkXyUiTnPc5nNO76ltSxhER/f/gCVKXE4hW8Vx
         m3AW7ozKPK9fAoVy/c+xfsuHclzOKE1JOriqEZyevP145rodpIX9wHBakkuNRyZkeIhC
         5a43RpUac7WXTJ6GbZ5cLFW5nSyjNgzfFhXnl304e093h0NDfByEX1aQ6ZB/5OHNEBgJ
         UBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192450; x=1723797250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hzfw/96lJb4bQMm0DPGLtxg5MZTXy4gKlDaf+3Ud31A=;
        b=jdhNVLn47tBV+mb6ofzhNsxG5jeyvnP6uHNEwm1Kb300746H/7SHUuIrVu4G15RCKy
         hnWVhOQPbQ6vWJNmdfGzWRjpSzTcQgwpd641RsHGYRMyievnYl4M2NXgNO+Z5hborOq1
         O20AeIzvXB4RWgeQ1c4SjwkIxevodmsA62tcfvEPHbWV82x0o6p+Q6jJ7vlOiLz4Rf1u
         XKlUr/v7W9ZW41ta1MGb/T0vaCVQnZaccLUuNy5zbgmLOsxTcyQ7WbCutySEtH/wS3jw
         JFDTCjPdLEj3EErfe8XguoOI3GhzsmUXaJrNht+wZwwJwpZNkF1NnEn+q1kvHFgcapSX
         19Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVb1A3NwLvs4NqyCZ47eotfc53gglzAd9vwvV3cIZoX7QGKrCbbhEF4cqYAZfMGdBiCq1y36yZe8iCi7U6I+bwwaSLtTqQgTzOtx521ig==
X-Gm-Message-State: AOJu0YymFpBiXFJUtMFI8tKGgK17zl5Dxj7I72g3wOg1iiGlo4+SLPrn
	3wvNXgMi+SHLhvfhOQmjPK77A97LDFCs5RY3frYiRsfUr4hakqe2f7kulWSj0WU=
X-Google-Smtp-Source: AGHT+IHunt1rt24Z66zT/GRjyNQR/iZlMfySgAZmzArvUQ0sChkXB8EfaUarNZjHNUHUBwjWkQ08Lw==
X-Received: by 2002:a05:6402:13d1:b0:5a1:f9bc:7f13 with SMTP id 4fb4d7f45d1cf-5bd0a577dbdmr755422a12.22.1723192450418;
        Fri, 09 Aug 2024 01:34:10 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add DisplayPort sound support for Fairphone 5
 smartphone
Date: Fri, 09 Aug 2024 10:33:56 +0200
Message-Id: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHTUtWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNL3bQCU92UAt3i/NK8FN0kY3MzizRjA0PLpBQloJaCotS0zAqwcdG
 xtbUALdDLb14AAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.1

Add the necessary sound card bits and some dts additions to enable sound
over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.

The UCM files can be found here:
https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm

Two extra notes:

1. I don't quite understand whether the sound driver should have
   SoC-specific compatible or device-specific compatible. Some earlier
   patches by another author for a QCM6490 board and a QCS6490 board use
   device-specific compatible - but from what I can tell this is not how
   it's generally done for other sound drivers?

2. Unfortunately DisplayPort enablement itself for Fairphone 5 is not
   upstream yet. This is blocked by DSI display bringup upstream which
   is blocked by DSC 1:1:1 not being supported upstream yet and just
   working with a hacky patch. Nevertheless, DisplayPort audio was
   validated working with no additional sound-related changes so once
   DisplayPort gets enabled, sound should also just work upstream.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490 sound card
      ASoC: qcom: sc8280xp: Add support for generic QCM6490
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 37 ++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c                          |  1 +
 3 files changed, 39 insertions(+)
---
base-commit: 6cdb38a56eaf615abc60fbeec0e4ccbdf93468e3
change-id: 20240809-fp5-dp-sound-b3768f3019bd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


