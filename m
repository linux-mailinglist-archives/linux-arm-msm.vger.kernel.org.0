Return-Path: <linux-arm-msm+bounces-57192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BDAAEE41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9F527B635D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 21:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9BB28C2CB;
	Wed,  7 May 2025 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et2XrWBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E372632;
	Wed,  7 May 2025 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655160; cv=none; b=oFaXD2RlIKaEbByQPsMLkxBITvdKyKoctQhro/6Tj0GSkEZ4qsInRA7jtnAWugWPi9lt4hV8en0gLcU+Iho81gL7ZgjdFVDQ34OSnBnKQUHM3chhHHSJLXU1y+g8PTpGO8+JmhQ1lLALdLcLKtDas0abZNBslHVLHQx7W6k7wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655160; c=relaxed/simple;
	bh=Cni/pdWt9cIp+mXSH/rdXfKlwgkpc0+yATONdzAnZ/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0goMZNB5tPr09SIQhJ5bKQP+2OS9o6wbpfRTQh+u5YS8dw8Xo77Um9+MHQg4go/twEOIpo7G1ZE5CuS8St/uo2dCJUtdmsTYbE/YAudNT9nUr+mGfOq6roFSFVaajR+dT0GJjN84shH9mlzrNCuTI6NkpvTxTU2ycKLLn08ex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et2XrWBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3041C4CEE2;
	Wed,  7 May 2025 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746655159;
	bh=Cni/pdWt9cIp+mXSH/rdXfKlwgkpc0+yATONdzAnZ/k=;
	h=From:To:Cc:Subject:Date:From;
	b=et2XrWBcXB0vQxxivC3De8795+Bcn71ukrJG8s/ytct8YVrQJtRd3h2BjreH2Nywv
	 MWkJfnAxgfYHvL/1M+6epLXyjjqzg3qgbA429FyR9H646S/56Ax2WfcDxBVkdI7Imb
	 0PFSxw7hfHM5B4an/L8UGw/bMVcBs2jqupntMaGMtNhlRtye8QW37guotxPHPYv6xy
	 Agc1vIDuB2ROE3XZRUxie7rqSDYWkJUxhzxktqaVga4cBAspCj3B+602P3Ozi3C7LH
	 YnkWMW/sl1FD5yYJ4cQmuXg2iyZILTamXmejfNHDJcD4v0EnqiE70uw02tXjAH5BHv
	 figz6GvjKR8CA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on additional 'port' properties
Date: Wed,  7 May 2025 16:59:12 -0500
Message-ID: <20250507215912.2748964-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM HDMI port nodes are missing any restrictions on additional
properties. The $ref should be to "/properties/port" rather than
"/$defs/port-base" as there are not additional properties in the nodes
to define.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8..099274d35680 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -89,12 +89,12 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
         description: |
           Input endpoints of the controller.
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
         description: |
           Output endpoints of the controller.
 
-- 
2.47.2


