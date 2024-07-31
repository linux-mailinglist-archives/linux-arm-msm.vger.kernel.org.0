Return-Path: <linux-arm-msm+bounces-27462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8059424FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F961F24C75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27A141A8F;
	Wed, 31 Jul 2024 03:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpOe5B8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E5A3FB9F;
	Wed, 31 Jul 2024 03:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396024; cv=none; b=IoXLYXZ4pBB+oPBnYA2w9t3bKApfWeILnMSipryhCxT1EKr5OxV7SlLrYti5dO+EgyxxvW2kl5HvT7bWpbHxGCOB1MCprt+9orkrbRzMGPZOzypriW8p7rJBtDjLfjfoun6kle+QKx9AbZu5WG/quB9WnO35NZ3wfOQDL2NJOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396024; c=relaxed/simple;
	bh=8AVA6DduvcCJqMNU1iE+LembWD4Pr6ogfnghClfwP/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=me5BMANIEWOWAUZFNRkT7oWHBSxek1HPhn/NePO789dxKHxKinKtBe4ll8acCS5gHRXvKpuSotyVTdJSRWsWMWrYte+7o1I2L5dxwYj0rGy+BrAuVuLZ1NtXk7F/AS3nXhtdctztt+PKr3xsoSohA74uMtNE6l5qhovw6duzc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpOe5B8F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3AFC4AF0F;
	Wed, 31 Jul 2024 03:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396024;
	bh=8AVA6DduvcCJqMNU1iE+LembWD4Pr6ogfnghClfwP/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XpOe5B8FKGmVLFP1ftEjOCQzThZ4aBDXC+FvSZq7uef3kPf7gnVnV5e+2EvqwNNlZ
	 gu5JiytBV/J7mbcED8dEd8htb5Xj2LfhElldczLFWao88uuXRyqyX3yAY6gLvdNxXP
	 2hND+V3tQaaDk8b4mFAIcl9xa0HK4LpUx+mAwmV7aFmeCau1sFEct+BHV1OWqcg1BZ
	 QpNPAF6OgWfiLMkPK7Zv62pI06zq0dZ3QZlyllpujg8eJ1NjiGBfDeky07wbjuyEpI
	 tdGRWqTH7+Nmz3d9TGYY/tTUr+2bdNOJwEFBHZMAW5huYpRDnwLtzJRu6fahmWm+f2
	 UFqvsL9WF9hEQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:44 -0700
Subject: [PATCH v2 7/7] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable
 USB multiport controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-7-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=m9uoF6Qua65QfQVZTBm40gaW8k9GuaykuaC3tvQLyiY=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6H0HwvZV9M/fEjWVV7kRXbxdLjTGJa1o9Sg
 qyLUzKW2DmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVEeBAAmwsDsuUaqU36eOQSvxpYKBcve8GEj98lcYHjT0e
 zjZgFT7Ijgpz1gmtAQihcMu1ep7NRl3Ur5/jLbVQEXchSFEt9h+Sp8YuSVnwdeHrS8J82PB54Sn
 hm25m4e1/1SjApYcWu/MqrWBb7ZzunsvHk3YSmR6Hqx85Gj8thKRMqWXpb7WyG139+Xg96WW1QM
 VGUPvxtNxHexWPsd6+cdrA2chIts0bYVRLZmxKxpobsrWt21hZSm3fW5IpQLNa4DCRSbuh0S6iF
 hXxqQ6i2A4VXEWNdQ8UYskTG/7nz5V4ppjeMDy0wT+j+PSZMx98+14IX0/szeh++sN1ZgqExGew
 bnStR5C5i77Wuyz2DvXAInqR4yMAA6FXwoZJ0XkkcJlEPPVEA/HdpvNtk3eqvHTFwLW0zcuaFGm
 Nf7XD2MFKh8CFbiJ8unJDguvlVJ8diKL0Xs8uYLufFI02Cx0L8zBcT4H90W41vWPQHH3YGEDzVI
 JuCbeiHpa7pzO+MRRD6+9NCFUlGJe8ryP6e508la62LoIn3RyvSM1SXSZkvKMQqU1Dlaq6guJAt
 9kTjLr8PawN23hBulb4T1LgRPabSadhLCwMvfspHlhngpS09tvA3xxTbzWt0NQGSqBhcvKT3QrG
 AD3qK1v0MiLVE2ne9rl8vjrXRgQcADYqllNY+gLwlses=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The Lenovo Flex 5G has a camera attached to the multiport USB
controller, enable the controller and the four phys to enable this.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 5b226577f9d8..575a1a5ae20f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -557,6 +557,40 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
 &usb_prim_hsphy {
 	vdda-pll-supply = <&vreg_l5e_0p88>;
 	vdda18-supply = <&vreg_l12a_1p8>;

-- 
2.45.2


