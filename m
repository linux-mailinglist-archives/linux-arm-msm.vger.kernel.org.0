Return-Path: <linux-arm-msm+bounces-26595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED89351E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 20:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D976E1F211B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C671459F1;
	Thu, 18 Jul 2024 18:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhRBYe4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F3145332;
	Thu, 18 Jul 2024 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721328288; cv=none; b=V81k5aK+OdTgwO5Uo/OGAo26Uh4/f2535hFW85i4FvDO5AmM/G0wraT+mBt06vb1tpZiixraTu7AO74ltA+HelI07mmSWYQXwDSDNWyZ+EB1X4aD8L75JSaMIfB23d4ggbPnjVj+VaPiZYQNt6GSGNjdfHtviVeqa0D/iXdUgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721328288; c=relaxed/simple;
	bh=+XRF+u4xM/4om6BU01EZCl77VDMoLkuPeewcYmgvI1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRROY2c5PNxgJ7Z5yMWmleRjWboNQZ3QEv7dqYpYCS2IE/IjKz5MJOFYjqPdd8zIKsUUn7OWPUOrKLSXfZhqPWWcagKIA+lfAiM1yU6wkQS0Q/n9F5bv/+g1c1nSHxzmxu/j+u6JNXtTEoXkVe5Sj153uPh0SjwUmNpTpHO7TF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhRBYe4/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc611a0f8cso7733265ad.2;
        Thu, 18 Jul 2024 11:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721328285; x=1721933085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5Xir0kH2JjHhRYu7hQDjOGhA/R02SRiM/dfrZJX4tw=;
        b=NhRBYe4/86zPJWbiRxXRLbZSEAv7JzX0ymgTC3J8581s2yWSS9MpJwnnw3DLfEZUre
         bB2200t8RtPjJOeu8ZtWDht/VB+VdZIJi1DIt66JERzCKWNAfp6Exyxsc1Njapr/IMOB
         s7aenmg14LgsfYziCeL8WYjhq9z8y0qNUCt0blRbGS1+fCPOUF73swSDLdKBa8VTP7y3
         YWLsbsQT5n0ofqrCNHZ8YUxf23VPDLR+k6b1tQUqRpuuNnPsYNnH7zXaQmXVK3UrQIci
         5/HP9QMtoJx1zGajn/3PyB4noVzCFFxpcueNGCM+tKo9d/FcpC8h1EZlK/CIEbuY6jZP
         WX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721328285; x=1721933085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5Xir0kH2JjHhRYu7hQDjOGhA/R02SRiM/dfrZJX4tw=;
        b=X83hlWr44LQjzY/YMPeO/3rMXsAzDnYmUEsOsDdM58fTLzgxNnlO/Qehvr0GrOBK8V
         ksftdngg1EKkXQwiKItDpFl9+lpS1HsP6TcZB9bCyXWWYbnu8nqxlI/Cb+afnXMQkK8v
         nqG9c49iAi6CD0hW+OZ2T5+HQt3ESRJF2GnbAq1TJ3439Ghfe3jLSnxtFrylv5AYZuko
         1J6AxA1zsTHdQg2/nY6ABcjrKEAJ4744MLSt2wjzftoXhndbOQNpBZsm3FqzGtIFudY0
         6Xgv0YNnOHok+HBBwUvkAXKIW6TF3dvlO14rur6yG0x5dO5tQQ444HOsWDOxVLwmQlbr
         38TA==
X-Forwarded-Encrypted: i=1; AJvYcCWVdvM38/aAj7N9YND/WyLpNkAq8FGxP4SDTJa3yzmOKQlYvt0M0ApOriMMMjkzUFZYFurfjZV1oPke2Ishj+NoSIZa6NPWmBYgzikH+OQE16Sst4ez5HKYDZXzIlLxRXlOxI3cWjOIWw==
X-Gm-Message-State: AOJu0YwH3s/T84m1OGNFn8kU2i+VjmTaQMITkym//vr25USMHU3WUWTZ
	mbggqSiNksirWHffbr+34Ksho3k/fTVYIQ8iy5qqtoNwiYsFtplMqFe/jg==
X-Google-Smtp-Source: AGHT+IHGChTs8X3tqnORG7L3i64G79rLMi0c0cdzHOqrs0XdmhGbNEKKyA2Tqb9BQKUtqRCD17YRFg==
X-Received: by 2002:a05:6a21:9ccb:b0:1c0:d9c9:64f9 with SMTP id adf61e73a8af0-1c3fdd998e6mr7280403637.36.1721328284730;
        Thu, 18 Jul 2024 11:44:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bba4506sm96459175ad.85.2024.07.18.11.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:44:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02
Date: Thu, 18 Jul 2024 11:44:32 -0700
Message-ID: <20240718184434.6307-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index d668e8d0d296..284a4ee79bbf 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -19,6 +19,8 @@ properties:
       - samsung,atna33xc20
       # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
       - samsung,atna45af01
+      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+      - samsung,atna45dc02
 
   enable-gpios: true
   port: true
-- 
2.45.2


