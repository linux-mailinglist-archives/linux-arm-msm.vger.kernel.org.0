Return-Path: <linux-arm-msm+bounces-23792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B315913E22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B631F21E86
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D569185E7B;
	Sun, 23 Jun 2024 20:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEYd5ZjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EC71850A7;
	Sun, 23 Jun 2024 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719174649; cv=none; b=tYNFALbjPDpESuTxiRDslWO7uVf8+k59Gap8WbHmZg4Tb3HsmzMGinoWQaTFJo35twtdewcQa7ydW2Y1wp5MimJnqh3DWoJwhsUlAtzYcyis/wxa0c/RY8+tVXCdG7QJw58fayI0PRbFofwiPbec5JQtKMYc4ceBvrAiBX2tNx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719174649; c=relaxed/simple;
	bh=WdkY9UKGQiYMlf5HGSUdpPWLYG2/Z2l6HTKM772afyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNvZPIUXHqd7HAQGOCfrzss0D97iqunZWZkO/x2Pgl3OdPsyG1DalwvZxs1OOIngYajzSti9FxHnBbXU78XNL/30xti42FOMwsaE/s/YKuslBXSqheDTHYbJfTRzZJHjaE9zmA4p4NOkhsaBbwmBXIX/pk2S9GRBTPYbZyfk25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEYd5ZjB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42249a4f9e4so27659805e9.2;
        Sun, 23 Jun 2024 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719174646; x=1719779446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSLZRfc59PgjAu3IAfb10/Y7qX+44+MtwIvZ2wCAgyw=;
        b=BEYd5ZjBc1sYztPpGfehRH5QZrRT/oKIpu8smm/9B8d0fNihnOI6m8WAUBb3uVh90F
         dtGiUjcKTvLxqmDQKiywRTie7W3hh+a2um6WXRefsetSgPFuBKl03coiMGg+LpgoLCa6
         pxSoecoFL+HxUK3AsMmjW6gyTxNUnBdxDi4YpdFT8UsUIITjA3xrg4EYlLW7U4Sye0PN
         i5dwsuFTXY7Tc2YYjyEQsmnVbAtkluQWvtIDJyWOcZgfQFmp8bH4lBJpuInW32QG52M2
         mjoISq77XQvONjjBVuQKbdEGJlcd14VnHjvvRVw+l+zLVQZdqtn9niJ/v1kQZ5KcrS8k
         ffUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719174646; x=1719779446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSLZRfc59PgjAu3IAfb10/Y7qX+44+MtwIvZ2wCAgyw=;
        b=elIDRWunWzXQuhZE4gqat9hl74+mXZ/qsQYEEx0HuKIciUPPsVJOjxLq5wJHw11VoT
         yMcHWcO9hnXUskvU4o1aMVV2PEZqnyNzKJe/9jaMW0UAtUCb++sCtUCyTC/FWTonWg2H
         DWwcc6A2eNmu9/DEfkxjnnUke/vrRA+wMcWybVTgtBcrbsfzltR51mY/QfBjxmG+C07B
         dl+WNyGd3I+Y41bvaRGAYDrr+nc3EI5AX3zUiNFEfkEO+ErT4g/cRRJoFsbn+qmynFSo
         dfMIrj0c/A4k+CewbriPLK4nGrpJu8XheA1ox1OcBbAgSnjTnY8vwDt5Av7x5KV82FyZ
         Y9CA==
X-Forwarded-Encrypted: i=1; AJvYcCWNRRTg5VauVq1NTPiogCdJN3j8l6wbwSrE5d3PB4pjDlgb5WK1xRGyRUJblvtVWi8onTEAqbhocHz36o2cHcAIuqs+gQaDGBzRlt7kGPEwx/N8r3peshTZON1jYXaHGI79kv32xpDee4hYsqzo7WQFxkUhnzqjXPTL/hip14ki3w/q1Zdp
X-Gm-Message-State: AOJu0YzrfbBO8Op15lF3dEDZUo2xeBGZwcIagJM4eDB69Jl77vYda7lS
	Wt/TbhWJwW7IJLY20VQlooCPQTC66uH+WgAqAuxM+R/ICrmj3VML
X-Google-Smtp-Source: AGHT+IFQYzva89WBUwkGC27QsYMXMAq2H+qOvshVT5ndxoilTZ70p8PAYKz5+yc8iBxI+YDaJVklkA==
X-Received: by 2002:a5d:64c4:0:b0:366:f627:37 with SMTP id ffacd0b85a97d-366f6270197mr171245f8f.53.1719174645659;
        Sun, 23 Jun 2024 13:30:45 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:30:45 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:38 +0200
Subject: [PATCH v2 3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-3-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
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
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0

The MSM8937 SoC uses a slightly different 28nm dsi phy. Add a new
compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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


