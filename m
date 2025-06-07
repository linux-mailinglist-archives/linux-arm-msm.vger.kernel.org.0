Return-Path: <linux-arm-msm+bounces-60523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0023AD0F04
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 21:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063413AE1FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 19:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9641C20B803;
	Sat,  7 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qk/be2Ko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C21E50B;
	Sat,  7 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749323980; cv=none; b=adAcOLH0L3eJi8Mc9MD4106JYsuydITr/Hvo8Zq8VAg+w2JDsB/erxEIc5Qtmr89mbxjOnEMrc8XlpnNo1HIBJLQRO6vpSbqHRASOAv9Xxp1CNhb8sIZ2/E/JlJo1bsMS2/WmfZthOtc73khQPEgcMIhkbeS/K7m9IjyJtf1Xyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749323980; c=relaxed/simple;
	bh=IboFBVpYRKzDKkQX/pnk4Sd42YAjQ3wt5KqonA5Th0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avud0rH0Kr8JMadCiCZX1AL2sAPuan1ojqtuN7GW3V9fFkIxTtYB5K4LWk1M0FRT9yBIQZK9jWIxyOe092pCrsUBh6s4CxDltP+YyhmQUbPT1NuWomOXxmJWe/FjekLwEruE4YN1EK5lLJ8uIHsTUyvdJBXczY9qKkSLo7zNymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qk/be2Ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0992C4CEF1;
	Sat,  7 Jun 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749323979;
	bh=IboFBVpYRKzDKkQX/pnk4Sd42YAjQ3wt5KqonA5Th0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qk/be2KoitxyrpfwALYNqLyqv53EJw+1dA3BsTWiyY6sU8/V/eKjE5MgWRfjwiRCt
	 ekYgwwRLoLgb9dxfiEYhaB9WFniCS+nT0zYK6w0VjqaI0XwrBJCQyKXTyjDRpzZMa/
	 +p0j9Vx71LKdXq2ozt1k5hHsYC2Um4lcO/Q4P/tOwH+LMXVLF+XmtJTeGHYiF16fyR
	 IyEjmcD7cK8nC0P20+lxhkpAl7m8PrrGPCcAy4Z/EkgNcT8CoblsH/kzXCEHTJ8fAM
	 BDnbuShFNXZ50bHfjFyin8jrpI4f/cbwu0VOAFnZ8Ex1Lanm+GpUUCjEsyhZjcQPR8
	 yG5z/N4pTzZrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D056BC61DB2;
	Sat,  7 Jun 2025 19:19:39 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 07 Jun 2025 21:19:36 +0200
Subject: [PATCH v6 1/4] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-tb16-dt-v6-1-61a31914ee72@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
In-Reply-To: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749323978; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=VKlEav++gGoAnz7EjFckGLGHa5HU8TeXviODgz9PWIM=;
 b=kAJd3RbuP8xQ7M68f5oz3MPuVYG/7doYhxl+F/DfkqHP2Ct5epQu4qkpB+IAqX7LOFz/1DRQp
 5aiYA+yBPDaAUxcEQgtq3/x5hwHKIVP+IkW414I7pVbsg/+J7Y0ClVx
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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



