Return-Path: <linux-arm-msm+bounces-52573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43038A7284E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8291885156
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C73148857;
	Thu, 27 Mar 2025 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StWEfqRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6E76026;
	Thu, 27 Mar 2025 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040070; cv=none; b=kU4fvziZVqesnvttQE9YXPm5dXlwrLnF642Re1IA7NwHtHqBXGMVy3YrzMmfiFti6YPEPXIgXoXWswzTLkR2KpBB36yc5dYmvPq/dp+jBK/JZc4o7S6jFjn0xvIQKVsbghrGWsWV37watNByLZGBCuNLasKYw2AC6v5oSTH2NcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040070; c=relaxed/simple;
	bh=s+MMtWuU9WzFX2FSX/8k6JVcWUB4fq19wlaM8PLCMOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pObz6JThI+2DKsAhnsFYHBfzGPWaA2vjCUSvjuOyhetjSlmYQUMiNtB+RaLhH4VW3S0RHI0Xtmawkr7gytzpuCo0umqV+dIjjNKLAp6BLk4jtRaWp3JJsHOzm4L/6ySwNkaMBvl9qLrqEG9qJOKozuia1tCPO4/Ghdz6f49H+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StWEfqRJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3498BC4CEEE;
	Thu, 27 Mar 2025 01:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040070;
	bh=s+MMtWuU9WzFX2FSX/8k6JVcWUB4fq19wlaM8PLCMOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=StWEfqRJtgZjrM7lcTilUV1/GNRAp6KlgdevYkuBQ+/TvBRzN8Zb8yBs7ijiuKok8
	 42/sn3ETl1Pfu2WjgkkYyRBRlJK01DJsFvULbElxzzv27qEsMKRM9ZOzVHsdv/2OgC
	 e6aeNIEUmB2tWqOjwux6vxQ3TWL/rsyr/vH5cRQ9faab002KG4C9/MRNqVaEdxrmtw
	 gt9WUe1Tresfd9F0YDCv88LNt3Ej+H1/s95YXJbDbzN60maKSFIvYBc6pQEmL+ToL4
	 q4egiY4duBptZMrx0QhPZER7oB1yOg8GLToRpZQ89vNWNcb7htw2QsAnyVA91SFTQd
	 AU4rEwKtHnP4w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:09 +0100
Subject: [PATCH v2 07/12] arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD
 supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-7-b763d958545f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=851;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zo5bkmAwR0UxA4O6AtT5zwF3RS8CkC8Vu+9e879c2uA=;
 b=SibRReKE89dkq/SCdWKbWanvppmcOUG3ULHcRygiIWDlyoKYcz2gVkjXxKGRrwue/6nZKm+V3
 FvXhk+q2DazCAatMqEongjysu+YxVqjWj/5Fw14QlmYhI7N0cEduUxI
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the supply as required by bindings, to silence the warning:

'vdd-supply' is a required property

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.49.0


