Return-Path: <linux-arm-msm+bounces-87296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F708CEFD24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 10:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5808C3030FDE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 09:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECDA2F5A13;
	Sat,  3 Jan 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdJnBod8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C22F3C13;
	Sat,  3 Jan 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430838; cv=none; b=m7h54FSxrzYQ2FsPHlAVJJP+Z1psEs3ahH6tVJ1Zffj2hVdmWRlinZqLmycdFw5/wBssSRCj88muKC8UIuDiDyl+C/SlgXSlnHiLTraOr5pkCuxa6RsLvu/oJPxBq6xiJWFN4VVS/YNZktzcoY4T5NQwDYIdRuC5DxMsmWRgG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430838; c=relaxed/simple;
	bh=99Fsalw9BmQO+GBSjOMzcLbfjVN1G8AjlkhqsPziQEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoa6uNDrMVN/0SzNRL4pPY1klrlUq1QzSkqqKVUDNFH4CMua5fBsK9+0v3M+6kXFIcAVpxX4s9lxzC3IvbrrzELUZ6XNhbcy6hLcz+rTPV+gxLTWWSoMOr0N0Scsgw35A0tOHgdd8WuGOC9lAcZ8KAODu3cNTh4NzSn3dVSmn4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdJnBod8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD88BC19422;
	Sat,  3 Jan 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767430837;
	bh=99Fsalw9BmQO+GBSjOMzcLbfjVN1G8AjlkhqsPziQEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GdJnBod89ypQWFKU3wMa2TuFk+HV2MKM8q1PyNpAfxN1FWt3gtcW45QTaIeb3rSxb
	 55lVKJN7RYs8zmXrRoUg6hKyfSBarCp308LXHrIxr0hD+fyybioVtUTHmtz912jwtX
	 K/d4WcKnFzkVmLntIRVSEfZt3Mn4xgKSC1cytJdNXaI1CIW/D+5nuC5RYOEifeSx0P
	 V3adYvnnE3BEGPoi4U56JV8up5oCfB1oeEp7lenDJJdREJ7e30lOajAufmeMIlOiMh
	 URXaQ/2FHK3ZZCJPR4wvUQtL7zA8da0VObE68KhWfqW+9pzbS6Th/vo5AG1JCCz9lX
	 NHDAEpEpXTK2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C855BFC6179;
	Sat,  3 Jan 2026 09:00:37 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 03 Jan 2026 10:00:23 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16:
 force usb2-only mode on usb_1_ss2_dwc3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-tb16-hdmi-v2-1-92b0930fa82e@oldschoolsolutions.biz>
References: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
In-Reply-To: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767430836; l=1047;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=qvHXN7aWllqPZdMuwrvQeLOkad2q5h6xoZcuTsDoVV8=;
 b=Uwbh4jqxo6srQ5LHmEn3AppEaRJ8Hc/zFhCDp4jEAc0mUm5uojBlT1bMAHcjt+ydi6ZXpnVK5
 QZDmr1QzN5nAiCp3jo011vhHK2k4uJ+JRK8d3v0qkmw/vVvrpojVC3Z
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The usb_1_ss2 complex has 2 phys, usb_1_ss2_hsphy and usb_1_ss2_qmpphy. On this
laptop, they are used for different peripherals: The hsphy for the fingerprint
reader, the qmpphy to drive a hdmi bridge. The normal logical wiring for the dwc3
controller is to both phys. Delete the port@1 to the qmpphy.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 3186e79e862de67cbda48a4b85a459e6e965ba65..b4a40904f0a01b36ff2fc72e801a5fe7d6971e2a 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1560,6 +1560,8 @@ &usb_1_ss2_dwc3 {
 	maximum-speed = "high-speed";
 	phys = <&usb_1_ss2_hsphy>;
 	phy-names = "usb2-phy";
+
+	/delete-property/ port@1;
 };
 
 &usb_1_ss2_hsphy {

-- 
2.51.0



