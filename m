Return-Path: <linux-arm-msm+bounces-25887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4520692D988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 21:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F248F2826F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94753197552;
	Wed, 10 Jul 2024 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb9rO8xJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA6315E88;
	Wed, 10 Jul 2024 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720641035; cv=none; b=O1NJA75MMMnR8rgbiCTG6FKxBSoi2ApwLhnULmzigAIbN+LVyFoqumIxLyGbvOkI5E+Ms9a8CnoWNkjaNxpE+SkdO1SDQOfUiF2G0qODNwxR3snuCTlfIHzeZQcZZHns8mMGfXfPhA76RLNnKZW0iG4/UwRs9eqsCe8ncxBOkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720641035; c=relaxed/simple;
	bh=xihsmeAWmOXJW0TEj1iF/9CEInbgkYEYZIMDRf7/TMA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d2GjEDh8Fjl5Q1JJlnifH8KO46OgoFELi4tC9byoDfNjMpYzHojhTDi+qMbFRehvvs4kzx0+CslGXeLSUaY4rhXxiibZ6gTzJB4kYyg7KLuHeiraOrBMkkp1CUK4/NGec39FE3hcZ0eMcv/ZVOTFVAhh4jnV/oIjt5rnVosTxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sb9rO8xJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4CB7C4AF0D;
	Wed, 10 Jul 2024 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720641034;
	bh=xihsmeAWmOXJW0TEj1iF/9CEInbgkYEYZIMDRf7/TMA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Sb9rO8xJAUR8kNxOjj2HYw1jog4jC1IbJUlPgzGwTcUCYX6/rSOD7FjLhcjpin5y1
	 YMUOTErXKxgr9wsihtzojt4pwdMb6XSucltspyo7KKJupEAR1sDtoBIXj7gbWqKZTR
	 FRnz3zolywukR2t1NrViHp2Y5PDAw4Ig/ggTquwBOUGf5bQKs9gczVtKP0uR/BsyA3
	 IsMyKNrQ7lr/Urj7OLKX7dAXZeQWO0s18gZjNKWpqtwVQBOtTHfnaEGkH9avIz9xsw
	 LVz+Vlj2Mob/7ZGnDhVPyMREE4K3YZ1Xkp/qBT7kxng+y0JOkAoRtXaWNg9UGZQOTc
	 GiCOCnfZoUlNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C419AC4332E;
	Wed, 10 Jul 2024 19:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/6] Bluetooth: hci_qca: use the power sequencer for
 wcn7850
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172064103479.11923.11962118903624442308.git-patchwork-notify@kernel.org>
Date: Wed, 10 Jul 2024 19:50:34 +0000
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
In-Reply-To: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bgodavar@quicinc.com,
 quic_rjliao@quicinc.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, bartosz.golaszewski@linaro.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 09 Jul 2024 14:18:31 +0200 you wrote:
> The following series extend the usage of the power sequencing subsystem
> in the hci_qca driver.
> 
> The end goal is to convert the entire driver to be exclusively pwrseq-based
> and simplify it in the process. However due to a large number of users we
> need to be careful and consider every case separately.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: bluetooth: qualcomm: describe the inputs from PMU for wcn7850
    https://git.kernel.org/bluetooth/bluetooth-next/c/e1c54afa8526
  - [v3,2/6] Bluetooth: hci_qca: schedule a devm action for disabling the clock
    https://git.kernel.org/bluetooth/bluetooth-next/c/a887c8dede8e
  - [v3,3/6] Bluetooth: hci_qca: unduplicate calls to hci_uart_register_device()
    https://git.kernel.org/bluetooth/bluetooth-next/c/cdd10964f76f
  - [v3,4/6] Bluetooth: hci_qca: make pwrseq calls the default if available
    https://git.kernel.org/bluetooth/bluetooth-next/c/958a33c3f9fc
  - [v3,5/6] Bluetooth: hci_qca: use the power sequencer for wcn7850 and wcn6855
    https://git.kernel.org/bluetooth/bluetooth-next/c/4fa54d8731ec
  - [v3,6/6] arm64: dts: qcom: sm8650-qrd: use the PMU to power up bluetooth
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



