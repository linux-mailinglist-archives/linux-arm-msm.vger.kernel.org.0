Return-Path: <linux-arm-msm+bounces-66320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64659B0F4D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC4EA7A2851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C915D2F2C49;
	Wed, 23 Jul 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ommdgp7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CB2E7F03
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279450; cv=none; b=GQXlsP6QAzhD/syDW29o7WHYSdSPCIouNlyRe1pqUhJ+34QRFT7C4aSC1kvzYDLjbTNLxFWtnYDdaHbUkhYxDUCH2VFyKIETzDLHa/qMmAZv7PpPVxbY4C89y1sTd7DNQNXsKnuFjL6dgF1z9+mg8eD04VCNASsKFCJUJAVC4Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279450; c=relaxed/simple;
	bh=RsDj7fBH0wRh1xBxTXXj24VvxAHZ/U4yrchFmTB5WQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PtQy7oohQ+r3kQI3v53FSZfy7neuMOUHRElEq/4EnfqxekGtzFa7PjulX9MPEvQG1EC1Reu/LBYwEabeHWOqgzKOu24/LlgmYMrqKjPO7W7vdvnHt8+/qPQCXhDQkz05bWLsdxzr5BzLHZliKJLDexGCCSuml+yHTC5gz8/tjD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ommdgp7C; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so222816466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279447; x=1753884247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SViXaxASGAspN2RmEy7xCYDdUl2v6hy0DRjtwnjSz5g=;
        b=ommdgp7CC9bF1OkyglA+vmYWhcYm/ns5PAJKrOlMFAxIeYfwVAImfj3DEm98qctTGS
         9oBAizDdYku032+4BL1pQcW+ZBiF1fLFzdTbDysHXvQiMg6KBNk2+0t72Ed+zsG0gsKP
         MLYOmighQ8nbfupkgAVcTIe8R3ZlAEKe72v63kEDPlgxoDTuCnXn6Rk223NBC9Gu1mHA
         OZPFNSE8P3V8RLMhG1NWweyVRjNjNoD0pMNWEpGxWdgunt63jfYcOEvCCDa117rLHFRP
         y9bZciL1ktzVJsydcPUuQuUkwyo6xpST9aYP2NcrSqW5SpSpu03Gm4jXmzm0fMlJ83jF
         oLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279447; x=1753884247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SViXaxASGAspN2RmEy7xCYDdUl2v6hy0DRjtwnjSz5g=;
        b=hlk9AyvZ6S8Wlx4Wh+ta6+gQBdMZ5T9rmV81Gn/cRz+zApQch8IziSFHOb05mmRaTL
         HkR4r7c0Qh4fJ47jM3MfjVG4q9ngfi1dCmLi149NXAJkDvpwZO0mxwwsj8uOGAFGfV8a
         EqpyAwRPW0UpcoAfPy//SnnND7zUuULFlFo+47mbtu3A6QXT8GYimjxwYzjecVFhOXeE
         CkqP/lZX5JM8Yh29yKmO+s0tYgARG3WnVM6Uib2Ii5qDtCFB2RHFw9CQoZ0d1/GRUw2w
         igbkbkMFNzMHpWnxV41LkNG4iBIL1Wx+qyqQEzx/naHw83EKfo5kr0mc7w7ZCZlqctU/
         Gv8w==
X-Forwarded-Encrypted: i=1; AJvYcCVoU69iiWXQf21cIaDXOX7knjB3821SOa4yT02YPCaBy24ydhpETRZZS+muYPS4ci23kbCUtN5a+dK6jHAA@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbqR0JzvyadpTxgtqxtNAFQnTnVlGSZvBZK6f0pvAGM6GfQv3
	wi3IPPpHHkC9ZzHIUaJJkSFS5OqaysMTzPIPmnnyz/Sndwt/3h3Vh+QrNSeu3Hs2bNDRy8Vj8OL
	3P/mbzXGzOQ==
X-Gm-Gg: ASbGncsGiwKtaeFxiJ3kL1LlvR7P3FLj+icc6xVLUxafIy/yzW+L+sdp5QyasRBIOqy
	a0dWLezWyoNcOnTdp5K1nqCnac572+fQXsFKUrL7UmrswoIidQ4MisjS7Sku9tE0GXVTL0pp1jC
	QhFnFJXPTpCa68HpSG9XPn/gofE9lsdEzlX6PAxEJ8YUYgBGRKQQ5ETgaGm89X5MoHW/SgmX/8X
	d5OqAF9o6Qp2FEvCN+JexsNnwDHO/+1SkHLLHot9BKTQu5s//0k6j/m3mibavl8Tb1DjFsw4GE8
	/WI5mnZcd143pqs4ypFr8kVKrTCPTuJS9z9WijmrhynxXsTBayIHGsqdRTvRGkP0ivKJzy0SZy3
	9skh3jAyd62NQlLDVaDKiu1zy8bCERNV4k+d6pja3mx5ExiybbNOrxPC4/oqyNhz6iJMY
X-Google-Smtp-Source: AGHT+IGoYidAqpNmHwrn+fKbqjLOe2L+BWlSXogDHiKeDqGOn183MFAMwjZQZlZecs3w0Fw33JZJzA==
X-Received: by 2002:a17:907:3e1e:b0:ae3:6038:ad6f with SMTP id a640c23a62f3a-af1523a81cdmr939026366b.3.1753279445856;
        Wed, 23 Jul 2025 07:04:05 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/3] Enable USB audio offloading on Fairphone 4
 smartphone
Date: Wed, 23 Jul 2025 16:03:37 +0200
Message-Id: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnrgGgC/4XOTWrDMBAF4KsYrTtFP5adZJV7hCxkayYeaCxHs
 k1C8N2rKotCoWT5Bt735ikSRsYkDtVTRFw5cRhzMB+V6Ac3XhDY5yy01FbW2gJNNSypA7d4DhC
 IvoLzgNa31Fnr9c6I3J0iEt+Lezq/csTbkvn5dRSdSwh9uF55PlQj3mcoE6024qcwcJpDfJS/V
 lUab15YFUigvSTbqsY0WB/JcZyGMOJn3inqqn8lK9V/ks6SkVTbfaN3qvd/pW3bvgGEJHXbOQE
 AAA==
X-Change-ID: 20250425-fp4-usb-audio-offload-e5d7fb55d283
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=1333;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RsDj7fBH0wRh1xBxTXXj24VvxAHZ/U4yrchFmTB5WQ8=;
 b=N3OPUhF05WuYWetYVOiPbbkeCt5+rxepwW2Iye7lnS9uFNfNKnIPYaolqZj5/cHsDx+qSwkLO
 AHcvaQxnkwuAYKGU8WdLw0XNIaHT92fp6nU0PGLH1gzTm0rUdWS+iC9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Updated description for v3:
Add the missing bits for the sound subsystem to enable USB audio
offloading on the Fairphone 4. This is mostly sndcard enablement now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Drop applied dts patches
- Rebase on next
- Link to v2: https://lore.kernel.org/r/20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com

Changes in v2:
- Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
- Sort cpu & codec nodes correctly (Konrad)
- Remove usb-soc-be prop as it's no longer needed (Wesley)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com

---
Luca Weiss (3):
      ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
      ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible

 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml |  1 +
 sound/soc/qcom/sm8250.c                                  |  1 +
 3 files changed, 15 insertions(+)
---
base-commit: ac3f0fb04c50a909908fd375686c5ad6b27bee98
change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


