Return-Path: <linux-arm-msm+bounces-45884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62965A19D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 05:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 043907A523E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 04:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D18B12C7FD;
	Thu, 23 Jan 2025 04:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8rw/56n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B612E62C;
	Thu, 23 Jan 2025 04:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737605407; cv=none; b=q76pzSseBW31aRQOvTICmnJNWzx8StkiVtxDmpTGBDXztM79fL76GMUWyKLazr6mRl30Bfh+PTyszSnnuorqN4nP/3LSv21p3EQ2DhY3ApBsVJPe7SC/hFZvWZGzfhX4jpuykJN6B7dItIiqkqpS7ZEVtQt3pP5L0hOTM8VeB6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737605407; c=relaxed/simple;
	bh=jIAvkyTigTAsrgEBmehd4gQwoyZk44PWXjLcnu9Lo+4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NzbbyUYSdYEtZzwFR/CVmi1FTQmmNYqjrAkLTgj9QwlIJTK0DJ9SB6mOxgVgi/LJ5jBOo7cCyEXS9kzqnBodJ8vV5PnbzctOkEBdXCEnJ3PZfQf7im6i1bIEnbcdq4mfwDnu9vsf9p7aLm86eNZmKH3esOpoILsUtBuApV3v964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8rw/56n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16DEC4CEDF;
	Thu, 23 Jan 2025 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737605407;
	bh=jIAvkyTigTAsrgEBmehd4gQwoyZk44PWXjLcnu9Lo+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U8rw/56nKZNrasZbLqSk7HPqliGYgjgu4jZg+vdc89uX4Q63w3uVqq0SXkh2hs6GL
	 Cr4gqa/psKVXkc5YONBfuhGgca+TlZYS1hVCKoZe/fnEUi8l/XXhikJF0gm58+Kjrm
	 EfisfPXRbeQzgfk7wuMzzs+2XPKye+cyIeSgxMCCkptz837LlF0yMR/OSIRXHZeeup
	 LdS9mErZOrwH2EuqcXltIVDoN1MIW5VCjKTeMSKuVk0iut0yXIKyHPS5FwCOV5A4du
	 Rd4OYI8qvD5ZYxN7jWMC8no4AKtzWWrblu7PJGqigDKA6UD0yG8pd2qzUyBPEadbun
	 4tzZBuOU7H/xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE23E380AA70;
	Thu, 23 Jan 2025 04:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] dt-bindings: net: qcom,ethqos: Correct fallback
 compatible for qcom,qcs615-ethqos
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173760543124.917319.17863724148091129767.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jan 2025 04:10:31 +0000
References: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
In-Reply-To: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: vkoul@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, krzysztof.kozlowski@linaro.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Jan 2025 15:08:28 +0800 you wrote:
> The qcs615-ride utilizes the same EMAC as the qcs404, rather than the
> sm8150. The current incorrect fallback could result in packet loss.
> The Ethernet on qcs615-ride is currently not utilized by anyone. Therefore,
> there is no need to worry about any ABI impact.
> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [v4] dt-bindings: net: qcom,ethqos: Correct fallback compatible for qcom,qcs615-ethqos
    https://git.kernel.org/netdev/net/c/ba1af257a057

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



