Return-Path: <linux-arm-msm+bounces-23734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156819136EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 01:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE19B283F41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 23:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD5784A53;
	Sat, 22 Jun 2024 23:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihypLwsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9982C82893;
	Sat, 22 Jun 2024 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719098762; cv=none; b=UFPfWZoBw/ucmuyW6aT8mrqM53FLyqgq6ZOd2s7mR1FrM0Eg6O7UbPVgLL3d1qjbxkGv7T1Dvd3OwCerrFOliNu7sr6pyNxJd4ugLv+Fgi/y/I+Z2hprUqB98iMsfFa1lsfl1X7ppG+QMh/EkIRwN/KhN+LhFYHB94vfFoMdtIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719098762; c=relaxed/simple;
	bh=P74oyG550yEgHa7Z36TsUiL0BnRrPgs0SRzC/Z5xsKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IalsxvHL5dPxZ91N8bDTl6zR/K1QtQrKBpnP0GCJ3SnZUFNhsw08mcsFaFHKAUzE2MdfwXxA2OQTOpUNA4l6npAOx3JVsSqTIce4mvf+d+z2mQ6d+radE6TGJQViH84EzmR4WAt552lGMi46WAceJzIbqz1c+K5vgMGWGCHU7Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihypLwsP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424798859dfso27160235e9.0;
        Sat, 22 Jun 2024 16:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719098759; x=1719703559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNZIBBitXPi1uUiKPoj+62/BSgetTcrhDK59sUyVjUo=;
        b=ihypLwsPHGdH/6AbNBhTexgCYugydtWPsUN3GTkKVnCHxQ6vv15sLtK0RxuVVyo6UP
         iqBln6VZ18YxdMgnScKHlUbVDfiMQxsTwVWUqQJ81a7a8bTfWYJtHhb1/6hSwAjW3xd9
         Z+p9GplrKDoj6+XKCHnkklwa8/cngcNHYKXyXFfo82/qOk4mlVxT0dbbzcnhLhFSFoDl
         CNma5CmrWnz+QiA8O1QLZTqNqNzZu/q8Ez6R6fLkweBQSBRsbLt5Kg+09i3NHrveNIc6
         vCrAhX+GrAnbBREaotHbsI4bwPP2A7ZxCNfKQTRTigjquMUhxwWJrJrAEdW+owksm0lW
         PUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719098759; x=1719703559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNZIBBitXPi1uUiKPoj+62/BSgetTcrhDK59sUyVjUo=;
        b=HWpnyPpy/bNnS3TOEC2Us5oI4VNY8Np/eLQZZFM/rdg+SP83QLM81tztzXs4fkrIX2
         tQOG/7bxWYcHmZKldz3zm+bh77xCSRqdgOcbqZMw9N4rCXtxUXFBtiK9ATssW6+TgqaK
         Gmz6jz09xbc55Xm5tiSItjadTMbHTmyOh+9Ajc+x4bD6oB9bebZLlNww7STNUZc2VnPQ
         7p3Ji4hbM8MZl8wGASi+gc//BcH5YIuzgtZhWP/81alWpmUuXh/MLWNlk/nVg08R61X5
         C7G4KuKAV+kdlrlP6xuwzFzmFfoJilAnEoMwM5Cu6pMf0JSTECS5BskncHZGMrnHVhQH
         zAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKvNmLBaboXdCMpMjIqATATwADMwAp38wm5QCkJ/0MlQti9SIBbs2sqPhRj+a8AIsaSjv1fMfAiyzes2UjEJ78WM5FPNw6ANowv4zw+jdM6yzwJ0YThaZkkPG9nNmpLQDhQXvhwNXGQA==
X-Gm-Message-State: AOJu0YzlHsy/Ff22nPLHF1+Wshxt9LRa2S3KbcBac8jHNFbVQTM5E40d
	X7vLqgNKL0gWUhY1SXuhYT4cbdd+vBp1EeYcE+wNYQDqNy/GSSPl
X-Google-Smtp-Source: AGHT+IEgNo+6duAt+aCgvMCkwCVQGht/gvaa7NRc/S63e47o7jVhTD+sGrZavu2g7pi1hRkGDj8wQw==
X-Received: by 2002:a05:600c:3209:b0:424:7d42:fd7a with SMTP id 5b1f17b1804b1-4248cc2b71cmr6092835e9.15.1719098759079;
        Sat, 22 Jun 2024 16:25:59 -0700 (PDT)
Received: from [192.168.1.90] (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu. [2001:4c4e:1812:9200:deae:e202:304:a5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 16:25:58 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:53 +0200
Subject: [PATCH 3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-3-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0

The MSM8937 SoC uses a slightly different 28nm dsi phy. Add a new
compatible for it.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 288d8babb76a..a55c2445d189 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,dsi-phy-28nm-8226
+      - qcom,dsi-phy-28nm-8937
       - qcom,dsi-phy-28nm-8960
       - qcom,dsi-phy-28nm-hpm
       - qcom,dsi-phy-28nm-hpm-fam-b
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index e4576546bf0d..7c6462caa442 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -126,6 +126,7 @@ patternProperties:
           - qcom,dsi-phy-14nm-8953
           - qcom,dsi-phy-20nm
           - qcom,dsi-phy-28nm-8226
+          - qcom,dsi-phy-28nm-8937
           - qcom,dsi-phy-28nm-hpm
           - qcom,dsi-phy-28nm-hpm-fam-b
           - qcom,dsi-phy-28nm-lp

-- 
2.45.2


