Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D92F6105E3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 02:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfKVB06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 20:26:58 -0500
Received: from onstation.org ([52.200.56.107]:33738 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfKVB06 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 20:26:58 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id DE4013F246;
        Fri, 22 Nov 2019 01:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1574386017;
        bh=dL0lrpCjc1VI4yESYZZzGcFikG03Q6qUZMtCASVWS90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bDxbw8cG9jSpgDI8dpL9PIgZx7q9aZD6XkBpdFFha0G+xYU4wRVYjttV9N7jEj+UV
         Y4UAoPUyVdztg3QAZcyt2KaFjyTaD3ljifLzCKifmpB8MZYcS6BF3wImHOZQ5eTHjZ
         AQ+QHF8aa0y+q1gnT2zl53U0uqciskg5QUqhPLAw=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: drm/msm/gpu: document second interconnect
Date:   Thu, 21 Nov 2019 20:26:42 -0500
Message-Id: <20191122012645.7430-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
and must use the On Chip MEMory (OCMEM) in order to be functional.
There's a separate interconnect path that needs to be setup to OCMEM.
Let's document this second interconnect path that's available. Since
there's now two available interconnects, let's add the
interconnect-names property.

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

