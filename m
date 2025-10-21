Return-Path: <linux-arm-msm+bounces-78160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F76BF650B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C44118A6FEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DCC339703;
	Tue, 21 Oct 2025 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwdANdnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243B3396E8;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047589; cv=none; b=ZRuqaj9SGbd04Gq4AqS0tStOndVMFiCfOPT4ypV1zm4rL0Lr9IIQThVjicnWTHpMQOVZJUprSLhaBsd2RtZMQBslanwNrRHdVSzodAIvfqX0eKrErn80hYUjgBIClNkEAh/hkkE0vs/DpYkPm7vS3PxaEG22+1mJcKCqAi+cJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047589; c=relaxed/simple;
	bh=+b+ylfRcIWpYeFfan3Mweh/xrrouoNn77Loht1AaAbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxDC9lJ0Nl4HQoAHVTsNIMLUrR/uE/hb5wblDgWwXqbc24prIroPTblBZ1iRYutuM7jmcBTfXCfTUhqtwiDz57tIRl5E8YBXd1tWdPjQtP4pdnBDuSrEX0U892cyHe6zUG8ntDYidUKYZrxRi1rkh00DNZ9zlBvzUtSiGBq4tWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwdANdnS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18D1CC4AF14;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047588;
	bh=+b+ylfRcIWpYeFfan3Mweh/xrrouoNn77Loht1AaAbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uwdANdnSoNt2+3kquVJsfxToRgng90OvQCBqGNFn1jHcVPTGJn25iBh5aXhaED4Ub
	 Am5FjBcvEKh9YVYfIOiU0peYFYdb72bKhaj7tzixm/TEQIcR3L/ntKgfiUT0TwTh/D
	 0YL2hlkOpn0Sa236zN4zto3Ot4r8EDwmZSeg1V+dMwgNDyg4LZOqssvtIUMLFLGydE
	 vqE1DpS5vWcLT9LgqMysJagv6XIFq7xmkLl3ewEqBkFDsuKGU/SBeBfIl2evKVPIHt
	 VH5T3eoabYi6Lq+WmCSqLc+UYkiH7ZsE7QudKUb8XTvjIrq3oVX4mLC4YqSbGA0De8
	 HDWfuzbxRNwlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF6DCCD184;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:06 +0200
Subject: [PATCH v4 6/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-6-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4HlzjaWbltHovpW/x3csoBFsnc7NUcuYDQwYcmmZFrE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93Qh8qZOMkmBNVijDAoQ1Q6Qg+1c4buWwc5AM
 M+Vqm/GnOyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 csZBEADPO5B99OhdousRGVcs4eB/tkJL/81Gj2Pkrn/gy4BEIOCxqjmp7yzWxY2llWqtL162T0g
 oivf2adFLgpVuf3UtS/1I1ZMw0adJlQVjqW7JaHZ1BzD4H8mLPF6kjsUyPBXHOw+hW5mP7ByrnV
 gHHxxdtz6e4UXHPwSJmyU51n+iC4qUXwBtUIeZeWv/WsWdj9yygPP8H8X2ggoZgiuE5h/M+nFsF
 4J9BrY55qDvyBfEcSqEWHmelIZBX8JCc5nhcwBs/4irG7CXBA0tATdknjuTxLEExmku/3wqF81g
 TJ+eZBMJm+7sFc2NOHWG2163anq/CGjx7m98TYBZvSsk1CG2YR4k9Cwt2NsF/ujMC5oj8Jv9nn7
 6GyELU5ywbiJCmjKz8Osdkzj/k50EcBbdZokkC+BccO4+pNe20dMQpBuKj/39GGb/Ig22DR4vFQ
 SpIrucuM+IwgCRzu3yi29u1kDizmq9By76CEganh8/W50c8sZLlu225iPbvDDDbfELP+GdvuT2i
 9BgFpwIVMqbIUjJpqP36Z4uBdbjcd2sNwAbYNzcPajPg5gkCGv2PPClDh/269/WRT1XtOUhK8hn
 s9FYq9ndlkuQzja5FCiUBAP3wh5ID4OYziN/Yho442G+wn45dnjWOcuHBSbRDul7UvC8U0SULRf
 2I2pd1VyCZ4asOg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Describe panel Tearing Effect (TE) GPIO line.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index a8e87507d667b..8ccf93dec557a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -460,6 +460,7 @@ display_panel: panel@0 {
 		vci-supply = <&panel_vci_3v3>;
 		poc-supply = <&panel_vddi_poc_1p8>;
 
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&panel_default>;

-- 
2.51.0



