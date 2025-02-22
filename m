Return-Path: <linux-arm-msm+bounces-49028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6081A4088E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 14:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9371A4246FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A68020B7F2;
	Sat, 22 Feb 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="3+7I1SYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E33835948;
	Sat, 22 Feb 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229275; cv=none; b=rvQ7axfIN8BgzfhGgOJcHbXvBsiVyPigE3lHUeCLXdY5uXbk5ZCWe/4QbQSujdcDkGUFOQj1SPejsM2NPyczyBJ/sW2rKOhJhiGhqRlbS/M/p+Xf5i5Wt5rl+6Fo7mTcia8yg8APs3cME3pSEGCYSDo/j8AWqOpkxLc08oPzRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229275; c=relaxed/simple;
	bh=E81IZVnYsg2qBLebXsL2Wo9IJ6W5FxrP4pSvP+wPjMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJToU+0Crmut29NRWjWfb00Ed2eCk9KI6AeJD85sfnM4ozUGDnZjXIKZpSjLVO5lxLV3U7XxmKSv8fqqQHbp5lyJPi0Eix/Zfa+jC4uO5E0N7mAGmXK7foYn/hCfI03tvFptJFU8U56I2+AtH0UOPFBtF79iy9vlT+osJSqyydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=3+7I1SYb; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740229265; bh=E81IZVnYsg2qBLebXsL2Wo9IJ6W5FxrP4pSvP+wPjMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=3+7I1SYb2CpfV68mq631iZp7THizfQH3QqjZ6hQbspHIe7rE1UFayQ3R3CiBKcuPS
	 ngwrRjf+j2nr92Bs4+3KY0F+d+/PEglzDB4WSO420hZx7pZkybmMN5ZGZFegcnCViT
	 /eBRrO4/591n0ghaeKmuU+hcxn1j3R2BeK4a+7ps=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 14:00:49 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=E81IZVnYsg2qBLebXsL2Wo9IJ6W5FxrP4pSvP+wPjMo=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnucqOROIXxdFNC4QlmeNCKjgY0zP9vp+s/04zn
 KcH5qJP3kiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7nKjgAKCRBy2EO4nU3X
 VqmLD/9yjqrNAx94JyFiuMsbOVI2pYk4Ka2CPTRLPTYeeXl9rwCH/XYXgN0Q3MRXLPiw/uV2DtT
 Snh+God9qu2aYe2UGtIxZrqym2jwLqY670CoISGyc7H/hNkj1npor74E57G1TwDEEdR+Qcei/fP
 416BXeiTAH1aGTmuIKUJV2ihWnrtd5Zmetss4g34N3FKw7vJJooenbtNHfpaUKpKJQD38gWjvPk
 YXNmo3+KorrlaayzPe6TcXzVDat64Xs+TGAkcfSNCDzkuX23m7fy/WBJFRlMurEWZM7uAPNe6yB
 ahTog2FoxFbBR0a/TsgEVOXrRwljbMOtYMm+Gnw+TAYdCQ5UlKVrW1VB+L1SKZa7ZzlDChsDHqW
 USeerEqSEbTTVWh+YGPxpFe8zAZiobvdH9iJ8JDujj2JcvhJi+V91vtIE0dRFTDZlru3ZAMFuT1
 d/hn3MouyG6Pky1Tly7gsxadhQz9/fpLH2dSO9Q7CPuQVm4x9JKLVwY3yPNFQbt83H+DcbGn39m
 YqQKFSWyKpVpfOaEk3us7QIiN726KP0WCplccuChcUFd8YGzFLwLSoXNLSPBA5aR2hCzOeYgITq
 JZqUSS7akC3cmzCWxT1QHuUciV/vy8h8k7+ObQfepkXD3K3/ZZmGQnxRJ/t27uOyJTFy5e/cZUD
 Kv1ohWniH3BBaKw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Set the paths where the device-specific firmware can be found for this
device.

Fairphone 3 was shipped with secure-boot off so any testkey-signed
firmware is accepted.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -82,6 +82,8 @@ nfc@28 {
 };
 
 &lpass {
+	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
+
 	status = "okay";
 };
 
@@ -297,11 +299,16 @@ &usb_dwc3_hs {
 };
 
 &wcnss {
+	firmware-name = "qcom/msm8953/fairphone/fp3/wcnss.mbn";
 	vddpx-supply = <&pm8953_l5>;
 
 	status = "okay";
 };
 
+&wcnss_ctrl {
+	firmware-name = "qcom/msm8953/fairphone/fp3/WCNSS_qcom_wlan_nv.bin";
+};
+
 &wcnss_iris {
 	compatible = "qcom,wcn3680";
 

-- 
2.48.1


