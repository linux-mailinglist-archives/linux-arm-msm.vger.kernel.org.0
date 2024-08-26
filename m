Return-Path: <linux-arm-msm+bounces-29497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D186195F3FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F75CB22252
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591A518D658;
	Mon, 26 Aug 2024 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaOvVh7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E3149E1A;
	Mon, 26 Aug 2024 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683090; cv=none; b=VXLrptmkLu7c0ho0jN6WA0K697h69ypYgFdFneJSO3orEr6r4ST+PA7pTNnmf0xHVOw/aK1xMmXRjRIx6AWW/MkcIm69QYWjKYwij5YC07zVtvdscIV1A64sIfkxuh7telcLuZUYTuxRHSwhl4IGiK9mNXwcA5aQlevsu5aX2l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683090; c=relaxed/simple;
	bh=t8M6b0z/Fk1vZ3IRTbABLfRpVuDns73VjaslYbxx0gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nu2ForRX+1M4g7VZ2iB0zT0gVlfeRqPdOw2xVLRcSUNoxe/c1waHAUZr+W3SGFyHEPnUgYOnNj3DVEjREO/b+qqdKYoTftY7d6eM9lx4bqk7UE6LjmdVmb5PpNPnlJaaHS5hAxSGbZ3h1nsY4Dfxsp9zvAVnQU09JEZ12bc3ru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaOvVh7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCBFC4FEF6;
	Mon, 26 Aug 2024 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683089;
	bh=t8M6b0z/Fk1vZ3IRTbABLfRpVuDns73VjaslYbxx0gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WaOvVh7wWgNORFiynXYwE9Ubp13/qTREmE38cheNZ6Jg7y+A3YC1tu8aqod2gVl/l
	 imgkPCgVGT7J1Z+EM9kSjyKEuwRaA6By29fesMYceqiA1MXqCfuJjrW2VWxoaA2iRW
	 fID9RBOY8QfXtu+nAEfL0ZhubvfEWZ339/bkYR32q4vBoteOuv+3UtoGE9KHzA/I0f
	 9KBB18VesqMHsgXo+WBZvHHnG9ZCnRcra8xntnIpOQz1mCFl708LFxL9TFPbuab8yA
	 M2N6Yp9xX/ELwX+Fb42phWoNno2WVy+IT2BtbBj3OSGAj435EP1GBJbIe343QIHVLK
	 B0FEBiEfzwEAw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 26 Aug 2024 16:37:50 +0200
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Add Surface Laptop 7
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-topic-sl7-v2-1-c32ebae78789@quicinc.com>
References: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
In-Reply-To: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724683080; l=794;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=VHqsv0DC+5Hjp8WeEOdT9U4KazigkcrrNPyMsieUuog=;
 b=lq0WHFW//StOMDPKpBHGxL/7slztDv/nOUmr2LG/KzUmBIeB3jt/0X13oyGnIwKXob9L1g5sT
 PW+z8VnDGW/DcHc8fP/GcWK4QKKLJfdRRfsuYKO0DrAXQpSCe1gBJ2Y
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Document the X1E80100-based Microsoft laptops.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c0529486810f..2cee7d96ce6d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1053,6 +1053,8 @@ properties:
           - enum:
               - asus,vivobook-s15
               - lenovo,yoga-slim7x
+              - microsoft,romulus13
+              - microsoft,romulus15
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100

-- 
2.46.0


