Return-Path: <linux-arm-msm+bounces-27455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22A79424DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88370285FDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB36417C60;
	Wed, 31 Jul 2024 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="turT+Ug/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A682F22;
	Wed, 31 Jul 2024 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396017; cv=none; b=XKuDb2G21Mso+xJGvqOVcei2mMTM55W9Ecjci9NeTBfACOqVAhtT0rpZvLQnly3A9SIKYVtxqTr11nR8bBrI2crO97H2rEu2UjoH+r1O2QiQDh9rmi/vg0doLTpd+tP2ag7CVnUUlXXa66RLtEYY42yEDJ0P7ZYRwSvSWKaJ3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396017; c=relaxed/simple;
	bh=hDZt6iIUDYiAN923V1UwKGNGcbxjG5lzmaD0FxmfFNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R4VfHOSam67sae0I1fR5YYEXj7Q829sDmstdpVy48CX0H4WHSUXkfHgUsQ+2MRTlvGsdGZGhkcmS44CZbg3zCNataJXeP4SPsUXPgnrqNoof6KPBCYf45lI7IU1D3aqs/S6KTobLDwt4+kN5QPS6McdtPPxG5KrBItxkDIfWFEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=turT+Ug/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E294C32782;
	Wed, 31 Jul 2024 03:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396017;
	bh=hDZt6iIUDYiAN923V1UwKGNGcbxjG5lzmaD0FxmfFNA=;
	h=From:Subject:Date:To:Cc:From;
	b=turT+Ug/FBnGiOZtQqDjjbr+TaF7gg2taYNvpZR0mRVJIUbWSZKF+jb0ud17G51PR
	 lRS/6DyL1fK4zYhYLKEzgWacvLW+MuNfOm43vlAkZqdQE8OphDC2NGg7L72N9gm86z
	 sZ81Y44GT1bvg0aqo/RcvJhZ5nGQyV2QkKUCGDRBsSXCMeTaujAlBHy5tNLc3BEBFq
	 TtUg2LeDzCDLHf+GR1Fw8V/J67ReJ38tkXrxH9YssqaG5mZ0UV4AS6IoHK8ARWFE2Q
	 45F6nYI1oOlHckckQfD3/G/YIJMeWCp8sjZT0kriBaoouZcCeY+d3iKRAMFLzdwXxB
	 LxgQPmzK8OjRA==
From: Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2 0/7] arm64: dts: qcom: sc8180x: Enable the USB multiport
 controller
Date: Tue, 30 Jul 2024 20:24:37 -0700
Message-Id: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHauqWYC/13MQQ6CMBCF4auQWTumLUWKK+9hWECZyiwo2ArBE
 O5uJXHj8n/J+zaIFJgiXLMNAi0cefQp1CkD2zf+QchdalBCaVEojdEaacSKc2xxmFBTq0rTuZK
 chHSaAjleD/Bep+45vsbwPvxFftcfVfxTi0SBF9FUQueV0rm5PWe27O3ZjgPU+75/ALuS7NCuA
 AAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=hDZt6iIUDYiAN923V1UwKGNGcbxjG5lzmaD0FxmfFNA=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HAhUhl3sNxQYkwRvuMbP2hTzu7MO7f4G2k
 3GN1MjEIRaJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVfiQ/5ARfNLoV7wFNzFwiaVzs2ULTj2CUC0qccSV9dnkk
 Wv4eDYErwEATenvdR+LlwJC+EUBNHH2voPiUJ0BzLLM3Qv//TJATN2Se4vM9P3CNr/wwvOoIyAT
 YLeEnxJlXgnHukUCeLXChAVKFy9gIlazBBsBUUtRXeuCK5Ifw3Uj/e8vdOt8jtEEiJ8rUHhP4qf
 5NOm0XBOvPtC1Wnr2gBk+LXRDSZ2lGUx4wUz0XKUSb2tVr9sZ0rS7OP9mI+d/mo/YPRK2P8GpEu
 8xe8J5rQbSWeha7f+SUl3ilFTuxEraR8JWEtBdg/NdF5qnMdAaSay7BlJ5rx9nqm3DiHEx92WiO
 GjP/VTBZU6J801TaQqss2gAg9bpdiKywKYW58X9hVghDc6BvlF33RFLB8NDtDafINZTI3U/VAkl
 TbWf5ZzciGBuWz9AWwH+8UokrnRTrF7b1XO9frl4RBK/bcipwEiMNlD2IgjqJn3heKj/QIPohp6
 OxlGZPWWS+TH+H8jmdjR7vP2D9zHi7HE79iWsKR08ti909wx1nNHy2WcveGuVwTUMv+4QLTlEc0
 XRQvqpDYlmH5JdGMBE8JpCdqUmBEB25LHRsxFqyTeBnvRYGhZ07u90rncCyfGsuTSHmxr9gncUc
 pvM3ZUsmf9m9XLc2saYQzuCuUCJ3iCaTdr+4v/kbawvY=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

The USB multiport controller found in SC8180X is used to driver the
camera in the Lenovo Flex 5G, and a couple of additional USB ports on
the Primus AUX board.

---
Changes in v2:
- Moved mp index last in DT labels
- Dropped applied PHY patches, and sent dwc3 binding update separately
- Spelled out GPIO_ACTIVE_HIGH as necessary
- Moved status last in a few nodes
- Corrected MP_PHY_PIPE_1_CLK
- Link to v1: https://lore.kernel.org/r/20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com

---
Bjorn Andersson (7):
      dt-bindings: clock: qcom: Add missing USB MP resets
      clk: qcom: gcc-sc8180x: Add missing USB MP resets
      arm64: dts: qcom: sc8180x-pmics: Add second PMC8180 GPIO
      arm64: dts: qcom: sc8180x: Align USB nodes with binding
      arm64: dts: qcom: sc8180x: Add USB MP controller and phys
      arm64: dts: qcom: sc8180x-primus: Enable the two MP USB ports
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB multiport controller

 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  34 ++++
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |  16 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  60 +++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 181 +++++++++++++++++++--
 drivers/clk/qcom/gcc-sc8180x.c                     |   4 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   4 +
 6 files changed, 285 insertions(+), 14 deletions(-)
---
base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
change-id: 20240524-sc8180x-usb-mp-4eb278df7ef1

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


