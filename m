Return-Path: <linux-arm-msm+bounces-60723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBAEAD3077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 646CA167E98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C1C1D555;
	Tue, 10 Jun 2025 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYU5t4n3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F721B9CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544414; cv=none; b=mAF7cGe2K0pTt7Q0JrLV+Lw7NY9JmYBjJb/bWw4uN1EpDUwVlSWlsrzPkcV8AyYT0Ahki/ZQBBdAlzmONAW3zaH0Jpzx9W1YsDvQITnMrWn9GUAW0LQcYl35eSQe/f9awawKZhJXtiAbgXzB+XJLuj4H69LS97y8sI0P64mOL6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544414; c=relaxed/simple;
	bh=7gdpRdONGfcDNIZ0vaKZOJ4Az5/CP7KpNF4sBX4i8XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJPxGR3Tc248gzfpSFbjv7gAASDcOwuJ8Y4HtKwC4lcW3xFai+KGpsXVoHdZ79OlXF5YJI8cHgf/CX/Qmfvvgk/qDm3qCrzlqvpNThm4WNHeyb/6FOyJCO3YVnnYxcK5AsfFIEsInJup6aT+pJNRFD9AQHSrMYBszqmYBbvTsl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYU5t4n3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55328ae0473so738539e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544411; x=1750149211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi0ojJKfM0jr71LRLkz0UQwhMRaHPQF19YuTp/guCV4=;
        b=AYU5t4n3MfmYp98sDVIElNMtQEPPKwwN2oQScQHdd1IlgR9+ABcu04PXKF5y/mcCvo
         0PWq/AjZ6IMWnS+7DQrD0OST5ryd7Nb2/6GTgdREYWu3HtDgENTSJLHn9ZA7GIqK6FsL
         JJGocRBMYUfxU4q0yh3w72KbyVYAUP7Q2xB80AhLYfZthdNOz/6dN6g/fakftFMTY3IR
         Y32unT1U0HiaOc3B+zAwoqBdOz//be5TJn0G3yyiPmflHWRHT8eQCi5dJb5+W9pVfEM+
         HnnLhCLZXWIb0vxCQXmE5Bu/YIi7bwGXQwH2h2p287eV5EyT9HYZeUOn4gNhRj4yBKZb
         hZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544411; x=1750149211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi0ojJKfM0jr71LRLkz0UQwhMRaHPQF19YuTp/guCV4=;
        b=wvEY7zzDQUajkwYvyg3clnfszPmCkMEjgX+ImSwXXv2Dm2WAbwjHExrSci13vDPLF6
         bPnnttjXjmIzAGoJ8StpftLrrxvkJPZIjX/aqdCaXu+bYRhW/7tEh0/dniDKaWr4+RZN
         4ns9uqE5+itpDgL4cnxeUaywBoMr60W1Zwln7d/fEy65o5uUpJKw4EHeoXkL4O8lHHDq
         /S+aEOZP9dQ53PEzaCa0ClF8dhuI6gLZ+Iwpd77Gm7uA4fagwz64tovRZafzd5vEqIkP
         axJ3p7IjOi/qwnTa+QOMClTStRfZScgpcovgWVINhfUiwtbHmctmsyTH1bqN2HMG6IHV
         iG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiunCIFJ7PI1nT3SKyWWj6Z1lpAdmpYv6QQMABQBG7tiNP5U/Mx4vMD+a+ZGGcLIokpqD+AXjcsyvSahzi@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1S9dKkXiTl63HxCOKIUUG+CwuolUVYCH1kXmaM2qJIJRF4Wg
	y/ls49tGBHly3bBTZYzgtfkBa8gGVHWNj/ZndFWnQQEYLGuDx2/ZPBBLKs2iS4AtT3X/NZoxtXa
	C6bkI
X-Gm-Gg: ASbGncvTLBJ/NSUQoHeBKeFb0FbDCy8Zlc+KnEYkupFdW3mx4iw9yKMUq6xhrihfyg9
	ibY1SOtLBTtdgoIqJ6FAEE1WuWqo8HZi4ASKBEIVMfbYBaJ7GD1dbgDTm0JkUin1bu4ruKMMsOf
	u3peC+rlnC9QwJoC/c3xwlmwe1RH7SAC5TgXkMgvlsVC7SIbq9bqu2Lf2oTi6kk79vsbt1f2Quf
	Qq3r9XIoHPPb9PZz5dImBEEVs1UIWuGLNam+EwANmwOIgqhM0Vmrq4C9K8LgZD+YSy/gKUx6J+5
	hybSTXa123pEjYxwB0xwq6DmGh8s6y76vvVwL7mqSEs3TmLyG7NG8G8MMF6MSWt7KWQqLoeIPXM
	WdfNui5sUJakXPskMQjHMGGvEtA0GEHXlpNOJoH/gylhXbaDLD+E=
X-Google-Smtp-Source: AGHT+IHWMbam7GseB/gXW6bNFdLASWBzQkSU8Rt+97yCDitdCvOv672MUUq+tKYnaqIioglQAVtlWA==
X-Received: by 2002:a2e:bea6:0:b0:32a:7e2f:3df2 with SMTP id 38308e7fff4ca-32ae3243f27mr12713331fa.5.1749544411337;
        Tue, 10 Jun 2025 01:33:31 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b351fcsm14167241fa.35.2025.06.10.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:33:31 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort interconnect alphabetically
Date: Tue, 10 Jun 2025 11:33:17 +0300
Message-ID: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the entries of interconnect and interconnect-names lists in
alphabetical order.

Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index c101e42f22ac..7d4e6ef57bf8 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -100,8 +100,8 @@ properties:
     items:
       - const: ahb
       - const: hf_mnoc
-      - const: sf_mnoc
       - const: sf_icp_mnoc
+      - const: sf_mnoc
 
   iommus:
     maxItems: 8
@@ -321,15 +321,15 @@ examples:
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
-                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
                             <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 
             interconnect-names = "ahb",
                                  "hf_mnoc",
-                                 "sf_mnoc",
-                                 "sf_icp_mnoc";
+                                 "sf_icp_mnoc",
+                                 "sf_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-- 
2.49.0


