Return-Path: <linux-arm-msm+bounces-50554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B4A554A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447F43B99B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA51D26BDB6;
	Thu,  6 Mar 2025 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCryt67B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3E26B084;
	Thu,  6 Mar 2025 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284746; cv=none; b=Ix90X+PMTrkhJ3ohxU9Mrpu7KdXk5fSywlr9LP5iB3r3BhCJomzR7I1W/jdwas4I2gSL22+yx/tg6tENkAT38cK7rduD4uFo7UNiTZL6M5Sg6bCQ5elG78UmTJqMMqOIc+Oyr+lgYdcZMg4D8mUN2e9nToXLQU/2sB5rfiRKXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284746; c=relaxed/simple;
	bh=xJI8YW3tJWvXtoFCi5zYWmr2oU+yQ4y275wJRTetRfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pe8e2fHjOivz6Bp3s2ZwndURowdyTpOqrnGREnqC7+TKRF6UuBVt3GRIpWlIrou3Lo6oIfMi4T3rZpVa8gcViAuvSq5km+DRpn0b7srnPFqyQa3ADabm+u0JSVLTrGJaJDR1SG3u6jyrGFJcO+faMzdyveboHUsw99WMVonbIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCryt67B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F6DC4CEE4;
	Thu,  6 Mar 2025 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284746;
	bh=xJI8YW3tJWvXtoFCi5zYWmr2oU+yQ4y275wJRTetRfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BCryt67Bqnh3KXe4v64JuDn8rXu0KvqGcdGjMRIY0eFdmKkE+Y6zqGmJd5JgDSjCm
	 B8yT74nZlYuVj8GE8MhGoYMUEPMlay4f8Qdgvu79QVXs/OdaUQtuIUlR3x0oiH+eGz
	 qVhSSUzBvFlQD9iRsB7XSkrVX4vS6jvloMgY/u4F/EgoiIPmd9PBQcgbagks7hBzPk
	 GikBpZlJu5xwWbvxQYKAvnIvLD1xh0DwKXKJbyVOIuXq4eo6f2unQFYuRH0YLLYY2+
	 hwL8Yr1R+5X09cy36n2PqelH/C3xmmnDm5bZGEuVfppkuhxIRTu5BJeDmiSMmA/y9Y
	 K+gfgEbotAAjA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:18 +0100
Subject: [PATCH 06/11] arm64: dts: qcom: sdx75: Rename AOSS_QMP to
 power-management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-6-0c84aceb0ef9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1078;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=AfbhLxvAz3AtldfH1tTjLfb73GXmkBZlH8+4dYpZKEk=;
 b=anSPLuSzbJe+syIcdYyOlEdotRbnQEoqsyoj3CVZOv8+gKTd/wFQ/7eBCYIt9aGsGK0JaXvWY
 eleBqcYjcTFBVcz7FCmOyoNCIfCThOZmVKi82v7CDbPnnpRyjD8clyU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The node is currently named power-controller, which requires the device
underneath is a power domain provider. Rename it to align with other
SoCs and resolve this sort of warnings:

power-controller@c310000: '#power-domain-cells' is a required property

Fixes: 91f767eb6938 ("arm64: dts: qcom: sdx75: Add AOSS node")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 8da2383861e4321d91be0e23a2f1ade9914e8416..8e63f635a3275794d8ce248b65ae2cbc1e60072c 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1079,7 +1079,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		aoss_qmp: power-controller@c310000 {
+		aoss_qmp: power-management@c310000 {
 			compatible = "qcom,sdx75-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c310000 0 0x1000>;
 			interrupt-parent = <&ipcc>;

-- 
2.48.1


