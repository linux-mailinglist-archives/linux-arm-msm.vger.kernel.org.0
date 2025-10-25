Return-Path: <linux-arm-msm+bounces-78791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739EC099A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F019B1884048
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BB330F520;
	Sat, 25 Oct 2025 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndwyeTnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7830EF94;
	Sat, 25 Oct 2025 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409492; cv=none; b=cXVNf9BQnyvaZZGBm2y1lWQrx1SFDKEVOoZgWvRTumbIp02UxcC2uj9Aauj4xtOetgl2S1gI42+mnZU93B8Z2bfuDW08FqATeZn4+RIKsjWc8G+4FZMVuqqtBk37rq6M4nyznlny/UGUZMhHRds9L6C1mFGp7/vXFjtoMZAPjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409492; c=relaxed/simple;
	bh=bwtiFccQsOoGsrSvgCkYaSrdPPeWEvE9ONY3v48TobM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qO/uBx7v40jWEpDXHQ2sFajqSH4L/Rqf/7w/7+yshoXlzSO2+IHHxOl10yiEVdhmOXUt48uNtPZRgPA5qzVFRyRBc+Iw19EQC1WCIEW9TDhJ0RJOYmEZYfPmoPYMxjoTJrfLGK6KDH0HTHyMoY5mRP3iBBOT2xyZNslmWj7Csd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndwyeTnJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB44C4CEFB;
	Sat, 25 Oct 2025 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409492;
	bh=bwtiFccQsOoGsrSvgCkYaSrdPPeWEvE9ONY3v48TobM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndwyeTnJ+pK6cdGLOWutBQnHfcHi1vlkVysMHl1TjwsPUwHrRpsiqK4SET0ncxMIU
	 Qho80/iPHxQ3mSK/pmig4VYIvY2Xbh1xHpTq+Bze5NK3q4J0jZcpZO27w65fCnnhQm
	 Guoyuzf/HW5426HtOu9yA3kSz8Oax0AFisYiCqWv+kidF7lTL/oEnGOV0IemPGwQb4
	 GYFBOWZOzcsXXUXS3p2cu4aj4yCrlzI4YvMGnDqvcod9VN1zyUZIReL3nNEJjYxs62
	 zywUAwKtiMklAgd1apw/RGQPs0k/x33T/kzvfiPwwt1Ah/53lA09qRZg5KB+7pEdyV
	 Gu2e8EPPSghDg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jie Zhang <quic_jiezh@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] dt-bindings: display/msm/gmu: Update Adreno 623 bindings
Date: Sat, 25 Oct 2025 11:59:40 -0400
Message-ID: <20251025160905.3857885-349-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jie Zhang <quic_jiezh@quicinc.com>

[ Upstream commit c2cc1e60c1afff4f23c22561b57a5d5157dde20d ]

Update Adreno 623's dt-binding to remove smmu_clk which is not required
for this GMU.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/672455/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Corrects the GMU binding for Adreno 623 by removing an erroneous
    “SMMU vote clock” requirement. Adreno 623 does not need (and DTS
    does not provide) an `smmu_vote` clock, so the prior schema forced a
    mismatch and dtbs_check failures/warnings.
  - Aligns the binding with in-tree DTS for Adreno 623 (e.g., QCS8300),
    which defines only GMU, CX, AXI, MEMNOC, AHB, and HUB clocks.

- Specific code changes
  - Adds a dedicated schema branch for `qcom,adreno-gmu-623.0` with
    explicit registers and six clocks, notably without an SMMU vote
    clock:
    - Introduces the 623-specific conditional:
      Documentation/devicetree/bindings/display/msm/gmu.yaml:121
    - 623 clocks list (no smmu_vote):
      Documentation/devicetree/bindings/display/msm/gmu.yaml:139
    - 623 clock-names: `gmu`, `cxo`, `axi`, `memnoc`, `ahb`, `hub`:
      Documentation/devicetree/bindings/display/msm/gmu.yaml:147
  - Keeps SMMU vote clock only for other variants (635/660/663):
    - Block for 635/660/663 explicitly lists “GPU SMMU vote clock” and
      `smmu_vote`:
      Documentation/devicetree/bindings/display/msm/gmu.yaml:176 and
      Documentation/devicetree/bindings/display/msm/gmu.yaml:185
  - This separation removes the incorrect inheritance of `smmu_vote` by
    623 which previously happened when 623 was grouped with 635/660/663.

- Evidence DTS already matches this (demonstrating the prior schema was
  wrong)
  - QCS8300 GMU node uses six clocks (no `smmu_vote`): `gmu`, `cxo`,
    `axi`, `memnoc`, `ahb`, `hub`:
    arch/arm64/boot/dts/qcom/qcs8300.dtsi:4366

- Stable backport assessment
  - Bug relevance: Yes — fixes dt-binding schema forcing an invalid
    clock requirement, leading to dtbs_check issues for users building
    DTs for Adreno 623 platforms.
  - Size/scope: Small, contained to a single YAML schema file; no
    driver/runtime changes.
  - Risk/regression: Minimal. It only relaxes a wrong requirement for
    623. Out-of-tree DTS that mistakenly provided `smmu_vote` for 623
    would fail schema validation after this (those DTS are incorrect),
    but kernel functionality is unaffected.
  - No architectural churn, no features, and no cross-subsystem impact.

Given it corrects a real schema bug affecting validation of in-tree DTS
for Adreno 623, is small and low risk, and doesn’t alter runtime
behavior, this is a good candidate for stable backport.

 .../devicetree/bindings/display/msm/gmu.yaml  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4392aa7a4ffe2..afc1879357440 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -124,6 +124,40 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-623.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0
-- 
2.51.0


