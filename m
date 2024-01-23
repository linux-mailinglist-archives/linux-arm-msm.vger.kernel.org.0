Return-Path: <linux-arm-msm+bounces-7961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4CC839135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69AFD1F25DBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 14:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8BB5F876;
	Tue, 23 Jan 2024 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ6BgqFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E35F872;
	Tue, 23 Jan 2024 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019662; cv=none; b=lYkqp4AmRYjBRzSAKGifabg8CHFPlWGJzNqqDr/dYWraPfs4dQNDPd07lm3SiAJrY0kcT74/e78gytrsk8B/JKnJLsadyZDTjIKOsSwlRwCx8b+sxA4Anf8l5vfXHCKkcPjMqkF1JBysA4sEnL1rCRxUiSnxiI3eSvx07GLeFrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019662; c=relaxed/simple;
	bh=Y3qVpfbCxdi1d6OaDH52Zm0yMJAKCZVxKIP2XOv+Uh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LW8/uMGmH1mg3D/9q5V1nLTqf7y3se9yNadPSpPLXWi3C7W75fA2qhZ0+GdrToBgyg5fGqb2IM0eiSXWzAliAk9MzS8lY1L7Wny/mfinkcXvVCk4NP01vaL1wYOB1Lg9vReUuoP8ciuinoO5bk+swLFdknKw8Gr8DUXN3FYQyT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ6BgqFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE4FC43394;
	Tue, 23 Jan 2024 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706019662;
	bh=Y3qVpfbCxdi1d6OaDH52Zm0yMJAKCZVxKIP2XOv+Uh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KQ6BgqFe5lqpaeLoQOivVHcS6KBduwAPtR3O3W7jM4WjMA9t70U/Vf9J5Fxcv3lYy
	 BjAKvF+rg1czCAOE9OfmpNyRdsciGK12wL6SQR0tnzXMGTojWVZvcYtbA8bs95ypi+
	 XOK3Y+T6ekbrRebuH7A5QI3XpV7CzkBYPzm2vg39U4BjNM+97fWccGKZ3oy0w6D56V
	 7/nPbd9NXJebFmQ9S1OeVoZmj+pTUGO4OCeW5LUVLQmtxpHVT5le/ihEkCvlnIf5RG
	 mZI130IvUBYtwlXv1oqx+q4ilCM5JDOeutz50/qiKciwIPXgdkUAEgwPW1MPgH8ktz
	 1tuwB+jf9qhAA==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
Subject: Re: (subset) [PATCH v2 0/6] phy: qcom: qmp-usbc: properly handle
 the clamping register
Message-Id: <170601965814.371263.12044570572262863017.b4-ty@kernel.org>
Date: Tue, 23 Jan 2024 19:50:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 17 Jan 2024 16:04:21 +0200, Dmitry Baryshkov wrote:
> The USB-C PHY on the MSM8998, QCM2290, SM6115 and several other platforms
> doesn't have built-in PCS_MISC_CLAMP_ENABLE register. Instead clamping
> is handled separately via the register in the TCSR space. Make the new
> phy-qcom-qmp-usbc driver correctly handle the clamp register.
> 
> For backwards compatibility the driver treats these registers as
> optional. They are only required for the PHY suspend/resume. However the
> schema declares corresponding property as required, it should be present
> on all relevant platforms.
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: add TCSR registers
      commit: f2b2f86a8bd19feb70649abf8a63d639f4c838d8
[3/6] phy: qcom: qmp-usbc: handle CLAMP register in a correct way
      commit: 01b086ccdeffac96f107228d581e0925e1c83f87

Best regards,
-- 
~Vinod



