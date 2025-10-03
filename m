Return-Path: <linux-arm-msm+bounces-75933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E140BB7D9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 20:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD93A347C25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 18:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B572DC760;
	Fri,  3 Oct 2025 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyFwhJJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB215853B;
	Fri,  3 Oct 2025 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759515285; cv=none; b=KgPYISeWEQUs7ZBUcNpsEmIN9gHLu+MTHt6+aa5bI+jtq/ZDwgXj8u0GuPsEfPTRkYYPqZOoaGXlB/0gCFohRGMK5YCAB8qPFBjzGOuRb20rvWGHgyxj4M0mRwleqh81VyBy9Ga8C3ucpPdp5crIN3qChj9PLCvvTZWJZa4RTzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759515285; c=relaxed/simple;
	bh=XXdxeHrU+YWXFpdyjlD6M54EPxUSWpZWQmeLUa/FFmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NQXjyZEjyxmG+1dNC6En0Cg2Mbvw+wXOwrPPKXQdpFIVPy+oqF0TwOxxvRt7sxR9W60l5nOexMKPS90bJt2hYjPB4Yw4zcCaGLTnluIPvI9aBxUvQo1CNAEArZ9mC7a4UScVSxG2rqicFDT7EQT6KFB9ryXJcZLQsu0DICqWb/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyFwhJJ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98EDC4CEF5;
	Fri,  3 Oct 2025 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759515284;
	bh=XXdxeHrU+YWXFpdyjlD6M54EPxUSWpZWQmeLUa/FFmM=;
	h=From:Subject:Date:To:Cc:From;
	b=hyFwhJJ64etju9clNr5vNGQQUTD9xDZYiMbZS2p90z6vtlEcD8XC8u/kT2hGDEcWg
	 XBcMMOQPQwp1TJo9C5WV/8H+MfyhxoVpka0FH/xEVLwxcpEbI6wDs63k+nVM7GIK+0
	 9xer7KgIvTHGenk/gMKqatdPL/xDOPha4bRAfa9ue67urDgXqubvth6eDDyGto1rFU
	 lJ1iH1ANVoCUz6bKqFZSMBJVcEVpCsdqckn05SVMJ6+JX4KNIiX5kT3sReRbBdlLrb
	 yIY28Sn1k+6MOAwbM6/ao8OfgizKI8IFS8d3LDGjo8321xPxzuaLw1dXEKcD1/5Fge
	 KBoHdnX4JmPYw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/3] X1E GCC USB4 clock fix-ups
Date: Fri, 03 Oct 2025 20:14:37 +0200
Message-Id: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0S4GgC/4WNQQ6CMBREr0L+2pK2FhBX3sMQ0pYKPxGK/UA0p
 He3cgE3k7xJ5s0O5AI6gmu2Q3AbEvopgTxlYAc99Y5hlxgklwWvZckWP6Nlgx69bntr25WMYuf
 CmbJSwgglIE3n4B74PrT3JvGAtPjwOV428Wv/CDfBOJOF1Z2oOL/I+uaJ8teqn9aPY54CmhjjF
 yu6NoW/AAAA
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759515280; l=1205;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XXdxeHrU+YWXFpdyjlD6M54EPxUSWpZWQmeLUa/FFmM=;
 b=Ogm8m2yk83h+Q9YYpIEebdjvwyu2T5AGK46nP7VUqccT2Md7A5nZqip+ciIWW6b4maeEpyb4I
 taIOlg9J2cBCxIy/0WRc8T65jnQd2AcpnGpsOn6iE/nUSWqzpErgV/V
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some of the USB4 clock infrastructure has been left undescribed.

Following the example of Glymur, add all the required muxes and resets.

These changes have passed a smoke test with their intended usecase.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- pick up tags
- get rid of uncaught unused declarations
- Link to v1: https://lore.kernel.org/r/20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com

---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/resets
      clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
      arm64: dts: qcom: x1e80100: Extend the gcc input clock list

 .../bindings/clock/qcom,x1e80100-gcc.yaml          |  62 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  29 +-
 drivers/clk/qcom/gcc-x1e80100.c                    | 698 ++++++++++++++++++++-
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  61 ++
 4 files changed, 828 insertions(+), 22 deletions(-)
---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250926-topic-hamoa_gcc_usb4-35eb6741b141

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


