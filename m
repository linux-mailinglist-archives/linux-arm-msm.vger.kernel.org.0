Return-Path: <linux-arm-msm+bounces-37542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37D9C4D42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 04:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BFE8B2BD07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F65A207A0E;
	Tue, 12 Nov 2024 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxpPvHp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E3E207A03
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381695; cv=none; b=P4X8GqFRZ5RT4BdFthUfH4y3Dfoj2EWzMRYQeAV2dGGkzN977VteZAC7DXhVOUwGVlm7JrgQOtHg/hNqPzYh8OnUE8P2oHLVdpPLvRFkI7bXqDPyUCcAVRlVrOAJfFcbH/JXj9TLnihDAbRb7ZrXLcMVhl60Qm47rO+G/NRYsBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381695; c=relaxed/simple;
	bh=OhdT2VxfIrc5AObnYGG1UHJduwWMT7S9TkIllvnLPyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NUGKexsdAvs6MQMcNECbG93N16SPRzIa9IysAbMY33GelalZ3lkbPMWXx7Je/8KM7bUvFqM2e6FbaEdrAysT0dWPhdzNrgC6nKaXUhgXlZynUHkSi/Wyj49eEnao0I4LCPOa16wDxUG8O2zOyxkKyWQHIaQsCPKEd2f6fKzGQfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxpPvHp6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso876133766b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 19:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731381692; x=1731986492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/4lgmqUbG+fBtyzU0tlasfvaV6025E/7AVaJgntc6M=;
        b=OxpPvHp6Y/kBSjJFGg6lhSVyFKQu03d3mTEqu7vjmLD79wxI6drCPnfM+YGXynJTtd
         aKzcMV/PtEsiOvxkofLHyyDwR/PPfQ+1dDTWdpLfi2ewJmeT01i04K+wO2CNECXO/pyY
         x8Lc4FGQDiY+81GfPLOcFdAHv0aG/LMHHWCL4Xr6XuDSLFJHZLXg+ryYEXpYYNiRJcUY
         x3zxrDN46lI3zsmc0jiIdl2GRQUwVJG8OAswWxH/YAeEv9NkEwhy5exIDi0TvAtUHJWG
         A2Kyzq83l2CzpKZGhnnn4rWlNFiLG29PBQxo/5zfZPJ/S647UD+TatxeUFkhXL32N7Or
         vR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731381692; x=1731986492;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/4lgmqUbG+fBtyzU0tlasfvaV6025E/7AVaJgntc6M=;
        b=gt65uVbMBnJd++Hgnw25RgLCeccXv3+gsKJhu1RFjctpBmxkKs5ryCto/yozpRV9tA
         160fk5ZrhBR5EzQGZlPbvnECs7nUc743DIikuslDtjeLLlJaLH7VQNOmLlLPu7blHt4q
         1yv2fsBsKtI5OWU/ESrZCOPKS/dVSDqTWk5E/ol6guqn1Uaf5JfcBisCWq1HOEQLGvQ4
         e3Frk+YBRU38Uj14btZ97idJ2cqOFRVmCXqpaZQiQpiuSyy2lC6FpCt2W5SmQiIwoiu4
         lLQCxYLb3LtF0HM/V3QlpZ/8pnH5P3zlW4Dl0lKG1ktreK9iH9+UpWZXjQGL4Mqf1hm6
         oH+w==
X-Forwarded-Encrypted: i=1; AJvYcCWF5KdpQTCO9qzTpS6nmzdiSQrdMiS3D0MIWpU3bI1dN7PwFxzE72E5UctGKz2KbRNaROGHSr52J7BVH1UJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwENwVLhyVxVGMZkzWSkptdpcZPU7PycHRIYqhnaCLI4B3SkNNS
	Vj4QMQHD2kJddc4CNcAWfRmiQwtRe7tAORuF4xC0+j9DY62iHuwIC8tz/v4C2VhLKJRY2q9iuVN
	X
X-Google-Smtp-Source: AGHT+IFC0e3EFVw7w8j+15I5R+gq/awEWgkvdg0ap04O+5vLKB+g5jLRDqgG7bbsp2JIg3q1dy0cRA==
X-Received: by 2002:a17:907:724d:b0:a90:df6f:f086 with SMTP id a640c23a62f3a-a9eefeaf116mr1440613966b.11.1731381691668;
        Mon, 11 Nov 2024 19:21:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def87bsm667363866b.143.2024.11.11.19.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 19:21:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 05:21:24 +0200
Subject: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: fix the
 example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
X-B4-Tracking: v=1; b=H4sIALPJMmcC/32NQQ6CMBBFr0Jm7RhaKEVW3sOwqKWFSUxLpooYw
 t2tHMDle8l/f4PkmFyCrtiA3UKJYsggTwXYyYTRIQ2ZQZayFkJI9AMOM/rXim/DgcKIttVNbS+
 V162GvJvZeVqP5q3PPFF6Rv4cF4v42X+1RaBAXaq7ktor01TXBwXD8Rx5hH7f9y8p8yghswAAA
 A==
X-Change-ID: 20241112-fd-dp-fux-warning-c8764c93f787
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OhdT2VxfIrc5AObnYGG1UHJduwWMT7S9TkIllvnLPyE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnMsm4gC24uu1TSHwCoYjEFrrSSfkzWQ5JZLTPb
 PEJxhc2VfeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZzLJuAAKCRCLPIo+Aiko
 1ZOaB/oCWEbwWC85vZbqnSWXl4j2u4TirBvYrnxYg6SRZaZ14lWkHCZ5zLT4GKzjH5k0ITebYbR
 Q9RLOyb+j22Qv2CU0jGFDwMCidRy5OiqCiBiuY/zrP8CHo49XtMxgdV2jCuLSm1cADgkqtoK/Gs
 Dgd6amgyYfjL7UXDLc4qA0XyN9nAdGEtZ09kJ7n9tyfnzsdYvc717aRx/5uzdmiNT9brClRxeTf
 KuMUJNl3E9N5p8/T3klYIvZz65LuBimzSfCFcizVnahv9fY8aDHwtGIXE+yD7Pny58W1+M3ChKk
 BPzQZdiNluzwHs6xbBlTqoZFSSM+xbYrUzvZMgIGgeX1qO5a
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add p1 region to the list of DP registers in the SA8775p example. This
fixes the following warning:

Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short

Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
---
 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -168,7 +168,8 @@ examples:
             reg = <0xaf54000 0x104>,
                   <0xaf54200 0x0c0>,
                   <0xaf55000 0x770>,
-                  <0xaf56000 0x09c>;
+                  <0xaf56000 0x09c>,
+                  <0xaf57000 0x09c>;
 
             interrupt-parent = <&mdss0>;
             interrupts = <12>;

---
base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
change-id: 20241112-fd-dp-fux-warning-c8764c93f787

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


