Return-Path: <linux-arm-msm+bounces-73412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09064B563D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB9117C49F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664CF2D0638;
	Sat, 13 Sep 2025 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="MkB4IyTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968E42C028C
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807863; cv=none; b=eIAWBqu9Te8eVYkln6+fPRCWUMQgjXip89uwOhk+LDBuc9P3K0Qp29MKsjE99Zkj8Vw3W5IQ0GMfdWlYk2KyMwHMP1wUU7Ecuv0fRmAvkrHIAanZ1P29WRHRUwHDoLvvyA2SInBBUkQO7YRHyFivmJCXCgqeA26A7juNzW+ooIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807863; c=relaxed/simple;
	bh=4gTNdDMAFlEsDzGujBZQcfkcRdHSiH6aqRt+NvBVdts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCfGL2EfazF9w094fom3HmjQWNDsW6TZxKFQ46OBQOZNGo5XelrjTiT05veiZF54H1W2aeUifoHU9kOfvb1g14Nip7KHZGhJ7gVqAde1z2TwlTR7QK7SD/jWcyAuZYV6BdtkcaLd9Y2UYGtwM5gZV5gVnezBCB/H8lIaEZ3qlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=MkB4IyTH; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o32aiobXUfUkDKQ5L/ISoOzY2EfB7iyXuHf2sFiGNKw=;
	b=MkB4IyTHuHNmeuwzoVtuYXEXCjGSXTI1ArAXCeloTqamgFO6O26ujauG7PCOEDl5us+LWK
	wtpgHJyZjXRi9nT5A7KXcjy7NcEmClTPEXJ8EeCFI2jJJwfPBshI53/TVQiWMca9J/OBx5
	XcM68j9M2mCLKCjVJOx5d5llho6xBMZc8n0tUUhhUvmnudbB0c4CUFJxCizVHBlR4x23SP
	0IpsxWtRTyyjaze/BKZnENOi2RtSqp5fZ4HCoqFRv10VKuVFkmiyesiFNjjXEawSUGF4IN
	C4LVMElTiXVkZL9GAJeTOH+WyY3EK7c4hWyNtbp1ZnNYDc+d8w54nkYVd9FISw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:39 -0700
Subject: [PATCH 06/11] arm64: dts: qcom: sdm845-lg-common: Add wifi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-6-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=947;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=4gTNdDMAFlEsDzGujBZQcfkcRdHSiH6aqRt+NvBVdts=;
 b=mMWgAQdTVaekGLA33ZuVFsN6q/x8JABl4wrBnPJaPyWbEKq6uYdyelL2s069Pnc4ZqrjgmTFi
 zxDOH9BEG3iBqCI5iu3/WxrX5rgXDvVYCq7Wa6Pzw9tBHIikzCe39We
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Wi-Fi now works with this patch and relevant firmware

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 1bf2f2b0e85de174959ec2467076a95f471a59d4..585582ff4e0bbe8c994328278d5e5dd3a280ddb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -682,3 +682,16 @@ &uart9 {
 
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	qcom,snoc-host-cap-skip-quirk;
+	qcom,ath10k-calibration-variant = "lg_judy";
+
+	status = "okay";
+};

-- 
2.51.0


