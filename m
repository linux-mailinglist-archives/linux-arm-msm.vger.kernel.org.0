Return-Path: <linux-arm-msm+bounces-37431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 477139C33F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 18:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDA66B20D8E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37C913A25B;
	Sun, 10 Nov 2024 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUTMBr+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4D136347;
	Sun, 10 Nov 2024 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731259562; cv=none; b=fzQ8cXLxS0mpu9/AvaqELPLslKCmXri1UjLNdkoC0V2w/SO0IbEQDgHZvR65wCrnCtGC953jsQXPGkjpYELrLhapSOIMgdPC7IpN/q3geF2v/jD8bsUeQYpi0h9ptyBcHebS4uCiQDk11wknULHKPp65v7IcpOJbCxigiK4cNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731259562; c=relaxed/simple;
	bh=+bOJYNr8rgNyxe2oByOD2odiN3NGYNjQl2flqFtSe9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GPb+SpmpVsMHA9YYkt06IeWxWkeIbVSNFd0a3B5mQ3V2a2VVr98MAQI5EOo5ZGHgaHrRQJtoOm0AEOjdYuuhUgvrr0BaujCLt9L+860la1tcby8ouV4Vn0u6CfElzAqhexrQ2GJT4euf61fOYPEOBk3+gTT94366Usf+f/vkV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUTMBr+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27E4EC4CECD;
	Sun, 10 Nov 2024 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731259562;
	bh=+bOJYNr8rgNyxe2oByOD2odiN3NGYNjQl2flqFtSe9M=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SUTMBr+6WQPnrav6WlSQkExIq6EfuxL46u6Uo92E9TTH3tFXKPwd2BFs9WCDFggQG
	 9VyN5ThaqTipy7fXoCPxSfczfMjjUYHlrCF8QlBq0LNP1GMRfaWh6iI4NmhCLpopcL
	 p0Q6Nz4R1BwdirhJ4jpjpn7sctHP8dorCqglxunQbToxozdfI6FiCvAMprINXZjm+5
	 I249ol/84kKuqr2mdi2Hbr4JM2RMvplCWC7+j/AShwiRGR3Yq4mL9UOcJ/VlfgGmsn
	 j3JW9kP5+HkzTU/zqi5PD5AfKAu4+POH68HQv4bAky9zXOB6RiKPN9/Ws3IkkV+Aiq
	 PTIe1GMQbpR8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5ABD12D4C;
	Sun, 10 Nov 2024 17:26:02 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 10 Nov 2024 18:25:57 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable the gpu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241110-qcom-asus-gpu-v2-1-5f774b17ced8@hotmail.com>
X-B4-Tracking: v=1; b=H4sIAKTsMGcC/3WMQQ6DIBREr2L+ujSAGmhXvUfjApHKT6pYvpI2h
 ruXum9m9SYzbwdyER3BtdohuoSEYS4gTxVYb+bRMRwKg+SyEUJw9rJhYoY2YuOyMa24VVbKS91
 aKJ8luge+D9+9K+yR1hA/hz6JX/vPlAQrqQfV81bpptc3H9bJ4PNcZtDlnL9+my8XrAAAAA==
X-Change-ID: 20241110-qcom-asus-gpu-870c7c22935c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731259560; l=1174;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=GQznThV+46C0yZ1o8eInWLmC6i4Kl8cR+JfdVp1PeJk=;
 b=yjtC5wcK9nIcFq++TbCIQjTGbE9pz/7vZ3NUI48TZbB6BvMKVvbY/EKQE0QZ4KDWKE3lT7SED
 akyaNSXz3mSC9SI7Wm8toLDsSBGhtjBB+pI0b3u/io/FmRt2M3EgKdo
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Enable the gpu on the snapdragon powered asus vivobook s15

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Changes in v2:
- Apply comments made by Bjorn Anderson
- Link to v1: https://lore.kernel.org/r/20241110-qcom-asus-gpu-v1-1-13d7b05784b8@hotmail.com
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 8515c254e15868a5d7f378b0dc0bf8f339fc7b19..f25991b887de3fca0092c5f81c881c5d8bd71aac 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -328,6 +328,14 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241110-qcom-asus-gpu-870c7c22935c

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



