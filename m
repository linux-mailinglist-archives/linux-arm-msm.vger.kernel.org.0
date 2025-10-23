Return-Path: <linux-arm-msm+bounces-78649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B762C03617
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 22:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B44F4EE3D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 20:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F8E2D5924;
	Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5BDj+mR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBC82C15AE;
	Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761251070; cv=none; b=Cqnm5rG67fBrLgihV1OxbLfkcF41ddJ7DkUJQzPCz2GDFxsUcKR2QeoGS44++wA8ElbDIKewr1Y9soyqN0+zMss+HF1w8ej4vMBRkexYnu/p9YQbpkECUsaf/0SLk4VOEWgrDpnE1wa10Svke+gm8Oud8nkD0WwirJcI4s9WBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761251070; c=relaxed/simple;
	bh=+b+ylfRcIWpYeFfan3Mweh/xrrouoNn77Loht1AaAbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP6i5cPPlbUyF0ziDF3ho3eBvBgtMHYjRV2H+pbMZyYW2JeK4ajy7LnC1YtHyIgMELkfl+80SbP/ldI34GP3IVBY5rHYqpGds77wXxDww8rT2gpiAUG8YqqHEqDyjofQxHy2tiEKpkAj65XVtz87wATKldM5FT6SHoU7hN8UHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5BDj+mR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D695FC2BCB2;
	Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761251069;
	bh=+b+ylfRcIWpYeFfan3Mweh/xrrouoNn77Loht1AaAbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s5BDj+mRIbsHlPboI7azQjMNVyktuhI66SQA5+VC7RQAEomaBRGQIlS7j/gLnJI2T
	 JGr4q63EJABpv0ItalqNAiUM/3e7Ig436eA8OqQSUZB3YjUcakdf7YJ9EflLqo9h6/
	 Gpmz/LyszSMBfxK/mC6GPjqHPnJ5bT2rPi1/KmBOBxBVoNuCpoim+9BCaTpJGa9bQx
	 bv9wvseCrsTSt/kNKQfCvgwwMp8p0usPBRtZpay6g6rd9HaffX6gafBu7BB/ZA9rj5
	 PgTxviZqCSA15CFG3mcFH7A7J+Nls9EiiauabdMKCVgpfgTRd3IoNf/AUels1L1cYW
	 xRLCb5LK+354g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF770CCD1BF;
	Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 23 Oct 2025 22:24:30 +0200
Subject: [PATCH v5 6/6] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-s6e3fc2x01-v5-6-8f8852e67417@ixit.cz>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
In-Reply-To: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo+o77mEd+eCRJ0hMbE6TLpH3mPs3ZCMwueE40f
 l4JJPO31juJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPqO+wAKCRBgAj/E00kg
 cgCgD/9QMZOxyeIUcHQWTF3qvT1tVGuppo9og4JggfMhj+5QBC9QaegU057y7GnqHJJYy195ooU
 53E6w8YEBibHE7esvbksxh5OG41c5y/99JCIA7sgQwq8IRxYsxhf8VkXdrknNM9vClauqJRPx7x
 78RqQWGGCHoW9qSfNiLoKMpzhgT+mDgXVsYQkhaZZYOAIsLsWZPDToyya32axsy7tQ12ploiRC6
 m1cXzqhSDA3EqIyRVdzC5e9GmN4zU2cmAQfYh/jTCo6tbN7QO8fxxOZQYP8uZclZxf1GAyF+E5J
 GtgYHB2T4VnfUho+skT9EtF5dOHvOT0x5AdXoy56+CoMsDa/5cG2T43Ie9t4vCVQJTW2mZLOsGb
 JzlPu45/i2Wnr5RxoC5hbaRy2fm3fJ+fNyF0x+sMxXoYzuiWcCtES4W5ti3rVJHxHomxjc7ArHl
 PD8DcEmSvzFDOh4UdzTfIwYLlXlQwUgVRZ2gJMa62P71zM+CtXyKYkXcuXVy+tsyDH/h4OYslHl
 CEom9zQn2kb+2HDzXDn09sxcT0oBQWiCMnZwjbs2qY9hdwttVrghViDtIoDXTdgz0DEH1s4uyGd
 YMzsbvCjh0DWRQiS8OiWlwbUNkNTFg83tDCpLFjXCgcFI3NjhR2Wg2jOo8FcsAEradCbkv38AL4
 WWvX1wSH1KsbVOA==
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



