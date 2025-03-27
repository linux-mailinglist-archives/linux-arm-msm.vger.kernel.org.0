Return-Path: <linux-arm-msm+bounces-52574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E92A72857
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70D94189CEA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E95198E91;
	Thu, 27 Mar 2025 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MP8FzOcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6AE14A0B7;
	Thu, 27 Mar 2025 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040075; cv=none; b=Ntz5x5EsT35QP1jj/rK5sV4S+txpTGyReX3OvLWe24T+bUI/kTVDvxNtrev8S7dr/8DiBg7ZlcSE/Db4DQSRaFS+sC5Hhp/FcznSzd1mFQ7FjHZoKvNavs3zCVhhdiirkre9vO8ynHglGZg3XnpJ0NiN69EP+LgQ9TAkNx7z698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040075; c=relaxed/simple;
	bh=XHhkEIgUVrZKP/3ryWaQAFJqUi2noMTzMyRE/zlOr0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqfD1LQMTKnNykijMBjwrlD6ir+kbnaEndEmuzuPWgHXbxgGuEo2KxV91EH6hBuI1WuLv9nTg7tXSpiZs9rFgK1Exbj70VOwJW+I4TyOU7y56o/DRJR9I08q+LSIQMh1jXBITIAIgN9NT2ckyjDzorfbKFtklumNMthdiF4nXr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MP8FzOcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C361C4CEF1;
	Thu, 27 Mar 2025 01:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040075;
	bh=XHhkEIgUVrZKP/3ryWaQAFJqUi2noMTzMyRE/zlOr0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MP8FzOcrRvGkzTUYzxmQ2ZxRTzY6mI4wzWI1eMC7Ln+4IyB9EMjm/aQUoAdd5OAla
	 j2Z9n8QbnIGUeoyAXbGdPNdh+5pXERy6sp15sbR8tzCSs1S6zf0Cn6vD4QuE4Zk91F
	 DbAqajw6eAPBVErXIGlAED4vOIApmMYMiZvmotxWs4vQn4e5gyBK5NU+13q1VkusiL
	 o0/jBEKlLfhtCqXVn0XIbRL6VpEEX5Y1csmezHjoqjjD5dVtxoO2RjUDOqQIbep7b7
	 /wY0YPZ5e8wNtyHSNeS7dQW6SyXgRPRVV6y7wbFMjaQ/ciHL1dPaV/2oik/EWZPxP/
	 ixQ0HCifgqVAw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:10 +0100
Subject: [PATCH v2 08/12] arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY
 VDD supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-8-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=1037;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2bkUL8LT8pjwAi6XMds2FZeBUNoLAcwslGr+W3ET7Y8=;
 b=rWdC9HY0K6ZbpB0/Wt42TcwPuTBbLL7bJx6Ayc3k5jfx6SBCm4p0bcvYIh6dU55AyZyDi/+FK
 kO65bVGtpsNA89w8FDZ0NFHGZXHiarsUK1zKm6A2e2yCxfqDa5//RTT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the supply as required by bindings, to silence the warning:

'vdd-supply' is a required property

The value is inferred from MTP schematics, but it shouldn't change
between boards due to specific electrical characteristics.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.49.0


