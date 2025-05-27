Return-Path: <linux-arm-msm+bounces-59605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED3AC5AA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C5C7AEF88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478452882C6;
	Tue, 27 May 2025 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNPlRIDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18416280032;
	Tue, 27 May 2025 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373986; cv=none; b=kc5V1QmIVHVpKubYswFb+1e0jPNdoj6SbJnqXUmaBU67JAgXtAZWKd5TjQjPy2nebXZGvrcupQ/fTQuCMFzPZOIMKyunEDeNgeQpX9kx7XOGDkFBTKb3KLwVNcm2UOD4ycIO2hnGAA50o+yxReyPfoEOLBjKC3xMB3bWzT3oR4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373986; c=relaxed/simple;
	bh=wxxzpr4oeQlm7FlnRlxfORGC3AGke6PKYA+rki93ZvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GWRQq4B2s3zZMs/SA1cJab6O7IuiPpZRXd9bLiTimLkoolY5Ekc0gHC62Ku0YRy0E1pZlQCObhR0H4ipOFYLbkHGFj3CL/Kllh3x+7FHiNu/Gqg27o1x7pmxgLlJB3wLdHDayp3D3haRSXVIj/fZWOXLvVSS9c/HOjuyViB6CII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNPlRIDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373AAC4CEE9;
	Tue, 27 May 2025 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373985;
	bh=wxxzpr4oeQlm7FlnRlxfORGC3AGke6PKYA+rki93ZvM=;
	h=From:Date:Subject:To:Cc:From;
	b=iNPlRIDbdkd2UKfpSw+GAxr3qwiSGwxjCbsAkuvxznR1h60whX44jw2sMpNNmM4p1
	 opZb7jzwzlIKVdS0n+iIS/p36n/hRt3JIVLB88XqdFNVgppPjjCavZ7xfLjv71i1iF
	 by4Qmf8+M8aZuogFNVp+twATSbRBxBuLLl9mjiWhmZmpCy42kDvTB37mcS4GiY95nm
	 G77YyfmEhk1d8gFjL3X8w1PHKD1ufOPXhH/M0/Uoxd4sWlfrMVYITEKPoLlF0qLMKa
	 YtjB+bjrXUSXbjV36C9XxJEVDapd01TVbnghRtkek3JDrPBSVp28XMB196lLIn7u4C
	 UrBh7axs0dn7w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 21:26:17 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add interconnect to primary
 USB3 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANgRNmgC/x3MQQqAIBBA0avIrBNUirCrREhOY82mQisC8e5Jy
 7f4P0OiyJRgEBkiPZz42Ct0IwC3eV9J8lINRplOdaaX13EyyleTu5N3jCjnYLVtVe/RBqjdGSn
 w+z/HqZQPb4HfqGMAAAA=
X-Change-ID: 20250527-topic-x1e_usb_icc-af919407bc9f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748373981; l=1206;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=VPun6KAdJnS704Cwnd6sd6OzLPcRo2lwG8HdrSusiVo=;
 b=7dEO54WUYtoPp0pW5G3wTqiCd2Wu+nmZ70jun5nQfSvZ3pMLAyWUDqnxeuV/whCBDN7huYUIk
 yUZdh7WyzCLC29SBTlj6r/c+Xb0jJOsLRbT+KW5JZNfIMp53yTZwyda
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This seems to have been omitted during the initial bringup.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..76aa966a16a5383e7252a19e7d52fde3a998b143 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5014,6 +5014,13 @@ usb_1_ss0: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&usb_south_anoc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			wakeup-source;
 
 			#address-cells = <2>;

---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250527-topic-x1e_usb_icc-af919407bc9f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


