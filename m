Return-Path: <linux-arm-msm+bounces-65201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D46B07309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8E21C2522E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18322F3C30;
	Wed, 16 Jul 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHgFBKzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A32F3C22;
	Wed, 16 Jul 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660993; cv=none; b=FBALhqJKwhvbR1Z08iPPAwyNCf3Xd1VQ7Qs1DJSY1gHvkX+7c4iAulq2oanZRvjRR6EuoPz3YYQpHbg3y+O6OWExwfDl1P1XyZqwn/2oUjAgAaiP99INcLP9/udd07hQlaTciNv0jz6zICVzwVCnD5WXerzqPXZdGcowqTIQ7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660993; c=relaxed/simple;
	bh=cQs4higQlQowoSKCM7Isl3s4PaeYFVRruljsBLP1HDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOmI5A+JLJaFvzrZjb8+3ZN1rOA8VuWUUMGPWQen/+li7/UTUyRNtGXPkWK0uP06J0pLCdjjtvxCdNAj2bn+E54WzyEvjQf9a+CensLlJK/oVcHmxVFqaImCHY7seyp8usHUhsDkjXMYstJz9kHPfRPSMCqB5Fm5hkIUuLJIxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHgFBKzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3065AC4CEF8;
	Wed, 16 Jul 2025 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660993;
	bh=cQs4higQlQowoSKCM7Isl3s4PaeYFVRruljsBLP1HDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KHgFBKztX2Q4ZjIwOtpy/vTndl7SrxkMgfbHiKe0FlDuUYB+zcQXPEdsRt1LsdjMM
	 WaeNrqRrAKWzL4cboljUqBXK90MNNcfe03TmnPiUtoLMP7m08z7x/JEjuLqAUQwPFU
	 8HK5b+mFmJO7KwpmtrS6oJMLJPkeYrMsElETVJHfohYFeKn5V/CijN9v5CPFjdxCqU
	 pvpIZhshU852fuVf/UKQK6xuWh3vtdfUGd29QRw1r0YfQOOqjqdmabCb3/mYbylnwE
	 clfaE12wWGCHY1PyrV0/bKYFaDpijGH0WUwCzmaqfRjdQp1tKGLGx4LhJTQ7rqh0Pb
	 rT/XnJtm+vn+A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 16 Jul 2025 12:16:08 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom: Remove sdm845-cheza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-topic-goodnight_cheza-v2-2-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=1029;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nq0+bsZbM420uHM2NT9JW+kPINx3ak+QhA1FtvXfz1Q=;
 b=jU+IMw+wqXeEhyXyH/QhYhB6yg96qgYt37MGudhjssp+9f4QLTBnrYkrErYfjCCLYF6pJI00A
 5idYQfQ4d3HCBcgUT5bVncSCFWTKE+aozVLKkpGm9xfmfSw2e8G4xjT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Cheza was a prototype board, used mainly by the ChromeOS folks.

Almost no working devices are known to exist, and the small amount of
remaining ones are not in use anymore.

Remove the compatible strings reserved for it, as, quite frankly, Cheza
is no more.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..387725fb5420e37a802fa16b5ac5b9c60bfc5b22 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -976,9 +976,6 @@ properties:
 
       - items:
           - enum:
-              - google,cheza
-              - google,cheza-rev1
-              - google,cheza-rev2
               - lenovo,yoga-c630
               - lg,judyln
               - lg,judyp

-- 
2.50.1


