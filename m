Return-Path: <linux-arm-msm+bounces-43043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDEE9FA09D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CCDD165889
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54A21F8670;
	Sat, 21 Dec 2024 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HS095cWg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D691F2361;
	Sat, 21 Dec 2024 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734784588; cv=none; b=pRetyWJD7PSBWwYa1srf9c1FHSR0futuK6gorEiVF4FBzN9gEaVzlWq245EWPdCvyT8Aewkz0EmbZp3TCW9rtQak8Vw+3618LDiITDih3feHifOEKmU6sVcE960NsnDcPLLq1K29b++BbVGONSK3balWZ87aYh+G6iItzqWvRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734784588; c=relaxed/simple;
	bh=x8mYlaRMPWD7w71GqCqxB9d910f0UK4kq1aJVhc2Tss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyN2EiX/WzDUQnyeGM+t8+4aQfNtCyYIMW8LHEjMglqG9Avcn8viUw4Wj+f7F8/CWQpJhH6nMKUF05QJmUNE7bd+Qg12R37GEVg88sC48wKpYrN1JNtE2LfWJnO+wWcl6m+N5wWwNTbtkWgcFhNk5rqXgxtC6iyNHmUhKJCwlYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HS095cWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567DDC4CED4;
	Sat, 21 Dec 2024 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734784588;
	bh=x8mYlaRMPWD7w71GqCqxB9d910f0UK4kq1aJVhc2Tss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HS095cWgrXYveNAE2kbv+TkmFWVVxh85SF41EuoHxsXnfyUPJh40lQF+5KTaWzpvZ
	 MrQo0xqK7LQ9C/oA1+S/idqOpqRjp+oOQ6p4eZtZq5IuqzBQxHKLNsfK8S4KCU7BaQ
	 ludxVKkYZYbuPhB52ENf8iXxdjywRmSYPO2dqK+OaJxR4dSxZJT7TdCpuuy2PuZUMv
	 KTRWVTKxHbUqD12cGQMePBe+U9TdmwxVEIJgZgFiaLFRYTSML+TGznj1FUin6JA5uE
	 QwrfvBKphsN/H3fMvChb64pEYZ9KUboyBgbdlwB9SO/PJkj7pwvIFbbIYfPMjsh6UL
	 TPSRVvzBfafrw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 21 Dec 2024 13:36:01 +0100
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add X1P42100 SoC & CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241221-topic-x1p4_soc-v1-2-55347831d73c@oss.qualcomm.com>
References: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
In-Reply-To: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734784578; l=1411;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yI3uBSNn+hCRDD2iNYMFtSuFKrWkdKekAfob4MQhBgI=;
 b=uFPgUHL3SGX4LhJJj+2xnbUu2b7XE7dbHdrBlZhVQB0/PZwh7PLS0OZcn0VhJ6gauUqZQ71AF
 sh9Lxf7/5ZBAEtO/sVh8dgfGrxeTauPUe7kJpqTtC/Ufun8c8AbNMzt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The X1 family is split into two parts: the 10- and 12-core parts are
variants of the same silicon with different fusing, whereas the 8-core
ones are a separate design. Thankfully, the software interface is only
barely different, letting us reuse much of the existing X1 work.

Add X1P42100 SoC (and the CRD based on it) as a representative of the
8-core series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d394dffe3fba5a396b85a6093f34e9ef62b6f9cc..c5b7268cd9407c1e8a33b291d541d33c1e5cb6eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ description: |
         sm8650
         x1e78100
         x1e80100
+        x1p42100
 
   There are many devices in the list below that run the standard ChromeOS
   bootloader setup and use the open source depthcharge bootloader to boot the
@@ -1122,6 +1123,11 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,x1p42100-crd
+          - const: qcom,x1p42100
+
   # Board compatibles go above
 
   qcom,msm-id:

-- 
2.47.1


