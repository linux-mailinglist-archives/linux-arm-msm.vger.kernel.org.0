Return-Path: <linux-arm-msm+bounces-28526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7DE951FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 18:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 517F31F22514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4962C1B8EBA;
	Wed, 14 Aug 2024 16:20:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2E1C2331;
	Wed, 14 Aug 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652430; cv=none; b=V/6nhLK0G27Rb+ubjhpakneK4ULMC3JBbj7pUElfLLxTeVNm6NW5Hlo6wibAgS+14FxbsLncade8mD4T53fO7fWBtiL0++MMvlU4fSQAtvjHbP8miYkB59nAPAaDabK4X1kBQ+zxWU1vrl9wwyS2aDmUeexiF5x/30/NbNv9PxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652430; c=relaxed/simple;
	bh=XdnHB/yMfykm28C8Ni1jU5++lUlkJSx/OLYx5QYcAB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=teyQyFm2QEPzqVFzZ6TJSEt7QGIxnNItHb2zJO4RCUhoKjlviPBx98Dtry6icH0Jvvcv4E4hY+RqRuBBjrnwH71d03sTGtjWU6dI55N5rLHk7ow2Q+AppaEajcPfpZXfpbWL1s81BB2oJ+MFyGPHbTq5EqHbQU0cTu1Bq61C3zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id D911020998;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id C597620906;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH 0/3] Add LPASS SMMU to msm8998 DTSI
Date: Wed, 14 Aug 2024 18:20:21 +0200
Message-Id: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXZvGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0MT3ZyCxOJiXTMLs5TERDNDA7M0CyWg2oKi1LTMCrA50bG1tQAzh/H
 XVwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

A few definitions and glue code to support the DT node
describing the LPASS SMMU in qcom msm8998 SoC.

Thanks to Angelo.

---
AngeloGioacchino Del Regno (3):
      dt-bindings: clock: gcc-msm8998: Add Q6 and LPASS clocks definitions
      clk: qcom: gcc-msm8998: Add Q6 BIMC and LPASS core, ADSP SMMU clocks
      arm64: dts: qcom: msm8998: Add disabled support for LPASS iommu for Q6

 arch/arm64/boot/dts/qcom/msm8998.dtsi        | 27 ++++++++++++
 drivers/clk/qcom/gcc-msm8998.c               | 62 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h |  5 +++
 3 files changed, 94 insertions(+)
---
base-commit: 08d0fcf9db52b0ba09b07d5a0684c421d56be530
change-id: 20240814-lpass-686daa6106f8

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


