Return-Path: <linux-arm-msm+bounces-3017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6AB801A97
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 05:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6193F1C209D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 04:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DC38F7D;
	Sat,  2 Dec 2023 04:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkZzFzkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECAC8F55;
	Sat,  2 Dec 2023 04:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4163C43395;
	Sat,  2 Dec 2023 04:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701490824;
	bh=jWE56trVPmQzz+YfD/mLnPE1SjgGNTuR0UnvpUsNe7o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LkZzFzkcJbn2KTpvXUgzU+t654jXhocDfQZwy121qw8ciflsXCkqg/nVYtcdjj4Df
	 JIOyMyHEDJqs+1BQV/j2qF2iWrYeluno0vzgI6yTD8D1SHkWX3ksqPYcDL6oHrCqrP
	 +MqHmLMffWHEW6CrNmkdt0oAlEWYjHEXaRqpk2qWwlgDGZZX7EGddghpHhVy+A8igw
	 t84vEK3+h7Hdu3Kd2wwtbSTGFFFJmktHT2/DlKRjvNk7vFP0X1Q0kbOU1QtdLO2Bdz
	 dPsG8nCfMJ9r2NWFsbgakwUXTeisTU6hsoYwWbbmxWub2jlHk1keZUFpfjyUy5x3AZ
	 PIxuGKSvXrnOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0B25C64459;
	Sat,  2 Dec 2023 04:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: qcom,ipa: document SM8650 compatible
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170149082465.6898.10790430963543604877.git-patchwork-notify@kernel.org>
Date: Sat, 02 Dec 2023 04:20:24 +0000
References: <20231129-topic-sm8650-upstream-bindings-ipa-v1-1-ca21eb2dfb14@linaro.org>
In-Reply-To: <20231129-topic-sm8650-upstream-bindings-ipa-v1-1-ca21eb2dfb14@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 elder@kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Nov 2023 18:22:58 +0100 you wrote:
> Document the IPA on the SM8650 Platform which uses version 5.5.1,
> which is a minor revision of v5.5 found on SM8550, thus we can
> use the SM8550 bindings as fallback since it shares the same
> register mappings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: qcom,ipa: document SM8650 compatible
    https://git.kernel.org/netdev/net-next/c/a10859384256

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



