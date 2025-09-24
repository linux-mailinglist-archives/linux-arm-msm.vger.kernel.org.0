Return-Path: <linux-arm-msm+bounces-74615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D614B9A79B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3FC71B2293D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A460F2343BE;
	Wed, 24 Sep 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRylzg0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5830BF63
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726524; cv=none; b=SjZHUQvy0suj51rRSZm1YghCMVui77JOPz1ywReh6Omw8wNQLWxD0sklBtDy0ai9P/sxJ3NM0kXZwVgmLuNXTYGC39V6VtnHG/yeeAwIiuoyAWy1jvA0gujRM0dJi7FiQof7+p2EOeo1UCOJaFMjoPEDUWhD7DWPdemh60KQP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726524; c=relaxed/simple;
	bh=aqMS0Jn1TNh3mlyytrjaZuPheLrmPmhjXnM4Dd4ZxXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQNv3e0W/gkQGfOVjA7i9GoeHP1fl/HbalX8EN21mByPZXB/uEEBlD49j3d9kXlriApBGSDUbb78W0WfVjpG3UloeLIRcmTuL5Sj1tMBlB32oqVnrzZMyNXIrqUCEcKh+HfbxnQ0cTWB4f/l3EMbZ5EzPJLkO5MQtcI8m5pUFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRylzg0F; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b556b3501easo1467391a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726522; x=1759331322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9im2oqF4utRrC8rBpdrGYdBctIiIANDtE89j7rUJb8=;
        b=mRylzg0FMzv7mbqyzPNnbYEZMnvhxr9z9vsX5+bKWwcOkzS1dc3x1HkknHWM0dGymB
         OYtIKUff9ZSvxxqdv02ZOss/KbYN5fEhBcFpL6fZzAwCotA6QzLQ9sIBsqiGohnhVVpA
         WaQnOI4i87QSVyaONmNKvZr+yYJevjhb0IIvs3DsJ4R+BIy+kP79mlpbQ8wQ/Si+r/EQ
         r3n1b+qS7SuwBtPr+KcTGo4IpkcuwsAgZ6QoX80CKKSosscFRRw+Wx8UYCZNdrrEL2rE
         tEroIlEg4CnnFhwcawG7B2UE4jVjzYJ6jbx7iPv5g5SFQg6ueYEKoR3AS+FJ2xt6mu1h
         tOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726522; x=1759331322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9im2oqF4utRrC8rBpdrGYdBctIiIANDtE89j7rUJb8=;
        b=LNu5+4XRPhWF/iPvPdlWEdQVmBBN4TAgZGIzuXzvFqhLCRQ4/cMMNz7Dj7bVCpKrA2
         hW6X2JAlgHVnjkcAKILtTJHL7U+LbQHnc3FfbAot6Ss3s0ydnrbbOht+YgECYGn5a9Ue
         SoPOyk/8ZzHhdwae1r6L53NqkdoK1ACTyFFFXEFJkrtgZhZopMXY3GTPoLPfHlM84jxR
         kzhJQM3AoFVa/o8sBj1QrdAAP9ODUbUpdhagQeHFocftGGXd17MrRhv033gGwB2zNDev
         H4KmVbI3hm7KCdk4cN0o+jrjzfOX/uJni2HRG3J8OJCd8DFkNALSxsEWC5UF5i/4BlqY
         0XCg==
X-Gm-Message-State: AOJu0YwKDHRyWY+EYOPv/YKemebGb+7+T0EIpxpA2BruQJ2SWNEMNFYU
	dJ9hPxcKOCfJH6tbKm+KMe/8jmObgqN8WlaMPhC9b6H/0pvK/Cc4f6WLej+lPFlCs3o=
X-Gm-Gg: ASbGncuB4n93Ec3l+b/a65yrC0GGGHT6mNTk2Js0gHZiOnAGYFChp+QGmCDnkwtDsSY
	cbG4e8o/qCansjS0hCHo1tbCc5pbfxv7dvJJIZuyv0XvSCBr9UuOjW9cOct+c6Mj8BZeif29Xqe
	DbEzYuziZ5DBzbB1yRd8sfSJxarCo+KU5x/dYOEyQ6NDsU9+gL1V7BOfQquG/XINpvVJWepR7D9
	T0IuAsofARSizCz60Z3VT5kfo7o3MOCpNoMnvSchxKJfdb+M4S0NRM7qCh+xreOaa82HpDcxNlP
	6E789l0Hc3FqRKf6DgJ0ME7PpRB90DV9EW/SuADPfx8Pm0fFeO2IEs0sFLUq93BD7z0XErw62Cj
	ErU0U4u8gQwOzno7s
X-Google-Smtp-Source: AGHT+IGCHLd3pnmTwxyL4D3bJHLTKcwCMZ56M/ra999jlI6cfFbIZbbFFt5flDomb9K12MnR6LGiYQ==
X-Received: by 2002:a17:902:e88d:b0:267:b0e4:314e with SMTP id d9443c01a7336-27ed49df055mr820305ad.23.1758726522301;
        Wed, 24 Sep 2025 08:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26b59d6538bsm158717445ad.82.2025.09.24.08.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:08:41 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 24 Sep 2025 23:08:11 +0800
Subject: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726499; l=1401;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=aqMS0Jn1TNh3mlyytrjaZuPheLrmPmhjXnM4Dd4ZxXA=;
 b=6HLYqVGBQbEyuiZQevtXQREU6fOO4xIxqwSNXpTmZaJF78+kLnDym2AXLAFumXiRTuz5lKPBq
 Bn0Cs8FpfNoAOUh5922IfWiIiiZraGlaBvn+PXp5YEZTERAfDDDR7Ws
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some devices treat two independent physical DSI panels as a single
logical panel from the CRTC's perspective. However, two separate DSI
hosts are still required to drive the panels individually.

Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
allows a panel driver to inform the DSI host that it is part of a
dual-panel setup, enabling the host to coordinate both physical
displays as one.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @attached: the DSI device has been successfully attached
+ * @dual_panel: the DSI device is one instance of dual panel
  * @name: DSI peripheral chip type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
@@ -188,6 +189,7 @@ struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
 	struct device dev;
 	bool attached;
+	bool dual_panel;
 
 	char name[DSI_DEV_NAME_SIZE];
 	unsigned int channel;

-- 
2.34.1


