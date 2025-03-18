Return-Path: <linux-arm-msm+bounces-51801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E362AA67C01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF0F67AAF77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4A41F4167;
	Tue, 18 Mar 2025 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMed8eiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2D151990;
	Tue, 18 Mar 2025 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322930; cv=none; b=l7vJemeTvcdCCUQVuekKCaei9h3FrggOsCjHyE7aM7HDERoxs+6An58YP73v5z/q11O4K9Al+RUoKQDvn4BwptMFPn2k5TY2dQfHhLzGgvMLcRnAFPjMhmrSi7ljnEKhMXV6gh8O1+xiRmdfM+eUNAq/O4Z4v3rzh0jl1pwp1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322930; c=relaxed/simple;
	bh=eXtDFdtsvd3ys0IxX4fueVDJob9FRzlLwnSqpAlUv94=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjtyR15aMLeSGVFs6Mssr6/8clL8kqB5KpPjr0rIZq3yW8GhhbrqrNm94nEIkHkr30hBIe4k7TX3fjL9MftNSE69iVFp9l9aEFaBDTBoQemeXuSlRJlM39jH3u2lG/VsuNm7QJZr0FG2hQb4pygNtn2yf56jx4vdYI7kjfaLSLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMed8eiT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661E7C4CEDD;
	Tue, 18 Mar 2025 18:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322929;
	bh=eXtDFdtsvd3ys0IxX4fueVDJob9FRzlLwnSqpAlUv94=;
	h=From:Subject:Date:To:Cc:From;
	b=tMed8eiTGUTprLrgaGB9nK74sObuZ5CKlfRaA9ZOm5OJBl3KmakJBbw0fHblnbt6N
	 YsIVdH3gCyMxe4L7fLTS/h5QtYvNO5HAWUZifaGhyrrWqENhtjZFnKmFejLoBNcY2g
	 D2PI3JFaN+wqS/dRdPy4VHPlBO9D+/STirnsroLUsJdOZvXtfgVtXAe8sAars+UuzA
	 zNbdYC4wNPAI6iyits39tpRG9L7UmIKIpVEjVcL6gitFAOudfWh0IKQcpUwmbH4t/R
	 3jXWEyie+j95IgFM40UlKrIefk4A8fybO9RutlW3qiMYXMVUnsgmfvkaoPi9n8LNt7
	 QMkCBwCCHYaTw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/8] More more dt-bindings fixes for arm64/qcom
Date: Tue, 18 Mar 2025 19:35:13 +0100
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOG82WcC/x3MQQqDMBBG4avIrBswEVF7lVKCOn/iLJpIRkpBv
 HuDy48H7yRFESg9m5MKvqKSU4V9NLRuc4owwtXkWte3nR3NkXdZzScXeD78IoklRfVBflBjuwF
 sATcFprrYC+5QD6/3df0BbXOhM24AAAA=
X-Change-ID: 20250318-topic-more_dt_bindings_fixes-137ed1ee29fd
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=1421;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eXtDFdtsvd3ys0IxX4fueVDJob9FRzlLwnSqpAlUv94=;
 b=w+WsvPOSfIxhjf5POB85wf9CWtiQtw4DJZw9zjJmYDm44EBV4wSCsMpxqXi2A7EtN0yGJuxRj
 pR5eZcpxebZAQMcor+5nxPxtOkuTRRcXh7ycH1J0LyazN0GIJiD5lK4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Just some routine stuff, really

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (8):
      dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains requirement
      arm64: dts: qcom: sc7180: Add specific APPS RSC compatible
      arm64: dts: qcom: sdm845: Add specific APPS RSC compatible
      arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy phandle argument
      arm64: dts: qcom: qcs615: Remove disallowed property from AOSS_QMP node
      arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD supply

 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 24 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  1 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |  1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |  1 -
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  2 +-
 8 files changed, 28 insertions(+), 6 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-topic-more_dt_bindings_fixes-137ed1ee29fd

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


