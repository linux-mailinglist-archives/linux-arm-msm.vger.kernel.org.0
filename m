Return-Path: <linux-arm-msm+bounces-36667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE809B8A75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0313FB2224C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 05:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45EC14A0B7;
	Fri,  1 Nov 2024 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qr38qwD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACA3A8F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 05:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439120; cv=none; b=qEnRudxmdAYq6qrarwdmp2lhhxTRCo/khzAZTUuz6Li0xqynPMIWXxWYrjU+wTNEw4zufdK6WtedKGXMgPxI2oZm/Nrjf/muLFCvV4KiHKXjJ06nnYofrL1cqdkSwuGAUCO8DnE5Gr11X3cfYfz4GZNtZ1UfIZpXHycq91WlwvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439120; c=relaxed/simple;
	bh=f1RmulpmUSMqzKAwuIYtW6IAIRiLTRg9tNshHqQ3298=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1TbxFfGfVSgPKJ6y10jD+MB6iUexfenDdA+JOPEQfcOTHQTQ/rKLs7zAAM5g2crMMSH9ASZEWfuKgfN3cf6C9X96I/gDCuVDftAbbGuVbjife3/dneDpRcN6Yh2qwgtexVwtKBWIm2CRAeQNK47fmZf/SdmWGt6k5UjGzYE4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qr38qwD/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so13391205e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439116; x=1731043916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3MWPpUlrtWjiJFYp3qiFYtsvVqLXH1zB5HEmfy78o0=;
        b=Qr38qwD/exjABP2O+EsTPDuL7Q8ZRXbCnrQtNWiNMO0QvXz6LfBeyLz+hFWafWRHIV
         8pIYd5bhM7L/s8XWMA1itQZ2tXH0Gp3rkSB1l3dDXhwrWuoLWRSAqBN5HzbEvSqhaN+H
         5D/Qru15rWp/Ef58jODoBOox/KBibRVQCFj6YLruw8SOpcLYRdzbLAN600fuWLEy7uVs
         VyaZxsn3QuZRAolsPyTOVaUfPx2J74TPJ/lbhXkTsiV/fEjEE1YVYWJDqfQLp9DV4cOn
         PNSwD5swi3el2iZsLitzNyjBBxlaZvi/HnYVP9z7dIAxD6stqHNFbkJWM/slkrh+haqo
         t6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439116; x=1731043916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3MWPpUlrtWjiJFYp3qiFYtsvVqLXH1zB5HEmfy78o0=;
        b=GPniGhCKrS0/BynE2VyJ4DB99sUXHQSM1gC6q4CiqVNmF4v872SL0QFpVHGwdBsC9v
         1YBj1fgAFrFDstuyTNXwoVpJDsH+rxyDq/Sxez/5r7+/GipaBIa3heKGJInpYchYgQ7m
         W3ySj/YHY0Aux85X2sEZ9EoNZYbM9y+bYsg3joWjfOGM92x01BbVbR3kIcLAW8nksNeZ
         d4WryGog6t63ePUfSqgv6b4FKqvHYFePHwqtvlIr+suRkwDs5G66yUIG5vfk6xRaLSnn
         mQUmzOTBKh1o+Wgr1pKYYreSf5iJnSX9CHFvbbBa9Ak0WFZO7OxDk/RAn03pBUxkPJaj
         DSug==
X-Forwarded-Encrypted: i=1; AJvYcCXjpWZMVPzXR/vbg2E00lDLueRMbVORo7Zp1EuongCduSm+vC2WMDOvg9A5qy+u0be/auT7BGXEboEanVgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQksfSLSV/EKAbUgpvXoaGLGlpQL55YTav/kYRowtb+/kOfj/E
	P+Pwjt56kGa+vHWXmBh16smGY0ptRdCKyWjxCOXf7XVyP8MsdnALUReZPjwR9/U=
X-Google-Smtp-Source: AGHT+IEcTAMe1fJt4ESug+3wnBEMPewCh8Gb8+NM5JQNsU5wQ0NYYJmDobVmWnU4wn8oMQGHgcaQ7w==
X-Received: by 2002:a05:600c:470b:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-4319ab94b8fmr186458175e9.0.1730439115963;
        Thu, 31 Oct 2024 22:31:55 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:31:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] qrb4210-rb2: add wsa/wcd audio playback support
Date: Fri,  1 Nov 2024 05:31:44 +0000
Message-ID: <20241101053154.497550-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is basically RFC, REVIEW or v1. At least to understand if splitting
wsa881x is a right direction and also it is not clear to me what should
be done to force mono output (to mix two channels together).

Unfortunately, only one amplifier is wired in hence only single speaker.
There is no support for capture, visense, reading wsa temperature yet.

This implements the playback via the following path:
RX1 from DSP is connected to rxmacro which communicates with wcd codec
using soundwire. This goes into AUX input of wcd.
wcd codec outputs analog audio into wsa amplifier which can, surprisingly,
amplify the signal.

Special thanks to Srini. Without his help and support this patchset
wouldn't be here.

This series depends on:
 -- HDMI audio playback
https://lore.kernel.org/linux-sound/20241101005925.186696-1-alexey.klimov@linaro.org/
 -- and on LPASS clock controller
https://lore.kernel.org/linux-clk/20241101012247.216825-1-alexey.klimov@linaro.org/

The other bits like fixes for rxmacro and wcd937x codecs were accepted
as far as I understand.

Alexey Klimov (10):
  arm64: dts: qcom: sm6115: add LPASS devices
  arm64: dts: qcom: sm4250: add description of soundwire pins
  arm64: dts: qcom: qrb4210-rb2: add wcd937x codec support
  ASoC: codecs: wsa881x: split into common and soundwire drivers
  dt-bindings: arm: qcom-soc: extend pattern matching for
    QRB4210/QRB2210 SoCs
  ASoC: dt-bindings: add wsa881x-i2c binding for analog mode
  ASoC: codecs: add wsa881x-i2c amplifier codec driver
  arm64: dts: qcom: qrb4210-rb2: enable wsa881x amplifier
  arm64: dts: qcom: qrb4210-rb2: add WSA audio playback support
  ASoC: qcom: sm8250: force single channel via RX_1 output

 .../devicetree/bindings/arm/qcom-soc.yaml     |    4 +-
 .../bindings/sound/qcom,wsa881x-i2c.yaml      |  103 ++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      |  120 +-
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |   46 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  132 ++
 sound/soc/codecs/Kconfig                      |   15 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wsa881x-common.c             |  123 ++
 sound/soc/codecs/wsa881x-common.h             |  425 +++++
 sound/soc/codecs/wsa881x-i2c.c                | 1454 +++++++++++++++++
 sound/soc/codecs/wsa881x.c                    |  493 +-----
 sound/soc/qcom/sm8250.c                       |   10 +
 12 files changed, 2445 insertions(+), 484 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
 create mode 100644 sound/soc/codecs/wsa881x-common.c
 create mode 100644 sound/soc/codecs/wsa881x-common.h
 create mode 100644 sound/soc/codecs/wsa881x-i2c.c

-- 
2.45.2


