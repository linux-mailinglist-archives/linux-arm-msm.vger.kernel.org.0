Return-Path: <linux-arm-msm+bounces-46304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B6AA20104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 303997A44E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DA01E1A20;
	Mon, 27 Jan 2025 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1dwka2Rm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8C1DE3DE;
	Mon, 27 Jan 2025 22:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018004; cv=none; b=tD8b8JYJAXyZWif1b1CPAFUgQyBZd5JsIXYzNuUPGYJUHGfA58IxwHgCiXcEYccpCL8LVRiNcli1KT0LUdbZh96VIS2i3ynC6DwmRf45dW2m3CuAzAAwyqqBSX0naw+5tkTOiZfHIZqj0J83GH7afQYtSovJrXALZlY7eSFokHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018004; c=relaxed/simple;
	bh=06UuhUdOb7H0JX3y/VpolH3SD9Ck90DkDCHJlIZg1+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AH9o9LbGGttS/NUL3hE64BbkJQb7YuAH5YEZTDSb4uRwk3PBB835EB4LkFmNGGBGozk29cujNALDGVZu8U0LV+DYAgCUcJllMvzCCWO09zegOshe4kaxA6IC7WDYZow5fwxRtA6FxhRYeH1lm2HBjH8LtF1UX0MvWq4jlB44Azo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=1dwka2Rm; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017999; bh=06UuhUdOb7H0JX3y/VpolH3SD9Ck90DkDCHJlIZg1+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1dwka2RmxeN1a8AW7OcK7uO2Ay6Z8760h0tbpki93cATfQrm2QCcUSth2sVkx7zDA
	 kKMXThd8v03f5HUrkhTD3DVmTZOQ2GKq6EEnM2b504pODczmjj6AH+e8dJ37MjN/GR
	 w5BSdLqr7/2aAT1WrUQMywcyk+Uwed5AfCsAFqcg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:44 +0100
Subject: [PATCH v3 12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-msm8226-modem-v3-12-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=06UuhUdOb7H0JX3y/VpolH3SD9Ck90DkDCHJlIZg1+0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzJLSXgzfCt9SzhkrTRTIgnQIboW8e8oJacZ
 QdeMhoZJCaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMyQAKCRBy2EO4nU3X
 VjsFEADCtQzoFdclASAJORA3ycPnVa878pKs9sqKYnPAnyfMENz0Yf+ldemQVAn1rx30fDgn2fd
 LueiJoeBLTKFHi9+Z2xzA8ErhhFNmimGPZZusQMH1lh26rOSvrXKk+YVNWg1TZ4eHDmwvhALVnu
 NmXnowRQ9AKlU1HBFrL8uIRA8h0KI22NS/DfRYHzlhiUCQ3RYxTmDDH4nHol9/fA0uolLfSQW3A
 I2wy3XJsMUPpRPAXwZsYuV7twKT4q4W81gpl1YhTuxY2/3Y9gaT3uY2aK6sWZ6OwTZtgn/DytwC
 /vGV6PVWwx5bzYYA4c5gRY+saYoWM03M1iHOOaQHt+Va1IvYbAifCRdx2wi3ipZXg+imCO/YOUo
 HMax4ixplqB02hU7ZsB5t9byddwLchWBX7nKAqY5Xt5OeJooTp6XtU7EX97CcIPZlCkYqQrgNod
 ZH4ZgJT7GArQObLchvZMmfM3yfAakYOPhheL3aPqSFDGGwNZQeAb17lb17UXWPUdSFEnYL48Hgw
 9/Wq+UEvwXusu3K/1fxEJ6VzLvR8+IqxbxEu40LYjrEHz04H5CMpMLzWSp1731z5CpiyRu42j5k
 XZwdoLTKzMDhBLqMdXUbs7jjyXQvLvZqTxsBpryGd7Ale1QGHTBmgGNg3/v7ain8+3yqbYcH2vy
 FWnb4hCyAuODEvg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Enable the modem found on the MSM8926 HTC One Mini 2.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
index d6eaa82cee4daf6a1386902f537f1351811d4a06..cb571aa13c11598182dc020f064fe8268bcc061f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -195,6 +195,16 @@ &blsp1_i2c6 {
 	/* TPS61310 Flash/Torch @ 33 */
 };
 
+&modem {
+	mx-supply = <&pm8226_l3>;
+	pll-supply = <&pm8226_l8>;
+	mss-supply = <&pm8226_s5>;
+
+	firmware-name = "qcom/msm8926/memul/mba.b00", "qcom/msm8926/memul/modem.mdt";
+
+	status = "okay";
+};
+
 &pm8226_vib {
 	status = "okay";
 };

-- 
2.48.1


