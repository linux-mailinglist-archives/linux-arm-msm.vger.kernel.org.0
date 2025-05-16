Return-Path: <linux-arm-msm+bounces-58172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DFAB961C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 08:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C1A41B65E5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 06:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E059225408;
	Fri, 16 May 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5Q69eTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6DF18CC13;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377797; cv=none; b=f0yHUEc+UoFoAFSmaFuMWHFvI1f31oyEkNwlub0fsqGPHFiSGVLz8yfQmr2ENF/LywOC6cSOfJcBb6JyEaFqCFUIDUVXb+QMxnOWXeatu3X5ssbbkFtDEkeyVWMvbF+YgXpWalOigD/F23jtTHY4rlK/JjcOGhELxWdKflvURYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377797; c=relaxed/simple;
	bh=NywEqeDWKIE3DJOODAgld7o8NJRiMHAFoJbk7OTyI6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTKDE3LC71VMWMszNE7aM8egt9H5wiVYq+hR08CJyj2Tc3OtAZIXVrrrkhrWoTTYVnG5Z9K6p2fpNSJnXXUberQtqXgW9qkghGzocVsSx2t0UXJXshd3li0je9oEW4gqmEUW0RSPCqBAptMdorLW0Y0g+lPgdH/MB8lapVgmCRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5Q69eTU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BE4CC4CEEF;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747377796;
	bh=NywEqeDWKIE3DJOODAgld7o8NJRiMHAFoJbk7OTyI6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q5Q69eTUUKilmQeDpOKYipjVWM4V+FMWeaqZtF2cWU07jB1OuWzWjcj1HpCff1tzM
	 c66H7l9zH3EXFI6aL5tWZb95j/29hDu0Lw6fQROnW29eGrpcteRuMwXxttAXFGVtsq
	 zzN2ghdyWB0mfI3cbIVDl9EhW+R0e6Smmob90+u1I/dwgaErzcW/14iBH5/5sw07ir
	 z+sANgiJyGTKbL8EuOpUill2kFR8xfxSxVWwSBq4qsM0uoDRXW7DWB3gFPtfZeE58p
	 an23twsSDaX7C2AeRIFfuciIxN9t0i/sMrovTMJG2tIu4AHPm468TqLqj6kyoIFCV/
	 UBx+riQ4RNNQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0CCC54754;
	Fri, 16 May 2025 06:43:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 16 May 2025 08:42:59 +0200
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-tb16-dt-v2-1-7c4996d58ed6@oldschoolsolutions.biz>
References: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
In-Reply-To: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747377794; l=905;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=2g8SM9lGMgdWyCMNBhCp6KQKXsIP6Oe0w1ibkHBucW4=;
 b=h6tG7viVd62+cKVlQedXEoqvWnK8OYr5ipRT5xA9cT29DlhMNwLa+FI6aDUnQ6AyIn9CU2A7F
 42U1OAkqrq6Btt5itOxzhqXkRlSjeVquIsnr5HV83F16IiIv5U5srYq
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..5654aaf825955f8000355600c0ae35b74676273e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1153,6 +1153,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



