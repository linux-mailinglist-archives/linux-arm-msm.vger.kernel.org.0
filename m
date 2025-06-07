Return-Path: <linux-arm-msm+bounces-60518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73306AD0EE0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 364B816B60F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 18:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C601FF1B5;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6tcai8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB51367;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749321734; cv=none; b=ng277hq+2jxfy9jESs9HcIncvCYNhZnmRuzx0VQ08+NUEaYivbdtIgRcYIQAqtGdE0Ii66AuL7B0993TKUqc6EmC1kZOZbRC6Gxg6R37vrClz0PeguWftE7m39r4ySmolQEAZQeyvioVh/t1lXcHoyt0zOrFPzM2ZAo2NHr8VlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749321734; c=relaxed/simple;
	bh=IboFBVpYRKzDKkQX/pnk4Sd42YAjQ3wt5KqonA5Th0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQPZLUVEauHtznbwSrVwLuHvTPPKwEHgvRgyNgaEn5jNV7+CgjhAbEKil6RLmZdOdmzbJRL5L4tbajH36a/OXabYe8lErcmkxgglxzGlVrPFfgm+4jFtSGCuoNUaCAIfD2CqEZc/k2BQrGyvvUJxFpAsn+4SQLYEuyUTjf/eINA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6tcai8n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31F67C4CEF1;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749321734;
	bh=IboFBVpYRKzDKkQX/pnk4Sd42YAjQ3wt5KqonA5Th0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P6tcai8nngZqa8HHbHRyg1SJURUcXoLXU7NeRBVCVTDrEEpoI3OU8xjLebzVqn72e
	 tuAyAre4cchsroBOsYF8ifLfpuZJ0M5u2nP2TkU7IeVMKJjHEvKWxzasqeB+Gef6qq
	 szJLqsWAAPJ9S01H5x0MJQySEjtQb4e7rinRPVtPvZ5XCuq//YZLPAAzV4AG554VLI
	 KMzig8mpiwKAedx3OK6P7GjmcBydHHL9b/GzRTm79DBGBBB68G2kyT+EcNMsx4lY9V
	 gdwwpSa33yNGlQfozov6MfAsKz+GavEKObA/QHMJcOOGwXFvQYt+s67zxAW9HliI/s
	 nczRurVYH+hhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2378AC5B543;
	Sat,  7 Jun 2025 18:42:14 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 07 Jun 2025 20:41:59 +0200
Subject: [PATCH v5 1/4] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-tb16-dt-v5-1-ae493364f525@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz>
In-Reply-To: <20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749321732; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=VKlEav++gGoAnz7EjFckGLGHa5HU8TeXviODgz9PWIM=;
 b=+FnzeL4mMQ2LdX6izQ3iQt3bUYUaBWd9LY80utUxGQf7xb+4WbqEjEjPqAfKC8i1YlD+AHhdp
 l9EbG/FRL2HD1zSGoUwFm5kVfzxZqjtJiOwPkTXrrBXw8vlsi0g6ABv
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



