Return-Path: <linux-arm-msm+bounces-51809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A23DA67C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FEB419C0A20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AEC2147FC;
	Tue, 18 Mar 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAUaNLb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD72144CE;
	Tue, 18 Mar 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322968; cv=none; b=Wba9z826UMYZeq13EXK+rRIgQJvOp4z97UtU/1nbD8QonnL8E797pHA+G4c7BCSvGpLj1s19dYz7j2X5G0oeqjttpWMFSnoDLchqEwH7FBn4dVhsJqS7FS/eWb6zp6tyElqEIQ7KSL7B9mMMEKtknQGOFPLRPZLA2r/ffSdXMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322968; c=relaxed/simple;
	bh=0TL5c4/F2LfP2/9HiBcUHsXw/71RIFD+HeT4WJHriGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fy4yoqCv2/bTvK+TWaTdEFgiYmLJvvk5WkjJuKi3QcJRtd0o4+jJzxtWLIHUmKZ7u2GN+k72QqLdZ6Yq4rl0cZkcJTC7q1omof2FPAzAA6OByzyJaDHwxg9JYXQqPSylIUYWSpPTDMyh+aF/z9XMTvgpcrCtI0cyYi+xlaBR06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAUaNLb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9C0C4CEDD;
	Tue, 18 Mar 2025 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322967;
	bh=0TL5c4/F2LfP2/9HiBcUHsXw/71RIFD+HeT4WJHriGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GAUaNLb3vMmIRk2u6bol7bcO1b4/PtMOU0hNBoFdNtUTDdB2r6sepp20Vt19wdBND
	 0pTqRJzOXD/L+RTgJ4v8j8BrcMYsa6oSfjusFbBUMIVNfYTX1x7qc1AC7uYR6FF6vJ
	 eauT+fWpLOKHHGqndEFLl1156uE0+EiSsQf3+dgQs0Io/isY0uKa1mxkDWQfbLEWY+
	 T7mrObCtCD9KQdD8XK/gdTjWSxpGL/PInNCy6e2UyEwwjrwPoe4bRYtZrTod6wdp9H
	 VEB3hkhnweF/uTxkG1cZWkahchm2r4M96R9Ssqcd0kTBYwu2pAdP/ysPXNpflC5ZiC
	 qoyMU3E+CgFVw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:21 +0100
Subject: [PATCH 8/8] arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD
 supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-8-cb36882ea9cc@oss.qualcomm.com>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=970;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=dC2jEsfN9bBWEvSA1LOnhWyfC6YBmMM7GtAk2EOkUzs=;
 b=0skw9UrTkXBBQ7RExySa5KY52xR5kOURlFe8yXLLtYORf6TRxWt41u2NP4bL2xxsXomD00h9d
 K2fKI+PQNx0DcfOHo1PqcR9rSSBYbtsjYjw9w8vIFrtIF2kA73TmAHs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the supply as required by bindings, to silence the warning:

'vdd-supply' is a required property

The value is inferred from MTP schematics, but it shouldn't change
between boards due to specific electrical characteristics.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index d8cc0d729e99c5ead32f38c12bf65a930d369c08..3650f2501886bdde23c500bf5fce205de33fccc4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -450,6 +450,7 @@ led@5 {
 &qusb2phy {
 	status = "okay";
 
+	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };

-- 
2.48.1


