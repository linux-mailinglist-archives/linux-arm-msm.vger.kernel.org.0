Return-Path: <linux-arm-msm+bounces-44665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93154A08163
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 21:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FAB4188C59C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 20:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D532200105;
	Thu,  9 Jan 2025 20:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoA2I6NX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969B1FA8FF;
	Thu,  9 Jan 2025 20:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736454615; cv=none; b=An/n1EBiX9204CWhjPHkOvpq+y9psgUSprLkS1+xvuepMObqeOfJ44FAmbOwlAby3KvBFRvUlqE2TYx88Tq6SWqBXpvagss5QX795r9hV4LaDei21K8GeytyTx0WrX5jJ92Fdwr8j5he5/LPgZ8V/oDORvlxSavaobhRbajSYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736454615; c=relaxed/simple;
	bh=LJVI+pLzlgqcvhk6bHrFRyi9Cg2HhVGVDQokMOdCC9o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZyLAfD5tV7hqupCuHY6/u+PHsLWqWRCXnIPJgagyIggaUnX2wDzufWeMxvmXQ3SZwlmiV3AyO/6kY3wxcNWquBn7uFJStAdLTR89k/fijW+99L6P/N4f5sPXBebuCKc5RGcdZUpeU93fFAWLSzLVzx9HDJU/OykbfSQ49VWIdDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoA2I6NX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9DEC4CEDF;
	Thu,  9 Jan 2025 20:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736454615;
	bh=LJVI+pLzlgqcvhk6bHrFRyi9Cg2HhVGVDQokMOdCC9o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XoA2I6NXjGh1DRoc7LIk1RWm0/ecjbDvUizRYpDq9HGDsNisMchdBzTrDG/k75ZbL
	 yeLVVESye0QTXNCgXZacjpyw0w2VoajI/kwAo7bNSSL7hAL6Hv9xT/mQt31ckd8Sqb
	 4VraLXKTOQR9HVmTpA4pAew5zv1q//Xh3Bl29ilc7HZphbMtU9UiMPUVgOVRLC4hkW
	 cYjKpSzVJw4cI81V7PrFUt7zwRhausSekGYcr48NYii4Hgmx+sGEqf+eanH50PsBUK
	 ja7VQbW4kz5wlT721MltrJM1bwOsvmbk7JxAEqkYqftsiSrZ+zD+tBpTboIVgrALIC
	 Y4cqt7cjH1Pug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB48E380A97F;
	Thu,  9 Jan 2025 20:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: qcom,ipa: Use recommended MBN
 firmware format in DTS example
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173645463674.1501437.15919463810433398887.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 20:30:36 +0000
References: <20250108120242.156201-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250108120242.156201-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Jan 2025 13:02:42 +0100 you wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  No functional changes, just correct the DTS
> example so people will not rely on unaccepted files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] dt-bindings: net: qcom,ipa: Use recommended MBN firmware format in DTS example
    https://git.kernel.org/netdev/net-next/c/75f01bf61072

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



