Return-Path: <linux-arm-msm+bounces-27000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 176FB93BA63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E3628408A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4956957CA6;
	Thu, 25 Jul 2024 01:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="srn4n+kJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41DF63A9;
	Thu, 25 Jul 2024 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871824; cv=none; b=oElfWBUiiOldcIOpTrEaYljyNrsa+6eMdZlDDLqAUTNnEXeJz0nmf1dsdTQE5KHf3eKI/GXSgyc1/GwLbHn4ChMgz+1QePL8gpKsnp1F5p4h37FMtBk030JysMK4GVxAdmohbmK07MLy3VpswSwuWviH42DOBGLkfB74Gv1+4Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871824; c=relaxed/simple;
	bh=W27i8GsddWkkGbO43nNSrNo7kUCmHrqjkxKShFt8uBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPkk2ngVE41UFy0E4VT4YYLs7x1hcOrtLwErzX8mRgjSxSvHkOB06xStl15ITxvnaX1ADXjUvVe/gGi8lFu63J0emDnS1sOEoCPSWXXIVYfzHN+5s+mrmp34o7nPQJ7yqe+a/35e4L9yCPhGMqNY+lRPazItiZ1QLEu3QCqkVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=srn4n+kJ; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WTtvf1skBzDqWn;
	Thu, 25 Jul 2024 01:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871822; bh=W27i8GsddWkkGbO43nNSrNo7kUCmHrqjkxKShFt8uBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=srn4n+kJrmAxuGdPRwpNbOq2jilBzgpNuAvZJZnYe7CiyjSxKuXgj0P0qZCapmGjB
	 RGo/XBnpo5X2H/muUWMTWptuOAOutG5r1M5Bi9rZCHMqxahnWvn1E9RDC4PMHXXk0k
	 xdVmimIbC2BfY6lD/vLj8bN47AVtiosREPKW6g9w=
X-Riseup-User-ID: 3C13B24D9ADA5A948DEBA86D6218C0230D81CB46BC5330AC4AE95BA046F5E57E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtvb3YpXzJrRJ;
	Thu, 25 Jul 2024 01:43:39 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:20 +0700
Subject: [PATCH v2 11/11] arm64: dts: qcom: sm6115-pro1x: Enable ATH10K
 WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-11-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Enable onboard Wi-Fi on the F(x)tec Pro1X.

For reference, HW/SW identifies as:
qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
qmi fw_version 0x324103d6 fw_build_timestamp 2021-12-02 08:20
fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.4-00982-QCAHLSWMTPLZ-1

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 3f6676edc9a7..2ef2733bff48 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -536,6 +536,17 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6125_l8a>;
+	vdd-1.8-xo-supply = <&pm6125_l16a>;
+	vdd-1.3-rfa-supply = <&pm6125_l17a>;
+	vdd-3.3-ch0-supply = <&pm6125_l23a>;
+
+	qcom,ath10k-calibration-variant = "Fxtec_QX1050";
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };

-- 
2.45.2


