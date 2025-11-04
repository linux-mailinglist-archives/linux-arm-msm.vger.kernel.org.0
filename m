Return-Path: <linux-arm-msm+bounces-80373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE5C33312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195353B2790
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B13148D9;
	Tue,  4 Nov 2025 22:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cUeK5j3P";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KO/kx/1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F7313E25;
	Tue,  4 Nov 2025 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294659; cv=none; b=MWgyZOnEPZ1jwSzjWRdCGWOidFF515Nk6Vbk79kBbRwzuphnW0+J1IutcI9MF1mtfMbhkOcyMdNZkFy94EZjTMkqIcJi0QKHpiIcgFVYC3DaRa6CafPTM9KCcqUJuQQqo+dSww0UcIAKzO8/6tL7PDJdqfIeeYm/s09zqKGR8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294659; c=relaxed/simple;
	bh=+BJb5w8t88+1N3WMD+2YiklxBx85tm0Absn7xBNncbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7C1S17cbFBYvOLd02R4vExWH44eT2HcO3VVro/hZ2spJd8a8FG4pI/yqCC7om94yLqkKScCgvA0vq9WdNFXbAQ3sICCe9GUigxCfqLGlU2Sx52xmz2Qs10U8GrhYdsCyShkiYGlDePtLMOiIJAV+Cw/2XOf0rKNJwsrCY2Ix48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cUeK5j3P; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KO/kx/1k; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1762294654; bh=bG96UA0yj1CrKcC/xVJQMf6
	ADLQ98znf7yp37kr5X+s=; b=cUeK5j3Pndb5XMkO5Hjl6XVp2J7+rbevkiGHTCImYJhGwTM39j
	9yWFwmtHDvNhjLFrJya1gUP7johqPCys7eF2MAZ5/xlzgvG6YdlWrgvjnl8d/8kzxSudln6Hp0t
	emxZxOxjptKRSEOMo//3E3i018qxk2G+fOy+TivkIJJgOMfuS+lQO0gbmUt4kaiPv7T3duSSpoW
	vmjgCHTu/ZafgQfmFUPiqHFsTx0Wtx0iRLTiza6alSGp8bvzBCt6LeN9yllC6zjz0cfC2if0H6y
	gSjVMffvRb9LC2aRyaPYduGyQMHt+XhumJNmppa3TZoK11XRVI2NW0Gb6xScFSe0dvw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1762294654; bh=bG96UA0yj1CrKcC/xVJQMf6
	ADLQ98znf7yp37kr5X+s=; b=KO/kx/1khfGSrdNQYS3blkU9oqsxf9+wMYWfzgBOpoPkNllKlz
	UOK/cFh2t6hvTUMIbCJTCyR1NPO5eTZHlSDg==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	david@ixit.cz,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8150: Move usb-role-switch property to common dtsi
Date: Wed,  5 Nov 2025 03:46:56 +0530
Message-ID: <20251104221657.51580-3-pc1598@mainlining.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104221657.51580-1-pc1598@mainlining.org>
References: <20251104221657.51580-1-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 1 -
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 0339a572f34d..29afee6160cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -693,7 +693,6 @@ &usb_2 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
-	usb-role-switch;
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index acdba79612aa..cd05975dacd1 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3661,6 +3661,8 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
+				usb-role-switch;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.51.2


