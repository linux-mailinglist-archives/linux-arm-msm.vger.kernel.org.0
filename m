Return-Path: <linux-arm-msm+bounces-52571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B762A7284D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9191F3BF4C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D133013C908;
	Thu, 27 Mar 2025 01:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbSbV0eK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C1165F16;
	Thu, 27 Mar 2025 01:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040060; cv=none; b=H8GSh3tj+K9m8XJFygxTy3wc3nzm0uPAFrcH5+67G2YWsnNnpD+12qlkJdVLmM/enB7jRtqjjwgs59gunqYwsSKT1i0sqxh2iH40BdCS9yLHefVXrNNJQe+yfsRa3wU7CINW8A8shbjkC1c8qeFE8EqXOJAy0b2dghAcxn8V3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040060; c=relaxed/simple;
	bh=hXd3q3TzqgaJjlXCre00BXanjt1oWdAhduFmPhgtcok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLeBceCNeiLxyl2En45lSabyilYq9X1YVkX+XdIeaeBtZD7pWOGopgWiAlldAABB1SGxKHGDYdcKsWULrRJU/v6D6Njll0aza3icV1GQwnHGdZ8dUognJ7br4BzxpZzsUClWJoeSUpS8XNtKNbZ7oJofplUGwzwOI7iNyRYnaqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbSbV0eK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF1FC4CEEA;
	Thu, 27 Mar 2025 01:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040060;
	bh=hXd3q3TzqgaJjlXCre00BXanjt1oWdAhduFmPhgtcok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fbSbV0eKSHtEfntwXMp4AFzaXuc8CwHj3x3PTOJiqk8qcT1zkaPqAjB83y+FJYR0t
	 aY+MY6eieGE4MRR6B1Idrj/sLG1Pk7vzf7y5l9M51LuAwfaZ4jQYNEZq2JgTGJHWQn
	 US2PYMs5thY8kq2Chod0WgT2Mk3Bl7gEiVgx+9PpLvDFvEQHB5LfnDVLdkxXUa6MMy
	 rAJPQhFgpE2GuLdh3GJ9qkV/GXs7nNfwq8x6LtyqptIck1SIpszNOEqI8GRwZhppfH
	 SJu9MKC52vrQRmIK3ZRw1IO9btedVUBCzv+wrcIkrl5M5Y4wCBAVP71nWyeEkaHlY4
	 aVeR63ZxTMgcQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:07 +0100
Subject: [PATCH v2 05/12] arm64: dts: qcom: qcs615: Remove disallowed
 property from AOSS_QMP node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-5-b763d958545f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=783;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=HBatne6c0DFu6JCLfSJ42gkRHZzwWf/heiK1f5RMXAc=;
 b=X9yoAWe27CoPDQAF7W1Vusq+pfklyFg1mtVNSdZPId7A6q6YwHKwHL21szgGtfnelz9K+8NLE
 8LiPy/8icBZCPktII6G4HuRg+MtIx0wszoAlr9lESRev7nayltFxhXy
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

AOSS_QMP is not allowed to be a power domain provider, remove the
associated -cells property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index edfb796d8dd38f5d65fd4327308fb5ac52d2b95e..757b45a142136c01ac74bfa456f90374c3a7acfb 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3215,7 +3215,6 @@ aoss_qmp: power-management@c300000 {
 			mboxes = <&apss_shared 0>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 		};
 
 		sram@c3f0000 {

-- 
2.49.0


