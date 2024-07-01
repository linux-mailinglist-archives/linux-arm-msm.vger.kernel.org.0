Return-Path: <linux-arm-msm+bounces-24763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A491D66F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 05:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46AF1F219AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 03:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF638EAD0;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxZZgGMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C8F8C1E;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719803133; cv=none; b=MjYqz0bWXUqTNQRHrcXOLu/tumBMi70hJy6YuP0wBpHb3+pVbwJbuqyTxHqgJSK+r31zHWnkx8hZjP6ibkqc9yTKrLg8hh3fgQitWox4ReIybgFA+1AfR2ZHloC/fl178fJuXXmNEBcQGzu0qLdcU6UWD5L2qJ1vw+m/pwzS6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719803133; c=relaxed/simple;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pc0HDiKbsElJQljmAcafodDXYHhtpV4+eJOdDD8WchTcc9wdw50DAE8QvdN+IW4D2VJoRWrBq9tuOOuIujfazExsjfsMmdD3UhMnBuBKa0TBZIls64EOv4jLj7TSDmYYK81HO1NlpYegQeHGpaHr5D7u1IdjgjDTFJ7f4HqOeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxZZgGMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F566C4AF0A;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719803133;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QxZZgGMJVW0c56nvbC30fot7AmOtJIwvKu9YxXJc9EkkEKncOzCwzzrCXBSk92fJC
	 7waCbq1L0C5IapdKJzdsW1DcYqw0Aukq9ai3bPMV7Gg+/K4pHYwP2JarNDWmakYfzg
	 D5oDqtc1x18f6A/pUdFuDcdLdvQ2kctBl0ItsLzdQXerbWIxvIOL/ivDsRWYopxuLu
	 eO6rMG+SAbUlBYL1+fe2QXGtbJBUzGAoQppY4+8PDRi8GQzFbzxooadjUKMcIpiVZi
	 4l/QFYdPulNmp8ZxC/IJ5x2fXDrnz9TtJqlAUx12A4QIlr9N/j7qgOA2f8ftPWuFb4
	 JvNh/hEk4LzKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10872C3065A;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Mon, 01 Jul 2024 11:05:17 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add ASUS Vivobook S 15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-asus-vivobook-s15-v4-1-ce7933b4d4e5@gmail.com>
References: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
In-Reply-To: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719803130; l=679;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=RGZfgpJlhdnNIXBEd0+u/3mv88NUycmZX6UUfdhL1s8=;
 b=cSf3wqGHA7dk0H/G7iAe/Tf/Sq4GphnX3wbheOrohjgkdlscV9t9+CsaRkWNi2n11XmxCs0Q9
 LlI6HQ5EaIKBoYrm81xSzaZDixykSyXc68+xDLG++lJS48ArU8hxDe+
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
Reply-To: wuxilin123@gmail.com

From: Xilin Wu <wuxilin123@gmail.com>

Add the compatible for this device.

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ec1c10a12470..8342e3f2523f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,7 @@ properties:
 
       - items:
           - enum:
+              - asus,vivobook-s15
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100

-- 
2.45.2



