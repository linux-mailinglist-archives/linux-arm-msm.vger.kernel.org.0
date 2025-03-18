Return-Path: <linux-arm-msm+bounces-51802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA4A67C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C03277A835E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB082135A5;
	Tue, 18 Mar 2025 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3TDwL4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A4211A0D;
	Tue, 18 Mar 2025 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322935; cv=none; b=IzT5k6Xd56XNhTGzA6Ls3oeG5/KOygpOs8ylMlk9jEumYYtwtA/53JR0YoJWNF1TvPL1/T7sw3sEIyoZMuem05On4a5wzPxxG+qbHJL5ztLGpx4KAtFXLnQzG2Aq/xYP41UoXhvvUln1LjQ8hy9MdwkteZUocWagqobbVkDFIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322935; c=relaxed/simple;
	bh=vx5/s35EbbUVo021QHu0zEtqsOnkalvl/Ooc/L2cf1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqkIahMa1CRPZwq67oJtC0Bn2bXtux7FlPZJyDozY0LIbuGISnnv06+lmBU5oBe3DL1sfE+8bYANX4KCuNkw8MZt+ay01yWvMHdoG7koRE8QjpTdC3+yoT9nWuRmqvv+s0M0Q9qefMsrhyALL5tOGLfqJZP66ILb4U4f+ys2d14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3TDwL4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E373C4CEE9;
	Tue, 18 Mar 2025 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322934;
	bh=vx5/s35EbbUVo021QHu0zEtqsOnkalvl/Ooc/L2cf1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k3TDwL4ZIkTxcmckI9cP1Sv7ITfsiVLSVUblX+1k1so6gSv77D1xUh2qzIa83IW5D
	 4RYQzXYgE+FN+ox63P66kJxGxDoFhk5Nd5Fz0IufLi4F18ekQ8G9+osIkypt5EB3I/
	 k5V+z4P3XuPVFIfF6f9bms2Ix3xPEcMrPL9h/5HjqGzB43ZNRDbVP+XpL3JIDD+khA
	 ZUSmtdVWNfdPVFl5yagIaQv45pjVL8rVH5XO3qE2Nf4Yuz35jLv06NYBvOb/1D601d
	 9LjFdhdsx0p8UtP08tlEbjc7IGy/ffMH0U5fFp+76u3bwgiFXGhRJJjskzoat4FZtV
	 Vk+Dtecy/yFpw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:14 +0100
Subject: [PATCH 1/8] dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains
 requirement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-1-cb36882ea9cc@oss.qualcomm.com>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=1853;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=4mluHYqGriOqGK+Ra9FQnEddl9mTKD4esnUO6KTyZ9g=;
 b=KIiVhY+09nWTHExMpIvFiaxfM3diaKZrwItbiciRIY0aiaWYAjwoAC7a1wdAT+/diwzmTqeiu
 hROhVgnIDfEBzsZSaUKLcaGYbGwLW6/JE7bz9Z2VC2yCP0Kkx7WVJIt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Certain platforms (such as Chrome SDM845 and SC7180 with a TF-A running
as secure firmware) do not have a OSI-mode capable PSCI implementation.

That in turn means the PSCI-associated power domain which represents the
system's power state can't provide enough feedback to the RSC device.

Don't require power-domains on platforms where this may be the case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
index af632d0e0355c56748ecac24f528dc2eec7d1193..f8b7428df6bc3caef2917b300ce47a91bb3f0fd0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
@@ -44,7 +44,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,rpmh-rsc
+    oneOf:
+      - items:
+        - enum:
+          - qcom,sc7180-rpmh-apps-rsc
+          - qcom,sdm845-rpmh-apps-rsc
+        - const: qcom,rpmh-rsc
+      - const: qcom,rpmh-rsc
 
   interrupts:
     minItems: 1
@@ -124,7 +130,21 @@ required:
   - qcom,tcs-offset
   - reg
   - reg-names
-  - power-domains
+
+allOf:
+  # Some platforms may lack a OSI-mode PSCI implementation, which implies the
+  # system power domain can't provide feedback about entering power collapse
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sc7180-rpmh-apps-rsc
+                - qcom,sdm845-rpmh-apps-rsc
+    then:
+      required:
+        - power-domains
 
 additionalProperties: false
 

-- 
2.48.1


