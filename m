Return-Path: <linux-arm-msm+bounces-23789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47A913E0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5291281C2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13021836F5;
	Sun, 23 Jun 2024 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBq4aT2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA11E869;
	Sun, 23 Jun 2024 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719174644; cv=none; b=ZH8uxdZGSsYheKe+rc36FJ67FnGfHD4Zn2lJP+hNxZfmgha9V4KLBNSF0O6+eo8W01/l31OSIQ4IvSoUv4xzcUbUGcfupaURs71CFWuUlQB/IR5T+142JmMhDpQMQjF5tfI2qdVOEwNQdOm8Nm32jRofE/Uym9iQPWwykDcIOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719174644; c=relaxed/simple;
	bh=xjltCcRgmnJlrsLRISN+Zq/lwRG7lbNS3UTFK3I8rHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=unJ8q7NxAhR8n3xA/t0t9izqQzXTeWyM5rNt/wOGuI7plpDJv13AGGTw8SDxzbNXa++eliowcsCf5LOaKrfyV8kG0LKPrDhKU5llyeerjpApRIHgy5w8Ppt5ELK1szS108ENnYque5btspfkNfL9dRfO7/NX3J4O2btHOfnfQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBq4aT2y; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3632a6437d7so2094353f8f.0;
        Sun, 23 Jun 2024 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719174641; x=1719779441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uG1Tys1B/HQLY2Tx/XIV4+WZ4HCgTs0TOdWEHncJZM=;
        b=RBq4aT2yVDpjLUCZEg2fjVmwPa22ZltgJzkLxOXChangNeN/mW+KhrXPrfN+4gda2P
         B2NH3wnEcsA6oE5B80FkOrDuX7bqJgeDkR8S+KMIH4W3DogwxvMlaFcplQltqEU/Zk1X
         cy5zLPuctQShxk7vUgb3GMZo8ivITAHZEQrjwNwbBckZ5evgA+R/wug5K0awuYltx2Fv
         2UxzgNrWEaFPiq9b/e8Dnp8hAB/uveXYpvZHnJbwbeC4Ji72DleM3gC4hYSp6bHC5r2O
         oBZYKRUnzB/zGc/zySJGVYaIEoP0qPK/lznilV3NYqihmc9e3Z1GkausFuacfSey/Suk
         2VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719174641; x=1719779441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uG1Tys1B/HQLY2Tx/XIV4+WZ4HCgTs0TOdWEHncJZM=;
        b=iYkuDUZ7pObbQqo/FehduYvkcP1xyN2ysHDw1J6dOz8wvEsrgrL9IOvfehaC/g8Z8r
         dHR46gbNCXxwajJmCfhDcj1hVwJRDjye1MJ/9thaHe/v4z1wuGi7HY3oux7oS7v5sHUo
         8/66ImbGZSR9gDmrRdOExCKim0M2LqekWB9twHFD1cqzl+wMglQggNPIVjGUrew+ysXb
         AyHzLafJ1C3YxAO0uxVrh4+4MMX39LSUwgTe96TBfzI8Y5h27NFo3si3wkxXLKjgBBSV
         7PIQruGYFyLe6DlOiOoM8DpUCEIlVt9ZyWSL7X0rmkusm4MXNU7yinttOh9tXvcVr3uw
         auOA==
X-Forwarded-Encrypted: i=1; AJvYcCUdSgl1GIWsOYvc9CYINvGgFyTq5CiAso5n/ND1cduRLTigr0Ck535+KAWDaJPgYYDHtZGCRGow+N4If6VL0ijSc4KIh71JvTn0yCDxYfIDmf0gMzyYVE64m8iTjeJezGgTmiLjKJl2UC4UkgkFHW62SEekSoHnqSvbpawNm1MSOB59eaWB
X-Gm-Message-State: AOJu0YxpfRaXubknUiFYxdY12n/8ayIvhZ68/cuyHYhri974le8N8aPh
	/HjzGEvZU4aC6dwSi1coWFmNj0Fh6++kXL/+id/kxV72Fp+lGENf
X-Google-Smtp-Source: AGHT+IESzOtPGZ5GOePsvOUKETWkuSh9OYBBcl3AjTUBWVS89bQ5ueDZ98xvPPpfuDArDMrx3vPQug==
X-Received: by 2002:a5d:60c9:0:b0:362:ff95:5697 with SMTP id ffacd0b85a97d-366e32f6e6emr2844708f8f.28.1719174641228;
        Sun, 23 Jun 2024 13:30:41 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:30:40 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Subject: [PATCH v2 0/4] MSM8937 MDP/DSI PHY enablement
Date: Sun, 23 Jun 2024 22:30:35 +0200
Message-Id: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOuFeGYC/y2MQQ7CIBBFr9LMWgyMBasr72G6gDK2k9jSgGk0D
 XcXicv389/bIVFkSnBtdoi0ceKwFMBDA8Nkl5EE+8KAEltp5Fn4xKLTipxDNLbzUJ5rpAe/a+X
 eF544vUL81Oimfuvfx1P1NyWkaK3TRpLTzl9u42z5eRzCDH3O+QtAmLAHlgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0

This patch series adds support for the MDP and DSI PHY as found on the
MSM8937 platform.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- Remove MDP_CAP_SRC_SPLIT from mdp5_cfg
- Link to v1: https://lore.kernel.org/r/20240623-dsi-v1-0-4ab560eb5bd9@gmail.com

---
Barnabás Czémán (2):
      dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible

Daniil Titov (2):
      drm/msm/mdp5: Add MDP5 configuration for MSM8937
      drm/msm/dsi: Add phy configuration for MSM8937

 .../bindings/display/msm/dsi-phy-28nm.yaml         |  1 +
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 88 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         | 18 +++++
 7 files changed, 112 insertions(+)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240607-dsi-851ebb226a8d

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


