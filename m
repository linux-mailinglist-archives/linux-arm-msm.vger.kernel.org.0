Return-Path: <linux-arm-msm+bounces-82718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603DC75968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F1F4351A71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49072393DD1;
	Thu, 20 Nov 2025 17:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFR04STc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F126372AD9;
	Thu, 20 Nov 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658700; cv=none; b=eMAxXvjFj2K4b0NRzNLHXpzthiagyMzyRJDWqMETYtPyU6qJM6eL3GnAJH8uLD0z32PGrASJgQ9EsaNXmN2B4e1ReAcdqYoN6cl6emEM8yMHglO3HlL4Et4PVmdylxq4HBGM1Q5uPO7/DB0dP5gceAGqmgMKZx5ykzB2mpjR1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658700; c=relaxed/simple;
	bh=CzNgQDtqsMlCOrg+Jv4nr2hesjVeTWdR3pTTkDHKWDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ax7jRuUQYd8uy0emwQqcEj/tNqBtL5bB+g8O35joSvuFLZYbkdrE5Wbq9RcJ1gN+1/hj9ubKLqvG2UcwtW8jd6YuWN76pBdkcYRsV2tdYgVjwgscms9VaxcOgPodHumsoEkjtxfgzz3ubYBgpmP8ibt6KcAiCQ1Ln4GT8QvTrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFR04STc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1A4C4CEF1;
	Thu, 20 Nov 2025 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658699;
	bh=CzNgQDtqsMlCOrg+Jv4nr2hesjVeTWdR3pTTkDHKWDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SFR04STcUedDKoj5s2nDLfSh9lEinHLB/UuCxrmFwn5Mvg7vVNpcKxM0K64MwvFDm
	 N4scXGHWYNwe1uMlqPG7kvaJdMAuMwHWSSpvBBFKhMMEEZRWs1lgBu8Ij2YPp+BNMU
	 CeAsZ18FlTVvuClEQCLuGcvL2qcIOvjcs5tDNdNu7Z07tl3r8gb4qzc4mK1Dre4VZA
	 +pieLtevmp4YMzjI9GfMjKQUNZbmns3bRloD7M8mg1K/7V0cLmGJemtU48HQriPzUw
	 M/E9uo/QnMmvMzyj74Nu7HjuRWgRu/idiYHvCkgRCuQfWvsqnl+FPI7BinV9q074HL
	 eGa0TKSVdW7dA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
References: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
Subject: Re: (subset) [PATCH v7 0/3] arm64: qcom:
 x1e78100-lenovo-thinkpad-t14s: add support for HDMI output
Message-Id: <176365869552.207696.3147796021521061532.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 19 Nov 2025 09:45:39 +0100, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 1/2 DP + 2 USB3
> - 1/2/4 DP
> - 2 USB3
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document lanes mapping when not using in USB-C complex
      commit: 3faa2d0e794093df21c96550829d67d7d38e24bb
[2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort lanes mapping from DT
      commit: f842daf740114a8783be566219db34c6a0f1d02c

Best regards,
-- 
~Vinod



