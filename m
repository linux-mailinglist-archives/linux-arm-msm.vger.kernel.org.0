Return-Path: <linux-arm-msm+bounces-50550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F423A55454
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADDA47ABB56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7562026A1BE;
	Thu,  6 Mar 2025 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0tFRW+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408B269CF1;
	Thu,  6 Mar 2025 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284708; cv=none; b=KtjZbgQoA8aaZZyhuwjhgddFbqAuwql8WhBZ80K0SFn7UQyJf0P5fzDPORTLd1Ut7KC+h4XKkAnq9CjorretVmzTZKc0g/S39OBikaz1I6GRF1FqJl0lbmoluFZaDgf71LX1blxwBlI4pX45l2PE5H+Z7k3f37PPYqV5zrpuY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284708; c=relaxed/simple;
	bh=Lg8OMwB1TlZ3vqDkS3JAutAwNZfreerCcV/Pp6SERuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6c36SK0msY3yrRBEzXHtXx5+AFvlVN6YcOFJSq1mFmT5LJjHMxNl5fHyek7Ir34R87E6VRvO3ou1RcHlpT1LbwWspx2ICpO4qT36Npc/RwOhpq6wEW9cOqHLFbivMK7JlmcgRU8+Cj2YI3u76mSdYVH4U9KVmnKbsD8y/VislM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0tFRW+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF211C4CEF3;
	Thu,  6 Mar 2025 18:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284708;
	bh=Lg8OMwB1TlZ3vqDkS3JAutAwNZfreerCcV/Pp6SERuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H0tFRW+0GMOzxCov/2CpSpJmD3ljpDYJ7QDjRy8RIDkr0xohFL95FIOgCiwQKjJMh
	 sAs5NbQYPhExD027SeU0IaTU96Pi/Ss+xjRmUNVdA8Z2GgCs/7VY2GhugE728rwuV6
	 gfWNNyA2KZ4yLMeIKy2vL89I4aZ8qbddl40dM7OPe/EhovnA6P41JXjlBbkF45rrqC
	 go5aC/LSXRlGfI8msy1ybJtUHB5co6p8kkMB+2J8KWgn6SC+Q9kr+JpA8fQkCi336q
	 jIzo5OF2jw4tPqk+hg+5dI/fsL7a1LM74tlMWpX9yggFPZgyo+E3DpKBegqPvZBIeX
	 +HHMAjeCXivcw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:14 +0100
Subject: [PATCH 02/11] dt-bindings: display: msm: sm8350-mdss: Describe the
 CPU-CFG icc path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1199;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=WAIG5J6lBLZI7pGI8lxlnhUdSlxey3u+py6kR6LIBCs=;
 b=w1duYqY77CoKKwCcl0eUqUxC8MHaO2gDt76adsFPXmBvtm4a7V0X+15agO8oAUc+q3B9oibZh
 188KKD705L5Ck6IwxpTAjZ7OJZNWVeiCEjR2UwJ3AW0gGtZdTd7SJhM
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There's a separate path that allows register access from CPUSS.
Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 163fc83c1e80cf07383f9aef510f2f58a26e1ecc..3733d8cd2ae07597952ebdc1d74edda330173ef6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -38,12 +38,16 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from the MDP0 port to the data bus
+      - description: Interconnect path from the MDP1 port to the data bus
+      - description: Interconnect path from the CPU to the reg bus
 
   interconnect-names:
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.48.1


