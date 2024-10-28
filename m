Return-Path: <linux-arm-msm+bounces-36200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0289B3984
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D531F22788
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE151DF738;
	Mon, 28 Oct 2024 18:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyOr5kOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADDD3A268;
	Mon, 28 Oct 2024 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141306; cv=none; b=qbbf7OTiojD6bc+QofsbnZBPPQglNF6wzmTP6juv+BLIZhe3Kp+qwJg3U7sFwkT4kmZ0qNHNwExs5skg3syPE4ZISQdet+XqALbeghreu2Axx7T5TEyiBjocco9nwDpigOGcbz88Yu0DF3o3bMNPd90d/uSyv1A1sCcRo+kbs5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141306; c=relaxed/simple;
	bh=MLcOld+2red3dwWoB2u8Q1GcxpkrVirConXSUl2iIxo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dhdd5FRWP+RQlyagEkdj1qPngTYG1Ku4jDgHwqrWwRQIW70gsj+2yFlAtLajzW9pWIo5oQo2cFM13METwGz8ceeyIrR5tBOfk5mW3w72U7P/WZotR6ooNS6pnZvfeiWbbGSDQl0pCa/2HG+3PRa8hEZp6n1+PjkzTDv7FdWQp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyOr5kOV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso571498466b.3;
        Mon, 28 Oct 2024 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141302; x=1730746102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1L3PyT3DI7fVJTT6/gm8DMK/bwP+0mVSlGhALirvWfw=;
        b=AyOr5kOV1s7mjf9nXhCalE/72T9PzdAvAAkxUele3ZoQRaj6gbuV1H7nK7A/o5WA1f
         qEhZYqwgYgyMCOO8+zsORiYjkpXxV9NuNNRcjS8MCdUWHhYvAkPPnTtF50+p1dvJE7rc
         bNVJ5ssp0R8dGyUnDryZtCMKNMiQw/egkdc2wgv7e7m2ObjbTDqKsidRHVR/UfKR6zHa
         9Qlp0VCQMMEcrV7xXcNYiKKG2Hye29PzNm93jdGbqbz+5aDodlWKUXNbrPMQgxP/SHeB
         PDRIFdzN/jX5IM6FiNmOSoOFtPVLW8FAjNj34fvQo/dn93caTJd5IaQWo0tf2aZZIQ8D
         MBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141302; x=1730746102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1L3PyT3DI7fVJTT6/gm8DMK/bwP+0mVSlGhALirvWfw=;
        b=kfcwLsFu5zvSIlk4IVbNZRkBPIMkue68qtdJGd15ESPw8XvpcRtbLU8uRyF+w4vHoG
         rNeuo1ru7VNLmPmdmi9kE+QylknG7m9p2wYmaqoH0I7AYg1/OLpu39n6NTR8QxaEnA+S
         HWGakiPukBb8bA6vx49d30Qr8cLEnH0/xfA+ZU+pLJ8aLDWGiAGCBW64mpjOMBL3YCqm
         kk80YgOnCBA6yeYUiUkoitR5CDXMe+Jw2OLow2ils2pSavHWDsSeiPq0l8G6Q5MNvpbv
         gi8F4vcv9jPJneV96WZ5Fvbu3NVSVVwHLmV0RtF/oMAYRPdGUvFuNxxTEF+HBWGrErRG
         u8xw==
X-Forwarded-Encrypted: i=1; AJvYcCU5ch42Cx90xMsNGUHm7otD1pwIgWyMyodxVKuQIWzyPi3ZzOanUMpyEPZ4T2Exr1KKZPoCUZLZMqI=@vger.kernel.org, AJvYcCX/AD7a3dM4ZBW8NSuRx3b010qFc7MMLYoL0QqLM5jIbdJ+DWyNLtzueazrC1dCnk2dNs0tlg0W5NiKx7xX@vger.kernel.org
X-Gm-Message-State: AOJu0YwBJ/z5vTzB0pqWy9q9WEsV77sNbuOhNgONzGwCfL3udx5PfwnX
	tfZwVFJnIevRLii6Yh+t+OCmQTSfe7F6KemhJv19HOaH+3ix+2w5KQ1Mzg==
X-Google-Smtp-Source: AGHT+IETdkvSMOyudPTGJQzsHU7JlneDAZE8RdDq1tyzPR/PZps3mH0FOxDsyAC+Vfor9vo15EgPQg==
X-Received: by 2002:a17:907:7e91:b0:a9a:20f9:a402 with SMTP id a640c23a62f3a-a9de5c91a85mr984710866b.13.1730141302240;
        Mon, 28 Oct 2024 11:48:22 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f029617sm397585166b.81.2024.10.28.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:48:21 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/5] clk: qcom: remove superfluous alpha settings from
 PLL configs
Date: Mon, 28 Oct 2024 19:48:14 +0100
Message-Id: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7cH2cC/32NQQ6CMBBFr0Jm7Zi2tsW44h6GRaUDnQQoaZVoC
 He3cgCX7yX//Q0yJaYMt2qDRCtnjnMBdaqgC24eCNkXBiWUlkJJdOMSHE7RE3Yjufm1oLXyYbS
 2WvsaynBJ1PP7iN7bwoHzM6bP8bHKn/2bWyUKNMb3V/L1xWrTDJPj8dzFCdp93798fg84tAAAA
 A==
X-Change-ID: 20241021-alpha-mode-cleanup-661b544644d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

There are several alpha PLL  configurations, where the alpha mode
is enabled even if it is not strictly required in order to get the
desired output rate of the PLL. This small series removes those
superfluous settings.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - extend the commit messages in the patches to indicate that dropping
    'alpha_en_mask' is safe
  - collect RB tags
  - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com

---
Gabor Juhos (5):
      clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from IPQ5018 PLL config
      clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from IPQ5332 PLL config
      clk: qcom: gcc-ipq6018: remove alpha values from NSS Crypto PLL's config
      clk: qcom: dispcc-qcm2290: remove alpha values from disp_cc_pll0_config
      clk: qcom: dispcc-sm6115: remove alpha values from disp_cc_pll0_config

 drivers/clk/qcom/apss-ipq-pll.c   | 3 +--
 drivers/clk/qcom/dispcc-qcm2290.c | 2 --
 drivers/clk/qcom/dispcc-sm6115.c  | 2 --
 drivers/clk/qcom/gcc-ipq6018.c    | 4 +---
 4 files changed, 2 insertions(+), 9 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241021-alpha-mode-cleanup-661b544644d7

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


