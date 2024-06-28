Return-Path: <linux-arm-msm+bounces-24626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD891BDCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 13:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC9A81C20A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6C3158218;
	Fri, 28 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCpijD6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92F157486;
	Fri, 28 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575384; cv=none; b=uyE3JGHwqq8tl3ZeO4xlppyjqCo2LKGosggkeo9DKKMa0x/CNUkyigq6bwTRRnw7NEmdRfu0cEsafOWWbL/NdxATFFIgiWq6b/lGrMtGoBlLHFkjEQGYAcLe943SAuPohQKrzwadM2dF2+QMmA8ATrTxFRFciTqK5kljma62j6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575384; c=relaxed/simple;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLyYSRz6FqpwJfenKDeAAyNgHTFjtD5vQD4Y7zpDhm+ouNr9hD7FJfdSxuAJiG1pxG/P4I3bosdb9PZeXALPO0FKPvhTKIjt4MULKgsbReHUawsnPLL6MghWltNx0TaM5z204ny6bt4dpJ2cYgxiow+loLLS/0Mh6OAWHx+tVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCpijD6R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2F33C32781;
	Fri, 28 Jun 2024 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719575384;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HCpijD6RP+F5P2Iux8vMN57NmOvbJTySyXlxCVRBqziwNQs/sZ6el8B6A3kSGfslM
	 OiBQ4SPiVLJgprWafE6xsi8v7qsQG+W9ldW8oLAtC8KTA9J6DEAizKGPOHyva4wXu4
	 xNORPF2ddxd9/L9UWQJ/uVdpwl+OsgHIDZPPMA2EMCnjxGXgUL8iIl1DfNeGn40bh2
	 LlmAjGMTuEJN3jZbsPrKTtShH0rvRhAjrOxF5SlBZkuRpxr1uCRgn3ppHWjZ9QgMhT
	 BqkeZ4ooYcLemZz/GVKcfyFD9fSoaRtwoxSA4FZLWXEcD9kZ4z8768NCCZZmAQ0Wn8
	 bqg+HVvUYvp2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7123C30658;
	Fri, 28 Jun 2024 11:49:43 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Fri, 28 Jun 2024 19:49:34 +0800
Subject: [PATCH RESEND 1/2] dt-bindings: arm: qcom: Add ASUS Vivobook S 15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-asus-vivobook-s15-v1-1-92cb39f3f166@gmail.com>
References: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
In-Reply-To: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719575382; l=679;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=RGZfgpJlhdnNIXBEd0+u/3mv88NUycmZX6UUfdhL1s8=;
 b=0w+KavxUMozNwwd9eGJzXKFWNWQ2uWaBwClcU1zfBUCpypEYm2cqr4utHJx8kXXYEIWdaQBAJ
 H8b7NnMvvWvBeSUqLaB3kZrgtKFr3cEmFuceeEkrKjHlbDH4KLperVe
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



