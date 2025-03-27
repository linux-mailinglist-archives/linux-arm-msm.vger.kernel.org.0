Return-Path: <linux-arm-msm+bounces-52566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C5FA72837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F37189A059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1D63597A;
	Thu, 27 Mar 2025 01:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0+5etIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5582E3392;
	Thu, 27 Mar 2025 01:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040033; cv=none; b=GKITAmLqtutvQnj8NjQ/qEdurr7GDY1Fri+QFgxRhm7qnI8e6zmSDDrSJeo7wyHRWEkMGiuI9mBXrkeojjCzNObPgD9dckQtp05X+FeGou0XYrxORH5UVHNzh5+cEb4M5fOZKhZnjkGFh8QZRSkuENz+3IwE+nYPgB+VzMk7JVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040033; c=relaxed/simple;
	bh=gDv4EjDZM6idD7UsAdcbUpvFhV6136B9/fnEJQhqUsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A1QEzLA91rWcqJv4Ntgmq/LOqAO+GL0fmztZ1jt5Q6mP+ulLqfVaTFXZbaMM8tZJeAhBKbZLht9A7/hf5ZKobCEUY42X8Scjli/3Kv72Vafw9JJ6RHmbXfEqUvn3tNA7WQ627l6bxqoO1jwjKn895pOFw/UhHAQQVhSWlscycX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0+5etIV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10C4C4CEE2;
	Thu, 27 Mar 2025 01:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040033;
	bh=gDv4EjDZM6idD7UsAdcbUpvFhV6136B9/fnEJQhqUsk=;
	h=From:Subject:Date:To:Cc:From;
	b=s0+5etIVQarNxjY6XxcXjAvLk2E8KNtbTQNoqXSdwObR1iQZf5MT+NKLhH0KDWA6B
	 posqysP+dtHziCz+8/R2LRRIbKIYhq3Hq7IMYBmZmVyIwnpXJoR+o9Exu36uHobkk5
	 d+EM5DyvdDd6yIqbPpUvtiOIKBtvXgALg7FBe57xbIJPa9TdbHs9A/ABldziQL6bMI
	 Wom4Cv9Y5P0Hf3wD/ak/IE3M2lIODOBROOUe4s6d1UW09uFnTxjS2lE3r7cQro3YgI
	 H3QK2dFhRof04jIPxIw7FaHD+pM59qno5sMY9YPRRrmokM+2VCUEmSben2w44SOWtc
	 2esWG5S/EiRGA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 00/12] More more dt-bindings fixes for arm64/qcom
Date: Thu, 27 Mar 2025 02:47:02 +0100
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeu5GcC/42NUQqDMBBEryL73YhJaKv98h5FgiarLtTEZq20i
 Hdv6gn6M/Bm4M0GjJGQ4ZZtEHElpuATqFMGdmz9gIJcYlCFOhdalmIJM1kxhYjGLaYj78gPbHp
 6Iwupr+gkoqp6B0kxRzyGZLg3iUfiJcTP8bbKX/uneJWiELbTl7JU2FbW1oE5f77ahw3TlKeAZ
 t/3L0R4nCrPAAAA
X-Change-ID: 20250318-topic-more_dt_bindings_fixes-137ed1ee29fd
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=2191;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gDv4EjDZM6idD7UsAdcbUpvFhV6136B9/fnEJQhqUsk=;
 b=NAjgN2EiJrO9Og6G7WgxnWmtmD5N/liTfwvC6F4oIdV+UkENC/2TQDL1HVHkgTHLqTCss9EkW
 30wbK0NpMU0D5Xnd/Z+jtGiivi9RALXB1Z5b6Pt/NT+gJs1NrXSMpGB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Just some routine stuff, really

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Iron out the YAML changes (indentation adjustment)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com

---
Konrad Dybcio (12):
      dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains requirement
      arm64: dts: qcom: sc7180: Add specific APPS RSC compatible
      arm64: dts: qcom: sdm845: Add specific APPS RSC compatible
      arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy phandle argument
      arm64: dts: qcom: qcs615: Remove disallowed property from AOSS_QMP node
      arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD supply
      arm64: dts: qcom: sm6350-pdx213: Wire up USB regulators
      arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX
      arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
      arm64: dts: qcom: qcs615: Fix up UFS clocks

 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 24 ++++++++++++++++++++--
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  5 +++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |  2 ++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |  2 ++
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  1 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |  1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 17 ++++++++-------
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  7 ++++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  2 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |  7 +++++++
 13 files changed, 56 insertions(+), 17 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-topic-more_dt_bindings_fixes-137ed1ee29fd

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


