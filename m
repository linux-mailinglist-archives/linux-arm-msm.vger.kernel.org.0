Return-Path: <linux-arm-msm+bounces-38079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E69CF4EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 20:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770E61F217D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 19:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284431DD0C7;
	Fri, 15 Nov 2024 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBo4Mi74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09361D460E;
	Fri, 15 Nov 2024 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731699282; cv=none; b=apCQsqTBn2FZ1+X3qs/gyJ06IItiJYPfXogICBUBvaogtQRTtwxPO2F4HNf4Wn1xoXxy0TJU7iQCtZtml10AK2r3bqFQJsVZpk/CqhlPSWHkwkEd+icOjGugBBed/aBBjyw2BHiaeO54RPKcAzj2p/Hnhqy75mPgkpPxODbuOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731699282; c=relaxed/simple;
	bh=uDr9R5z1oVqKmrmb6zNl6rYSFhIlSqch6AMIcIbyUBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUYAR8jMvTJp7y8WQe+ppN6Eue4wq5wgj1ypdsOwJOzAlyytH8KM42+fD8V0ejx9IjUzfGTzZ/3Zjf4tjseTiuKaF8zwgD1ZobxAewreSZgXbMxmrOGvwdynXjYz/e4c8Qj6sg2lZs3ttN0YbV6LYnzjTcALKvEiss+3c6xAAqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBo4Mi74; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74841C4CECF;
	Fri, 15 Nov 2024 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699281;
	bh=uDr9R5z1oVqKmrmb6zNl6rYSFhIlSqch6AMIcIbyUBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GBo4Mi748usO07oqRjVO2b1icnlBY0lidYAgcxkTgeCclZ0F6y/71KSaNJX9P9zC9
	 lhGprp0879Q4M/xUTKIMPOR0iqppM/pBiDMi04s6FC1iEHhAx1g/IY5qk96aFl/zq+
	 oYBM/7uCn1oS6A0dZvmPXuW9wPVRgPurZXJPvDQj4Q7wktOifMMgPDlLuE/+vv5TiB
	 LewZG3nITgBBWcPzMtyjicGVxWFuba3TZKfyVdKSlAfOEqFJ3iLmqNLS1JSj/RuoZY
	 fD/hdlM4rhhiAmQAgH5Hj87uKZL7ceBTdHAaS0ndMDgmvtfQoUNV41CjK3KMFTXYC6
	 PyoJFDUELmzVA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Remove unused and undocumented properties
Date: Fri, 15 Nov 2024 13:34:34 -0600
Message-ID: <20241115193435.3618831-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove properties which are both unused in the kernel and undocumented.
Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts        | 1 -
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 10cd244dea4f..4c983b10dd92 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -387,11 +387,6 @@ sideinteraction: touch@2c {
 
 		interrupts = <&tlmm 96 IRQ_TYPE_EDGE_FALLING>;
 
-		button_num = <8>;
-		touchpad_num = <0>;
-		wheel_num = <0>;
-		slider_num = <0>;
-
 		vcc-supply = <&vreg_l18a_2p85>;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 486ce175e6bc..ddb82ecb0a92 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -452,7 +452,6 @@ touchscreen@38 {
 		irq-gpio = <&tlmm 125 GPIO_TRANSITORY>;
 		touchscreen-size-x = <1080>;
 		touchscreen-size-y = <2160>;
-		focaltech,max-touch-number = <5>;
 	};
 };
 
-- 
2.45.2


