Return-Path: <linux-arm-msm+bounces-26653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B9B937CB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3797E281657
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 18:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0985D1474C8;
	Fri, 19 Jul 2024 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqMd3z40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9963F144D37;
	Fri, 19 Jul 2024 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721415181; cv=none; b=iz2RtPchDELWV9lc0VDZiO4Se9XD7SlLf1BrR6y4oXFtdv3y+w13BclUPOHocSnQFjClrbUV1e4b1Y8lTF0PpWQ/XHFewiWAm9yAFTe4kjfE6F3KFk1IbJsgC2GVd8ATbSM5bpNyWD2jKRRvCFTEbXHszxaHtSL6OFO+JvmLXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721415181; c=relaxed/simple;
	bh=AeXpYjOohIre/ig2G+LhLBcnlw3yKmH56f03u3Yq1kE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWCzgDq0d+3dH6N3fAS6WTaPwMQ3zCfLFhWtY3UGOrwdt3gZGBxGrs9ZruUr/FK9AIEz+zG4n7Aa+hKEtNghOHLnw3Vhyg3ebZTZ1ZGzKHrS45E45Bd/55LDpy4FZNaBRQA3fpO5MGQg706SRwKEoUtK0sanjWMJ8dp2akjOySc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqMd3z40; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70b1207bc22so953325b3a.3;
        Fri, 19 Jul 2024 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721415179; x=1722019979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dj3Ki2W2OtNa0imFslO05z8HqONyNDJOqw2DrKzHWQg=;
        b=bqMd3z40bySoRJ84+5K1RAU76ANO+aQK8dZieqxZKvHXRcAFAjLczIQdtsAIct6f48
         sALg2uuGC4CHPkTc+tjG/vqR/L9TU0q3OzQ8IeZaGSGql8Dt+cbk5TI4Ouy+QO6MHT5j
         +n/oxHkJkmaSXbbRqw/Wc6zIqqCITIHv2UQWa/FoPGM1xLRPA2X5+qaPOSeREzTodjU9
         3Cl9qdBEfCyJaFEH9JcYqcZPQl7CymtnrmKPjvctYkF4jWHZRSdYllkczBoECXdZpMo9
         prvqZ3MZZrfzNLDPWn+YwTjZU1kYGOEfQcRe/d+x1N4gbLEy6Qz5OlRtdYWgUy4jYXDC
         y9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721415179; x=1722019979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dj3Ki2W2OtNa0imFslO05z8HqONyNDJOqw2DrKzHWQg=;
        b=jIQ0Gfw9WHpREZ8Vls9BKRMhyyrlpaCy7d+kQvz1JuJcEVOH7CAk+HlBXelJ8VkedF
         FtGTLS/s2jpfT9DkglWXqBgEl420e7CNRTXc475eDIAWhj5U34jMpTTLdBZLRz9qI/EM
         q4ys4J5MjP/QkVDHH1nECxJbQCDIqcygHg0YWePcEE90A3Pp7VQzxs7/noxUyQTP/oC0
         wHsDwDcgHYonV0MXCXP9H6YKWB/IVJVndoIBuYZdno4/N6QK87U+yVvdGcHB3MR+VKE0
         fvpvaTspUxkXy8nVHN+a9n2AHKikIrw3gkhfh7v2+lGNxqECRGDBX6J524AFq85kwu0f
         MUaw==
X-Forwarded-Encrypted: i=1; AJvYcCWsKbX3xKLPoz5s1dmbewyUzg9RtAGLqQHj521BXDgHq340+b7a+HFxXiczgkoQdP44nnwfx51NiMGXNnArLu70/v0kPSt4kXTFU1pcyNznkTL1arMamMiH1HUrIrltNXmArEMdpc4iyA==
X-Gm-Message-State: AOJu0YzLvrYaMNzFhJ9CdRPWf6liFgVLtLdkyrpRecXJWXwRJLW/d1K7
	CYHj8ppOVHW2nydrtycaveIFYqjh/ExjCE63p5W1tFkN02NrvMROLARB3A==
X-Google-Smtp-Source: AGHT+IG5pZnGFRXks8I592vO7nXbmZsKzukEcxgXihuHqf8RLj8pK+ihV/nLswlewmDJIZL/45jZLg==
X-Received: by 2002:a05:6a20:2452:b0:1c2:88eb:1d2c with SMTP id adf61e73a8af0-1c422999c0fmr1274962637.47.1721415179052;
        Fri, 19 Jul 2024 11:52:59 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c77486sm2035424a91.34.2024.07.19.11.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:52:58 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02
Date: Fri, 19 Jul 2024 11:52:49 -0700
Message-ID: <20240719185250.4877-1-robdclark@gmail.com>
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
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 5192c93fbd67..3ec9b8c79b5f 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -21,6 +21,10 @@ properties:
       - items:
           - const: samsung,atna45af01
           - const: samsung,atna33xc20
+      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+      - items:
+          - const: samsung,atna45dc02
+          - const: samsung,atna33xc20
 
   enable-gpios: true
   port: true
-- 
2.45.2


