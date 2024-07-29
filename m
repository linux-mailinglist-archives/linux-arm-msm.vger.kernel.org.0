Return-Path: <linux-arm-msm+bounces-27319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CB93FFEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A7281C2198F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62862189F33;
	Mon, 29 Jul 2024 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSCJehFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D6187847;
	Mon, 29 Jul 2024 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722286659; cv=none; b=OpeOFDTqdoxjh+oUxIO7fXrKdhwo+fbFVk9uvI4rKaeXPWbVCwO9GPqKau6ccX9iSdGOM2id6nsPv6APJNBLGrpIJ4WdHqC2GjWyMC6fIYlVOpItArtnkaKlfBpFucXBdhrVN+8Ia5QSZZ/pILJF9rF91FLYCmCW/VY7Xd4a57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722286659; c=relaxed/simple;
	bh=MVuSu8aL0eUmwlPXwpX3mYlPH9DcrhwZTzUj9wb3pfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyM/z3pBojctNd/vu8U9DDNGnhqfEe8Q3uF8FvgZNT79Q330ffbOaEYL1H5Ar5z7HpAHNxj6hPEPqH6KFp276tl42l+8pTsJtEsDG7vSXc/bXmyd0pqf8TFT3C66GVciQY0uwz2XORDtAtW0A2AgYoJ8K0tqpQdvRG+gYqKPrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSCJehFK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd69e44596so23732615ad.1;
        Mon, 29 Jul 2024 13:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722286656; x=1722891456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsyB4/IEI7fiDC+zo5ayLI7NX3RD/fWy5l3aPy+UUL8=;
        b=KSCJehFK+f19uilUwUS5tX+W88n6DXdhdzLp3NkS4LBR1iyN9pihNZVix0BfSzcJom
         R8RSaaEGanFM0mZn8FeFzR+RQFeLlP4t6QxhQiHZgX+jHlwxoiyFDlmFFPXqSMwynccg
         SxF9bpEpeyhT9/jgwHtq08f6k/bRbc6WGBnJdBlm0Iat1AsH4hir0D/T4XZQ+/Pzkyxh
         7ZhIvaXvNqkXrhxzKnQnJL2J2QxOa4xfPCEyJhIBh9gRHyEnOs7OIFnXRFIoTbLyKj8+
         TUvKDdlltuXPZ6YpMfdnmJRa8tKbj9WU9IOHIDzn4m8A02d23USBN/zw2Up/km/4pJA8
         rdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286656; x=1722891456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsyB4/IEI7fiDC+zo5ayLI7NX3RD/fWy5l3aPy+UUL8=;
        b=cOeZ4M0XG9txa9YCO9llbZ3sw+1bRzO0FYZ8i7ZPRH4rpObM8Eu8kIGhn10+xiGLAJ
         UGwC1CE8y5ypTza5in4dj5XPyNB5++zpkYv5YepsUlK6638+tcT01+6E74cBwPb9ssW6
         IEMIjvv099T4wUqMZa3K/IRB18FOZtuv/wmB2z/vV8OYgH7LgyUKg/9UNvzgnswqF9GM
         ec48Eu4/Jehh/YukDlRWe0fs1ZD8Fj6uXxa44LJzbRoS0pBpSiwtcKkoMDa/ejMMY62H
         Cdoecxn6LkMWPYGXeIiLDqYCmQk8waHA4QrkTjJDdyY8No5jtdQEoCRKZX+9iYN30/wR
         bi7g==
X-Forwarded-Encrypted: i=1; AJvYcCUO1sQdisjGs9n84c+7wl9S6Lb/McdorbVtg0ynSqNZy8WSt7yUSNImMUPgsS1OXhg45I6B5kzP6bh8EGtOwIfO8YKEQ86ACUApmatPB2xRTVzKDybvIz0QKgrvMD+BvSbd4KYQA1F0iw==
X-Gm-Message-State: AOJu0YzSdaZunPXeLvOYYE8joI5v0GFU9jaV0cu3fp0z89d2eRehI3uK
	akA8L6SD3kuMjXIsJysflzrOmVM3Bi8oA5HHVYjvBewCF0rxkMN40Xn8JQ==
X-Google-Smtp-Source: AGHT+IE7RlpPM0Ve8QorkWwBam/ulv41RrYw3YyiYgnmag2XmMfjp/FbZt1JmjuYH8DymxzoGN/ZDQ==
X-Received: by 2002:a17:903:41d2:b0:1fd:6581:93c5 with SMTP id d9443c01a7336-1ff04b1c364mr140162675ad.27.1722286655550;
        Mon, 29 Jul 2024 13:57:35 -0700 (PDT)
Received: from localhost ([100.84.200.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f6dc27sm87414365ad.237.2024.07.29.13.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:57:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02
Date: Mon, 29 Jul 2024 13:57:24 -0700
Message-ID: <20240729205726.7923-1-robdclark@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 5192c93fbd67..87c601bcf20a 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -17,10 +17,13 @@ properties:
     oneOf:
       # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
       - const: samsung,atna33xc20
-      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
       - items:
-          - const: samsung,atna45af01
-          - const: samsung,atna33xc20
+        - enum:
+          # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+          - samsung,atna45af01
+          # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+          - samsung,atna45dc02
+        - const: samsung,atna33xc20
 
   enable-gpios: true
   port: true
-- 
2.45.2


