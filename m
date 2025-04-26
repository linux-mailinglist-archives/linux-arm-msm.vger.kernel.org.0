Return-Path: <linux-arm-msm+bounces-55826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C99A9DDAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 00:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7CE5A38C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 22:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589692010F6;
	Sat, 26 Apr 2025 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrxH3FCv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E31FF5EC
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707976; cv=none; b=gJyqxS4WP6ET935ll+EZHu0QWhHjE0w7bjLnkM8dOKXHWQolQLthJJkKAtLXkP4YDG5npFgJBpWYsHJLGxpwQunOMVdqYtB9G7wn+UhFDm2MS6elif4ans1V3wwus0ic4Gymj8OrmBp2B4+HHOUF7JgkZUTPyaXKoCwuCkMQ7GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707976; c=relaxed/simple;
	bh=rdh3wDpVtJEWEyCTvExoPgmS4r310hhuoJQars1m3m4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RqBdDKrjprgOqLEy1BylWd5bZtECtRyY0bVh6oFF7ZAgPLx8pdl3VuCNv3PNpZmx0HeTFrs+uWzXHXK9uBReW9O6qBdJcZgoyY/GIoWor/uMXQ+LPCc2gUUekwOr4MOUS2qsaT8bIssYL5/nW7X9woUvNK+KIw3n8lTpbEMa9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrxH3FCv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so32992275e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745707971; x=1746312771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWKU44iyRT6MGYXYHtBkKoO71GOnzFlZ72+iACIXW+U=;
        b=mrxH3FCvkbi4PUHIWQMVl7iVEbpkDUI2Zj0deDZ9rWY1bZzSMIozILP8zYqzHPW/A5
         dlyrijSRqkLEDayZTpI7a55kFabbydSbRaSC06CQP92cfNdXVOqaAHDXB/LerQKFB1DM
         jWMuRef1y+PVZY95jw2nQhz7C7ODBYZL0Y01fRBT44xcnnC7+niDB35wnEiA2RA1DwVe
         AF7P2xy5vw5IV3AwnXAx9bOdOdXTDVavv42YTqOnwd7pOi0ucepMn5mGEo6L4ji7NnEh
         SLirRVVO/aG9w9xJ4P7DHg1b9bfOoVLAT38uyhysSedXj2/CXf9EHUY0B1aeeZkBiGRw
         inIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707971; x=1746312771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWKU44iyRT6MGYXYHtBkKoO71GOnzFlZ72+iACIXW+U=;
        b=L+AauMaCIXXgar2kkbSXHHVYSZ4AxIQD7lma+FgWwYfUAPQU3eFMnVStW6wFQK9vQZ
         /HKHsfn8XBQp7+nly01tLdKRCHLEU5BserlrGYdcnXP5kgf3fv0rSMeBeENLRg8xoGMo
         UaEpx/WaXrUlWaT0JbRC6+an11T8zG6jLYlkrVGqql3zx2BmOAU7vbmMEMUJvoBaU5qn
         5AwYT9yPOEIVGs96MmWFiV+cDuJpUHPIuNbCy0ZP6JjAzVgMwhqJePYc5Bw9DaR6tJX+
         KH1PBbwa4CXZmhibCATbyNI9pXALt5Nin0j1hoIoHCRDpizUK8ucRc+xEQOuTDRnlAdD
         SV0w==
X-Forwarded-Encrypted: i=1; AJvYcCUe8wkcVckcCLZukiMFko78+TBhPYdcO//9BZZmG4NCtTBt9RsedvllT6qKa5GkXGR9jbWQ/UE4rzY2pjcY@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVHIm5MtqSA5Z6V8IwTPHPaOhttZquLkJLj9I5O9yP8F71Dgx
	7iGLXzkNYzsQuHRW+JsOwN2luiJhpGC7ZhwcXup/Ibax4wPyrqMjDdrj6YtHEv0=
X-Gm-Gg: ASbGncvhkw8yFsx2g1B9EejLqAKW14yHkinIdYEADSoHtAPPJWQ1n6R7mRFe82MqFij
	am+vWhyArV3jB2p9/p2jvcfPEqU2/WoPPFkK8U9u4t0iz+jg+RaweDmF430DUumPa7cyOZNnLUR
	k4/xKB8bcYf2cN1pcOuuIEX1xguje3GBLUKuyAPRESN70JNd0Jqxz/g1R8E3qVmnoveX0JKmcig
	qF7XSimrezkLQU/Vmmy9aNqX7S+ruJgs0Sletr3nRIErn/9Y+0fZhwxfV3B5MS140FtPwRTpoMO
	gprAC4PjEvvwn5jOmDMdLUybO4BP9FstviL+9Zb4+Tvinz0/dXpWSSf8HXz9hueem8pkNd2jHjm
	JqUzdQA==
X-Google-Smtp-Source: AGHT+IGmSQQ+Lz7dfvrpQ8sguVCCaZxaRG7py10AosMWDBRcc8fXJgyUplpyWeq6fU0k3yrFTkRRxQ==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr80399865e9.6.1745707971366;
        Sat, 26 Apr 2025 15:52:51 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044besm75268915e9.14.2025.04.26.15.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:52:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/2] media: qcom: camss: x1e80100: Add support for
 individual CSIPHY supplies
Date: Sat, 26 Apr 2025 23:52:47 +0100
Message-Id: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9jDWgC/6WNQQ6CMBBFr0K6dkwZWkRX3sO4GNoKkwAlLRIN4
 e4Wdm5185P3F+8tIrrALopLtojgZo7shwTFIROmpaFxwDaxQIlaKtRQK+idZQLj+56nyYUI6ZZ
 qW0N9jBCf49glKZRYaaOlLC2hSMYxuAe/9trtnrjlOPnw3uNzvr2/deYcJCAV1hakTlTSteOBg
 j/60IgtNOMfckzyyuSotKzxXKgv+bquH/UXZUdEAQAA
X-Change-ID: 20250425-b4-media-committers-25-04-25-camss-supplies-6285c5006da2
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=rdh3wDpVtJEWEyCTvExoPgmS4r310hhuoJQars1m3m4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoDWPBvjSpeAqF8p8puUEfS151xzYoJLaqMu7MQ
 zS8qciFAPOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaA1jwQAKCRAicTuzoY3I
 Ot4nEACNg/GojHHCP7YvwevtzAeAOBm4j+RXKgcGWeC+wTy5q3N5zgjOTHq8C5UfNYH3e9z8oIQ
 Yk9vD0bUBH1YyFE276vgi8hyxU1YaXJhVOwzFgu2D2DLj2jVPcDlEAF4IQLTIhqq/XYDdNUrUhq
 wTRalH6cWKyKb7SB5HHXX8ciMQRcAHwXEsOxUi+u0o4J7/RnuiD10lmwy/8cEYZnspAkensAuPe
 yL7ejagQKrqZNnDcVIyXWZmCHvsGyfenGOCrxZNnxurbg48GWpIrGUYmKXuPrdpqLnpP57Uv/zj
 f9LaCIroGLUBDS50HmgnwVe5TNw6ypL+jdpzk/HibPf6jm67Pj70qedVbj+9v+n8b12zWecStGg
 ErdIhdIEV8pniCs8JKuBKJusfL0ruMnpvXtOlfX0daMrUDGQvfM6sx5GUP9YEXzUJOvAGIFTuDv
 syDaUbO+yHPIi44Js5E1lDUL1E8TbZE2bAjKOUOQstBpQYfHsTa9bTNE2NhHZ0Bz/CflVyyIEoA
 uBpywvQeOvlEQvL3XPHrpnhvA4sUl2/pLjU/P4ZhFVOjKRPAPACfV9QtyTCqCJ4OPxUkZc5wG82
 kbRnexBcg+rR0zvbG2zVsvNx8ThVMgKckHA/zx9werC89+Isbs1q+equGLR5xZ+jxhiSQWr0rfS
 3TFYtn7wz3eGTgQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v3:
- Changes commit log of patch #2 to reflect no ABI breakage - Dmitry
- Link to v2: https://lore.kernel.org/r/20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org

v2:
- Fixes an indentation error I missed in v1 - Rob's robot
- Link to v1: https://lore.kernel.org/r/20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org

v1:
In x1e each CSIPHY has its own 0p8 and 1p2 voltage rail. These voltage
rails in previous SoCs were shared between PHYs, over time the hardware
differentiated out the rails per PHY but CAMSS didn't keep-up with or know
about that change.

We have two options to support individual rails per PHY.

- Logical naming of the supply lines
  In this case supply names describe the PHY and its expected voltage input
  For example vdd-csiphy0-0p8-supply for the 0v8 voltage rail to CSIPHY 0.

- Pin naming of the supply lines
  In this case supply names will align to the name of the SoC pin.
  For example on x1e the supply name would be vdd vdd-a-csi-0-1-1p2.

This series chooses the first approach for the following reasons:

- Naming coherency across SoCs and PCBs.
  Virtually every CSIPHY has 0p8 and 1p2 voltage rails and these are akin
  to an architectural feature of these PHYs or at the very least a common
  pattern across SoCs.
  
  This means that the pin name on x1e might be VDD_A_CSI_0_1_1P2 and on
  qcm2290 VDD_A_CSI_0_1P2 but the yaml standard will be for the regulator
  name to be vdd-csiphy0-1p2-supply.

- Accounting for upstreamers who don't have schematic or qcom IP access
  Not everybody making upstream submissions has access to schematics or to
  Qualcomm's SoC-level pin definitions instead working from
  vendor/downstream DT information.

  It should still be possible to construct a valid upstream definition from
  that downstream DT.

- The counter arugment.
  The counter argument is that aligning the pin-names to the regulator
  names is less error prone and I agree with that statement.
  What I'd say here is - the requirement for CAMSS regulator defintions
  in DT at least from my perspective is a putative upstreamer should
  be able to show how they have tested a given DT submission.

  If that submission isn't tested, it isn't working and should be rejected.

  That should then address the concern of having as another example:

  vdd-csiphy0-0p8-supply = <&vreg_oops_wrong_regulator>;

I'm promulgating this series in the context of x1e but it should also
unblock qcm2290 and sm8650.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: media: qcom,x1e80100-camss: Fixup csiphy supply names
      media: qcom: camss: x1e80100: Fixup x1e csiphy supply names

 .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          | 16 +++----
 2 files changed, 48 insertions(+), 20 deletions(-)
---
base-commit: 1d1e564fce1bc361af1a1980a7f915a0475a008a
change-id: 20250425-b4-media-committers-25-04-25-camss-supplies-6285c5006da2

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


