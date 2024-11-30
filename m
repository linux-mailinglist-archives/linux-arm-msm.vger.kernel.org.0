Return-Path: <linux-arm-msm+bounces-39736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF0A9DF2C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 20:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 803D6B20FA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 19:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742861AA1F0;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pszb30Jv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B19132103;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732993738; cv=none; b=bRt3xwp6FTM16A0adK7SxKwwXodYV0AmTUKK4z1XZx4EdzJKIWSNqnVWh74zrc7SK2+n+4Ll/j47B98/aCH67PW0/K8Z4scMMOMOtONJ77MIYQoTGUiRGvkGnAiFG5uCTOY0VqY8Vo9iQRlC4RBRf+wpt3lLtKZVB1wVCpUMoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732993738; c=relaxed/simple;
	bh=hKo6wpT2lQ4WiPM+HGouzNx2yDZfJADULnxPu3Jm2o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtAD/A5Scq25LYiQ2aVC0QJjsODtiODvZc5D7Vc04pYRxIlIYBXMVWg3NVJH2lpWHdN35UZpazsqo0xIS6CTZFR5F/rx/iTfNkKszwtzVsvD8gNz91xDjdt1NESdPXDZlrs8v5fyM1qAz/Gt9WEjrB6Zz+a0oOBb6+np+ZRotbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pszb30Jv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4FC9C4CED4;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732993737;
	bh=hKo6wpT2lQ4WiPM+HGouzNx2yDZfJADULnxPu3Jm2o4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pszb30Jvb/fWTxg039G6PaA6tNDJ+NZUSvoz8WQUhBWFKWBbd+K3/ISJz89lXCSuL
	 YgsMaasuNT+VvnydprNpiLLWyToAhbNCmVOhfUsU5Khd0EXQ6r01eOnkgeSTXyAwu5
	 CbVmMJhR1HCVN7B63LLzrM69X+EPFPsyT+78LTGVuVtOiit1LPAoLjYLDsoUadjfEs
	 n3F2oFUtgT6RKkgGj5Kyrn6erot5piQH4r9RnTPcjis1v5Yw9kOdN5Qf6F7bSq5wsm
	 W1hph5TQ//r5hnAVela/R9je7aiaDQEHOtO24Lu76fQpmso8bFanGIJ+S4YVnMgUCn
	 QVqeq+PzOCQyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA777D7360E;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 30 Nov 2024 20:08:52 +0100
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add HP Omnibook X 14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hp-omnibook-x14-v2-1-72227bc6bbf4@oldschoolsolutions.biz>
References: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
In-Reply-To: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732993736; l=999;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=zU4xt99XOiquqKqTwjoKoYgCTiyjZq1Va7AXUhaFOkI=;
 b=4VrQrCGoK2IFk+7PHKWVO51MN5Y7p6Y0RHfFiNzsdLRHWIIcrkSCPtld/Khe70vXTAZ8cezUY
 C/i3Ejw3dS8CV3dCnVBIKP865eL8Y0rbWYN5Y0+8OklYyJ/AGF9PKZ+
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for the HP Omnibook X Laptop 14-fe0750ng,
using "hp,omnibook-x14"

The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca39903935104..62e197a1e7603 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1103,6 +1103,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15

-- 
2.43.0



