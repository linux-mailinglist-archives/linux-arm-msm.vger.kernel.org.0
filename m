Return-Path: <linux-arm-msm+bounces-72863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D0B503EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205084E7BA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AC53570DC;
	Tue,  9 Sep 2025 17:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/cQl8hT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E02DCF4D;
	Tue,  9 Sep 2025 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437361; cv=none; b=HdwfxySJPTfi2oS5j6sGgSKK3HQclvpH8CwnsES1CmN0lKFaI+vbS7Wswm4A+PQzvGuREjvolGD4BnuFPZ73THi5EbjqAwdNwVCkqDmiL0YzESGSISwB4gxgJz9wkiGZnQC1PY2PUUwOS+a7aJLWmXQOUSg7B16JNpqepJHGacQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437361; c=relaxed/simple;
	bh=+jMUMaLEjKEeihRySBtgzY2I18mLNX3TDsdErNOOwPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Phqs9D0bbKK/X9NCmbgaYPtDwfE1pJTZnqVCGw+eHRhTLaEwRAbmoZMiYYXN1n7E2WKPShIQaRSLL2MjswNgVEWDGW3JbEWw5W5AbGbO0L7O35UJn7MwW1/BkEl1NZEsFDX1fn+v9S4VgWA61ZTpiIxHSP3PQJ4RV71Hiib/ZcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/cQl8hT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B165AC4CEF9;
	Tue,  9 Sep 2025 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437360;
	bh=+jMUMaLEjKEeihRySBtgzY2I18mLNX3TDsdErNOOwPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B/cQl8hTxnEFUN/dFs6V52aiRTKx5b1H2Fvh6+LNdIWyyVmX0cx1mPoUZdGHP24Be
	 4LA6kcD/MumQ9aR7CKCfnrAJ/VssizDee9lHT6va/Wywy7AMVL3HDnkIRNGAW87ZNw
	 924QxyswyGz4QeTqDCY23cLjKbqDZHyPphM3Mvned1y01SLTomVrryuvEiWe93imwe
	 E9DSqk+cs/PaR53ctMguLp1mUWvqsixIpvXb+VfsSIW8L4uf+21/qplVA/2aY6pIXX
	 2M+LxTvZWhEtgFyvX64p9pIRSWCrOwl02SinVQNHT/VmFYGjVtKo5E2Tp1dqhcnq1k
	 zHHToe2eszmRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931B8CA0FED;
	Tue,  9 Sep 2025 17:02:40 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 09 Sep 2025 19:02:33 +0200
Subject: [PATCH v8 1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI
 X1P4200 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-hp-x14-x1p-v8-1-8082ab069911@oldschoolsolutions.biz>
References: <20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz>
In-Reply-To: <20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757437358; l=1044;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Q/61I5/AK1HbfYRX0KWha99BihztwFSAKt8iv2F7lF8=;
 b=nNjSbkmMCtq7EG6ONxhQ9P8D7y7hJGNwp+sV9l9tUakD1WVT+R7JxMbzRVhx/Uz1gEp4nwRps
 P7OeVItQzkXAu151EkL5GULpB8mlXu35IswtXHr6fgBS8BFEHRl2YP5
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
index 7d47d0c04376bc2d4802b55e7121573df472a3c4..916217c7996d9a7adde0355dbbf246e251694ad4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1076,6 +1076,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100

-- 
2.48.1



