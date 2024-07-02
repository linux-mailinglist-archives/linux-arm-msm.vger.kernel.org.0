Return-Path: <linux-arm-msm+bounces-24889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8849923F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA01528AF9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18B91B47C7;
	Tue,  2 Jul 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBPVwi6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414A1AED5D;
	Tue,  2 Jul 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927632; cv=none; b=FNQ4D+D4OEh61UEaI4sA2glmNLRpx9paHmORiZcmDcJlTcZTzoFozlWjfLDwry9rKkPugHFZZPKqo3GxqsPArHciBIVSSWkG/TrTORnQnaMv07fVgbRzYb4Esb0InxG4LW24VK6VDq70g03/QMTWjusQyi7XrljM36drFNgh1f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927632; c=relaxed/simple;
	bh=oWyMMPuMnk/cVjDHZftH+TzqlB1ahjPwRtOGWTrmum4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dG9IVJy7jK8T65e70N5agKy+NTLUmvBVTIaJEyeh0bQvy6uHc7RrnRHULb347B+x8sdCsQZiI/erMorxrFqsfAJHrD63ygdJ0hYFzB6x2avNfznoIYCdLl1zL96j19Z5weV9lm5MvMjfos5HCei9ETs7AHf8V1tueWDW62PKyMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBPVwi6L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C7AAC116B1;
	Tue,  2 Jul 2024 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927632;
	bh=oWyMMPuMnk/cVjDHZftH+TzqlB1ahjPwRtOGWTrmum4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iBPVwi6LyVgmhJNUGEtqynTEpSRPX/kUSJrh9ZjrUKwHEy0Z/svKF1QxOl0ldaJ6/
	 YnNkN53iWQNyVTRWUot5Fx2Q/1Y0YqzT+OIPcl73IDoGywY2wzbcqsxumYOeKK+RP9
	 31690r0e+f+OYTvzOPfDex/4GcMC/fUJ9QFZmW1GC6dQRNohtAbC/fZFh4Q2IkXEVI
	 yN0l5chOUxW6g2tDVzwKGbssDRXy+wydi3WPfotNJl4M4bbS3EBmrfDQakGbbbdzlZ
	 s92nAey6swXuU3dsjDnxmuH8tmEmR2eshfvkJqQ68Ud2JKFX7p+1dK1KWKyCu6ZbdH
	 VSb9Fl9S+hReQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38CB5CF3B95;
	Tue,  2 Jul 2024 13:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: fix error array size
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171992763222.28501.4782727810061359612.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jul 2024 13:40:32 +0000
References: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
In-Reply-To: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
To: YijieYang <quic_yijiyang@quicinc.com>
Cc: vkoul@kernel.org, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, quic_tengfan@quicinc.com, quic_aiquny@quicinc.com,
 quic_jiegan@quicinc.com, stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 1 Jul 2024 09:47:20 +0800 you wrote:
> From: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> Correct member @num_por with size of right array @emac_v4_0_0_por for
> struct ethqos_emac_driver_data @emac_v4_0_0_data.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-qcom-ethqos: fix error array size
    https://git.kernel.org/netdev/net/c/b698ab56837b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



