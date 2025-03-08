Return-Path: <linux-arm-msm+bounces-50669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A471A57761
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B07173847
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628F2137750;
	Sat,  8 Mar 2025 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="El6ZpBzO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284A1F95C;
	Sat,  8 Mar 2025 01:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398163; cv=none; b=bWCsZR05j2f5hVJboPflw6l8UQmFDNxwykgaekqWFzSFM4nnIIbaZQci/zJwzbzDhSSOqPBcrEoXfw8CfUfsGjV8805vmoZwC8H30QTqM7kEcUORF3Jsa9b6zCFxf2SqWTBB4fIno3y3ZaykcWibG2bZZGk6fizHPlqbReMCOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398163; c=relaxed/simple;
	bh=iPx+WBr8fx06alijfcgISN/safqfJBFq2eNoYJhSkxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqNnlG2sYnSCLzBd9iRa8egYM7BlS9F+PRB7cIPo3NKF1GkmY8zgiOV0cdnY6jHOFEDj4Nx1zGXQckfqrupX0+AZmTZNs/HnTcbY4Z0U1bVvF4cnEOsJe610aq7PSroF6uKCwlFHqD09oi7omGeXwaf9NVrGawuybXwfyvDbIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=El6ZpBzO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE66C4CEEB;
	Sat,  8 Mar 2025 01:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398161;
	bh=iPx+WBr8fx06alijfcgISN/safqfJBFq2eNoYJhSkxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=El6ZpBzOyzWZCj0RW6VimlAEF7mrsiyeWpB3Rzv5IWd9EOpHiI3FipKsUq9gOZcrE
	 Hn/r8ehPE/7aMkD32LW9Zk5CyOucPviqex7xRQVadMEJq1nSiqWDvivtNSO+/q6jjt
	 eBUqRiT+jXeFFl143NERRs3piVejvXRxHgn7sSrtCkE7WkdxkNM0u9Ae+ONWjNqkeW
	 hpHQpBLf42aQYkf0HP2u3XO7FpE6ph0qvGB0SBR+NOws9+f5sPHMJj4V9SqymAJfby
	 qcInQhQQs0xFAEIeqxg68Cz/f3R3lRX3LFPVxYr73nCRuZWCGkgJ0a3F0SdqZFxsur
	 7h0WEQQSDKH2Q==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:20 +0200
Subject: [PATCH 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-2-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rDGcZM2rvCdHm9sgR4lxUwNRWngl4FDx86wKfG6c6y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/fQpJRnRqw1lfiMDhDsGG68sdQHMwYIMns
 lOOOgdvQi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1SSOB/957aAJj2pRGjifVA6cDUWmwLG9wagizLPR/EPxJNgs6Ac4VDq0h6zGKp5oOB8YXuh3D9w
 gadAix7f31u0NniYOnkt6SV5szfhK49WwP69B8/Jzpa6nd5SGjpT4KU3x4P83BgvY+/MUCh3lga
 uVNRpoEgXtq0YjnjovDmvzO5Q4UNfs9Yp1E0Ki+bm1wxyu2gP20Ezt0JZvVK2nHQIDCL4fJ6JGa
 foLQ9e/GOmJS6myKW/gBy1kZgLIJboSsADqwFdu1wcpDTnvjDKuLIaDsogMvazlYqutGO4VFnEm
 F0QtKO6Y+np3gtFP4CUmRq9WpPra866+TKVo8kNquHq84ZOC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5


