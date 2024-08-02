Return-Path: <linux-arm-msm+bounces-27755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4B9455F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 03:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A411F23554
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 01:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B752134AB;
	Fri,  2 Aug 2024 01:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FucAqN8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AFEC156;
	Fri,  2 Aug 2024 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722562232; cv=none; b=Ad8Hz7zCG6F1vkO0OjNzQKh9WJvqt2u+eR9pABU/Uvkj7fvFeXSnr5/g+ZiVkI+u7hfBA83RhfyxKOKyQ5Dm7L59n9L9wdrE047Xjt1KxULBqr7xapWwue9m+87mUf7vXpe3XujARTXxNdal3eArH6MeDNR27K85mfKaS7w4JLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722562232; c=relaxed/simple;
	bh=/NO8rLNeJv0cBnN2o+HO18XZtIgNLJjv8n2ZC5pYfOQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OrLmJ7RGoiEFj4pWUzl7rQQp6R5VOJHXM9jQg2Kp3VAnlghDGyWaSii3JjLnmUwydMQ8heWnboelYWiYv0/CBZUA4OEHH0q5lfuxfciMHsNTOW/BlcoOmdC1uCx2emrW9KCcrzI805ToFxrJLlF8xFJFr9XQuxY86aa5IL7Ce84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FucAqN8C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FC06C4AF11;
	Fri,  2 Aug 2024 01:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722562231;
	bh=/NO8rLNeJv0cBnN2o+HO18XZtIgNLJjv8n2ZC5pYfOQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FucAqN8CoGrR75yWffAuL8JgHLygUaXU6HHfFymn5+DLVdBBTj9K4DhkoR/QMt1rT
	 t6TxFne1AqKUhECL7MDZiyNdjt0LdNt6pK9w9LcS1nsQp5f5TFU0x1NnESBqE00CcU
	 r88Kc5BEkTGVuiyfzOy2nRfsrdlCksKHQx/TbMTHs/USI6/8UEa4nyemA3Qwcsk5Po
	 ADiq+hMJjZHUIzJQde3YH1wdryZkAIzkO/G+38kIbW+hfCED/GRpfqcvwfRpW6M6nb
	 CsxwHaYdUukuEGJO51EcvcEFoROzZFdfoYoh2LbhvO/dTl4dQoiM4TKJrXoLA5Syrm
	 PnzTlTZDJxvCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 70DF5D0C602;
	Fri,  2 Aug 2024 01:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: qca807x: Drop unnecessary and broken DT
 validation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172256223145.32676.8205372678905951335.git-patchwork-notify@kernel.org>
Date: Fri, 02 Aug 2024 01:30:31 +0000
References: <20240731201703.1842022-2-robh@kernel.org>
In-Reply-To: <20240731201703.1842022-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 31 Jul 2024 14:17:03 -0600 you wrote:
> The check for "leds" and "gpio-controller" both being present is never
> true because "leds" is a node, not a property. This could be fixed
> with a check for child node, but there's really no need for the kernel
> to validate a DT. Just continue ignoring the LEDs if GPIOs are present.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: qca807x: Drop unnecessary and broken DT validation
    https://git.kernel.org/netdev/net-next/c/46e6acfe3501

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



