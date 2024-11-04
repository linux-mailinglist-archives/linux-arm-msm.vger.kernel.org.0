Return-Path: <linux-arm-msm+bounces-36869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC69BABC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A696FB2304F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF0199935;
	Mon,  4 Nov 2024 04:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubFKgnV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076E1991A9;
	Mon,  4 Nov 2024 04:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693637; cv=none; b=EZSQB9YfifWoQGfmcZH7u2WWCm56pQ+VGWYYuuybWZe4jUXjpZwk54K5Dr4Xlvq5oL5vV0M+kAkwAYGXVN/xKvc7nrkwMd5t3A/6Cpwps76dMljejJl+wFLFBSuZDlbdO1dVgPLOC/8kZ/sYC8+4dOSCrYZfUwkVqdwr/uiBJbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693637; c=relaxed/simple;
	bh=IvJQdDE3Cn1heqlvzf5ZmdYNo5Flrbj094QOkxbLsg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3bC6aWLzfHenn4+8OiHJ1s9ILxMVstyFHWjiqWFp0AI3YkyTkhZp1RnumPnJx19zf7u+BnKBE1YW1UsZ0/32zhzEYQLzVe9RRJmUrVci9Z5OHB6fCP1DjWoJBVHqOEVELJZe1P/LwavSgC0q72F45cC8v1ttMF1ms7e4INwFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubFKgnV1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D630C4CECE;
	Mon,  4 Nov 2024 04:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693637;
	bh=IvJQdDE3Cn1heqlvzf5ZmdYNo5Flrbj094QOkxbLsg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ubFKgnV11Fjwn2e+0zl9YbL+3oitPCMpATGiCZsZ1LIpSi0uvs3VLBnzvVXRqveUZ
	 MDjXVHYcwgqiL3gM+jnS6hVizmD7JHXlkK0yhlrt3rTwrN4qNgiooU9xTIokm2OAe6
	 FXwwG99j3PcJQZVX77ZVEhmSrrSOBIgBNOvOzS3njPcvq92Z+ViCqxugWV/NS5jFa8
	 dwzJfBGeYY2qVKs871CaVkvecUka+naEa1wyQY68pKGnTGN6Xhff7Irj4ziBoKE2iB
	 wBcQ2BjyogZkbzDUWsk9JrfrEFKgESyvjpz0FfAlk9O7wH4mi5q7xk28DbAu9XDMLu
	 gDRSOFO2mSxTQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com,
	20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com,
	20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] soc: qcom: llcc: Add LLCC support for the QCS8300 platform
Date: Sun,  3 Nov 2024 22:13:43 -0600
Message-ID: <173069362375.23540.185749212387703093.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
References: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 31 Oct 2024 15:14:35 +0800, Jingyi Wang wrote:
> The QCS8300 platform has LLCC(Last Level Cache Controller) as the system
> cache controller. Add binding, configuration and device tree node to
> support this. There is an errata to get the number of the banks of the
> LLCC on QCS8300 platform, hardcode it as a workaround.
> 
> This series depends on below patch series:
> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
> https://lore.kernel.org/all/20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org/ - Reviewed
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC
      commit: a83e18ca83583ce191848ee73975894d43093cde
[2/3] soc: qcom: llcc: Add LLCC configuration for the QCS8300 platform
      commit: 584e936feedfcf678510a749f407115bdc811fbd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

