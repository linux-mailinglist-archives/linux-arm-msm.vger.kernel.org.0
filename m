Return-Path: <linux-arm-msm+bounces-26705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5269389C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C850C280EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306323EA69;
	Mon, 22 Jul 2024 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="J+9cfnIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA56B450E2;
	Mon, 22 Jul 2024 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632288; cv=none; b=QI5v0JSjAZJX0TJm5JJcJC/Alb83ys0NM1t6ORZbg89sUAyYS0HlmS64APDggh7YBev5fD9Zbc4fJxKFlbmlVycpXHg+cYh3XlZv3JRbBAqKzXRFBAMvqsGMR+Bc0dBBNj1SMoNPl2zOHxKs1uLeWWC+W0h2yaadGJyGPVtnWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632288; c=relaxed/simple;
	bh=g8VYDVwiCgfN1ypDaLdFF3BSM+kQleQ5q6JQ38we1Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NlfNXJe6RhI75Twa3z9n9fAHnq1YCLMw9MIrmX49YbG9O6WiovXGA3n4418Z+3OmLj3xSc83WLdrRIt/CLbyGknWuip7ZLQCQq9H5qFvi2X5AI2IrPJlyqljvJbLR4Ct72oTZbHvkSYjXgny3UlqGzqb2L8i2zREEElBzmtvdyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=J+9cfnIC; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WSBK92nKDzDqX6;
	Mon, 22 Jul 2024 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632285; bh=g8VYDVwiCgfN1ypDaLdFF3BSM+kQleQ5q6JQ38we1Vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J+9cfnICf/oC/QHc0jNPGo+eEb0zAVs38KiLvX6PtSwfPbXqfdlbWQKT6HMxuAKuj
	 O96qIosZlElpIiHHskPdLLaunTGq5ymgkTMCXzyiEFmNIoOD4QcP8q0lDOOGX66VsQ
	 H6rnCsMEGPmzfTxRCZuPMi3GXRGBOEDK+o7dw6Z8=
X-Riseup-User-ID: 7CB66B167F740C3C821EA4AC209CF4BB1611C79B03E0D6EF3F1698972E2D93DA
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBK63XG3zJrdJ;
	Mon, 22 Jul 2024 07:11:22 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:17 +0700
Subject: [PATCH 07/12] arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-7-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The F(x)tec Pro1X supports USB 3.0 through it's USB-C port.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 6148cc258164..a32fc27bc783 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -428,7 +428,6 @@ &usb {
 
 &usb_dwc3 {
 	/delete-property/ usb-role-switch;
-	maximum-speed = "high-speed";
 	dr_mode = "peripheral";
 };
 
@@ -439,6 +438,12 @@ &usb_hsphy {
 	status = "okay";
 };
 
+&usb_qmpphy {
+	vdda-phy-supply = <&pm6125_l4a>;
+	vdda-pll-supply = <&pm6125_l12a>;
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };

-- 
2.45.2


