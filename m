Return-Path: <linux-arm-msm+bounces-68237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97035B1FB6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 19:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F19F73B35BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 17:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4224D2741D1;
	Sun, 10 Aug 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hc8pJDMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D4270EC3;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847492; cv=none; b=haxPIiCaGAxZpsBEJMsUw/n4QrI95gkDEo9/YGJymhR0DG7/RM+xVvSsiSWR3yNfh/CETRW+Ind2fF+dS7xSrvn3moDgictBlDe61adPgI51T6abiGu3ytvY1Tl/2Jm+VM3K4JONwn5nmLUu9veGX6LpAePj6zyU2lp1M1OpFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847492; c=relaxed/simple;
	bh=sYsTv8ItQfzr2zXGgGZ5IJ5IQootCZp0cn8SJezpjsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2R5pv4GmcBsIu3tv732DPfiUdqzXGtjX1mg1PncCnyDeRalzaMpM3NLggjmbCzbB29aACkYg1VCR6+K+31dhj0mnXNCtTtEEyw9dkTlBZGHkJ8FkTbSscCx+HQRx75r4Xh9Yoj4OPL9jVJNA5UpLfoCHfL76Qj0MdyvfsI6AwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hc8pJDMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F1B6C4CEF0;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754847491;
	bh=sYsTv8ItQfzr2zXGgGZ5IJ5IQootCZp0cn8SJezpjsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hc8pJDMNYVYW2xulW+GHEmdNxEvMRX4NM0ebHHA8q0a7T2ip5sv9U85hU3sCuJyyI
	 NOoX1moGYOSwMzJWSOD0Pl9TgnLV+lYwKwE4WWqP+BBHhtlOYX0UTB7yJi2yqPNS5X
	 Wra4J5qeIVfFaoQkxNvqP/dA1Zsd7QF+R/Y4eRNqWk+RiWEN/5sNAOMK4z2ouXxIMz
	 gNTUzAveJUxTbAHCrMAIUJ66G9Qu0w/VMXAtgOric/jDsd5ulvQ57XTZhBe5we5gA4
	 DX4o5ZZCNCUbri/3RhI2X+xMDv8gvPdxGxxN4KFesSHdCmR/bFV0RmfiBDQ+vpWCsa
	 zGmYF/NFSicVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80019C87FCF;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 10 Aug 2025 19:37:42 +0200
Subject: [PATCH v10 1/3] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-tb16-dt-v10-1-0bfed6d75c69@oldschoolsolutions.biz>
References: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
In-Reply-To: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754847490; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=vI3yrrFJdwP0Pb8xCkFG/zKyW2qMJHRig37q9YPCpNw=;
 b=TY9LW1w2pBjr25Vl14mfztww5qjDugaVv5MD2629SpIHV7bPvrtSrEf8q/HCiyjZkS8E/FzcH
 G0//12Ad7eJBPxZEdkb6vGU+K/LJySOuMTjinF4/So28wFm1Ax/guFs
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
index 47a7b1cb3cac1150bcde8c2e2e23f2db256ab082..4b32dfecdb1a34d985903cf25bf51f66b55677eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



