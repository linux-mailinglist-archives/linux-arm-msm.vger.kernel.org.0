Return-Path: <linux-arm-msm+bounces-82991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB7C7DC61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 07:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23A4B4E136A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 06:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3667F286890;
	Sun, 23 Nov 2025 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGH3atKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010D285C8B;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880285; cv=none; b=p9iAk+sdr61qEavzEJxqzbUV88hBIInJSAXdg1Ymuq/JAGy2GUhBmCiF+leVRjJC+xnHKQrgOECeja/HjT7TL2YvQFDPlLBdC1GLnrljorSd1po4ZbwJ5po0/bevC0bDsf+0GUEZPkOMflT46B1s+Dhi3nTaW5hkUVJ7cc/ZQTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880285; c=relaxed/simple;
	bh=sZPW5eZ8MR1rL8bU721fhKIdw2+RQHUJOsyUnQ8tzJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9rWpix0su0allB79ieCAmzJsxfH9PAiNyXYwff1mKc5klaVWGHYShGtbraqN/Ffhbylb1lnrTEMY0QXXblM8UE+j5cKym3/MjJc3Ws/KuB36w/5MaXLuRZzGfRdHZvRFDE2EyGx0TwbC930/RWOP4BibW7Q7StePAYn0UOXXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGH3atKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65E1AC2BCB1;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763880284;
	bh=sZPW5eZ8MR1rL8bU721fhKIdw2+RQHUJOsyUnQ8tzJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HGH3atKPDYud4DhvBDwtsMW2bVIdOmYRn8LoGR0e10gufgh7jEBANT3QcVh9+94nE
	 cJ7nj+ZdVGzgqd1Nm6biy5421dtCGjgXdwLDXjVG4j7FKfal8VXJ/oFDgM5qhZIC53
	 h3Q6KoGFK4Hp41CYyNSIqmqOuf5R1bO+wxqekEQRcjGOj+wl2v1knHo8md24K9kfGQ
	 QDIVcGH7kls4Wn259IAVkO9tjAGJKBYu9eLHY9xeOt3tRj7vOKdP7kzkT1c8u/Deml
	 55TBw8uQB41Tgvg622fiKm+luHcwJkyTXg6wrnnoiNhHf3YwKu+Q5lWr3luJtMz9mf
	 V7FdB/V3Ys2bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBAACFD317;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 22 Nov 2025 22:44:46 -0800
Subject: [PATCH v3 5/5] ARM: dts: qcom: msm8960: expressatt: Add
 Accelerometer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-expressatt_nfc_accel_magn_light-v3-5-78d198632360@gmail.com>
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
In-Reply-To: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763880283; l=813;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=OZ/k2+Tpqc0kQFWuC55IinM1SMWgAPprXjNRbIlFM6c=;
 b=BlIdU6mc/P35Oe1bo+hmxr0lNgn7Wm7mNIwuyg92DaOIU151cr6mMonnenrPB4VRAmi11zVPP
 5NpF6ey8cp5BxjBXU+QBQ0XjE030VdAtDGzeh8YHxrjK6j/zYOsbhj1
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the Bosch Accelerometer.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index d32461fc58e9..cb7b56283f15 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -497,6 +497,13 @@ &gsbi12 {
 &gsbi12_i2c {
 	status = "okay";
 
+	accelerometer@18 {
+		compatible = "bosch,bma254";
+		reg = <0x18>;
+		vdd-supply = <&pm8921_l9>;
+		vddio-supply = <&pm8921_lvs4>;
+	};
+
 	magnetometer@2e {
 		compatible = "yamaha,yas532";
 		reg = <0x2e>;

-- 
2.52.0



