Return-Path: <linux-arm-msm+bounces-50896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40568A5B3E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 01:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A383AF592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 00:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DE72940F;
	Tue, 11 Mar 2025 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DtcKUZxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92C5234;
	Tue, 11 Mar 2025 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653279; cv=none; b=HWYNYZZGke7/EScvqHIGEYtBJ40PMAoQ3oB6hgr9q1mCDfnDqeSdMJxMH7KBy6s/9qlCQw99BNgd2c1meNhTKyHWmJu7LWUuQ5IP92tAbVvA1SY6EpaLVPw3C2P2Ks/N23nahHuefADalmDih2CcOC9XlTmrSgN3Vm68qQ+B8F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653279; c=relaxed/simple;
	bh=SAgG8ZzwhLcQgfG0A3CGBxDdkGnNITSL2asZZjT3WSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1vaoHb7tZRVpVWtOeLWeTNbuzSQmxi1jn9ERxe817aqMAATuvp5rG+Ahm/06YL6QWT0WzWQtjMGrqnWrVS3Wl6usw5sQaCXhGfRDuUfTYrNqKUlXlpZHl1j4Mh4PwHiU7W+GIG6MOZWJ4kx9j7HZNV/f7Bs2+/9en15Sh8dk+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DtcKUZxp; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5DE0525CB7;
	Tue, 11 Mar 2025 01:34:36 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJWmj9815iIe; Tue, 11 Mar 2025 01:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741653275; bh=SAgG8ZzwhLcQgfG0A3CGBxDdkGnNITSL2asZZjT3WSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DtcKUZxp9v6CRfezDVoYvPlMaVzKuW9VscCWKp1LlD8NWguM9eFxDTuh9Rn6RV03k
	 R7wh+KTC1Z98fstyfdJafoAqUYoMPmhJcyhtaDIQje3etsFVcmik5Q25PSJ+KmirGT
	 r6kePnvZ9HTy3/UUrNf3fIldxJDWV4NAAv9GH0xeNt/FzPpV5SkHa9GwrRa8Amjs9S
	 ETKZbC6ObnE9oDfTY4eCHlEycxFnQfTyh07acfpQwHR9xhwNbyoSrx+eh64C79mKR+
	 AmKvlD15+T05hFauwUpxYiBaiA3rpkPFmgOBJfGD6DN42tXTaQBL5/MunyqEdhYzCd
	 IlfxNKMZCd7GQ==
From: Gabriel Gonzales <semfault@disroot.org>
To: 
Cc: Gabriel Gonzales <semfault@disroot.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
Date: Tue, 11 Mar 2025 08:33:47 +0800
Message-ID: <20250311003353.8250-2-semfault@disroot.org>
In-Reply-To: <20250311003353.8250-1-semfault@disroot.org>
References: <20250308013019.10321-1-semfault@disroot.org>
 <20250311003353.8250-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Xiaomi Redmi Note 8 (codenamed ginkgo),
which is based off the SM6125 SoC.

Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693..52f7b217b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1020,6 +1020,7 @@ properties:
       - items:
           - enum:
               - sony,pdx201
+              - xiaomi,ginkgo
               - xiaomi,laurel-sprout
           - const: qcom,sm6125
 
-- 
2.48.1


