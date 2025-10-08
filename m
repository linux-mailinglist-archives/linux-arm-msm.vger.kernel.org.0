Return-Path: <linux-arm-msm+bounces-76420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01272BC55D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98C7C34ECE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D5C28DB49;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSIQixBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6A28C039;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932331; cv=none; b=Lx3eBItGGfigXepdFGDWSLEbRAaogOPXfok/q5TQhshonLzHsaDEnc9sxzEEUhpjhdJ67ZtbufLkK6+wkdfJYUjc90GFkpxHiEv4LkhTPuOX8GbLcwedj9cbYQz1R8E5d+Klc9Y5HiF03p9KBMjb1O+YaeL8LlSnFT4E/AdPsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932331; c=relaxed/simple;
	bh=xdm07Lpvk11ns2O+Mhvb/MQRemsr0G4JOfLGNAPa+Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzCoe3Ir5Yavj6KB4DCo7QJgjn6RJI/XNgl6l1aIPywaTbgJfoh1PRtV/mudiahDtalrQww+Ir9Kg5/Zc0+HHknXJfe26TABQz6J5NZ/JG99RxgHQpWC6hvXXr9f/YVOPRSkorm23kxeMt96V3WzI1nQueazBHMrcKfFo2xHjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSIQixBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4B34C4CEF8;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759932330;
	bh=xdm07Lpvk11ns2O+Mhvb/MQRemsr0G4JOfLGNAPa+Zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YSIQixBBExeyOczaSkObLRa03gZ0iHlwnqE0tvjPK0XMJb85pkCFTYA75uMlsNxCh
	 ykJPj+7ZuiVQ+4kXOqZsZAq0f6uv2JiRJIzITS/9VwDqpk/UoPPOp/AueDmc26pUgP
	 z8aQk2v+r5tte/UhNu84BBtflSa8PzRQ4cY49FBx34Aq17ufQve4TVy28OYG9kEvhh
	 u6U1Ejy56KpOVmTiMP6ZTWbif1EHgqNzEw8C6DRZ6J3RPRkIuFXFjiHxQxmB0piZDR
	 IKX6FQ7+qX+E43XGlpgmYEcJJWRxng5zogjKXv2Vj/Q9QECXbFkWO70ssGocw/IVZN
	 SYgktOrftRqQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE44CCD186;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:31 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=6dQxM0IMSr3zsyolXreEE2WPEzcxlj+3dZAUqGx7Ra4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+oxJlepJwVpuhRk+jL6sBj30CNdaZGLqKzR
 MsZtOZOaJaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 cguHEADOxL2F+63NYgqSUUh7HyAP4sZyLpY2ZDmDm0jGwTEaqCDsSMZz5ELYrGqRmoe5TyzK7GL
 ArfakhFNCUZdiq0G6BOggDFcZwY8EI/W7zJ94D16EJnU7aVvpnOezbXUm6V5NVWrCrpdYl6+n+2
 gTs7s82g6pRoF0Q1BexTpis8KWas8vTUxPleN5LzQO1aPU2fdEOc/gD97T6u7cLoQHLwMYXgdAg
 cEhbk8+7JshZL2FcukepFAAF5kAWaQigsiJeUuctaWJtPTj1uQKyT3Vb++SdBOouZ8AJn5+2Gt2
 wT7sc8WfHLOPpDYClYzUi+he5mb3jiZ13aqUIuEXJcf8m5cZrRxgFS2lk3hmt8snUuqRaBx2w2r
 o2FiNwLiM8QAhdbuQS+d/hlWt/DOV+bnfvjEJ2Lzg7+z2iPG/3+mWr4k65R1g9TTfhmihFm0l+i
 0414Ow31o/ZghCuBS3lUYW+kL+tiB6u/16cCIy+nn+xqUKqahYnR4R/aWr0zSr3Hdrp2pr/OtTR
 wJM3M2nBI03whrav/RqXtdT71t+Le2qoTs3V3B71ADm6Dmx9QiLf+lwC1EvfCfjgziAKnHGNPKj
 HcTBmmKffxY59mhrUnA+nE/7s02Fg5V/UaLY7xb7ia2+cDIvsAn8g9QJww8Wk1a3i5Ki2edT54t
 cEunZwKbYXTnm1Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Describe panel Tearing Effect (TE) GPIO line.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 1cf03047dd7ae..75989b377f8bc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -460,6 +460,7 @@ display_panel: panel@0 {
 		vci-supply = <&panel_vci_3v3>;
 		poc-supply = <&panel_vddi_poc_1p8>;
 
+		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";

-- 
2.51.0



