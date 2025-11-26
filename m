Return-Path: <linux-arm-msm+bounces-83450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B55C89B0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 13:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5D43A3D9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6DD326D6D;
	Wed, 26 Nov 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMBZ3opU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452C2325729;
	Wed, 26 Nov 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764158929; cv=none; b=hTrvXugtn9JcWDaxCGcL70FnIbHn8Z0tndg0dzVrz/6L+e2mLIp6YF5cRH6S5gdp4qNzFXiteoVA94Z6stoEHz481E6AqcvQ+6jTam1soyZ5KSATAcQL3lpj9XWSvL2j1IRwif9q57npTbNiZl4uEALVGwSuYSOzJCdFfT4nk/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764158929; c=relaxed/simple;
	bh=q++9McjeUbFfZrGbXc73bNCq7ra0291ncNlgmrsSmzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZaBLQeJKdbny9HMr6c/evy2oNhNyYmngucHOA4Towl/e6jzvh1aMx9uwgx1rcyfqQm22LQ/nGWCj+XedUpDvHAmRwl4Ev5Xw+tmoNPT36qm5zcqqJeYqjff+2yKU7xdvXq8uZj/Ot4O0hG4F8MartyO8XRW3LLFxCe2Pup6iwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMBZ3opU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9D1FC16AAE;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764158928;
	bh=q++9McjeUbFfZrGbXc73bNCq7ra0291ncNlgmrsSmzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vMBZ3opUs0gxqLPJHBtgiitk8fB05CbjxX2l2t66TIO5ydjJtKvmctYysdkWsN1Ka
	 W+PyLyr7Jcg4BB82KEVQ+ZMdtdMNQxOXsBJwMQ8SQfNzG2q9/oOIIHpjwVX6/6heMf
	 bVLEJuNlgfy8WhFjIMbVjM+bUsdiQanZYVnY6sqJ9KO+pO3WMHQJJ8Zs4y5sYEQ9O+
	 hD4xZmsZCuFoxxcrjo2lhWzfQQNsoVJ6ewtDxzOmsYx3h+oj259KGUgx+gKLhYXSNP
	 ywEXEcL6ChBRoHNXgIM+raKFvDPBlCJ10NQliDtdUhWhUbNtBo6fmBcJd6dMhWNFUp
	 vU3gsWErJaCiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935D2D10F23;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Wed, 26 Nov 2025 21:08:35 +0900
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-slpi-v1-1-c101d08beaf2@gmail.com>
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
In-Reply-To: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Eckelmann <longnoserob@gmail.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=oQ7sBf0C1pN7qOlstYDWiU3zk1wxIDDBTQIIlEu5j4w=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDLV3p7vc5jxXbRvaY/goZql2s5bRH71MoWkXfiwoqe77
 aXG5ajwjlIWBjEuBlkxRZYdbsd0Ml2XRmzcvb8MZg4rE8gQBi5OAZhI/BRGhubIV1vur27R39La
 5hXDMeHbcblIB8aW/hNp6Vwf7p3VyWf47/j2uZ+o15auquKku9Y+Pgt8lTSktSR++5UUTwgKPyn
 MAwA=
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e97..0fb1d7e724c4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -425,6 +425,12 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/beryllium/slpi.mbn";
+
+	status = "okay";
+};
+
 &sound {
 	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
 	pinctrl-0 = <&quat_mi2s_active
@@ -637,3 +643,4 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 };
+

-- 
2.52.0



