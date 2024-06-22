Return-Path: <linux-arm-msm+bounces-23731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2C9136D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 01:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA67A1C2168C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 23:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E44D79B9C;
	Sat, 22 Jun 2024 23:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeF9sq++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0462904;
	Sat, 22 Jun 2024 23:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719098758; cv=none; b=bhK0gUWKaf1boMdCYttPnhuKD8hJUxTp9k9USjsMVNmn7uwPeC7pmdIgb2l8JBQxauEN72G5biC0DWWmwMT9O1OxTE3/HZpnTnKeT8RrE+g810/yfhSnGzUbZl1jqCDg3Dwi1aMLLRdx4jIZmGUWND2QZeWU0WQ2XpXJYq6PQmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719098758; c=relaxed/simple;
	bh=QWveozn7pL0B2oB0aNoLxMHaBOcG+Q1GhrVuUFYLOZc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X5gnULLzyFOlbvZc8gMGxN5baBy+ti7M7QRRv9yfQ0KCTmysMTqfzE+bG3Dva6r0IIhbUraFLROEA7/QazD4tFqM0k/1NuOB0gEdepyxWbToGN4M/JJSikrm4zZU9iUYQlBAA1taBBYd82G3RsYYOouShEaGw+/a3EvMp8DvIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeF9sq++; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3632a6437d7so1820751f8f.0;
        Sat, 22 Jun 2024 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719098755; x=1719703555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XFhrpr/qn0mm91IgxOnqVHLrq+I4jLwILenECz4N48=;
        b=IeF9sq++wYhZj+apt/UUVH932Z0akdyfMuu8a+ZrdMVeT22BR3VzSTmTwn7lXh5nRM
         mHkkZWG/XvLQWn6am3v7CgeUbPwtoly+vUnmFKjZ5Fo/iAGd39JGgNPN5Ph13/zvDiTw
         6UpJSl3sHptaOWpLizQK+XZltiq2une+wjCL0rCNBXIGmEYfzd5rj0URqQmeyzvYdMy8
         rB3QfzwOOreppnC7KcoOKBKNH5h7uuzp77DDs+1KmlB0r+AGFg5ekBZlsHXi1MxYCNIN
         ojKv9nUKYyf9c8whs7DhIvY5r5V0dmydNW9Evtm65jh+ZsaVOj+Y1LqqbBPZ/UH/i4Y6
         u4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719098755; x=1719703555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XFhrpr/qn0mm91IgxOnqVHLrq+I4jLwILenECz4N48=;
        b=KhFtXUXTMLRSfrm6F1NufH9Ze0rF3mKFv+6TK7WkY3iBZjwbVt2y7LLf9EJdG2z4Gn
         Bc5HxoTo/fSZT72VvIAdWqXIrutR5VCSmFDINlnJ8IK8CTraMss2VoW5aKPrQEPvSJM0
         easxWxWiWGBm9wnRzYfIGMrhXBMGPl8QmHEzWM3Pcu6I7FrmWfu8WzUK4tBsjmYzStao
         0bLtyn/H07eyJ2NGu2LYQMbabvDdZ/2nS4Zhwcbbyds1/xOc//RhJoAhzI+TLusXOR8Y
         pzZ+ltSzg+JcTo4IaHVBGj48HFdK8fmDpDfIJxsQsJ8rwuZpK31AQW/Ocoa3UJoVhS41
         /lmA==
X-Forwarded-Encrypted: i=1; AJvYcCWfLtjPpXHaiz/sy2D5aMTm25bSjgxmHYlBrVkNMTSyFSVQmu7fF70aQCGAvoO9A0OYWfl+YaigTjATmlAggruZry8DcDqYTeSHf9Ng42Gq9DbtXCBn8/pzoxf4pVF3A2Fes+nnCw1WGA==
X-Gm-Message-State: AOJu0YzNcxV4gSsR4gHmwxtQ1/HQr6NTeu41wfrfPG5QF4krOzFPxXmE
	8dFeHmjB3dMICqJmUMDUqRe3XKoacq7lD0+thPykBCxbzKUmY/eb
X-Google-Smtp-Source: AGHT+IERaYMQYvY5/RJh2ZzxyaVVENtd4pMEGEL3xCcdxmEeMraPnma827Y4G6+IKY86Bl6iZD3AXA==
X-Received: by 2002:a05:6000:1a8c:b0:363:776:821b with SMTP id ffacd0b85a97d-366e31bc9f4mr2237353f8f.0.1719098754835;
        Sat, 22 Jun 2024 16:25:54 -0700 (PDT)
Received: from [192.168.1.90] (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu. [2001:4c4e:1812:9200:deae:e202:304:a5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 16:25:54 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Subject: [PATCH 0/4] MSM8937 MDP/DSI PHY enablement
Date: Sun, 23 Jun 2024 01:25:50 +0200
Message-Id: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH5dd2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3ZTiTF0LU8PUpCQjI7NEixQloMqCotS0zAqwKdGxtbUAZzx7tVU
 AAAA=
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
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0

This patch series adds support for the MDP and DSI PHY as found on the
MSM8937 platform.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 89 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         | 18 +++++
 7 files changed, 113 insertions(+)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240607-dsi-851ebb226a8d

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


