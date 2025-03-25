Return-Path: <linux-arm-msm+bounces-52477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81654A705E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 17:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0294B188C293
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24F325BAD4;
	Tue, 25 Mar 2025 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKr6NAdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848FA2561DF;
	Tue, 25 Mar 2025 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918399; cv=none; b=rE0iMRwXZ8nPwpaI+c8xxsHLV7cKtYSmdzg0x8Ia2lwT+cN/jToMhfBJCiZp0AP/fSKClESo973YhAOS0wXcm1XkAx3TVW4dW7UxRKLBjTHnSujqhxsRfn5Mc5YUKo6ljxgxkP5qsBhapX28N3mlNAoZMZDJkc9awollynoO+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918399; c=relaxed/simple;
	bh=deKQHsSTq91cU+gs/lwy9UU8fJWk/D/NAudGGh5pVbA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Nut+VzYge6oTv8g4ogl6s8G9+IbYYRAhB70NOxCSq27MdRAsAT5b+KXU9ZFbMD2muH7ToFlbe8xkfk4aPe7Iw2R3zl9SKEetBFb/6AmkmCFkOm6als+rR0KYavbwrJTT2Y0bKvgjKZtllCwxWowCUOEawJcX8TrTzmgqFBQs2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKr6NAdT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F95C4CEE4;
	Tue, 25 Mar 2025 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742918398;
	bh=deKQHsSTq91cU+gs/lwy9UU8fJWk/D/NAudGGh5pVbA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FKr6NAdT2DkrIev+vLUH0x0gkYXnPoWCXigmGKiCxn/+dQkLV4mqFWfcdB8+e7zgA
	 R9ow3fUG3YK4sXvy9mifQe/LKclyGUer/PiYOeHszJX7fEFmU58Eyx7DSOsB6YxIFv
	 YAdByilcq/JxlzWenEgtH7jbXzF6QT+0PyQviXJjkXSuUxixWhbWLVaBwD7TDfYV9R
	 eNPZKkNDQrVHe+at5jgXtL3gHi5/FYcI60JaE6H3r7UEATewUesbNnwNNhYHUAdBqm
	 QVVP9wGGoY+8EwoijU1y986STkiBffZzHOKGyIfVP2yFTrg65rXHUTuDsU+/xt5+wC
	 KVPQMIuuJNO0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7122A380CFE7;
	Tue, 25 Mar 2025 16:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: qcom,ipa: Correct indentation and style in
 DTS example
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174291843429.628657.8812268848912438806.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 16:00:34 +0000
References: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Mar 2025 13:52:22 +0100 you wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: qcom,ipa: Correct indentation and style in DTS example
    https://git.kernel.org/netdev/net-next/c/a8b4ea7857ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



