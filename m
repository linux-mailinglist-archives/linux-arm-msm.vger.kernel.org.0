Return-Path: <linux-arm-msm+bounces-23763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E519913A4D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE8E1F21A31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 12:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8908A181CE2;
	Sun, 23 Jun 2024 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="necivQJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9A18133D
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719144035; cv=none; b=XKbmvGUD8Qulw9WqglN4age6t5cCefzBzGY59+bn1Xl8A+EATV/PGm1KBDUHix/HD9cYMdMVjwL+0kxqUsXLPTPSmrfm1paGxn8AOQ/pNvTfd+S1I/+UMuRLjtsli0e9SkN5mRIbSxWy8XZ/tn7HV4Dfw3NEaJlJvoqigkxc7e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719144035; c=relaxed/simple;
	bh=w7QmicMOY3gkCg20Sf6J+bR20DHpDJ/1/bdy0XRaFQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nno1TI9oXqGk4BNxh92vkxcvl9hau6DHA9gv2pc04rF2OCP9XtcQOkb11H5DVI1qb1sYiKjBHrxSdQs2f6U1e2HpjOorQGRIELGkqM6GU0QYIUHCtgO9busZ2xE8AYByliNuogBp/BB4IuTdfqh1428jNKr7WuyGXlAdkIJm454=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=necivQJv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217990f997so25304505e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719144031; x=1719748831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5pRySu+ARf8jWv+YeotUn57i8P3KF+qPMZ7wIjslP8=;
        b=necivQJvFommC63knwOs+2OKBfec0oP7Fm6NH/8S0fbaBl8cxNpGekpZZuKxTlBgTb
         0iJ4H4HsOdPVmLINmqpMzTiV4W0PFVBFcXAKBGQ1mGHffRhR+hRHY6TZjbL0YwGm+Rn9
         dF4rjHCEqlgMDCooytESL6NYl5M/W1Ipkq4WMXJoO4H/+CdyKbKtf3Onm8DsZSPV7tLh
         8bTclQ40SbE6WyKIPf9kOPfDjqPZK+lP+o/fJ1fNILNtyKCYrZp0JjV0Kt0iyTkWAfqa
         ObtHgTwsL0ztvpZnD4SjCglOjPX7rqQdY9UnwKy4/P7SiXgYABeeq67Lw/JCdlZ5fSYs
         G5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719144031; x=1719748831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5pRySu+ARf8jWv+YeotUn57i8P3KF+qPMZ7wIjslP8=;
        b=XIYrUgGNuDF0DmvbHywTmbY7lHf3j6n/wHl//j573cZGJ9IfCEzDH/k8yNnwz0vCVU
         +wODn62qg03qDxXYVqqMLlrAjEIaQJ/E2Q4/b4XkOlLaooj2MUVSvBd0D5VWfhOadp6y
         tQg7FdDfJ1Y4/VP86WwLdV48VLY9ky/Jhw+q7jyK0NrG0ty1mk3gItijhkkG6cG+Hl60
         aY2oAROhOy+25wMIuMKZ2n9vceu9bEMiDlFmBsNUKJNl8e+eYA6TX1+fAuX0qevBPdUd
         gVVt/H1PqF6YLmgG+NWjyE8R5OEK9K3T46B505L6pnLEa4DkELxv/sESJ5aKtaJbnwf+
         HfmA==
X-Forwarded-Encrypted: i=1; AJvYcCVfiqxTCdCFDEZph98jgg2WfOrd5VMQD81DEfMcPDR1OViYit730Vp0XytKRbNEq9c1Xa+UoKc95SVRvQqA7VO8khMyIRrIr/Fo1kvFbw==
X-Gm-Message-State: AOJu0YyB8ZgOBm6fwqnuN5DcmtJZ1bIV6U588A2kbGEtUSyvapD8xreE
	R/WsYU33ij7fC1XmX7tEfBWKofcHgoctTv4io6MC3FnpRN8WyJ5gbaoDqOo+5vs=
X-Google-Smtp-Source: AGHT+IEXP7AJ8wGYP4P3O8ghUgKEsx/NMem41iq5obFqMs7hv1GsRgZtKTmlmuq84/7vHtVQVzL0xQ==
X-Received: by 2002:a7b:c4d3:0:b0:421:7c1e:5d70 with SMTP id 5b1f17b1804b1-42489e3ab62mr20397615e9.16.1719144031293;
        Sun, 23 Jun 2024 05:00:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:00:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: display/msm/gpu: define reg-names in top-level
Date: Sun, 23 Jun 2024 14:00:25 +0200
Message-ID: <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All devices should (and actually do) have same order of entries, if
possible.  That's the case for reg/reg-names, so define the reg-names in
top-level to enforce that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 253e68d92779..baea1946c65d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -46,7 +46,10 @@ properties:
 
   reg-names:
     minItems: 1
-    maxItems: 3
+    items:
+      - const: kgsl_3d0_reg_memory
+      - const: cx_mem
+      - const: cx_dbgc
 
   interrupts:
     maxItems: 1
-- 
2.43.0


