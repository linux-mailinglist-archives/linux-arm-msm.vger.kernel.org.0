Return-Path: <linux-arm-msm+bounces-68781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F0B227E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091D63B3B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0638227A918;
	Tue, 12 Aug 2025 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw6tb3jB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AAF279782;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003792; cv=none; b=UK0vZE9++A0FFcD4ZuSI4ZOsVcjiyWWUrK9I8X5MSKw8Iv4SAUZWRB8gGVZmDIC+wk86vRV4u8Irn9FPMjvYAkBP7J2RLpGIQBs8Nntcdww0A/WXRiBoJ5lYWKS7ew5VVn9uPeeeRJxxYbmVJkgyuW0hiiWJln2ie+bGjN7oATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003792; c=relaxed/simple;
	bh=sYsTv8ItQfzr2zXGgGZ5IJ5IQootCZp0cn8SJezpjsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFXK+8de21fzGfMZzLzrwNKghsoU8jfBo09IW+vU6H472mNClEteav4+80UDDNHVDGYNIudjF35SEyEjqO5S3p2skmp80tyqP5dCPQAojJLmdGRUBzdPeacQrG8n80q/D6timIpvRsxVNbr4FobgnfRveoV3K/zDsXUoUAsCtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw6tb3jB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B08FC4CEF6;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003792;
	bh=sYsTv8ItQfzr2zXGgGZ5IJ5IQootCZp0cn8SJezpjsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dw6tb3jB3ziYlfchXEJnw7trKxP0EsRr6Dk6zf90x/kkOAj7qF9oN9bys26oK3qHR
	 68wS2Ir+NPJXAqkMks+qUSQKFV5/3rmYthq9h2bI1e9LCJBtNdXpBxNxq8vDymWQ2a
	 9Q3hpQ5iejrYon1tXvqk5FgPrKQLU4GGSLZX/6GNbfVIq7YMg2Fi8khB62syEu2KHz
	 XqcsDJwNgkzqyVQ6p9Iw9JmdOIsybq5yYftDGlSgsIibcC5AmC3NajU8/IjmZn5itz
	 9e+FbFJzwH2m8Mvud5mndy7Sfj9pMyiYy+qprGChLHo9mzdcV7X5HmzPgirNbSsCgh
	 n4qgR/TtvgC6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D18FCA0EC4;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 12 Aug 2025 15:02:48 +0200
Subject: [PATCH v11 1/3] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-tb16-dt-v11-1-4923d2cd7121@oldschoolsolutions.biz>
References: <20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz>
In-Reply-To: <20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755003790; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=vI3yrrFJdwP0Pb8xCkFG/zKyW2qMJHRig37q9YPCpNw=;
 b=tVuX7joMSBa43IULyQUd3K/lmVIWyH3lx/O/xIMr3OD/5onF+82SbT9/kO2ziykDugKUCp0/R
 JAN+s99Zq1JB5xaUxuJRf4/gY9AzEOV/ENt8nfpaPBYmwcdDldVuHxQ
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



