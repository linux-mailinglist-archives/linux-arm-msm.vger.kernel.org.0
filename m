Return-Path: <linux-arm-msm+bounces-24622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BAE91BD6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 13:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D522849A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3992156C52;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiKMjp/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7803015697A;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574223; cv=none; b=pdVgAabkfK0I/TeBwa9VUk4+9OkheaOvNIZ6xEbT3YI7n6iPLkGu7S7/cuD9Z/YD8CYeG/fpHegv87msGzw2I7NTtGkxpmGYZ2lMGqMM528mpv532C/+9uwvHl0pVL90haZ0BTucKdhEo3h/r39uWl/JMBlks95oHGi0NqBtJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574223; c=relaxed/simple;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrDz276KG5qMLaKXaVFdYh4V3nvGI2lXLJcLoLSLJk9QijchKlaimI2+FP85tnLfYfHh/5B08IinTwiuCw7zWFJKGuZi5kwV5J01WvF/bbI4Ru2iZihFoiOT+VUe7G8DOypMzzUOUXTSf8QZ/PRkr19qeMzZbzOqPsFPXG0wcwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiKMjp/b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27203C32781;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719574223;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jiKMjp/b5Hvs56aKoE6St4EqEclF60CwAEmFB9VUPQQ74BZX3GMS68OMDIt98sbK3
	 SgH6mLhTaDrQfgl9e9YkB3rzhXm16eBREEX1fTXJaRyBEH+LZRh/qvASe8J4gFX/DK
	 S/oVtThRPIZZiLxGCaa9Qv995WkCTXcV5iZp16ZlqptnbN1GTsMZ6wjQCaYWIr62Ot
	 ZvPvtHv/zFrnCa0bFrP5aZ39rhP+g4XjM8ftm+r/t+e8ATjLltWVIZ5hbaYRhKePBp
	 s+UdEDERv+Q+haFGV6KkLXgFPmFeV/OyNeTfaU65CgFaV7wpFvtt8s/wsQ1rL6J0Ah
	 E5ff+yandJiww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16223C3064D;
	Fri, 28 Jun 2024 11:30:23 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Fri, 28 Jun 2024 19:30:12 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add ASUS Vivobook S 15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-asus-vivobook-s15-v1-1-2a1e4571b8ab@gmail.com>
References: <20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com>
In-Reply-To: <20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719574221; l=679;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=RGZfgpJlhdnNIXBEd0+u/3mv88NUycmZX6UUfdhL1s8=;
 b=B/encHNUfXVXiq2KLVK0ZyEvVjzQyuEZo1dssfZJrE/tNNBJZOCo/aa7fqf+Ge2odBkSHsTlu
 bvcShr+A8sQDt5vNzdzZmB1zRYv3LqDYe7Xqa9tvsq9fUf9A10A0tlV
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



