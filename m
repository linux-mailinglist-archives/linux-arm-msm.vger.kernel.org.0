Return-Path: <linux-arm-msm+bounces-67277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C6B17768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 22:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3E41C808C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 20:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA1426A1D9;
	Thu, 31 Jul 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UX9+LNjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F725CC52
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995101; cv=none; b=p2a6/Wcy4JcskcJjOCNW7yc50jW9w6l93JKPqIp+qvC+FnKOSOxTysrWSenAXoqATU0TgS+hRsRgXYT9bl64h/lzf+cwgjyEOU78XeWXg++xsa0vh+VbnFcAeBHjuwvYhpQLkeBsDEOz2CoQGfvBl8PgZqOi8paRbTB96zErlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995101; c=relaxed/simple;
	bh=07lfiVTzO8Livfg8raQix3qM0PvBmIv/XbKbd6whLj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J2adK4K4ToVfAWZqqBPG793W6du50YAmX+f6op79z9Urz4LuCr1M9z8HG/vezHA1Swl3mxRQptRZeVEmyL6R19mYP8eGLPCdnfinXYP3SjRMkw+VCxRgSWl34hyoD3OkIxevTXnVK6eb+Eyn4ed5+U7grzmSsZIC3Cnwxno5MGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UX9+LNjR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78315ff04so713288f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753995096; x=1754599896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar6Wf1+UMHorH9TBZzw9vPO4d3FUGtgqbxwITenQBWI=;
        b=UX9+LNjRQEP0Om/aoXWcnhNy/N/CxNNTGGtGYGASgZrGuLPshYqKB9rLVzxTBbsAXf
         3hXnJkL9ICyJq5+pp4eOJCOeKblY0WH+T6PVJE3Ny+qITShoJ4OOhkf2TZul5SA7lOLV
         BpFz2Uwtc4U2wAitMIRys3dZWfraWlPMxwBdtR4Pk56Xooh9MsWGzCO6sXun0i2OmhZD
         55HUtyDr24xx5oeqZxtT4mKyyr6oxDJOqDV+RFvqYl+M5EdXujtnQZvTdR7Pe0b41X8Q
         OL9h8GQRtCMvngHJM9YIcWiMFK6784lV0w9bFLz0KMLW9QUIUTM11VI5joF9h7A679b7
         0g5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995096; x=1754599896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar6Wf1+UMHorH9TBZzw9vPO4d3FUGtgqbxwITenQBWI=;
        b=K87+Ir3EUIw7Y2wT9JDVhXXb3jZx5+NvDOEbGabXK19oOq2kKC/FBsJAHAWu+vOC5U
         9FWtGNX4t/0dPozkOH3iFuLjKAl0liWFWp0kzLoHya/Mbx9uXfS0HuLxPb92fjVWqXRa
         uCHBurAZ954CxGZzfLfV6A8nQrHy1+MNYyKUM+jVqme1TJrhBsHq2+QqFuxNhaae4ZNJ
         GIFBmzVyGuPnHW4U+os00br4vr8Wi+rF5s/3ckpQpz3prCF/vZYqdtAEtd3+sKpYyvo3
         AdcXjWv0U1Bbly5P7FRKySm9HUj2WKXT3Tm2BHUtGwqeTpqq7qY5zlBiw7guROSVPNLn
         99nA==
X-Forwarded-Encrypted: i=1; AJvYcCU0sRs2wJB5MNKHwYOxFrl07GPmqDzxyedYj4iSmkAZ1iC60zSm4X4h/TtuD08SzTrkCRcXD9t10dtJ5KYW@vger.kernel.org
X-Gm-Message-State: AOJu0YxuE1RfII37Dtcww/jLJ0Jl6bubcEb+aT7dvgQ3bhVSxPocVy4H
	5SntmCii/V9ozTI2hM0PFpmqbSgxOJqhhqEr5AxQNqG44cvxX03tPimP8qLhqMTd5Va6depQxcV
	Hy+gZUzw=
X-Gm-Gg: ASbGncsDeIb+/yNjbTRDGPVHj6cy1YybOzVsSBICL29yP9ffFcswkgZzKAEsBqO5896
	bZRa2l8XxrTRzjkeaxU97snw4+LChTkkfMqYSIHOREV3QL9Y/+q8egPK7jhkjUQDPHfZ+QVQQC4
	wH76p1H5r03yXf+FtCdSW34qidMZ3qJitbZWBG9gMykCFgZLMtFAHVUa+Caa00ibJvhbBdC1BAO
	+Yrj3H5EbQl84R9DVDjOVLEHxiDgcUidK5TxBEy/BuVd6TXQ7IMrLFxBXla3rnFtD6QuctxplMF
	iyiOhH6i/DZSWXkS9aDOE/UzCedtxd9GbPNylWryh6ULat86GxzHvndzNXjEKs4cKJZIG6Jotxw
	ltn050sGgyu0BfQonGawyjx/mBcsbhIiXuHGQnQN7RBn3LV+MeXVJavUKWBaqfnuU
X-Google-Smtp-Source: AGHT+IFIePr5Jj5OhjHaF2q0jZu0ma1dALBYhn0dPVtkAtWcQLW31eBDUhN9HgwQFxQvXyzTDIwRcg==
X-Received: by 2002:a05:6000:178c:b0:3b6:c6b:e4e6 with SMTP id ffacd0b85a97d-3b8d343c2c5mr203792f8f.11.1753995095656;
        Thu, 31 Jul 2025 13:51:35 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458953f8e0dsm76953885e9.31.2025.07.31.13.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:51:35 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v6 0/2] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Thu, 31 Jul 2025 21:51:25 +0100
Message-Id: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3Xi2gC/5XNvW7DIBSG4VuJmHuqw1+IO/U+qgzAgQTJNS5ET
 qvI916cpam8OOP7Dc93YzWUFCp7291YCVOqKQ8t9i875s92OAVI1JoJFBqlQLimEbJztpCHL58
 /4cJVhdwHgtEOoQdnVAwkOO0RWWPGEmL6vl98HFufU73k8nN/nPiyPoFPHDigdl458nQQ9r1Pg
 y35NZcTW/RJPIp6gygAIXTOG9+RRO9XonwUzQZRNlFp0lEYZWR3WInqT1QoNohqEbmzMsoGEq5
 E/ayomxijlFERosD4T5zn+Rc39nddGQIAAA==
X-Change-ID: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=07lfiVTzO8Livfg8raQix3qM0PvBmIv/XbKbd6whLj4=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBoi9dS5IzossHJXPMyK5mIJ7/oNr8rSeV77nuA6
 eCuTxYwEvGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaIvXUgAKCRBjTcTwaHBG
 +OE5D/444EK+ZjVRzMRSYbjvgEpcG0ePJFPavJ0ohg1DwGrFmFxfSjzMkxib5L9fkuDCdeOLZF8
 vE6A7rqUqzDN4VZieVP/1OE0rvMpKW5LhHamAbW3kBIuG52XLVg3awX9evxEOgNDuRyODAEpskW
 2wKdu8/0Hv4NX1lgJFncBCchg1YXKx6+O90zSC4xeHsOLGBCdqvoF5oAvqqVkciwvXvIe9oJjQ/
 c8S3EfdQ4UjVe0ONIgwgdRLj6Kf7Ykk1wC0wWmgPD1rE+U5Ynbe6wjxB+eUPGWDsPs5Bqt9CkCV
 eliRcAd1fbHYaKJwtkQVC0qMxwTW3axz13JnYUtXjt40YsCGyXwKp8QZCPvK+qzCetVUHVNSve9
 HrhyvB2GvhRBo5LMx0xIsCFKiTrYajvnb7Q8rtybZZKX3ktDnLUzCPQeB9htE885p7kYxqLoOA0
 XqsZWQTluaa+pLk42g8ub304J2ZopBUACUXwwpg64pBv1hY+bp5U8eTUfuLe+Xw6XQMeqyrBaV0
 IjSPZE1bZwJu1+1IqKU0EcOygVZREYoXeEXWQ2ARcpIk1D++nP67Y0eB36fDPUHezC3sBDfFIL6
 0lkJXAVeMSdPHQDU131Nu7VMX+70reQvHM3lXVeOazj4J4BGiFB8kF8dQv5Pwno+bMJslTiVQB6
 G92zNF/oqLKjXaA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
panels. This patch series adds support for the OLED model which has a
Samsung ATNA40YK20 panel.

With this patch series the backlight of the OLED eDP panel does not
illuminate since the brightness is incorrectly read from the eDP panel
as (to be clear this is not a regression). This is fixed in [0].

[0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v6:
- Squash patches adding "edp_hpd_active" node & its user (Johan).
- Sort new pinctrl node correctly by name (Johan).
- Use correct function "edp0_hot" instead of "edp_hot" (Johan).
- Drop review tags.
- Link to v5: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org

Changes in v5:
- Move edp_hpd_active from T14s DTS into SoC DTSI (Dmitry).
- Link to v4: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org

Changes in v4:
- Rework HPD GPIO into eDP device rather than panel (Johan).
- Drop review tags for HPD GPIO patch.
- Link to v3: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org

Changes in v3:
- Added review trailers from v2.
- Dropped dt-binding documentation patch (applied by Douglas Anderson into
  drm-misc-next).
- Dropped eDP maximum brightness patch (will be sent in separate
  series).
- Removed duplicate nodes in T14s OLED device tree.
- Reworked WIP comments from commit messages.
- Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org

Changes in v2:
- Use the existing atna33xc20 driver rather than panel-edp.
- Add eDP panel into OLED devicetree.
- Add patch to read the correct maximum brightness from the eDP panel.
- Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org

---
Christopher Obbard (2):
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
      arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                          | 5 +++++
 3 files changed, 16 insertions(+)
---
base-commit: ba94ec807b071becbed7377f8c84308f1b6ccd51
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


