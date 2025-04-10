Return-Path: <linux-arm-msm+bounces-53794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B96A83E14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E48CC7A457A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68B720F088;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwVQtz2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CB220E030;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276410; cv=none; b=geLDDfAVtI38jS2dnoiKDBtlCvz9LAonPhnN7n9F/LSQ5xy4uDEN0uXLSWHkLf62Vuu1bfBVvQVlSm7sM/udx+hK0HAnzJXOhByhcQ7NISCr1J2EQUeqc3xVrK8wgAstOAEY+DcbWkYr8ap2Y99AjXYlOeKm88463xbwsBYsixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276410; c=relaxed/simple;
	bh=gOous5YkM9MLgavnUT+mJixUtzV8Aox9a8MbOzaNjCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8ekCrOauslKDQ1wWWh26aYZCfaWHGfBKaza4THLHWSzOCcotiOFkbAUhuwNHkxdOs/Yp6g1kyM1M6zuyjdRf+Bi2Z94MXMLdhBaBg5doxyHK71zLuZf4vgc4ORhVaxqKb4vQMfvmp5i8g9ZenzFhxXPBPIBNW8ZkFi0OBVR7uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwVQtz2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 169CDC4CEEC;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276410;
	bh=gOous5YkM9MLgavnUT+mJixUtzV8Aox9a8MbOzaNjCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fwVQtz2umHuQU/+FG7g9CAPp3BEaVNphLOtCaxXK8PFYnT5hHGVq3R/Q8DGZ7UyiI
	 w8LTyANEpePf4DxAPVWR4oWGQIB3w9L5pEeDWYNPjrEzMIAhGhNaqtq+gjc2kF9nOl
	 z7+dhYaToUEYc2GWG8RSsOFLDvy5NZBOYTOmcxVKJtBunVEcdQhFaPMSJ7AcJNRA8X
	 T7XGtenI98C1LeFGkZjTI4/mfsfKTl+DaSff3K2OJC9xtjZ9iMXyulpZ9sNv8K97hF
	 KmXqaYuvv36a8elb9o/D8s3VDtiBdjGaCru4SkHKcMGHg/zyQzsuHCRZkkpQ7zlNJ+
	 Zv8AkS0pWdu9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6E3C369A6;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 11:13:26 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: x1e80100-hp-x14: explicitly enable
 smb2360 eUSB2 repeaters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v1-5-b4e5ca253ec9@oldschoolsolutions.biz>
References: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744276408; l=1115;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=TIwCHukIRJYo2xuPlQJ/tZhR+AjnxQb+ZE4KDUe3o4g=;
 b=IVBI0MP84S4Whm+OungZEcqVU6tyqIQy4d1m5lXVjgg3xL1A0KePVuJLrqrAQLiOSe0ONhZmR
 nnog3JsiX6lB4stpKGVEEgc8hqqsBxMUDarvWzHctOJYMSjp0zDvXpC
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The smb2360 eUSB2 repeaters that are in use need to be explicitly enabled
after a change in x1e80100-pmics.dtsi.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index b492901f2d8c610e955c95aea60eb6c3d80d4f65..df24c5e7d3f8d7cfe44bb165a058fb0cfe6f1d74 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1244,17 +1244,29 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
+};
 
+&smb2360_1 {
+	status = "okay";
+};
+
+&smb2360_0 {
 	status = "okay";
 };
 
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
+};
 
+&smb2360_1 {
 	status = "okay";
 };
 

-- 
2.48.1



