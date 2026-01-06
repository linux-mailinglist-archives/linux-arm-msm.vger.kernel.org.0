Return-Path: <linux-arm-msm+bounces-87739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3640CFA1A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DA8C301DE3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B76365A1E;
	Tue,  6 Jan 2026 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tl1XRplL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8CE365A0E;
	Tue,  6 Jan 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723874; cv=none; b=c2DC1gxDGh7v2aHBGDub5gb1x+WRwZviMTYtXZS5BbjzuZZKxWPlaLshubVlh8Eoye/GDXnDuc/qr4Lkkuns7othpG1l/VaHActFH3wFSCgXZKCR2Ap1oDcf3RQ8G3j6p+h/jbMNOI2FI7DfBioLHZQZr19ma8q57qBGh8/axPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723874; c=relaxed/simple;
	bh=5nm+2FqlveMbs0kxg5bKImRAhZnncshdO88FXiNIK0o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dTL9jiwxUtd4fw2/voWiOjUAEUUYcqWAdSXmm/VdIxXZBDt2/na5HkP2BcTcvN8FpbrWsqEX/UV+JKQLV/KkrEql/s24M9b92YO4eDWvJSpbZVPrTDZR0hBujWJGIbtOlyTN8Imv7QJQhNbCUSxadt5pC9KCYYYnDg23jRV+GaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tl1XRplL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B45C16AAE;
	Tue,  6 Jan 2026 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723873;
	bh=5nm+2FqlveMbs0kxg5bKImRAhZnncshdO88FXiNIK0o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tl1XRplLmKrI9pJHWVo6I6XIzyavqwa5LnBDIaObzw3fO9hTkxrr5Ux4Fpw0xiKO/
	 r/FIGgTR87AlZAfeBrohC0ezNT0v131xcPPir/hovTiTjHgclCDstTXnDQ+OYNIUEn
	 n/WT41p+Kpm5kSeiYxB+eFSRm1KgNOaWJmc8v6MuS8qbwQqD1HBeoGFialp4/sMu8y
	 FwTZQdxmw70PSotY2kILrKIuuMPR/88osVpoXfa2J1A/Bvz/ikse/PmrlggfJQZjhg
	 jq540+PQ0BOD78FJJLD+moGrplGlDR+ZUfjefodvkFrOmGAXxRsbHZ0YTXwq6ZEhWs
	 6GKwlqKRJxJ7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7879B380CEE8;
	Tue,  6 Jan 2026 18:21:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 0/2] Bluetooth: btqca: move WCN7850 WA and add WCN6855
 firmware priority selection feature
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176772367127.2054401.4884359431579092369.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jan 2026 18:21:11 +0000
References: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  6 Jan 2026 12:35:01 +0800 you wrote:
> patch1: Move WCN7850 workaround to the caller
> patch2: Update WCN6855 firmware to use the new FW file and added a fallback mechanism.
> 
> Changes v9
> - Add Reviewed-by tags
> - Link to v8:
>   https://lore.kernel.org/all/20260106024806.480779-1-shuai.zhang@oss.qualcomm.com/
> 
> [...]

Here is the summary with links:
  - [v9,1/2] Bluetooth: btqca: move WCN7850 workaround to the caller
    https://git.kernel.org/bluetooth/bluetooth-next/c/d6af4afb70c9
  - [v9,2/2] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
    https://git.kernel.org/bluetooth/bluetooth-next/c/030d2c0e9c1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



