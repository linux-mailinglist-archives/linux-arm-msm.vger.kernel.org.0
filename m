Return-Path: <linux-arm-msm+bounces-51808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B642A67C1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCB419C0991
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832042144D5;
	Tue, 18 Mar 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="repjMdD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB22144CE;
	Tue, 18 Mar 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322963; cv=none; b=AyfeXWQaPsqa7toicJxc7S09MjkCpT7rm0c1/hdj8bYjbdMbzgpkJ+4k1edjpnA8W6l2CTUHKDKG7nOd4gQATOAlNVtIkOJRJxT/zO2a2JvoX4oo1bHgYdY1ka7LKigQ8dzrSTso8qQOOTB5VlRGq/NNdKlxjnzNfJ3pJDDhDh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322963; c=relaxed/simple;
	bh=Hlt6LRKJlzxrienKneH00TJlQWFoWJVdX8daEDi7uNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoAMb07DuqU1frMpgVnkGyPt51OIFMe6IBQpYepPBGTq8bWlRH3ai6VCq11h4pvmth8GoVXWP15t97j1eYwc203Dip3RaPGDJCxUywlLTd0xs8l7vEBrb11f2RtJ0kAKvJP0UKuanX/QETR/s9LBEOm5j9Wq/2F6FEE+At56uqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=repjMdD1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74C2C4CEDD;
	Tue, 18 Mar 2025 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322963;
	bh=Hlt6LRKJlzxrienKneH00TJlQWFoWJVdX8daEDi7uNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=repjMdD1c0+QfIe2FJVETukC+mS6rZhGZzVi/rFAI5Zj9t6Ry1EPQmnuxIUNj8l0E
	 UCqnAqMl87Bw6UATYbmLEMGCicsmbmuFilGaqCmlMIeT0RYk85e815Ks53Y5Qdu8y4
	 drTdUTR4Gwyy0sQAgETKKVmIE7A3x2hO7GBFRJYZusS0SyamyoKA2cWi4XcAhZ/E1c
	 u0kzWoILZIAeyHoJG+siMGu4FI8IgBWDfRfeH6bwcGRXYVSmdqbjqiQMhNVyRnAWrf
	 AFrc0cSPPr5XybtFGzlGCiOYiksBgVZA7VeZ7WZjucgERCUNGEyCv59urf2NDHVV9K
	 NdpSThWgyGBCg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:20 +0100
Subject: [PATCH 7/8] arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-7-cb36882ea9cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=784;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=5ATWyo2+USRqKgYAbZ5wtk5PbjVCWEZoYPPudQZiT9M=;
 b=IIZXh2uM9fIk3bt+VZkoG4wuyGVz4hFpjMZMvEoyLDubDAGXEbAh9knsMKu3t+UbQAw544by2
 pBfCESt5FiNCfTUw4QwcBGyfByALk5q0RvO+ThRWDPWqHNtixTFt+Oi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the supply as required by bindings, to silence the warning:

'vdd-supply' is a required property

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dts b/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
index 7c77612fb99026e42adf125c538735b3ef6e57d4..ad425267e9021174e95e7356b0b3c491fd5873aa 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
@@ -156,6 +156,7 @@ pm8005_s1: s1 { /* VDD_GFX supply */
 &qusb2phy {
 	status = "okay";
 
+	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };

-- 
2.48.1


