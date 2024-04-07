Return-Path: <linux-arm-msm+bounces-16707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6589B4BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 01:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E50283259
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 23:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F00044C9D;
	Sun,  7 Apr 2024 23:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jAVuGJ6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA3B1E893
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 23:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712534036; cv=none; b=AR8GBT3PdHKOrOvxlTf/kWco8rI0aoOPkC78jqOOOfPaeB5eqNitjGI99A7YuKKcl8P3KTZRBP57POamG91a9bWRZho7MDki0u7SQ36MfZwfySR6YuAAp8uSksJIc/4IKGhj/vsmPxk0pUGDzNW7u+B01Y4BHGK5ATSpzZoMocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712534036; c=relaxed/simple;
	bh=t8MZMgY9WeARuExR2gP9qPibci5DwBYxO4q76j3A8PI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k7guuJa87tn6fpn0oBSl4n5UIuYmqqON7R4AuLFNkWuhh+XWeNIZzqhtUl2KihlLyzblMh/x6K6fhZ64nstdggZ1YeehCNQ3v0kIh+iPObPnQN4csvVoHMEeRgy7CBZx5jr3ktN4kUXRUm82PvDFNN4O5oJFuVu2PUfODgr1C0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jAVuGJ6w; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so7962271fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 16:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712534032; x=1713138832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMcxsAENHF5JWPN2nEOEzKEp66J7aXCfL6fneB4AUf4=;
        b=jAVuGJ6wGTrL6FTlTb3Cf5GoLdDr65WTz5vrRFj33F9Pgo7MdU3XIyB0YG4xlKgiLu
         FlDkGLtGKcTduWNQNTF/xfF9gYoHjNcgdcpgPxVHV6D6MzWCxy0NcORlvZSonomEhUHx
         T7YtM/ZMYkM//TqSoxLwEezLTg3DKZ9of01FgVKtNNUcbF/oMw9VqdfFlHCX5vgX0FKz
         koKgl7RImbDrHTCZuBteDhCVV/nMT2V5gqEjQ2O5cOF8XczZ+XvguWAk1lj7w/vQEP71
         gciiCS8C74qa7Igabu7+YFV5s0XQkWf9G8gR1/F+6QxfveZAvYVR4RPrj4ME/5W3MEsa
         Hqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712534032; x=1713138832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMcxsAENHF5JWPN2nEOEzKEp66J7aXCfL6fneB4AUf4=;
        b=CpgI2XC94xLahSbbPL+lhf/ax9HqLIz8CyiqbU4TfBV55USarg45oUImDxcCtqrNxW
         B4wTnCHdKIMCGFuOQngsFTXC7vZad40ZHXbpVoJGSLomhQlpWxIUzrneoTXk06rnV9Jq
         n8ViG3ACMJNc2D7lBcF1+s1bFC0nc21yNGG/E49cKqEAHdAy2mi2AOMR1zjmBdgs/l9k
         BC/GEU6jaNWwVqq4nNEf4Bkh1MBJDUf8TKe5P7U6dSDl+snFuQPrKyJNQqqnrAZQwvEj
         FlmUVJ+yscp51SoCmvBHD/9Ci8FW8QmUHhx+8xNkLBAuS/9+u1lO4wlgMd4MoyD2oDzG
         /96A==
X-Forwarded-Encrypted: i=1; AJvYcCWttHgsa/C4NUDYDlIe4xnJZqU4U9hZdioHCi5XgT4lL5hHfm/k8iRUtg6ldMenR+ykAvR7V4Ls3p5Lvjk+vBjpJ7UYLdg5Gm/qt/OYCA==
X-Gm-Message-State: AOJu0YzbHq/g/QvVYfSYUxy/95/eHPuqoO/xZ7+o8rDWMYIRSs/IGRle
	mckPd2L8zDtCe35LBC0culRH12tTYpBSplh2lCXHF7EvM/aETlrNTG6B5XLYXxc=
X-Google-Smtp-Source: AGHT+IG8Cvzb47G39YnyMESEQFbAqyke8GNxFSe1lOa01YChD0+et85pPgvFJad6kghoFHZRAIHgNQ==
X-Received: by 2002:a19:9155:0:b0:513:ba98:36a with SMTP id y21-20020a199155000000b00513ba98036amr5237441lfj.10.1712534032021;
        Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t27-20020ac2549b000000b00516b07fdc26sm965696lfk.109.2024.04.07.16.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 16:53:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/4] drm/panel: add support for LG SW43408 panel
Date: Mon, 08 Apr 2024 02:53:49 +0300
Message-Id: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0yE2YC/4XNQQrCMBCF4atI1kYymRkbXXkPcZG2SQ2UVhKpS
 undTd2oKLr8H8w3o0guBpfEdjGK6IaQQt/l4OVCVEfbNU6GOrfQSpNCVLJtZLoQkjLyZDvXypJ
 ZewKoGJ3IZ6fofLg+yP0h9zGkcx9vjw8DzOsPbACppGc2ylcbr2u7a0NnY7/qYyNmbdD/BJ0Fv
 UHLpoCiRPMh4FMgpb8ImAUg8lBYAMvrD4FeBfwiUBYsmnXNNZaqehemaboDf3BNJ3cBAAA=
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2771;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t8MZMgY9WeARuExR2gP9qPibci5DwBYxO4q76j3A8PI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzIOYhLmADeE1oMW+fuimUAYr6cUUclraV6es
 Wu3wQMznJ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhMyDgAKCRCLPIo+Aiko
 1cQoCACMrDFIOYvkEv/r09SDxlsU2yZMhfKkA7hCJwc0eqKkWPYlHxfNEhXmp4yvJg5MvZ5tEsD
 0x73gudQfFfiXQojJXapalASKBWU0p1Ukw3G0n+M8JG9hDlEF2eALighs/pKoYzKuBSTBk5duSB
 20v2rk3/2QKdoKS6Vy1lQRlQr0Y2DtuRtOpkecsNVqffmG7jgVgLz9wH4J4qSaykks1DOKUqgDS
 EAnn1/1xEUAkUzgGQs77lbwo6Dla4Yd+UQeAU5cES6MMrwkNZzT7uYHA2ClUHTzml0R/z/nb2V7
 OltGgTznYpE+bNSI2eLrqbVGqqmNGyPfeKGp1dPxUpZzderH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LG SW43408 panel is used on Google Pixel3 devices. For a long time
we could not submit the driver, as the panel was not coming up from the
reset. The panel seems to be picky about some of the delays during init
and it also uses non-standard payload for MIPI_DSI_COMPRESSION_MODE.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Mention 60 Hz in the commit message (Marijn)
- Fix the comment regarding the panel being DSC-only (Marijn)
- Link to v4: https://lore.kernel.org/r/20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org

Changes in v4:
- Fix order of mipi_dsi_compression_mode_ext() args (Marijn)
- Expanded kerneldoc coments for this function (Marijn)
- And added arguments validation (Marijn)
- In the panel driver send the COMPRESSION_MODE in LPM mode like it was
  done originally
- Expanded the .clock maths to show the reason behind the value (Marijn)
- Moved the mode out of the match data (Marijn)
- Link to v3: https://lore.kernel.org/r/20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org

Changes in v3:
- Fixed return type of MIPI DSC functions
- Replaced mipi_dsi_compression_mode_raw() with
  mipi_dsi_compression_mode_ext() (Marijn)
- Link to v2: https://lore.kernel.org/r/20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org

Changes in v2:
- Removed formatting char from schema (Krzysztof)
- Moved additionalProperties after required (Krzysztof)
- Added example to the schema (Krzysztof)
- Removed obsolete comment in the commit message (Marijn)
- Moved DSC params to the panel struct (Marijn)
- Changed dsc_en to be an array (Marijn)
- Added comment regiarding slice_width and slice_count (Marijn)
- Link to v1: https://lore.kernel.org/r/20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org

---
Dmitry Baryshkov (2):
      drm/mipi-dsi: use correct return type for the DSC functions
      drm/mipi-dsi: add mipi_dsi_compression_mode_ext()

Sumit Semwal (2):
      dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
      drm: panel: Add LG sw43408 panel driver

 .../bindings/display/panel/lg,sw43408.yaml         |  62 ++++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  45 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 323 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |  15 +-
 7 files changed, 453 insertions(+), 12 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


