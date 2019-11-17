Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46BAFF94B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 12:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfKQLsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 06:48:41 -0500
Received: from onstation.org ([52.200.56.107]:38694 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfKQLsk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 06:48:40 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 976133F233;
        Sun, 17 Nov 2019 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573991319;
        bh=IF5jVC/IJ/HGFr94VZv3lqZ7QDpm1s7uu+GgLtg8z60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kzB7W0se4g1Mm/JwUOV5vsXp5jZJ6YzdyozpICfW6eLEyrPCGsmxAYPJk7X3jYPbi
         P9uCZNhfO8srSC5SHG/o5FawaAWUAw6H2eQq5m5Lym+PVoEHE9wxtISRviVCRe+Gyz
         N7+ZKvVn47o7i+rO4D61rg20TQvMqxR6W5KLVGmo=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: drm/msm/gpu: document second interconnect
Date:   Sun, 17 Nov 2019 06:48:22 -0500
Message-Id: <20191117114825.13541-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117114825.13541-1-masneyb@onstation.org>
References: <20191117114825.13541-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
and must use the On Chip MEMory (OCMEM) in order to be functional.
There's a separate interconnect path that needs to be setup to OCMEM.
Let's document this second interconnect path that's available.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 2b8fd26c43b0..3e6cd3f64a78 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -23,7 +23,10 @@ Required properties:
 - iommus: optional phandle to an adreno iommu instance
 - operating-points-v2: optional phandle to the OPP operating points
 - interconnects: optional phandle to an interconnect provider.  See
-  ../interconnect/interconnect.txt for details.
+  ../interconnect/interconnect.txt for details. Some A3xx and all A4xx platforms
+  will have two paths; all others will have one path.
+- interconnect-names: The names of the interconnect paths that correspond to the
+  interconnects property. Values must be gfx-mem and ocmem.
 - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
   control the power for the GPU. Applicable targets:
     - qcom,adreno-630.2
@@ -76,6 +79,7 @@ Example a6xx (with GMU):
 		operating-points-v2 = <&gpu_opp_table>;
 
 		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
+		interconnect-names = "gfx-mem";
 
 		qcom,gmu = <&gmu>;
 
-- 
2.21.0

