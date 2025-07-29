Return-Path: <linux-arm-msm+bounces-66997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C5BB14D5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBC3D3BFFDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DE0291873;
	Tue, 29 Jul 2025 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b="EN+iGzDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.atl.tools (mail.atl.tools [49.12.87.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3150928EA4F;
	Tue, 29 Jul 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.87.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790631; cv=none; b=CMzHl/ZDj1+N7ibSQL2LHchk94gqliDxYoDeDBkVN49uqiohX27eAh1p00D+otuieD3K/goguohN5cpUP0fX1B9MZFijpf4AhY+Fgz81N+7U57VEcg8IoLT0EI8pHbJNEX1U1VK6q2J8WdCMGhalPiDcMhQy+HtPtaoKUiWrOSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790631; c=relaxed/simple;
	bh=Sz0RuO7L6mEXw9CbjRqS0ULJtTMkIX+QvkTzI6idkyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wifh/M/I5Gl7fmuOXBnWGxScaIb6xgpujZbTVlV0a4nvUfCqRPv+13Z1Ap0AgGLZi2i8M0LV8RP2HpQGo+Eo7JSRn4fq3LPAU94T0ga7eRdALkNdqm7c7jyAfBqmaAOG4qSgzYBuw4HTloJspNjSjaCFVAwSGpiRtO+ps4hkju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools; spf=pass smtp.mailfrom=atl.tools; dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b=EN+iGzDX; arc=none smtp.client-ip=49.12.87.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atl.tools
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92A022AD2C;
	Tue, 29 Jul 2025 12:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atl.tools; s=dkim;
	t=1753790627; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QHGSV/p7AwNzlvPcZHglcevhDklKeEst9PxjhmtZFwM=;
	b=EN+iGzDXgTpaUcFSU9al6o3X7NZeJMmUguwxW2TjrpM1ti9U30o1yFzC2C4vj2iqOutfM9
	jVmoDOVhVP3qP36GbWtnM5pNJObc9QRM95wm+H3EeM+BeolNs2ljN3xLTxQaaz9SvZpqyS
	nEjsvO2RFhmFYfdsRIruAUrAABTiQa954jOWRrMOLoC/aay/n7wTFuRVdfEOEAhk2Bnr7T
	c3TksFkSRPZSbqdTucTXqziASE8IiPWsM78eglaZqbeE7YHJCBIZvM/t4b2GeQ8tWDCTW2
	/3jD/jcYpd18aye6Q0ZJydm9U5ZifA91FtfVvi8Tqr95e5b/FTi7yBRyVoLo/w==
From: Violet <violet@atl.tools>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: arm: qcom: document r0q board binding
Date: Tue, 29 Jul 2025 12:03:30 +0000
Message-ID: <20250729120331.287245-2-violet@atl.tools>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729120331.287245-1-violet@atl.tools>
References: <20250729120331.287245-1-violet@atl.tools>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add binding for the Samsung Galaxy S22 (SM-S901E) board, codenamed R0Q,
which is based on the Qualcomm Snapdragon 8 Gen 1 SoC.

Signed-off-by: Violet <violet@atl.tools>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b3556580..64455af6c44a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1095,6 +1095,7 @@ properties:
           - enum:
               - qcom,sm8450-hdk
               - qcom,sm8450-qrd
+              - samsung,r0q
               - sony,pdx223
               - sony,pdx224
           - const: qcom,sm8450
-- 
2.50.1


