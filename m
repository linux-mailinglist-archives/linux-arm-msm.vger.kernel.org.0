Return-Path: <linux-arm-msm+bounces-73495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F2B571A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD36188FC85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B0A2D6E55;
	Mon, 15 Sep 2025 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsCx+bSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385662D595F;
	Mon, 15 Sep 2025 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921717; cv=none; b=bgr0qMbsHSaD+pWM008jGnksJP6T+pzirkGmohb0vwhrYJq5uUTvHX4c8y8aL350gE47FeDIAJtXFF6g+Jol9kpjnUgrCEZ/zhZ5O/oHjjVwWd0VbCm106DrFjtIwWcp1k1CCyuN1bonw0HLFmJIiWTXffkqqswEidJJQito52Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921717; c=relaxed/simple;
	bh=I9solv6v3NNMXw4bpTlk4j8YEp1PJnsek6VGljF/j74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zxs+XFWNX1uR61YKvqotQ1THY1cRx2aeueFi0WsevdtgqoAbsJutILOo/nRBrDPZkXQLlMM8j2/KuNGEN1faHaamTlgPJ+uNt6GCU/DWWp/HfhXpAP/spYAY4ykJYPExQy5g+KWB8yWxObwbBjlD0j/I7vmX2o11G+GczcSlJzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsCx+bSz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2059C4CEFA;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757921716;
	bh=I9solv6v3NNMXw4bpTlk4j8YEp1PJnsek6VGljF/j74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UsCx+bSzXRv996AWqYNS2+Amr/ywSIsKA64fYqN7ZByco9vf8szL+UPU0NsjYl/tw
	 fRwwwI5+qfqfkalAj6z7Xnxik+FgG5ROtHyZo0k0ku12qD14qKHPbt4rpfnwLWv7x8
	 A99QqJVPtK5RMATZo44Nd8urPyamGAJLXStYmzM5idJsPXpTMfT+1uR1JJDUXbGwlc
	 4uBlsxjFJoxe+QV+omK2+e6PRQfrtt++K15XlEQwTZZRpOcKY0C5BSMU15yHHbx0Eh
	 nDP/w8RRChqB1AF1wzfDMncS4klHd4OXY6fvz00jkMi0dsX4ntCDc/yOaQNLqfdtMV
	 LE5Sa4CmSFbrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21D8CAC58E;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 15 Sep 2025 09:35:04 +0200
Subject: [PATCH v9 1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI
 X1P4200 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-hp-x14-x1p-v9-1-fa457ca30ffe@oldschoolsolutions.biz>
References: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
In-Reply-To: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757921715; l=1044;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=84BFla7oeqqiXUYREX3Zt9zgWs4ikNp5mg7FgtIK0VY=;
 b=fpYaAqiiPecPK8xFBhtiAEIc5qFTqEHnZOSLkcBAcg2x+HEjeAj490MaFXwBIWx0GWmgqK/Tv
 GIkHO4wTLoWDUIjDJVuvKybBnUsOZujQyOsVsRKO/Ncyi2as0hhTAys
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
add another variant:

hp,omnibook-x14-fe1 compatible to cqom,x1p42100

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f3686f1647b9e2ea192c175b0b96d48a..d205bc901f9251fdc162d6b060b0437aef3aef7e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1077,6 +1077,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100

-- 
2.48.1



