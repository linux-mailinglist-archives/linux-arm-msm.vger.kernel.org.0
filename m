Return-Path: <linux-arm-msm+bounces-15994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B18947FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 01:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9EAA282924
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 23:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15A657889;
	Mon,  1 Apr 2024 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBL5QGAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C356760
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712015478; cv=none; b=R9HmYpAPV7/4Rp+/4npDlkUYFawwBhnuYlXZHDnuIKgUk6foBsVTcnxgSKsnzD8UHHLf4LOzQEXgjrlI4ac3cG71vY7UhxA4yOvy5AS6Wc4Q1Pf9Zf58yhHeMN2g2otF29YI4CZwtk75YDHJl9It6/n/wOq0jDr0rNr4ZjSs52Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712015478; c=relaxed/simple;
	bh=AIE+v3isfbEbNJwblsGQEZ9BeAZNLAvQspWBKbN90cg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ktf900we+PngxSZIlE7ME/RhMX+N0A0zib7unelIsgBygghFNrzpu3NrAR1KSBLu0lGS9K4gxtLwpxeL0dPblgVBDJLvEQRMCoYXbrb/fCUFT7nzxNSnsisWq83lERr83u0EEvnTttaLVhxJHgIqbvZPkykQ07GQq+P2X+QODpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBL5QGAa; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d476d7972aso65834981fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712015474; x=1712620274; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dcSVI3IWYNVdSPmBC0C2QNVAXSUlaGzN8zET/T3Huo=;
        b=FBL5QGAaLE7u1ajTxg4NwD6oRzWF8seTF4S2qA4BOzKBtuekoUDYfPNh9BH+0SIH+6
         NcTX8T3GMeg+YaeZ1b7X064NMkdwpTOW0olKpDpYG9SkO7SdKrYKAa6sTgYj96txzbGN
         /VJBxMAnr12DUelfHQ/OjJgFz8MHcLYd9ysjBmkls6R4uUuzmqKifiRD8CCSngh1C2nv
         eTGO/c70NCiJtq6RWPpWodUBIbsO7iEouCoeEP76DUqiif6u2PyNd+VHlYOhs+u6TGHH
         Lv5bONagqO1T5KzYmkC2llGFlkg/8puyiDJJicSkVzP2K5S1ZBq/DE575Pyx1pD3aMd7
         7yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712015474; x=1712620274;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dcSVI3IWYNVdSPmBC0C2QNVAXSUlaGzN8zET/T3Huo=;
        b=T9+PLrcSJ0DF45qt+Z1lT7G2+2zjOXEDqIvwSkv58zlYZL63O4IlmHcYCiwSGSDBRG
         Gp04O4RCGaCULZEf2vY2SZ/C9ECr72HXm2Ym/9Fi/2sRqY+D2z82p6z6G+K6yFGDoKrR
         GUYaXDGsFYioN0/P/IRig1hrqvpjeFiKESZDsMJuBLG1vbmfrUwYXFyLTJJRsp17kZ+E
         DgyW7Azxa7SvUVmMLxhEp4J6KB/5ljv6P4oaI32F4QWgdNAuGCijJ74dtoQ+VqlaMQn/
         9+8zS18l1Yy/PlYfyHKfiCxY/VSxbJqfl4f/EGuEXmetETGPa2EXlLnC/hdDT4Q86xoB
         6+jw==
X-Forwarded-Encrypted: i=1; AJvYcCWvF41fvDqSjAqRk9/m/rG2ZuQSO40Y8M+QKVstYR2PQRmTjICWrKrU74+tNyYEtXR58c9JKxADkImsYUL3gaQG1Q+KTreSXz5RMei63Q==
X-Gm-Message-State: AOJu0YwNhluKtluphPQhDZXQttyewDauTrq28mGZ0j7/ZNlEmq3nmPgW
	/BqaTgZ2llXEW9LStCBBoNRQblNlAJFr2ci7CH2kF4BWy9U5DndoC4yBavySpVQ=
X-Google-Smtp-Source: AGHT+IFYSCeMxGqZ2MbE1waQe/9063olfwjZ1oTGYegt2N0rOdrSyiwLNPjYVdZg1fOsMFVZeGMzIA==
X-Received: by 2002:a19:8c04:0:b0:515:9aba:743a with SMTP id o4-20020a198c04000000b005159aba743amr7163184lfd.59.1712015474106;
        Mon, 01 Apr 2024 16:51:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g28-20020a0565123b9c00b00515d127a399sm1176135lfv.58.2024.04.01.16.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 16:51:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] drm/panel: add support for LG SW43408 panel
Date: Tue, 02 Apr 2024 02:51:11 +0300
Message-Id: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9IC2YC/4XNTQ7CIBCG4as0sxbDb0pdeQ/jglJoJ2mgAYOap
 neXdudGl++XzDMrZJfQZbg0KyRXMGMMNcSpATuZMDqCQ23glEsqBCXzSPJTCkk1WUxwM+mV4l4
 yZpVwUM+W5Dy+DvJ2rz1hfsT0Pj4Utq8/sMIIJV4pTb3tPB/MdcZgUjzHNMKuFf5P4FXgnTBKt
 6zthf4Stm37AEKhG/vzAAAA
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
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AIE+v3isfbEbNJwblsGQEZ9BeAZNLAvQspWBKbN90cg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC0hw1zyg3pAwUtnjkm+5F8dYu9r5Jix16Jwgd
 d5XVDHdzF+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtIcAAKCRCLPIo+Aiko
 1dG3CACR4Oyf2mAyMzZiyD5RWhCiID+SZ5tnwd5Zguqhu+bKP68AWpQ+ckh6dZmUs0A7DslNrAR
 Z3fYeMEIWHk1sWMxedMcymSYfnBb3VoXunNufkBA3HBylB7zGrSuZ7Gr68W/Z7HXftfu6PeacOx
 0ib8+dIrDFXHx7jvzGAIGLIjb7C5Y/qFe/7LsxEeIyNADMoD58iutryQyVrFnGIDLFJFg5nDuFu
 H1j7k9wxHmQnY91jultTOs/37Rx6gkPKOmZPOsSdKpUj7pQzzV1h3e6BSltztv7hEdUn47hMfUr
 3mOnDPjuIRNMF08qnVlteUfwH4NQgTG7uUBocJZvtjX6YbSr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LG SW43408 panel is used on Google Pixel3 devices. For a long time
we could not submit the driver, as the panel was not coming up from the
reset. The panel seems to be picky about some of the delays during init
and it also uses non-standard payload for MIPI_DSI_COMPRESSION_MODE.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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
 drivers/gpu/drm/drm_mipi_dsi.c                     |  37 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 326 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |  15 +-
 7 files changed, 449 insertions(+), 11 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


