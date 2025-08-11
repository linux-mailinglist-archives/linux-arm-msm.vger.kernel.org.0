Return-Path: <linux-arm-msm+bounces-68575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A1B2166D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 22:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 277A74239CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62812D9EED;
	Mon, 11 Aug 2025 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfEa7ziw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B121149C51;
	Mon, 11 Aug 2025 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944193; cv=none; b=C7bgFN/VMM1WMnrvSMJgzBOW1NkTabzxac5IhqUNlH6K6f5H1daVfn2C1qsrn5AYT33FU62zOBARu+zCcaz/bFCZVYnWTp9CBU6buudYn0vHdUPzjwqKR0+G+HNDsyzb0P9evAAqup5tuekExtT2qmRgSTc7GPqyfkw/6KC4LQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944193; c=relaxed/simple;
	bh=j6d0B2ufhADPaSATDMPFJC2cPBGnHS5olYtUKfHrhhA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LEuCv7x4DJjbX/MTC9oKU86pM3BDRQVrU/buYcvJ6aT2UBDxuS4UpDQ4yCy65Cp5GMH6cEih/IIAJiPe3ejKWOv8kflzzZohRaTfq3GqM/gBRRodKwkJWir5p3rb/mRPwQVJT2ZfPNddiQtPpw6vyEcc88XJalls1WK4hgvUSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfEa7ziw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5CFC4CEED;
	Mon, 11 Aug 2025 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754944193;
	bh=j6d0B2ufhADPaSATDMPFJC2cPBGnHS5olYtUKfHrhhA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IfEa7ziwzA7aVsOhK2i9hG9WKaqxn0TOQ/Wtqi+Kcd3piBbWEVUaBCh2DMe308wvx
	 ONWsKTR7nh33Ztke4Bx0eeeV961kC2RiwJDWdv7FCL9BKR4RS+4nxLrRd0JEdqcJsH
	 h4Rp+kkIe79/U9jvy9AB9NIjK9qphBTunNQyuXyR9+Q1phuKcci7JbWzit4ow+8MZM
	 pUu3HJ1eBeZQxvtGB+z/uNMR9Vd6qyQwj65/ev8yIlQm3LBGSQP+A8kvilsInkPnQD
	 AZUFXh7BMC+Hy1yLcNbFJwsGKggQ/dEDc0muRCX7cYqbUB2EGeJp/BIXoz4ZmdZZjE
	 +MbFr3uXkRihQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DAB383BF51;
	Mon, 11 Aug 2025 20:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] MAINTAINERS: add a sub-entry for the Qualcomm
 bluetooth driver
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <175494420525.1880523.9587012581531708194.git-patchwork-notify@kernel.org>
Date: Mon, 11 Aug 2025 20:30:05 +0000
References: <20250811150400.86926-1-brgl@bgdev.pl>
In-Reply-To: <20250811150400.86926-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: luiz.von.dentz@intel.com, quic_shuaz@quicinc.com,
 stephan.gerhold@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
 linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
 konradybcio@kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 11 Aug 2025 17:04:00 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
> linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
> can get notified about proposed changes to it. Add a sub-entry that adds
> the mailing list to the list of addresses returned by get_maintainer.pl.
> 
> [...]

Here is the summary with links:
  - [RESEND] MAINTAINERS: add a sub-entry for the Qualcomm bluetooth driver
    https://git.kernel.org/bluetooth/bluetooth-next/c/159053f1b531

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



