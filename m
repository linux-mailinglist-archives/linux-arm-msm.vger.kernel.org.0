Return-Path: <linux-arm-msm+bounces-59147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8093AC177B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2558FA269AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CAF2D028F;
	Thu, 22 May 2025 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8+Fp2bA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604A2D028D;
	Thu, 22 May 2025 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955923; cv=none; b=dz+CXe3kFrtDY3/hjsxW6f44xpjgBKr43yg7pCfMBtMBE6aqCewlQfZrCyBb2g8D6f5oH0eVukQqD3D35LxXGU/zWI0KkpkaVjOJLfthGTdNUMDZyMKCsmAmP8klsMzSFvoJ6VBM6lJSu7DnNcHABgJEP/xczjeEFmu1NgA5Vp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955923; c=relaxed/simple;
	bh=i0PGLJXZvXil9JIWiSO+PGM51YENV2SmH69RJEF9VvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fd55M1iF2K7Q5C4vbAL+XnDHI4iDfC8iiPW6P/Cv5xYda+JQeszHHBK0Sp9+iyrCOmBWSI6Rn7UYtooDpBlBFNN/FENpDJZa/jQG53MZsupXiKUYpWSWqvoxaQQf8YQXzsn+lpjSUMQlTjT3fiG7GoiB3X2fSFT1YoXOfk4JWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8+Fp2bA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6413FC4CEF1;
	Thu, 22 May 2025 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955923;
	bh=i0PGLJXZvXil9JIWiSO+PGM51YENV2SmH69RJEF9VvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C8+Fp2bAEVOB8NJIIEo2Gh59y+03C/7qP7/iWM9QFL0jpvoiEhRG+EzpbCkqe9nsi
	 oRksxzalV3FGh+eAeFoOj/gvldPM+fiNJhxcfD/0dRyYYb/zAZRT7dQIdFylneOhVR
	 fJXUK3Z3Qg/OaZI3FHL2dRvlsIjwbjJgCatYoaBfdUvhNQEXLVZhjWvPnPbyhrLPJ+
	 VEQpxkcx3TBlDU3025M1/p5fAlgQdv+RE6Eq7RuFr4M04JIjoG1jsosjHcCuADJo8N
	 CYW4C5A0+EUaxhcSXM/3y/7QEJ0rq0d1z3HloPaWtzNREfInTglZQMpS0MYMn/culW
	 9cv01jlGJsCJg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:16 +0200
Subject: [PATCH 01/10] dt-bindings: sram: qcom,imem: Add a number of
 missing compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-1-f7aa94fac1ab@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1510;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=TorWN4qo7AfSPzEc4fT3Ql4uoQ7mKdiBMbLE7+/VWKs=;
 b=w4WxMQQki6M8pdgAhcmga8HEASw6ZQmcKoC5Xj4ZaXnS9D4E3B9IYRf3rnleTwi8yZdsB3MGG
 SuiLkglnJxfD9wIDJmH3e4cvFhOuVKx212qx18FZk1cF0hx04dd4FvG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently described or not, IMEM is present on *all* Qualcomm SoCs.
Preemptively add a number of compatibles to ease integration.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..70f934e3569068c0781d9ebad16e7da2f7932d6f 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -25,14 +25,27 @@ properties:
           - qcom,qcs8300-imem
           - qcom,qdu1000-imem
           - qcom,sa8775p-imem
+          - qcom,sar2130p-imem
           - qcom,sc7180-imem
           - qcom,sc7280-imem
+          - qcom,sc8280xp-imem
           - qcom,sdm630-imem
           - qcom,sdm845-imem
           - qcom,sdx55-imem
           - qcom,sdx65-imem
+          - qcom,sdx75-imem
+          - qcom,sm6115-imem
+          - qcom,sm6125-imem
+          - qcom,sm6350-imem
           - qcom,sm6375-imem
+          - qcom,sm8150-imem
+          - qcom,sm8250-imem
+          - qcom,sm8350-imem
           - qcom,sm8450-imem
+          - qcom,sm8550-imem
+          - qcom,sm8650-imem
+          - qcom,sm8750-imem
+          - qcom,x1e80100-imem
       - const: syscon
       - const: simple-mfd
 

-- 
2.49.0


