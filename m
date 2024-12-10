Return-Path: <linux-arm-msm+bounces-41296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2AF9EAFA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 301BE28ED81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A37223E94;
	Tue, 10 Dec 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWGeXlYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9CB1DC998;
	Tue, 10 Dec 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733829333; cv=none; b=XROf0Q4kUbjeULyadbeMqwOaFeRYqksIT0gmYXvqrBg6cBjzL1X4uLOv6zHGmJlRsAPvEq3fuwz/4rCf9RXDQdrdufSvREPS3mW0dR9YOFRcHqBKnjINgs1BDumiOmctVFWlb5Kph97q13hN2AqTOId4vrGKEsc9Z3obOpW98pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733829333; c=relaxed/simple;
	bh=L5GszgCqF7LF91WytrVze1o325SqKK7siXqfCAphg8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vANOLqqTjPNxAczGlFF0o4xxFgWu+T+33MRt3KArfE6T0Bz00LZgB+hTGmBNJiszp/42fXnod/O86m4/YJzg3lqyFL/o4WF2Ely7CP86+UK8Qh3o3az5IeTdHlUN7XT3kpSeUZWFycbxO4dzNTSRaweV7tqKqhyYD03ztUH1bvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWGeXlYy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B82C4CEE1;
	Tue, 10 Dec 2024 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733829333;
	bh=L5GszgCqF7LF91WytrVze1o325SqKK7siXqfCAphg8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWGeXlYyjKaptStKljVza2s2LLXqYEJ2ql9iD+F1/Tc9RkpILl9SwxUM+IO/VJcKm
	 SnGhgVAwB6rgl8/V0PHk2/LTCXQNFvJU07dBJif1FUeXZaE43LKvwLAEFt0WNgtmvk
	 dIjx1kPii1WGsBkxNOTsKsv3PdK56BRqBag12Ctx86hxXe8simkO9UCRLQdlmlww2s
	 ISdVEQiudx8RaKMNC7MZsVRW8swO8AniHjkIpe5dBq0GRHMFGiXz7mDAmWcJ3hpWoN
	 syYkuKwC3jeBCJPrFfwUWyzPoIodTdLBeoQ17+76pNlaaPdXIZgqoEBZtK0DF1roQj
	 DkY+OFV9T+yTw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tKyDH-000000006qx-28JG;
	Tue, 10 Dec 2024 12:15:35 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 3/3] Revert "arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers"
Date: Tue, 10 Dec 2024 12:14:44 +0100
Message-ID: <20241210111444.26240-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210111444.26240-1-johan+linaro@kernel.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit f042bc234c2e00764b8aa2c9e2f8177cdc63f664.

A recent change enabling role switching for the x1e80100 USB-C
controllers breaks UCSI and DisplayPort Alternate Mode when the
controllers are in host mode:

	ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying

As enabling OTG mode currently breaks SuperSpeed hotplug and suspend,
and with retimer (and orientation detection) support not even merged
yet, let's revert at least until we have stable host mode in mainline.

Fixes: f042bc234c2e ("arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
Link: https://lore.kernel.org/lkml/Z1gbyXk-SktGjL6-@hovoldconsulting.com/
Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 1740fdf7b1de..4c1e01605e87 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4422,8 +4422,6 @@ usb_1_ss2_dwc3: usb@a000000 {
 
 				dma-coherent;
 
-				usb-role-switch;
-
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -4677,8 +4675,6 @@ usb_1_ss0_dwc3: usb@a600000 {
 
 				dma-coherent;
 
-				usb-role-switch;
-
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -4777,8 +4773,6 @@ usb_1_ss1_dwc3: usb@a800000 {
 
 				dma-coherent;
 
-				usb-role-switch;
-
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.45.2


