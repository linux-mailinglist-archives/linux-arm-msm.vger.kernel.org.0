Return-Path: <linux-arm-msm+bounces-10041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A98A84C3E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 05:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3597E1F26974
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 04:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F481D55C;
	Wed,  7 Feb 2024 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epkh//PN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5212E6A;
	Wed,  7 Feb 2024 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281215; cv=none; b=JlAWxl1p8B/vSdQZbsQhuXPeWqODjh4ue2DncOKZzsJf5NCaXP3a2gGt+nmXJMP3c0biHeZN4b9gTLvG3OLmhqfDHIle2FzJIAwtH+tQAtah21wtmVPZSUig5Lj1MDPoW/W5YEQ6D6/Fn63BRW71CvMkQx/4BcUnGygcFSiEV1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281215; c=relaxed/simple;
	bh=zcYnajvpiFbj962WuH6tg/mhlAWqJ2keYskNv5+pdnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyJiqz2UqLjZsCTUPUgfmtl4L+NzKP5NWy19f4z54gprDSCVxg3TLfavb8KPVxyyRM53e9jOPET2fwJmaB/B4uHzUJu1ai9G3CC4HsM/BGnlz10B9QiOTDWTcp5BujiumCcV9uXQ75PXLeax02XuX1Hg7QwpvqIjfJpHxlIev6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epkh//PN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4235DC43330;
	Wed,  7 Feb 2024 04:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707281215;
	bh=zcYnajvpiFbj962WuH6tg/mhlAWqJ2keYskNv5+pdnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epkh//PNQEUBDNjDiW+oCLQf+XiaKagEjPy/+S3Da1PhYY7tfL5Ldpyo+U7dBPTNP
	 yDRkKGxm/65fGabgJXpFzBUfx/r6XBhxYP687uGjy1FSsOc41NQYFMmuD/qNtNvS3D
	 J5x25XLhUfeZVlSHt94yPRg0cfCnMAQOQz8t5gXdMoh/55iyfFig0veTXwL1wnV2z5
	 qbT9Ia9FpQYlWgVnx3Z6+6BOVezm6Z99pOlLGDJZz+UeQCuSg3XqYMf7t3pa5A9PcD
	 rZaJpF0DTCU2w3CKwL+ytkseHFqEcW1BUhwIimTVACcFIkyz3HZli4ukozg3qvkYgQ
	 R+Z0HWaQpOEJg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/6] phy: qcom: qmp-usbc: properly handle the clamping register
Date: Tue,  6 Feb 2024 22:46:18 -0600
Message-ID: <170728117679.479358.15159278126829937083.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


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

[4/6] arm64: dts: qcom: msm8998: declare VLS CLAMP register for USB3 PHY
      commit: fc835b2311d4deb85d776c1d73562338462aa7ac
[5/6] arm64: dts: qcom: qcm2290: declare VLS CLAMP register for USB3 PHY
      commit: acb94d67f5a23dbb2e0021b6c30609ed05d7d6a5
[6/6] arm64: dts: qcom: sm6115: declare VLS CLAMP register for USB3 PHY
      commit: 95d739ed962c9aaa17d77b739606dbdf31879f6e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

