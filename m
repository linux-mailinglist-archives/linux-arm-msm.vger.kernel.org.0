Return-Path: <linux-arm-msm+bounces-51807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89297A67C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA73881594
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3362135B0;
	Tue, 18 Mar 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6rxiTuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81070211479;
	Tue, 18 Mar 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322958; cv=none; b=ko3WbGECVrh1CZYvxrLe85LpkxFylRHu1ZhokrQFammKGozx+7ni+4y/ODrmCHrja0OaQV5/Vnz1Lqvf76tF+bsXDZvYlwA+A+Gy3EOk03Nxd8Tf6xqL4pfcCgwuMiV3Atl85x4Pmp26FoDcu5WW6n+0XA/vDj9O8KYsLWv+7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322958; c=relaxed/simple;
	bh=ABE7hWy7CrlNhMqOX08Qee9ueCqHSUVHM/6nV1xAlog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIFj8vu+35wKZNhwD2EoFP8Il2oUsvR+hNcGdCkyaW113E+SjegWdJMp7qHnEz0kDk/DIuuOzlKbGEVTxp2hSOFF6BL/XOvjMx+jWKp4WDzhj645TGgDF3b20e1xsrnvpM3B8UlJXVud/7OHRF6BvYGT9y0Uy3Lp79ULnx90tFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6rxiTuS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE58C4CEE3;
	Tue, 18 Mar 2025 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322958;
	bh=ABE7hWy7CrlNhMqOX08Qee9ueCqHSUVHM/6nV1xAlog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y6rxiTuSxB6nDEWzvinhi5+5SzdZFiWy1js9jxhtb9EoqjwIImE43q2VgXK3EdRUK
	 LPvdVWTfOA9CNdJ/UbSEy1S9xVGTPTjx4en3d+cFpAYkOY53LDx28MPhEt2wHhYwm+
	 kq3lEYdAo1wRkVEWQL+jylNMfxRTW9JauuTtyqr980m4827S8L8OutuvlXCyvC6xBO
	 EZN8e0hLpankXY+fIQ+UrfJUfxJ+Xl4+ni7REdn6fZc98wqWIbN0Ug4m3RD4XQuoUn
	 CNsjCqGp6RzxAQ4iXGXrOiPxtLXfmmkE+Otgu+MT3ffk7Rbc5eKZU7lllSDakncUSL
	 XbXeTDeM8S/3w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:19 +0100
Subject: [PATCH 6/8] arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD
 supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-6-cb36882ea9cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=928;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=FaCT7cRPRhgFIsT2sHAU0/u0Ms58vhqY/CSFQ2nDwtg=;
 b=yTrwSAcx/ZkJo/ytzLELuXhn4nQIP9E9k99TA0wJvNRStAYSp9fAw9g1Z6A8GC1VZmlf398gC
 RmjWyBwIBvxARPi6SqmGvztvnVm5hqreoJ4Xb4GEXkua587hrQlNDMg
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the supply as required by bindings, to silence the warning:

'vdd-supply' is a required property

The value is inferred from MTP schematics, but it shouldn't change
between boards due to specific electrical characteristics.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index f1ceaedd9520c13df0f6cf086907b355264ddc80..f5558495cb02e44597591331d5d28a488b120204 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -372,6 +372,7 @@ &pm8998_resin {
 &qusb2phy {
 	status = "okay";
 
+	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };

-- 
2.48.1


