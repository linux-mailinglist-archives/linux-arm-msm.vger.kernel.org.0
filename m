Return-Path: <linux-arm-msm+bounces-50549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F8A55449
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C4B17AB9C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B814025D8FA;
	Thu,  6 Mar 2025 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E55EmeLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B0F25A352;
	Thu,  6 Mar 2025 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284698; cv=none; b=Klgcm/k8MahgMXCpPBVte29gNwvaRXeJ0dySe7VATxVLN7Jv7le9agBBaeQRdB8/woG5VeFn7wR+SGxVY4ls3Im+B3gVdYsS3joL+BXS9KGRgyJ00ZHyoV+W6VkAozK5dWa/SYSHcfb9YvZ4rXnQetuqYfwF5nIoBivTHdjPfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284698; c=relaxed/simple;
	bh=TGDEu2STiqYGeD3JRa0RBM3cTzKUNBPChBweLyyidiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jg1WcEjF9Y7pGVXFrjiUEgJF/YNu6hkuDvzW6y/jfNmfUBXkVp6A+w59E01L1jTlwqaXlYuJI5vEtn9lnbe8ORT/M5AwkFCvRA6GxUSXxFA6NTJpAfZTfwnWesp3lvfG42Yb8i/pPJhg1mSLYHam8lP69MjaDOplgusfMd641Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E55EmeLX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2361AC4CEE0;
	Thu,  6 Mar 2025 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284698;
	bh=TGDEu2STiqYGeD3JRa0RBM3cTzKUNBPChBweLyyidiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E55EmeLXqmagfIpWgpi7jjJYLRMx2cH7bqj2sbGLvoDlVUQeT1qXYQVQ7aBz3TfBv
	 L1GnHx5iJw5LILaUZVVd5PUrb4lBJy5A3bOvhsr+msMBuXBL+CyqGMQkjSrmFm/GXf
	 /xFaYgKtDBebfBg4n7FWQPWFr865vccT6w1bRI6PuPcI5iC3MDIwANy6IhM5L1QBae
	 mVfq/Sx/g+YDAaekZJSltViMJx/g5vMUbh40bt/333QKpyM8TT+R+klLD6QhF97RXW
	 ce25W2PW9JcvmJIe3nBpiOjhnzPrJOqDFwHAtOYLEwBfp0n0nUKzK1MSG8kzPUy+hb
	 vy7WYqrtgKNBw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:13 +0100
Subject: [PATCH 01/11] dt-bindings: iommu: qcom,iommu: Add optional TBU
 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-1-0c84aceb0ef9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1136;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GbSJhNvPymdXfLEhMABU7ydqhf3LjmvyneLWjlqwYcY=;
 b=Gvxxdpcoh52RW4kU1ayFveBjlOW3okp2WEGgXcJakTS1JpAZj2OYMvZDAVGPqFKpZL2uVdxcN
 rPakUHjJQTQDsRfMVYqAMosWgIdVzkB5xsq0u8SY1sRBLb9OTb+VSmp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some MMU instances feature a Translation Buffer Unit (TBU), which comes
with its own clock. Allow describing it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 5ae9a628261fd251c1e991a70662c6d37ef2c4e3..09879bc8ad8d04b73dd22f7f64b2d1de60409941 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -31,14 +31,18 @@ properties:
           - const: qcom,msm-iommu-v2
 
   clocks:
+    minItems: 2
     items:
       - description: Clock required for IOMMU register group access
       - description: Clock required for underlying bus access
+      - description: Clock required for the MMU Translation Buffer Unit
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: bus
+      - const: tbu
 
   power-domains:
     maxItems: 1

-- 
2.48.1


