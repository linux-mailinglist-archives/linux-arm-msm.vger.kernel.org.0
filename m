Return-Path: <linux-arm-msm+bounces-87738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6DCFA194
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50EB63004E32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1984E364E8B;
	Tue,  6 Jan 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iobjq0SG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF084364EA5;
	Tue,  6 Jan 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723873; cv=none; b=lRlToVP33I/N9x0dMHmoj2tfmJuBObGGW6x0JDmKVTESnhNK4CQf2gfgChAlZf1Tqj1koZQdrpDuIVh3Gai7q9uAT/wARi/XUDMLzmxTQo+DTdLXpIQ2Bn/aRJTDvTmotPcdAhEsgZrEmFGcP3dCI6FC7Gx1zKvrLNDSL41w9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723873; c=relaxed/simple;
	bh=O2YfAdaRm2JiOu1qyvpY1hWK7Jr4pDFI2YS5KPab1X0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ThTEoYUfIxv2ujhgHUCzh1hs9CvDnGzerWrwWBTa+i3ouop64pzzOftMrJggOnm3n8y/T9zSp/e4KkPxL4JrwYBrxPkxHQuuGV+vofkS7HQ21ojHG8/BM5ipflPC9gn9EtXoQ673V5VguSn+YPeqdCOE+FjuT/O1/0ULooYa9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iobjq0SG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6087CC116C6;
	Tue,  6 Jan 2026 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723872;
	bh=O2YfAdaRm2JiOu1qyvpY1hWK7Jr4pDFI2YS5KPab1X0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iobjq0SGDWGQ+/K5GpawgISz5fIHyO0A05zArzOAREGXyBQ0c6fULXlOz+zdv1/Fr
	 v01HTu4tIxTVoRSEc/QOuwEJyiO2WuztNRRVl3Lj9ZnTzaiY5gj6qo04o+rpBOwAAl
	 a59E8FUv4blz+h/7Exzh5tabE02DxqIJawhmRPMbw88LvbEXtH8YYvwCkZlUZxuIIv
	 S7SiT26uY05osZ5XPaCTlKGR9uhOY902i8bBSE1DEa9YEx7OHZm5KhTgv40ZnZh8Io
	 5AlGpVV4BVhW72tUH5RAK4wI+2aHz4HFij3aGlX+diCuOZw4tohwzNigbtzmN02h6q
	 tGvmGgRiP2lLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C0A8380CEE8;
	Tue,  6 Jan 2026 18:21:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/1] Bluetooth: btqca: move WCN7850 WA
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176772367001.2054401.1990279895099735055.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jan 2026 18:21:10 +0000
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  6 Jan 2026 10:07:37 +0800 you wrote:
> Move WCN7850 workaround to the caller
> 
> Changes v7
> - Update the if logic for firmware retrieval failure.
> - Link to v6:
>   https://lore.kernel.org/all/20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com/
> Changes v6
> - Add WCN7850 workaround details in the commit.
> - Reduce the logic nesting level.
> - Link to v5:
>   https://lore.kernel.org/all/20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com/
> 
> [...]

Here is the summary with links:
  - [v7,1/1] Bluetooth: btqca: move WCN7850 workaround to the caller
    https://git.kernel.org/bluetooth/bluetooth-next/c/d6af4afb70c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



