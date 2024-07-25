Return-Path: <linux-arm-msm+bounces-26995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7D93BA54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2C3283A04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0BD208D0;
	Thu, 25 Jul 2024 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="DbpJHE5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB022638;
	Thu, 25 Jul 2024 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871812; cv=none; b=psOUyS9bwtlKOHV2VNS5YI9/dBgT7JHhLex9ZhLo0dZcukXnlHyfuWHTTJ0FWzeGfAg3vT6czV7JuSkKaoSubtYs+5zTRuw6qJ4lG/qptyj1GFmUxHZdX3JDG4LXH5cizA6lmpSgaHYXkDyTUbCR+dvF8irVp6BAiva6/bWIy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871812; c=relaxed/simple;
	bh=EJVZ1grtY6xvpuvgsYU8b5pTPUrZoqx8Mj6QQe0GIvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/WIYCjZrGs7MgBkLixHZxae1bCjdrxp5eAQuiwfMf5WZZ3i0mxqiTsfYdmCDW5htZcql5rlH/cQqtPPuVeDo3l4op4SjiyNYiJm3guzQWUODNCIV4I9WaLJOqRFUWkiqiBesVsVh2JhE43V0YQtDHSuOAtspqyMMemPqf3N6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=DbpJHE5x; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WTtvQ2sGxz9t9m;
	Thu, 25 Jul 2024 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871810; bh=EJVZ1grtY6xvpuvgsYU8b5pTPUrZoqx8Mj6QQe0GIvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DbpJHE5xDnUkPMSYSfkE6OFJFXZp7K0SxZopyvJlGQsCvKViAB0lqkatz+Bc8IuaS
	 aI0pJ8QQIgzjUKgnXIylASc399U788D8ZahKgNKAdvbBxuUOcoYj9ReXHR7gfEmzJP
	 5THIwyDOiR7pUHLc+yxiEdfhsyGlqYY5l/k9qKSo=
X-Riseup-User-ID: D126182958E2FF562944F0E4B8C151F5D7D26218990B6E9663E1CC1636E76DFF
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtvM4mK4zJrWZ;
	Thu, 25 Jul 2024 01:43:27 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:16 +0700
Subject: [PATCH v2 07/11] arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-7-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The F(x)tec Pro1X supports USB 3.0 through it's USB-C port.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 69ef404d9de6..5dd70dc87328 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -433,7 +433,6 @@ &usb {
 
 &usb_dwc3 {
 	/delete-property/ usb-role-switch;
-	maximum-speed = "high-speed";
 	dr_mode = "peripheral";
 };
 
@@ -444,6 +443,12 @@ &usb_hsphy {
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


