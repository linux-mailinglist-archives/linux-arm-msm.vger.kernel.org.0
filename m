Return-Path: <linux-arm-msm+bounces-28206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8894C81C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 03:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C7C4286DA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 01:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D018D12E4D;
	Fri,  9 Aug 2024 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrJx6ngz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A078912B93;
	Fri,  9 Aug 2024 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167810; cv=none; b=lm+rGPc8n70OXqTF7ptpEAQb0gaD9sv8MZebU9lIhsaW8ga66TOOeZ2FDyXthBTE81sc/PQlIa3R3ou8iIlHFhHJOnuuL10+h15hCm+LsCxxWv2oS7almstE9xTP/2L+8YiH3JnrghyLL1x2VUUNkgpv3ew9Mq2ck4RNjVQEwTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167810; c=relaxed/simple;
	bh=i8BnAxS3pQ0fMVFdTPUTJXERiH77Ud37g92FGli8Q3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2DRj23P6m6vmf/2VOPhhjNtZcaL6ijo0CfZyOFq+7ksDVHej57D7Yyoz1U94YQ5xxMWv1RrQSzd1NOh3LHG8FglEnHKcbZ4RpFV3fzOMlytX+1TEJm6+2UUf582BYngLlfGyLKQiXCDlCQEUyKN4rHaIOc4d8P0ZSVQOGJ0Zxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrJx6ngz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F32C4AF10;
	Fri,  9 Aug 2024 01:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167810;
	bh=i8BnAxS3pQ0fMVFdTPUTJXERiH77Ud37g92FGli8Q3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BrJx6ngzvwktwBtWXBMvEh0fjtO59yUA4MPvgXy6BrKBOLdtVlijjo1uZ+AR5A5/K
	 X+8HfKhtOQai2cjKYZhAMSlgER7zoLHUa2ueZK2IlUIOKINJOlnw95n9tJEFBQ9IrN
	 omDjJQikRYTrFs+XQkcATTCTtHR2vKZjrBrf033xOoQsOKKO+FhKJjhhjby3a4aryC
	 r5Z9cc5TGRrBrGr0Gog3aUK7vqpreArjDBTSrme8hKSxrgIe7t7mtt+wyge+5X4Jws
	 QOJyHcAw4loUBFyeqNuMXH4ws8yClccKSGMqHBKjGpOvJY6ExloxDv3pA/xTLS4bK4
	 qzAx8rP+oiD7g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 09 Aug 2024 03:43:20 +0200
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Surface Laptop 7 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-topic-sl7-v1-1-2090433d8dfc@quicinc.com>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
In-Reply-To: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723167803; l=794;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=CPMYGWB/wDNJqB3HpCfKsmZzStbjWzZiRcnOXR3D8w0=;
 b=rdHjYBEtl3iuNubnR777EQVX1Z60IMGySYAT6bTvm116F/jPfsAO8i/CaSXb6cLAOqhCb+88w
 UXWfzakRMPcAc2Gv5F4Cowhxe+QJNn21L5pFhdfhZjHnETodiYqJjp2
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Document the X1E80100-based Microsoft laptops.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4ef456cefd6c..686f44d82cf5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1052,6 +1052,8 @@ properties:
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


