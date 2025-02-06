Return-Path: <linux-arm-msm+bounces-47039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCCA2AA63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 14:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60AC3A4B26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 13:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0AE1C6FF6;
	Thu,  6 Feb 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkAelZD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C4A1624EF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849877; cv=none; b=OSL9Thuq9ikAUMCjRhLiAU39kxGraMQYPQ72UC/Eh9uenja6nJqgnvq8pHzND9Z+bNHE8sdqnbuzCl9Aup6GF6gVmbK4vUl5u3B5FlQTKAEanaH2dMYh7ErJmmpIJ4MbjkMrEem3oA/Sv2iCookgqkq7pxrMTMEihdf9Z3DEUAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849877; c=relaxed/simple;
	bh=jEfFPYjhhWYVQQFXyKASWQyErTdoY8Ap+ZCTd9eVCBE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZJiLQ9IUW4LibPCeg2YHnjRXk73UU1fBxLc33pyQcfcQkVcdDP1fE1xECL56Z+YB0sLbdmSBrZDWgttz1efVg2cC96ucabAym81SIMdJf+cjC5fkK+B0kCYiodpAQz52+pHgEf+EeFnB+mtglV/BA6DB+68Nuqcnp5r1lwkdgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkAelZD/; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30616d71bb0so9748711fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738849872; x=1739454672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlvRT/m0xJ3xAgqG1g5fsw9qNYmlNi8FJnlxC1TPJrQ=;
        b=UkAelZD/aJN9ZMJUsUPuJhIFVj0TRqecMFf7ESNgUk76Pi2BNTORl2OJvX55Aq/P6A
         Qgp0vi3ADSISzH3rXVT7U7sZNISgFFKp5+piPCPPrYTlcCgTIzlhjGcvvYPxfQBR1TpW
         537uRYPZafkhdSxpU4WD8E9Sy74dkPDVqGet6dyDhSbWbVOsZWsxQlp2tRpokDpyWkf2
         RytasquYnI5Wzus4nJRniQrxjwQ3EvuSPDp54fUC2yj4zmM2ecwnKkSZ3DB0EzTOI5jc
         iEfVHfbOTnAz0rgZ0RBKNGUEZBiklsyl4AnGiAchfWwdDm6mSiGfVBa5Cvai5Jr5LhpZ
         Wurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849872; x=1739454672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlvRT/m0xJ3xAgqG1g5fsw9qNYmlNi8FJnlxC1TPJrQ=;
        b=D896gcHvUluisctr5QhgmWxc+LzmPaDMJo5oYLfhfbvw792cdLnKmVNYpz9ioJ6LER
         2rKsYvNtCxgiVZVx86yQx/jYSRLZYm+DylHi7smZMv4daUyJk0+SNb5e/VwyIWLSMKyq
         ytJB9FqLnLRAs2h06uAWK1b9v3qhcBLwPzA04yFAXllanp/s3WOkJr4lqtvYPEmEjNRZ
         JSMxR96BamEK0lJ9IcMdZD83C94Q3vWMK11Pv/fLWL7abRVuf976GTnkRlyoFtpWIuU/
         0HUULuOs5EbZFXLltK//K1Z1flgzd0vNGz3JnrfVeJK8xVVkHOMFWYhpFMj4HdylobHi
         47ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCViHT+s9zIrMZbWs8IDmx9iMGxsvYru9TEZau/GMlwc0mU8dcB13cOBcHQYrqjDiTOPHMPyfnTXwMX/MjHO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3Jav86fBvdvs+FPCsfM/bxBV1SHPCUSSr52ga1XER7p6rs6l
	cZ1SWHfNa1Gs8mAyYAoZ5CaZEsalsAcapqPmoCWU5biKr31VDkMwnuNbWyG6pQICB8MtgJcfVAH
	SYnc=
X-Gm-Gg: ASbGncvvFz4I6n7+XZmHY9f8hmb5vJM6Ddch4J4JThSW0UAuN4fKuviAN/oDy+L0wG3
	7vRAHf+8Qgbj5sFXwnh8xQwh21IdNQnz/7P0T66CQIjJWP6FPCERhEp+fBNKZS+JJIYizdkPfca
	QLaJS7xVJdi06TaZB3xWKzH9gQr8Bx9Q0x/dRMfPh4VFLHSFJSYeRgbBsMd6+PAfBzh7+jYIhMy
	S5B59nOoNlDxCaAMsF/VwYzyy39SBEKzpJBSZeAdh/qJaEFX5+qEI7yOlVlF6oGt4PvvLVg5Hme
	CrZP8AuSUSeEHjaS16BROIQ=
X-Google-Smtp-Source: AGHT+IFSoxJ0P0T7H5ffUZDnHS6utLPPhqQ0Xj+ZAE/hrtS9g7mDuzJ3rLQXiReVNulKoeE9NZoXiw==
X-Received: by 2002:a2e:a988:0:b0:307:4fda:c544 with SMTP id 38308e7fff4ca-307cf312227mr26755631fa.17.1738849872268;
        Thu, 06 Feb 2025 05:51:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2da11fsm1318521fa.92.2025.02.06.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:51:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Thu, 06 Feb 2025 15:51:05 +0200
Message-Id: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEm+pGcC/x3MQQqAIBBA0avErBtQocCuEi20GXMWWShFEN49a
 fkW/79QOAsXmLoXMt9S5EgNuu9gjS5tjELNYJQZlFEj0omRdkF3kRyoB7KBPHtvA7TmzBzk+X/
 zUusHO3u32V8AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jEfFPYjhhWYVQQFXyKASWQyErTdoY8Ap+ZCTd9eVCBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpL5N8UxuLafoSi1beUZMoklAK0KI+apFqYcXK
 zIpR+AMEJeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6S+TQAKCRCLPIo+Aiko
 1R90CACi7Ti+Y/t8thf8VuDZcV6zf2WGND598IR0eR6rFaQ0KTGdYwEqLjnjAGefiGxMz85EkOC
 IMghfm08/ysXE3DHac6U5HNPlQy0dpcn+fvRmjyVel7Lmt65gInbi0Wxz8vVdzmBYO6LqCZuWqU
 tDJhwMhmsDoCGFLXH7kBEZHRy4aoYFBw77aIAuSNRjuIm/nOBA1fEWNu25c56E+5n+z+HJRVl9F
 rGJaHzmMRSOS7rdOV7XzPAeVjojxZdKuu/MOu6P16S18LcjidgWRO+oHSANTm6C3uSK8iSKsiP6
 uJO2TE3WnRU3AyrTmgBAGLDE3BQZYGBtSSq2/hyvu6trgqcl
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
Dmitry Baryshkov (2):
      drm/display: bridge-connector: add DisplayPort bridges
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/display/drm_bridge_connector.c |  66 ++++++++++---
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  14 ++-
 8 files changed, 96 insertions(+), 185 deletions(-)
---
base-commit: 93c7dd1b39444ebd5a6a98e56a363d7a4e646775
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


