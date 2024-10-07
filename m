Return-Path: <linux-arm-msm+bounces-33347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0D9928B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7AC81C237ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507F41A3BD6;
	Mon,  7 Oct 2024 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xL6sO4Rc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9018C917
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728295388; cv=none; b=X0s8wte4uuQyfOnPBr8W+K5xQovQaMfoHHCmvXMIlN8tLD2IUJYqSd3kBA/2SXiAeWtwwylyd1iXnzwFg/zWkOS6zTXHqK99bgHtrEk4A7SowyzY9OsELAxlt282MILjKkVeWWSYujM0JTTGN0ClqpVJDuEEt1mu97nD0DEO+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728295388; c=relaxed/simple;
	bh=KS93XOFcInieI51972sksu4TRSxiedGNVM6z/VmUif0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jxcoKWkHnPvWkmwxTgG3m41ZJzMAc4ngbFcOXoalefDL5fXFI/fZR30LW2cQwMK8P0dbD1LcNucQJv5nAya5ACH+8x3SsA5hvuufaakaiw5R9JHHa+EjwhTdMuWGLuMNBrm6Z39QFbQqpMMhIX688/tUHjBOojLHqcUhsN0eQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xL6sO4Rc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so42942385e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 03:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728295385; x=1728900185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZO4nqrQXxhefTyL2K0cDlQWrSv0U9dxTg0DToIgpMk=;
        b=xL6sO4RcVmufrXwMNefF4wF4oU3G/kWKvnoQyz1fBtfG1OWcL/NZsx0k9kUsa+cSbR
         AO1APnklaXQbCN6KyGYZW2rm+Wd9agNjF9QNfUFxhyzhD4+k7UCi7NfN2zVwOriwNp+S
         TIrnjvaTlBUjNqQZiMepJIZyCUWvW71RjHgrVSHnhb/ai1Eqs95EmmcOVabEcxrDnbVf
         vIUuAWUWH1XCwe4Ss8KP4yM2s1U/lcT3Iz3Fna6EzXoLmsi8QE1pysBqy3+fFTGpynMs
         K/zYrA2QHxcTO7jhCbPLzgD7+zPFzol3KgH8eZnC1kZf2f/YuUdGQrevWYy2b6vUOrTw
         UOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728295385; x=1728900185;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZO4nqrQXxhefTyL2K0cDlQWrSv0U9dxTg0DToIgpMk=;
        b=WYrrLnQMOsjR1wKUpWEKmIyeEQSsDBJomz40mjia3Oc/j+OE2qByyfgHsCJdklUTRY
         STz3Mfyz6c4G3Xp0TNnAEVVMrx3UuRziktOjioUgkYN1kit2FV82L+9znDemXDt/6yIC
         kuiAm4EvmYR/DY/3W4sM/pto3LalJVyBjimVrHVdeMF1dZ2ffqjnc13JPZDW2znGirBo
         VyADqohy7O7fxfSoXr0l6IQXePz1r2yfrmPWF4zPJk1ojIRqIq3pepvlmFrNjykZTb3+
         EjX/RNazOEWOcqug5LQtLijZD7jkYKhLAnzB4QAkPSYW1j0O+Wq/mPnq2BpLPGLx+JQI
         x2NQ==
X-Gm-Message-State: AOJu0YzCi5beGjuAwXpTaFi3E+YMYhhVetrkI6ybIwfjP+IrH5t8HELU
	KgTro3fsxsezOYQCPCBA1mzE28RN2opQKdts1+He7p9/u/YMAonE+Uu4wGaWFtU=
X-Google-Smtp-Source: AGHT+IHVePlWR0edr+YwNbDjdqHsWdlc+TQhMFa/YKcBcEgB6wXceqTxYiO7y2/XYG2gppMSBNw2Hg==
X-Received: by 2002:a05:600c:5103:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42f85aa90b0mr81621725e9.11.1728295384694;
        Mon, 07 Oct 2024 03:03:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f9384f648sm8498695e9.20.2024.10.07.03.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 03:03:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v8 0/3] arm64: dts: qcom: extend the register range for ICE
 on several platforms
Date: Mon, 07 Oct 2024 12:02:54 +0200
Message-Id: <20241007-wrapped-keys-dts-v8-0-05ee041f2fc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM6xA2cC/33NQQqDMBCF4atI1k2ZaE20q96jdBHNREOLkYmkF
 fHujS4KhdLl/2C+WVhAchjYOVsYYXTB+SFFdchY2+uhQ+5MapZDfoIaJH+SHkc0/I5z4GYKvFF
 FYXRbCgOCpbOR0LrXTl5vqXsXJk/z/iHKbf2DRcmBFxbySrVWSIWXhxs0+aOnjm1aVB9BAIgfg
 kqClrIqRd0oa7+FdV3fxnB6L/MAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Om Prakash Singh <quic_omprsing@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KS93XOFcInieI51972sksu4TRSxiedGNVM6z/VmUif0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnA7HT8i04MpqQOXEZQ1bpnhBhxZrWhbNcugZvo
 UNeSuGp346JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwOx0wAKCRARpy6gFHHX
 ctfrD/9MUSmp4buyUdDije9go/7QjDJZAdZgY8F40kYB28Ye/1dYPm7i50XSwEqA5DjmK/lBI6P
 wxR4TuBBcBgJMiI8P7X5ggE+XdSfJfcrT/6tbKA7lherAVrDoJoJynoTsowQ+vy4eyIo4Mfa42M
 91GWUQvGoQRq0lJFspHQhAHT3LAYKWopGaF1WjFjwRSBuM8xWNDeZK04XYu1zVoFawjEygD+Yny
 g7p2n719C/xdDUG0ooTfEeNsW3Q6TV0xFB7WmBdekyrATmn25lBGsYb6Y7aadRynCGrxtUVkRTW
 ER+gJ8zlg2vKq1nYK4PpflFZCv6CR1dKIfV3n7nNlZQPt2z2aq18zEHz1VMv1pJgBjG0+qiAvX+
 ouWnsu30sqNdwx19w0wYjQSrx0oZcDAC78jmcx4XZyeLRwc+RixN570m0tCCmZ7Gzbb0SIH6Q/n
 YrQZ14WCM4EpsjM8WWAC+9A6kIzeT5XPegyX6rLIrydEcp9THR29vfBR+YBpNU5tEsm+1lXfT6V
 asqbKfvSy2TrKKBCK/Je48XExEk+bnhQu+sVH0YEmXJgnNAgOymmwLqRfYlQJ7DOF6zm5kWRBud
 +2PCsoukdFGNe8l+KWbgjlBiTl2MmEPFbpgktwSeKNuHqgiYe+XTO+ozWhfIvZpIYdnjzJMCdSr
 jd9rjgt0BQ7h+UQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The following changes extend the register range for ICE IPs on sm8550,
sm8650 and sa8775p to cover their actual size.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v8:
- drop any mention of the HWKM from the commit messages
- Link to v7: https://lore.kernel.org/r/20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org

Changes in v7:
- bring the ICE register range up to its full size of 0x18000
- Link to v6: https://lore.kernel.org/r/20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org

Changes in v6:
- split out the DT changes into a separate series
- remove the new DT property from the series
- rework commit messages
Link to v5: https://lore.kernel.org/lkml/20240617005825.1443206-1-quic_gaurkash@quicinc.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

---
Bartosz Golaszewski (3):
      arm64: dts: qcom: sm8650: extend the register range for UFS ICE
      arm64: dts: qcom: sm8550: extend the register range for UFS ICE
      arm64: dts: qcom: sa8775p: extend the register range for UFS ICE

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 3 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240906-wrapped-keys-dts-b733dac51d01

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


