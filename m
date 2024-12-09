Return-Path: <linux-arm-msm+bounces-41026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4079E9208
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61A482824CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502B7219EB0;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0Lscgoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFE8218AB3;
	Mon,  9 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743237; cv=none; b=KGhODpnNYOzsMDuaqLhLj4v2gVUR8RlS5El3JFv0gOmJFBRFgVpkrG8yPeINHHGNzvuZfzSaflQAW43XCEmOO7BhieYvwiP1/uZqT97PEL5t63mh3UN2xW/SRkkPO034pQmNNflKTZJhy0rsms+qkd4MBwDsT5+HoBuNGDRu6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743237; c=relaxed/simple;
	bh=jdcd1UtGAai1fWkfFvIjFbaFosjgIwsdkMA1Odz4TBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPRBWfhVYtUcytWG6y8HR6V2jEQ/PVSpW6g81E7UGxlhlSW/1m/ixuNbvXNyvumA8Po/sP6JlU5aIgY47KT24W5fMy1CFkKlGa1LfpTi6K23YFZZtmhjJtxpNnGB/pTdEskFyOKB3YE1PaQt12diobBmw4SVhH3iH+YCy+OwEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0Lscgoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB01C4CEDD;
	Mon,  9 Dec 2024 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733743237;
	bh=jdcd1UtGAai1fWkfFvIjFbaFosjgIwsdkMA1Odz4TBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0LscgoaFrzmcDQc6z0pmtB0o5RcdyPbQ/M/e2tKRkK1zib4mVVmgZdCkuC6noN+3
	 QAHyeGlrLpvkpiApoNC4vU4cjnQY/Tf1dgtespTGkeETpIuk9xwm4t1e50wgTuwOmy
	 DEYm6liwPm7eT3VwyhLcyvllQoeWDLgzEsqR/JusE2cxAE+44fEE6p49q+bPDYBJA8
	 LZN6tgjfGSDBp2u5/7bcaRhraKYvUyuK6Okkx+S26GEIBHgZcd2U+qzrlBLbQ6ZWjo
	 P8L/dtHgVw/V32Sr7hgbNAT0I0Rri8Pnj7HofXjUEPPG0KzddxJiF+E6lbybZu7c0/
	 jBz3Ux4EcF+cQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tKboc-0000000086D-2ec0;
	Mon, 09 Dec 2024 12:20:38 +0100
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
Subject: [PATCH v2 2/2] Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
Date: Mon,  9 Dec 2024 12:19:05 +0100
Message-ID: <20241209111905.31017-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209111905.31017-1-johan+linaro@kernel.org>
References: <20241209111905.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2dd3250191bcfe93b0c9da46624af830310400a7.

A recent change enabling OTG mode on the x1e81000 CRD breaks suspend.
Specifically, the device hard resets during resume if suspended with all
controllers in device mode (i.e. no USB device connected).

The corresponding change on the T14s also led to SuperSpeed hotplugs not
being detected.

With retimer (and orientation detection) support not even merged yet,
let's revert at least until we have stable host mode in mainline.

Fixes: 2dd3250191bc ("arm64: dts: qcom: x1e80100-crd: enable otg on usb ports")
Reported-by: Abel Vesa <abel.vesa@linaro.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 199f6b42aa11..66360390ae7d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1840,6 +1840,10 @@ &usb_1_ss0 {
 	status = "okay";
 };
 
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
@@ -1868,6 +1872,10 @@ &usb_1_ss1 {
 	status = "okay";
 };
 
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+};
+
 &usb_1_ss1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
 };
@@ -1896,6 +1904,10 @@ &usb_1_ss2 {
 	status = "okay";
 };
 
+&usb_1_ss2_dwc3 {
+	dr_mode = "host";
+};
+
 &usb_1_ss2_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss2_hs_in>;
 };
-- 
2.45.2


