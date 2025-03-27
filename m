Return-Path: <linux-arm-msm+bounces-52567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFDA7283A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDB83BA166
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBD63597A;
	Thu, 27 Mar 2025 01:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmxnUY+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B722E3392;
	Thu, 27 Mar 2025 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040040; cv=none; b=lvBK7Wx4uG0fa6XsBGdFmLbSBTR4SybKIny4SHolOj9Vi4JQBJ67YTv37Q0w77fueLXD9JmbC4qrywL9xf4/gF2DjepVlnfGM/KgJpSWK3M/h0HKaJAmhmPWBJq9nezHOAPshRMTLrvlY6kTUedPeAT5gTQxSTdIrsanKXXfLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040040; c=relaxed/simple;
	bh=jV44gltnZugSk2jzsvPx/rE2eqC9fZLtlEwshyoGgic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAmgDkOn8+VEtWY5h8yGOA/C+wzb0gTKrEKITly5rBe/j8HLuvnu10UtDc8sUimlEtvHVLMtEk94A237naC3emHfwUL3lygY2DaMxj5LwsjaZQnGCwlFt4G0caRHDfM2aLrb29CmrFQLdTxw+d0KBfDoESSg02lw7DB+Xk8F/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmxnUY+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBC1C4CEF0;
	Thu, 27 Mar 2025 01:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040039;
	bh=jV44gltnZugSk2jzsvPx/rE2eqC9fZLtlEwshyoGgic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hmxnUY+eZuiYniPxaxSZuaM0319j+lagdwzi9aPeKvYY4F4tlmYF6irpzsNkCuesV
	 Unh3eZhpesh6UAY7LFVLmKvUE7jvklpw+JQvSFzETmA5ilpZ50wJNRGc4Lr2jUEazp
	 0oBFrFDTRUn4d5mWLJlR4R+Di+vot0RpU6lRIHgOvgODBzkKVcMJgGdaiPpBlPGAfq
	 zYNM4ck1NvFx73ahplNgwmHgJTX7X5blIvhCQDuIoQzIzl7nefjBM56bDquNZhUMAF
	 dyJqow0uInMMYrEbYSM/7xf4YpekAWO3+OprUzZs4FP/wYPQKRXboLv2+Zlwtedong
	 pMl0uS51ojy9g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:03 +0100
Subject: [PATCH v2 01/12] dt-bindings: soc: qcom,rpmh-rsc: Limit
 power-domains requirement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-1-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=1865;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3v0lyktSMkCxoZv+uP7b7uNR+dz+cduBYTIqbyjd8PY=;
 b=F1PC26EOlRxAgdm3fP3W6mh5mprrHmDDRv9rzcFkOogS1qdpQNVNZ4YPcq42ZqHUsYoEXe1Vv
 YTeyML0AkkFBOlj4JHt/BlagE/VX7zwPwlnIWQpovXYV3o9+R26noIW
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
index af632d0e0355c56748ecac24f528dc2eec7d1193..036562eb5140c78c10d845fd6efe42470b41895c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
@@ -44,7 +44,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,rpmh-rsc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sc7180-rpmh-apps-rsc
+              - qcom,sdm845-rpmh-apps-rsc
+          - const: qcom,rpmh-rsc
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
2.49.0


