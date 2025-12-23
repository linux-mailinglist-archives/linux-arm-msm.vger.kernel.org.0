Return-Path: <linux-arm-msm+bounces-86402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6967CDA2BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93BF330115D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B540346E42;
	Tue, 23 Dec 2025 17:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/xtCSU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178EA2701CF;
	Tue, 23 Dec 2025 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511913; cv=none; b=VBKYoMh8wt2HqRfIuT/ONq//Fw4QYBue5HXzB/QCEPkYKFEtdZpge1DgBpvgJj+IU4aBTkqehySlLPmH3Pu1dXRIUUPGMzUNnEViKG0KX7bGohOve0540i4TpsQtgbKIHiUTRDhAUha44f8GfW7nPsMVxwN8VF3P/l03+6IIHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511913; c=relaxed/simple;
	bh=Fp74yWwB0EL3oH6IPXUmyxxgfVxbhxLvcA5X9IqTBa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qUtgtd245IAAUcu6E6Ao8shqkV6Akevts+KTXNL5ihw5M7bYihmww5HN0npYi5o4ClUM7k9RpRRVR4n6U77dnKVSTvZFnwRykf2WET3iSXkYTkHKty0rVk/vyi7b4mD/ue7bNSveJe08wsOfYS6J85UkPIzrRdbH4pAHerjwxfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/xtCSU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1040C19421;
	Tue, 23 Dec 2025 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511911;
	bh=Fp74yWwB0EL3oH6IPXUmyxxgfVxbhxLvcA5X9IqTBa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q/xtCSU0WBdYo290s9OJ4gg0vUURad0KXkqk2QKqkamz84YEETLMwajEYwJ4007ru
	 MJVJ2QxPAbnuWV0K73kknyuU3FuUeeJgKWKe+lnid7rH7Sv6XXcLQ+wXuMpOAvSsVv
	 YG5WoYLjRAT6GeniIa8Ct/jOadaaArcdcggHCkt+18CbCvSWkuNzIPDw9WH5p7Mv8S
	 Pk4///Fxb324F8Vu4XPF/gb7MnCradJHtw6WhgvBfIs2PewX0GvEtZ9LPRIIAa8um7
	 1Kg6JxyPFCvBkn/C7lA+Ib869TfiurDzQoyS6mS9gpOnBsEUudCqs4ru82GOIWYbas
	 oPmly00tmDebA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, 
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251215-add-displayport-support-for-qcs615-platform-v8-0-cbc72c88a44e@oss.qualcomm.com>
References: <20251215-add-displayport-support-for-qcs615-platform-v8-0-cbc72c88a44e@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/12] Add DisplayPort support for QCS615 platform
Message-Id: <176651190661.759340.9506342080628643827.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 15 Dec 2025 20:41:56 +0800, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
> 
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
> 
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
        commit: 70f12a4cc6a04869b2185be999e3849a6c17439f
[02/12] phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
        commit: 9f5f6083b3bd74c7d25737241e32821adb294e14
[03/12] phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
        commit: 0599a4b9ee13b10820fa71f058bef8cc6f06b0b6
[04/12] phy: qcom: qmp-usbc: Add regulator init_load support
        commit: 3b19374825676e0b548b808772f5ecbe8af4f9da
[05/12] phy: qcom: qmp-usbc: Move reset config into PHY cfg
        commit: 5b2dd08459ad1f61dc7037032a5230c0efd9d797
[06/12] phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
        commit: 049e708e7705534a9992b24c5090d133c8efbca6
[07/12] phy: qcom: qmp-usbc: Move USB-only init to usb_power_on
        commit: cb2255822509c9dcdd1fad0cd167032dee7dc6c1
[08/12] phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
        commit: 9ab26cb7e652f3cdfb3d59fb42907c0229f2a93f
[09/12] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
        commit: f3198fde573be23de1a8196bc5ebb0abe9c7e02f
[10/12] phy: qcom: qmp-usbc: Add USB/DP exclude handling
        commit: 8e7670f7465d46bfa72980b310d39491a3a944d6
[11/12] phy: qcom: qmp: Add DP v2 PHY register definitions
        commit: c1282d5f85857d72cf947add3f14240fd82da261
[12/12] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support
        commit: 81791c45c8e0eaeba9a40927eecd082a8500f709

Best regards,
-- 
~Vinod



