Return-Path: <linux-arm-msm+bounces-54738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EADA937AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4231774AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30AF2777F8;
	Fri, 18 Apr 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XShPdjQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917611CA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982042; cv=none; b=uT1LLYDEkf/TwMgJIb1m+SWGUPbf6V7tO4KaBQVww7PWFWhg83f2ow3b6ainoe1D0oygkbNMGY7GyTf872Ki+D8gkbO2PhXQivZWi1MabBVP2l1FpEZtDb4/CYqdLmlctslci3+s37e+K96jyM4IzFLX3qZM7Ywu7a4pPncMNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982042; c=relaxed/simple;
	bh=oG6I7vuTiOh+DBUVeavHMpkt72p29hj0RNzTc/V8MdM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F53NvPO36vcLXiYWhAD5dD6cCcEZg0dJkorpWswmNUEVrk8uMz3SWXXi0IA2sOqRoVPKK68R0BC9DtknIphA2ZhfwoItW0T3M4G3nCnOQFJOChggl2B42MUy3ypOLcNGdvjuXb7rA/eYTwlmF/pxpMDO6klnmGS//WDNpljrKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XShPdjQx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29fd22163so288993466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982038; x=1745586838; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3X/gbMZWU54cMJwy26Gb2B5XgxbyYs+jksPX2/CEuik=;
        b=XShPdjQxT9cBlynxEapVFLmhKDcZQtSYGgPmREbLBVPOMYs/XiDqlySHqoM66C6bYy
         Oqrm35jkGrEWZr/qKteoUsrmWfI2VhUrGKrYjPglbpVojnvauFMhqHU2Kq8T+ULYg5bS
         2WGmRdLjx+sussZB1w7cugBZvpfvLSom/pv78QfUgktp0Yc4q+hg0xyy6+IdJXuM1z5O
         IjJe1lbyy74uEdapMxirOJ3f0ksTMwsdT2LJb/liGFwMlfh0DCXPsffmpdHxDnMj+0UX
         JFxu//gupFjdVxuwj7Pv+r+tlX8J92G/6NU6UW320w9jIKE5p8dD403Xs72V25vpeJnt
         YP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982038; x=1745586838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X/gbMZWU54cMJwy26Gb2B5XgxbyYs+jksPX2/CEuik=;
        b=eD3voL6yavMBHb0tRD8175ZwmlMxlbM3SgFH4zFUbcJJAYhGWLutDLOTij1+syhsl1
         FeEe4uV4RSwrqkq4XVD11DHN4yiK0mUp2E221EQbXf0YgLpDITxO8lZiQAbrXgMpmRFh
         FXFaxJlQ1ay5tDul3bCFG1eIlpxpYoFEXp9UEBrJ7vICNSQa9TVVTjzQAhPOAaW+Q/Gx
         4kTo0R/hYFzNXEMGNwuRI82L8zvOd3ZUsBdBSf9jPwivin0lPSq356gJRPB+rJ0psq5G
         c7o2q6bBm3aDziynyO56AL1g7uibihS0D6pBw1IbnVWTQFF6MZV/sVNW2hOIK8jB2rna
         Tygw==
X-Forwarded-Encrypted: i=1; AJvYcCVuIkGTUAN9TI7NEmw1TZp2IN0dzykAXXcdv4VcyTi7179KrUPSybre70VO4QlqS4HkKNBu7RfAitwZFSpu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05ICeDux4Ms9ZXRJxJuvM7k5dTHhBbI89VO64uVFM29FU0pgA
	2no0mI7h+2Wrd4LQ/Xzvqq8MhvRBKan2BCcbxTXCaT5AvD9dqZ+TArMwHbSEplg=
X-Gm-Gg: ASbGncvwHIDfOeNl4iSpqR/0BybW9aJbYBV5x6zh8uTvuI/KIljPuZU4LKXdRUHMru3
	fnsEHUrlA5f851GjYTxZUfryhVJXmYJWH+LkNOnpF3CH+X+pW/BtV92dWUR/yGBAqgYuVrrMfLd
	pgK/0B3BTvZFtJ+Gd/T/iD7NTF4iVJw6aY20f/Ajs+6e4coWeIJjxR6nk9M3ZI6ooKnqCAPpU8c
	kuxzwja0DjWIClJWmYYwYqa2ImZvyhnHDOx29ygjjPojopCMnNZlw9Zz5pSRCzFNay86/OSG/ID
	cc/Mst3fd2Gd3qeEygfiaVkE6u/LHsc4rz/qxlZ4haliqsbx7Wjyou3xwbFJmHFNbGDQWNlFRTw
	9kbrGhBrrPFZYSA==
X-Google-Smtp-Source: AGHT+IHwVVtosWsJoxBbmBCH8nalV1MQnRR/fXT4Se9eLne1pthBsyWXKcYt1cN17cYK/1WeVttuPw==
X-Received: by 2002:a17:907:c807:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acb74b2c9a7mr267090566b.17.1744982037837;
        Fri, 18 Apr 2025 06:13:57 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:13:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Add DisplayPort sound support for Fairphone 5
 smartphone
Date: Fri, 18 Apr 2025 15:13:41 +0200
Message-Id: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVQAmgC/3XMSw7CIBSF4a00d+w1QGtfI/dhOigvuQOBgBJN0
 72LnTv8T3K+DbJJZDLMzQbJFMoUfA1xakC51d8Nkq4NgomOjWxCGy+oI+bw8hplO/SjbRmfpIZ
 6iclYeh/cbantKD9D+hx64b/1D1Q4MtSDXIUSne3ldLUrpeiCN2cVHrDs+/4FIRKNx6wAAAA=
X-Change-ID: 20240809-fp5-dp-sound-b3768f3019bd
To: Srinivas Kandagatla <srini@kernel.org>, 
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
X-Mailer: b4 0.14.2

Add the necessary sound card bits and some dts additions to enable sound
over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.

The UCM files can be found here:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm

This series - in spirit - depends on the series enabling DisplayPort in
the first place, but can land pretty independently, especially the ASoC
bits:
https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Revamp series based on comments on v1, doesn't have much too much in
  common anymore
- Use sm8250 instead of sc8280xp sndcard file, so port other required
  changes from sc8280xp.c to sm8250.c
- This also changes the sound card compatible to from
  qcom,qcm6490-sndcard to fairphone,fp5-sndcard
- Link to v1: https://lore.kernel.org/r/20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com

---
Luca Weiss (5):
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5 sound card
      ASoC: qcom: sm8250: set card driver name from match data
      ASoC: qcom: sm8250: add DisplayPort Jack support
      ASoC: qcom: sm8250: Add Fairphone 5 soundcard compatible
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                            | 28 +++++++++++--------
 3 files changed, 49 insertions(+), 11 deletions(-)
---
base-commit: 7f1dd4e6634d085f3c9652d4e0f1903659fb96f9
change-id: 20240809-fp5-dp-sound-b3768f3019bd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


