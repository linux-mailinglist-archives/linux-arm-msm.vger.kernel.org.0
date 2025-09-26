Return-Path: <linux-arm-msm+bounces-75307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE1BA3908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EC21BC77B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1C52EB5B7;
	Fri, 26 Sep 2025 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMRkldRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B522EAB64;
	Fri, 26 Sep 2025 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888234; cv=none; b=NY3fXNjcDbUJXOVH6u0fJETKmHrvEIYEA1GB5Qc3IKeYqB7g+eDxUHS5Jr5c96bw0NQt1hTNp3QF3cDsFeqx8aROQ5J+jucOajgzvl+TMoednSPStqeaR+R6mwYSXOAroXxYOl+UnAIomb6eusbYX8n3CF2JdxdF+a/r0zFqCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888234; c=relaxed/simple;
	bh=DH4YjpeeCY49J44oUMq5VGmGqY68Y7NEJy0jWx3b1gI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wcx2luQDTuHSVc2tTlItwj9P995wO2o2k4InIku86NLhj8Zmxh3xbVAWo9IMMIsAgcMm37QF8BfNGbZ24Oc4Kz88FZ41/0U0YvhgGOxEMAFYfepMwvnTAHEPuycAFCwd0bLLe9uVuMiII1NN+/RqgCXhisS1jhWkT3+ZLRR/h0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMRkldRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0DEC4CEF4;
	Fri, 26 Sep 2025 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758888233;
	bh=DH4YjpeeCY49J44oUMq5VGmGqY68Y7NEJy0jWx3b1gI=;
	h=From:Subject:Date:To:Cc:From;
	b=cMRkldRZSoCaC7sd52JbufVJueLvM2qYUtEyD335inVD5jnLwZFC6AKGzLfS/ABPe
	 4SrBSTPPNi/Wnl2Y1x35hNEIGRFmTquMBhw2u5TUS0Msi3hAYWP7XMzDVkA6SNaPuF
	 XdprY+PDYuz6nFDiEBLeZqB3+i3mx3XzLnjX/6SFLLfRt/Q/fWUKzCPDLvD78ksve5
	 lBYVEOmlk/YfbaisS5FBPqh1frI3hzffth6G3oYi9bFLI7ETFFbGSBpEJuokHVq25C
	 BLJfiaswmTm4fV+0wWWdWJ9gz+GVHbAQQqk2A1qu+VcrK32zpbuEMuzbCeWKQ5MTSi
	 kNxNpIhSILBbA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] X1E GCC USB4 clock fix-ups
Date: Fri, 26 Sep 2025 14:03:44 +0200
Message-Id: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCB1mgC/x3MQQqAIBBA0avErBPS1KirRIjaVLMoQyuC6O5Jy
 7f4/4GEkTBBVzwQ8aJEYcvgZQF+sduMjMZsEJVQVSs0O8JOni12DdbM3pszOclqhU43kjsuOeR
 0jzjR/W/74X0/mTzFzmYAAAA=
X-Change-ID: 20250926-topic-hamoa_gcc_usb4-35eb6741b141
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758888227; l=1017;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DH4YjpeeCY49J44oUMq5VGmGqY68Y7NEJy0jWx3b1gI=;
 b=jH/ohMJ96DqjpZL0s0c2JeVwXFcaw5GI+UWuB9TBS+xTJWp9Kzmaj6R1oY1g2slDd6U6RpS4P
 VS6lrfwLiakBePiIRwKYLMVUxebaR++eFyTPXBtRQjIvwwQjUvctnDH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some of the USB4 clock infrastructure has been left undescribed.

Following the example of Glymur, add all the required muxes and resets.

These changes have passed a smoke test with their intended usecase.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/resets
      clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
      arm64: dts: qcom: x1e80100: Extend the gcc input clock list

 .../bindings/clock/qcom,x1e80100-gcc.yaml          |  62 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  29 +-
 drivers/clk/qcom/gcc-x1e80100.c                    | 803 ++++++++++++++++++++-
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  61 ++
 4 files changed, 933 insertions(+), 22 deletions(-)
---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250926-topic-hamoa_gcc_usb4-35eb6741b141

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


