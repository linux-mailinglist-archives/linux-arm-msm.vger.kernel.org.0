Return-Path: <linux-arm-msm+bounces-19962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B18C7FFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 04:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A43FB207C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 02:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A019454;
	Fri, 17 May 2024 02:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RL/EGBnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBA79E1;
	Fri, 17 May 2024 02:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715913631; cv=none; b=NhSDbdBOcmYogJ6YKhPHaw3XMlFWqaEwhc6pmzDpLfK+erC1MxlyfM8VOl3WGoWhNuJnh1WlSYECDdh1S8fgTrgSwkKcAUlbGKoLbmOWeACjHcTP+jszfoVZw6+zliAAxb4EgHwT74zIhC7E0x1LklxCxc17V07hSm5+vX7otJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715913631; c=relaxed/simple;
	bh=9kebVBdlBKzKUV6X1NAINiwksxB8q5L+utQ7ykLIosI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sQVy96X1FhgainN3U1h3efVm+im59DfCPuH0GLYd/TIxc2J4lZAiJhoG8oXY8ScbiJoSKfMLsbaUMfaUxs5sh3Dx2N1t0Yb35zSkxwD/8SBqsW0YBeSeOf7GdnMDfWlCHAOuz3rQ2fMXg0gYqwd2+dmGAupmV7UUIeruZYdPYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RL/EGBnb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4388C32781;
	Fri, 17 May 2024 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715913630;
	bh=9kebVBdlBKzKUV6X1NAINiwksxB8q5L+utQ7ykLIosI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RL/EGBnbcdhx9FrZXV+Po0BC//Qgt+qBLT24e1Zms+PiO+aiMLc7efcGIqw2mxLr/
	 l+0PpgTeFEB1C8Z8L7QN7SRFS3fu7+YKPZvtHNDg9LMFTIuKoxPxh9HntI5TU52891
	 6bt0/gGyEU2aAQQ3x0r2VeQEf/uMdlNbsRfimNMjP8fDC7kWID7YTz+bwvviXZZx5c
	 qb+07imcdlfgyMLRk1D5Dn4BpJWyT3HInI4JHW4mg8RNweEBvDU2MufVKYwnRhWTaw
	 mrN2tMUOkWvVaDFnt7AM+6nhaLb07+TyJsvKjBm/WKtmzzgM2ID1/zf+V9HRgegfeI
	 lIhShMYEI6nEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96856C41620;
	Fri, 17 May 2024 02:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171591363061.2697.10528707593141147774.git-patchwork-notify@kernel.org>
Date: Fri, 17 May 2024 02:40:30 +0000
References: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
In-Reply-To: <20240514-mark_ethernet_devices_dma_coherent-v4-0-04e1198858c5@quicinc.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bartosz.golaszewski@linaro.org,
 ahalaney@redhat.com, vkoul@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 bhupesh.sharma@linaro.org, kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 14 May 2024 17:06:50 -0700 you wrote:
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> To: Andrew Halaney <ahalaney@redhat.com>
> To: Vinod Koul <vkoul@kernel.org>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Cc: kernel@quicinc.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - [v4,1/2] arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
    (no matching commit)
  - [v4,2/2] dt-bindings: net: qcom: ethernet: Allow dma-coherent
    https://git.kernel.org/netdev/net/c/fe32622763d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



