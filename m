Return-Path: <linux-arm-msm+bounces-48505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F525A3BF58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442533B91F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879721C7018;
	Wed, 19 Feb 2025 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKkFCea4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2341E0DD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739970039; cv=none; b=nVc254fMIOhf31sByfeW6App8cdj4JbnbB6tUyYDene3PZM2mtUvSGS9CYYCZO3z63wkATMtX86Q449UkzFdiMyUEMrnNNN0Kan5X50xhgwQ9ijt1yXhuAKWkuhxV5qVXby5ez50VTc5qMc/6rX+xOyDYGajCb3kXpKBF0f4V0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739970039; c=relaxed/simple;
	bh=xLBEqgHgGc6f4GhWFZTZYL2fXQhQWUDFIGyzofB5XTk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HgX/XELh/1fIVNG2LVeQRvvJXmKEDj3t3fCHz+5JcgbLteFKR0NP5JMKUNfJiDNR4lSbqEAHAfKDo7URneyWFE9w+FTDP7bfiQ6c8uQkYYcCsxfjDUq7qtFNotvhoHpxEom/M8lSvwlUaTkegKnWQYzBkQPnYast2JvbDzTicSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKkFCea4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso4040426e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739970035; x=1740574835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9nu9CEuORGkEvM5vI9UglG07cy4F38vVcl8XiBSAjU=;
        b=pKkFCea4/IIrp8b/LYgwymV8YICs5PDFK43yQsB7Njy/lVc8obarlEvUY5H5bBBse2
         XWoHzixNLq9AS50wruEkPY3F9eh94Hi6d4ZmuwgaC/RBdk840WhoEPdiPHIqFMR6oiwi
         K8Gzi0el2tdFcJE8/PnCgJ5WyZ9ISg09VZEZh75jQK8ePN1rhy32WgYFkPlGYccX3nLi
         ldRTxr4c8l8QJOGbJWSzrOxoL/zW17l6blFOpsWVVx6DauBzTlFkNC+imyEUDsOMmLqp
         DRNnrhhN+wE3gFrUW+UBoBqLjBvmNX/+q7T+66C4ErPfmZq8F0QKM0fq7zvt5EJcU/k/
         msVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970035; x=1740574835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9nu9CEuORGkEvM5vI9UglG07cy4F38vVcl8XiBSAjU=;
        b=SAiARBqhurkixekzd1Jf/1aJVMMV+CrPgGmBatQ6cVbptxSncXJyz4YFLYEEDMQXt1
         9SKux8Tr+cXgRQJLJrBWWB/Mi2QiuqMtWtr/rHEx1djw6EwHwkzY7QiI5bHpTvLYQ9G6
         9otmtuzjsH7Hx+Rmla+kTYsVG3elIYuKSoxyXuelXm1ic+1jmLjgFUz/ofs6W8IEVLE3
         +fbZnsevpN+dbbo8nJz19zPu0Zfl/CKHRcPB1aACOcd5tsAGo59za1INszxDv3F9ME9n
         huspjBe6vJrEmtnDaEqW6ni5wjoMc4DS/y6uSdCxaH/GIzMrfFzYohcYFTj/sVql07UC
         U4YA==
X-Forwarded-Encrypted: i=1; AJvYcCW4xijUNe/5tG+dGOzs4fPkzRTggbtr3wH+Wb+Utoro/cCGPfBc7MVSfebCPjd3tF4OUWCnq4ZQ6VK5+MX4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5ByPxw9o2Y13CEHmmc//0ewKnmiTbyJtMJ1ij1D/YEXI39GY
	PHa8HeHPSHsV7/NzMI1m6PMw4hwzNg7La1jI0+h9IO4gHXoAxsTIgQWYnBx0ufY=
X-Gm-Gg: ASbGncvbkX0Fhm8MkPPVa6IUv0an/cTxAuh1czQ7JBck/URdrj/VmVktQkxDQP4mGnw
	hb+1NWtw2cLGG6Y6aSDZtpMqmzYtOY9q+/Z8yw4xK+B7m3tI/8bgyoLNyOF+fJRwXG5O4XQOqVb
	oOLlYixbJHPuQvNFLZe9YrOxOB9zFKsfSiU0w05nd4KTQEaOk66EVfgNV8A4eLBuDXS2Ee/gBAS
	ThdW70WSOqAmLVoqkDcSvJaqG6jcFEQWJgZozi6lsmgSvCxN2Qhl9lFRV9sfTrh0XCl30BMrtYW
	r7mScT5+evHaFgyT0m41aOw=
X-Google-Smtp-Source: AGHT+IF6YzLxPjQygzIyCyDmuGvnG2Nvx8WRct2Dh5q/Fm/R1qDKwRlM49lHsASYxtLspq93RsPzSw==
X-Received: by 2002:a05:6512:36d0:b0:545:3037:a704 with SMTP id 2adb3069b0e04-5453037a70amr4902370e87.17.1739970035480;
        Wed, 19 Feb 2025 05:00:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105a3dsm2179515e87.144.2025.02.19.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:00:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Wed, 19 Feb 2025 15:00:29 +0200
Message-Id: <20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3VtWcC/3XMQQ6CMBCF4auQrq1pRyDgynsYFy0zhUmUklYbD
 eHuFlZq4vK95PtnESkwRXEsZhEocWQ/5nHYFaIbzNiTZMxbgIJKgaolTnLAG0vzQPZSV9g6tGR
 t60Q2UyDHz613vuQ9cLz78NrySa/vv1LSUsnGGF2aplNY4unKowl+70Mv1lSCT97+cshc12hrs
 g7AuS++LMsb2LJyleoAAAA=
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xLBEqgHgGc6f4GhWFZTZYL2fXQhQWUDFIGyzofB5XTk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntdXxTPSIb3Dq/+5KCR2epY51xmqraveZyobcV
 3GTWgbS4XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7XV8QAKCRCLPIo+Aiko
 1fjiCACucytRzp+kgNNU42Wz6rz4JB5m835hRXFZRFNkxVQL4iN1K4NUjk1970tPgxM0ejsc+EJ
 MWfeH7BZ9kEaJzjH23bIgxBNS955/l6oVPvuQeSHQcNoAyUXhLpeadElzKSiH2IhUu/SxWhGXRg
 CwMB/Qu99lbFD70FLE2h7FTEOrKs8/JczxvrZ7xAf2CPqC4bS3ZA3/laUBUBEWWc+6p+DzLwkpT
 +bYDXQK9Z0DMjYbRobucVtIO6DT68dCgfISRT/bJyqeE3+XDQNgsoAxsUzZzvFtulxc+xCTJQVx
 UX7dBMhG6rvm4CrvBgu8RTYyzk7ugOjkZSp444w1RGcl6nVd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and msm patch
via the msm-next tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (2):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c |  59 +++++++----
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  23 ++++-
 9 files changed, 90 insertions(+), 195 deletions(-)
---
base-commit: 0e9eb9d5dfffee443c2765f86625b3a6d2659e95
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


