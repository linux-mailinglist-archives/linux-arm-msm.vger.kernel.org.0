Return-Path: <linux-arm-msm+bounces-44802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A8A0A4DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 17:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8811889122
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 16:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724241AC43A;
	Sat, 11 Jan 2025 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkQegxqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5AA10F1;
	Sat, 11 Jan 2025 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736614475; cv=none; b=gTUbTdDOtQ9LivAk5kX2QlDrrBJYXRhHclw+agch81KqLuTsOdTGhQIQ8ypN5Gas1ZRiXnwbmJ0TYi0OSRyYWEQFmEDaEUcDzELB0mIbKa6uCU9J8r/zdRO/wkExdJuz07y86JFtufa90FPgEHLlfJwHYaqigSE1ffkihVy63tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736614475; c=relaxed/simple;
	bh=P9GAD/pKCOuF+CUuw25sTdFxTnT6AAMiC1aPs4VA7hk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EfAMIYutFAkkEvREsELxFdEgs9XPFwebawkl3LAfFqRe6XNvSVK+GoV4mp2mxknWMS9MphzKeynxQUgl17mIBIdm+aX+sTTXqEcQ9dBkibcAGULWOpxFm+KH+8Uzb7Yo7cI2jc4PMo6kToH/BcAXf7TfWzfBKJtAm+z6J+rB+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkQegxqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B046EC4CED2;
	Sat, 11 Jan 2025 16:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736614474;
	bh=P9GAD/pKCOuF+CUuw25sTdFxTnT6AAMiC1aPs4VA7hk=;
	h=From:Subject:Date:To:Cc:From;
	b=TkQegxqTP0286cwlZQXp2juI9nM1BhslGwou/OkmCcH7jz+IqJialsKwbcjcROTQx
	 8Sw0+2DAZVikkQMJg81hq3c16VQvH3SMKX2nSAMz5IIQH/xO91JZiTq0UBj7yKFCiO
	 bY9/YZMis4MIkDVGhs6wJISciHeMi5EFStF8d13LsGPeTHsAMKaNDO/PGso5yfuYWH
	 cB+QMTkQZd2Vsy6j4MkMZX3CYbrAytd+9IJRGPSFVAZt2DRuvbR1FcRjNIYCBVBk0E
	 fpsCOnPi2SX+aZmSg5N/dDPFcEAvLow84E1sEsOkshfM6oAGrkJliRsEInT623TREQ
	 IuHyEp9F3Mssw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Some X1 fixups for sleep
Date: Sat, 11 Jan 2025 17:54:17 +0100
Message-Id: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmigmcC/x2MQQqAIBAAvyJ7TnCLQPtKRJSttRcVrQjCvycdh
 2HmhUyJKcMgXkh0c+bgK2AjwB6L30nyVhla1fYKEeUZIlv5IM2OnytmaZTTnUZnUK9Qs5iomn8
 5TqV8gGYoTmIAAAA=
X-Change-ID: 20250111-topic-x1e_fixups-90f8381f918b
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736614468; l=868;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=P9GAD/pKCOuF+CUuw25sTdFxTnT6AAMiC1aPs4VA7hk=;
 b=sm8dSwe8lRx8kXCwAyZaogQlX+HaDVy+ONiHyma1WsWiuK1taLoh/MeUJl/IspqE+msFUe+xQ
 1kfxrfC2IndDHGf8iqVdS3doTLmKIB97Sqi5oS+tojSAKbPBGIkLKAi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Found some trivial things that need fixing, with patch 1 specifically
the GPU is once again functional without clk_ignore_unused.

This series DOES NOT fix all the issues related to sleep, but solves
real bugs that prevent us from achieving it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK
      arm64: dts: qcom: x1e80100: Set CPU interconnect paths as ACTIVE_ONLY

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 236 ++++++++++++++++-----------------
 drivers/clk/qcom/gcc-x1e80100.c        |  30 -----
 2 files changed, 118 insertions(+), 148 deletions(-)
---
base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
change-id: 20250111-topic-x1e_fixups-90f8381f918b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


