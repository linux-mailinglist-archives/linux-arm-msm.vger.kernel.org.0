Return-Path: <linux-arm-msm+bounces-51806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED0A67C13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613708817EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED96F21325D;
	Tue, 18 Mar 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vk+27UlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C31211489;
	Tue, 18 Mar 2025 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322954; cv=none; b=qOCYynXZ4Kamej/16JaTlWKbA+qnGwXe/IzcpCvoQmMC5dp7bE4sYHt3XnFnGiTTpEVzr9hvh0/3hg3FJNJgyardxWboWuonDzMPhwls6yUOSWEjVS/1qB3UYFfYSatjCFENWR9blDcOZPirHdUiCrPFD16F48n1+erj2G3e67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322954; c=relaxed/simple;
	bh=SvdNIh5/hAU5DNIjPk21oNeWxCgK+h8WJ27PmtNiYJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqA8Rh9d77Rq4vFoSb4X8z/BWWrLkRsiAHD/7V8DoIv0liRJCNxG49th9M2D9t7AeX3Tr/x/ZrtTWLAIesIhDDvhEwdKX3eifAOmXHQANdt1t2cb43/OQA9wYiIjCUdmgPRA/2MefcA9qiAfrbmLY3RYcOaycx3R18R/eiUpDEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vk+27UlD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C80C4CEDD;
	Tue, 18 Mar 2025 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322953;
	bh=SvdNIh5/hAU5DNIjPk21oNeWxCgK+h8WJ27PmtNiYJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vk+27UlDuFFzsIyzzmSkxRPKGP5d4eLQMo5hD+YuBQujSsemxOYDhIzyCvxHa/Isk
	 cwkp0Vgz6gzJnxIl1ojjKo51GucqudLcVUiF9KwXVZP7tifQnBqug1Vzpe/tUFKXxz
	 EaaT+g7xLjTT3DiFHktaqtz6DVyytgfH8rTNs3xvwURKXfh5cshdoHV22z2AVHQYke
	 5m8ZPz9tjaK+M4A3IyweQTFl0ZJu8s/9fFM/+9PPw1M6CyjC7+24m07kr7tUoCx69M
	 NSaeKD9wNHxGS/YE4LgM1Ljk3DrMO1uZlv6DKA3Qe4cPz1O6ow7veGB8LlpkyHvHoW
	 dfGUdBLVL9a+w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:18 +0100
Subject: [PATCH 5/8] arm64: dts: qcom: qcs615: Remove disallowed property
 from AOSS_QMP node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-5-cb36882ea9cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=716;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aYp1L94mjx6Y0HHxgggjyyvBMS7NPU96tXWkFzo4M0Q=;
 b=UvSxNziU9t/CUYR6uW7F9CE1zQAferqU+6f5LNptQBEutTxFRlfy5WGJyxry81bVCzJdTZtB/
 J6rhhuyvhuZBXpXkkM3wn/4hFbdAvO4HkJhePlqrcImVpPWr0Y4qA5d
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

AOSS_QMP is not allowed to be a power domain provider, remove the
associated -cells property.

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
2.48.1


