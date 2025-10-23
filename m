Return-Path: <linux-arm-msm+bounces-78650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B7C03912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 23:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65468189C361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 21:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D07C26FDB2;
	Thu, 23 Oct 2025 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBJKwggN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E6EEB3;
	Thu, 23 Oct 2025 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761255627; cv=none; b=Tfki8JpZB25h8ZyFDSSIJuburjw/1ikKKQcl2E0My1jbNfd/ChPDuwoytt0qgNVL1STyWYpVAwOxa3tAgwCKlngvBLY9/UfWfI3uvemjaBO8pE8Ky9R029gXd79ieV2e1RzFAKSGhFAA3K3WHyePNFTLQFDY3/f1bEIQs/B3fOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761255627; c=relaxed/simple;
	bh=5qCzJg0hCt3HBb3QIW58eH+hgYTu6FwAxvg34Yv5VZo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BG/cJYsNUtkuO5k9l+fLjO2LCgV72AY8Y9/+4Vua1P4FymuHaJPKsOFCiAo55cDzouRfZkrsLsM+46kCXAkCPmIpATmwVOGnSD6XAlSpQV/z+O4er5wgeQ44c+B1lOReESu0F4yk/W8m4EgC2/fLHIZvRL5I/6fdjtSlkrneBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBJKwggN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB27AC4CEE7;
	Thu, 23 Oct 2025 21:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761255626;
	bh=5qCzJg0hCt3HBb3QIW58eH+hgYTu6FwAxvg34Yv5VZo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hBJKwggNlS5Z/APUyqIyD/y3+ODXl8giHzG1gqnyTHY6Kx57RGM/6Bv+Q+hNMOJsx
	 zDGzvBYt9sYkNhQoz9P7Mq5aoI1w5n+wbOLQhWlYJHlROaaHm0GwS2ZB1p9r46g6TF
	 fVkqgs1y2mkXPHJWVeypsX5K8S5DlGCGpkBd2eFNn3JsD1f9CbVE4dKINgGj22vkWC
	 4hQLBnrCMLX7UFvzJ4Y3cIr2y7g8XIuKEev3HUd2iDuK4QpaBqtNRagn/WuAlzeyqZ
	 XlU+BzVIciG55ec82SLKs7S+ObDRCYdigBA275Spv2uU5gLCLWCEbZcPtNde9jMKCq
	 55dNZJhb5ITzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B33380A960;
	Thu, 23 Oct 2025 21:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: fix corruption in h4_recv_buf() after cleanup
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176125560702.3260295.10385824633115850837.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 21:40:07 +0000
References: 
 <ab6fa50055fa0c39e5501c123c36e662eb48ae61.1761245114.git.calvin@wbinvd.org>
In-Reply-To: 
 <ab6fa50055fa0c39e5501c123c36e662eb48ae61.1761245114.git.calvin@wbinvd.org>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, amitkumar.karwar@nxp.com,
 neeraj.sanjaykale@nxp.com, yang.li@amlogic.com, pmenzel@molgen.mpg.de,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 francesco@valla.it

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 23 Oct 2025 11:47:19 -0700 you wrote:
> Thanks to Francesco Valla's investigation, the reason for the duplicate
> code I recently cleaned up is finally clear: a different structure is
> stored in drvdata for the drivers which used that duplicate function,
> but h4_recv_buf() assumes drvdata is always an hci_uart structure.
> 
> Consequently, alignment and padding are now randomly corrupted for
> btmtkuart, btnxpuart, and bpa10x in h4_recv_buf(), causing erratic
> breakage.
> 
> [...]

Here is the summary with links:
  - Bluetooth: fix corruption in h4_recv_buf() after cleanup
    https://git.kernel.org/bluetooth/bluetooth-next/c/1aaa18cc80c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



