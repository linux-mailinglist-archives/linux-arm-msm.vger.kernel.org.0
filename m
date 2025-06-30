Return-Path: <linux-arm-msm+bounces-63117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1AAEE72F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 21:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3B73BA400
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 19:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693072E7187;
	Mon, 30 Jun 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2KvDysw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6C28A73C;
	Mon, 30 Jun 2025 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310403; cv=none; b=brqeHnaA1WmtsgU3AxF6ku4FoQvdHC+M1ydWot04GolJ8HovPTzId88zplp4Om5kKW1ugV42hirfUdrlK/aUQprSz0fLodgAt+4SrAIEXjyVu3sRIKm0wcFiyTt2gbeafl3tm0jz1NGxMtKVtf+UmSumKRGKJU8VqWDx9gpIIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310403; c=relaxed/simple;
	bh=7J6wVBbwJYCDrqwFDOobTUHM1JmxFG+rhiy57fv8764=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHRhiloLEkTxmHvyn0u/bPQDEzkz0puyNpe0amxjU8PV5K98Xkbj2fzIeS5ud0QVKfAHWdVJ42AEHl+V1iWuCsiGIdl2L4CdTJy6blEuodX6WQKxyFwSE7CB86Lp36XdpUmX9p2gqQe6ybRC5Pdi0o053NAy3hRg54FnVTv/odY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2KvDysw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8DA6C4CEEF;
	Mon, 30 Jun 2025 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310402;
	bh=7J6wVBbwJYCDrqwFDOobTUHM1JmxFG+rhiy57fv8764=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V2KvDyswDsMCj6Uv1rFD9rmMJF9eijinIVvcsnF7cFQv8yFFDBihOO/I/rHmpHmyM
	 c/IZaLAcnoNt6u5fpU4XcrQStL3Nss5LWoRYcjjSNhv8z5YZtP+4baeUEbPXb7FI5g
	 ZyI6+MjK6Z5HhlANIhcwX8cqZTM65+QqUFhmY2BFakH3HqFWGCUjA+E4ammqfxTwwv
	 6ZSTkppfQ4unFecU9OentyIpoXy2m5OgruIGtZjWmr6zF5aX53ZqXQ2sCn25ew25Ur
	 auJm2o2M8TQM//0Bg1+1qfvsDGoDJxrvVE/8GeUp5xpN5JIMSxJr3wahKUNpSq6vrA
	 Un73B+IPsXv/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B20C83033;
	Mon, 30 Jun 2025 19:06:42 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 30 Jun 2025 21:06:39 +0200
Subject: [PATCH v8 1/4] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-tb16-dt-v8-1-cf42a396e736@oldschoolsolutions.biz>
References: <20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz>
In-Reply-To: <20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310400; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=pTpFlr2JNOBM1+TcC8lKJt5CSizsc8tw4WUtA7IPpGs=;
 b=OUEDZiZBFZC1HZSi8siB5cra5E8pkekIVs90R/mWkQV2EzlW2nUfoU3FSw5qVLJDVN5wglBJ1
 CW0BWfu8e+nDZnA1tVewZUu12sg0YxrxRAdKBYoSykkNHj/cPwkWmjD
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
index ae43b35565808ed27cd8354b9a342545c4a98ed6..98f8ae80feccf23b79ba7e7b04d4f6a291e37a44 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1159,6 +1159,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



