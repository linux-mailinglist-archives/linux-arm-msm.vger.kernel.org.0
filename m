Return-Path: <linux-arm-msm+bounces-36519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA49B7255
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 03:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A1A3285CEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 02:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB76A126BF2;
	Thu, 31 Oct 2024 02:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxMv7CBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D41BD9F7;
	Thu, 31 Oct 2024 02:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730340027; cv=none; b=HGPFc0aRXO8kY2WVTiBnWyoQ1MyCrD+mrIt2ehn0Mo+LLCG99InU/A1gfIk4w/9gbEJsB0XE/nf7ZwTfmTbMYVDZhZy3ovNl5oi9P8/+kCkbbIYm0D1nhiPxYOvoXj7JP3R3Af0DFKoRl3sTZLpRm2fD2nEf53q8i2ep2Yg6bCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730340027; c=relaxed/simple;
	bh=vZMVsbHNqyyr8Yn54rtnZgMFl+1OmQ4zR7lt+BwmeFk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GoAkcKx71Wqbs9nKQhoFs6W9mwuBaY8OqantTCb3l27J0g00GN3cutYvbrdfADlDYdMP//Q07G8m7tmpOjrwQuGvMmkLtu8FvJ/AJx0TX6xGgZzSJHtj5+p+cyIImcgRbwkYWjQu0hBlHVuB1HKcZCb+Fdgka+AbkzVN/IRGRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxMv7CBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4088C4CECF;
	Thu, 31 Oct 2024 02:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730340026;
	bh=vZMVsbHNqyyr8Yn54rtnZgMFl+1OmQ4zR7lt+BwmeFk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sxMv7CBZ5foQRJW+oGoe0rVzaspDacvos4thi150CE89TnkNPqDgPEMNbLbCswULs
	 7o67xfN5No71n64T22aqaE/TXFAOfv6ILyspZP14vDjuKwzyz1FYQBYG5MPYDZS30p
	 vFHyln62v8uHZ6KXk2hswAYtFDZt6vz6hAouctN24aQYC2/D7LwimrS9Dkynjp4ZW1
	 k814zQpScpOuDMGECAL37Sy6a5k9iijdih6jxSXDN2y6K0DQ9FF+3qmiTbivyfU8YH
	 zMYqq2WExnrZf8nP9h0SuoNYOAXh8vRdvPHIZmruNBz+O+pOSDpkGjbX1Zzyb1Mmwo
	 qntiq7+0f9zWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF9B380AC22;
	Thu, 31 Oct 2024 02:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] Add ethernet dts schema for qcs615/qcs8300
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173034003374.1522872.103186698139735392.git-patchwork-notify@kernel.org>
Date: Thu, 31 Oct 2024 02:00:33 +0000
References: <20241029-schema-v3-0-fbde519eaf00@quicinc.com>
In-Reply-To: <20241029-schema-v3-0-fbde519eaf00@quicinc.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: vkoul@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Oct 2024 11:11:54 +0800 you wrote:
> Document the ethernet and SerDes compatible for qcs8300. This platform
> shares the same EMAC and SerDes as sa8775p, so the compatible fallback to
> it.
> Document the ethernet compatible for qcs615. This platform shares the
> same EMAC as sm8150, so the compatible fallback to it.
> Document the compatible for revision 2 of the qcs8300-ride board.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: net: qcom,ethqos: add description for qcs615
    https://git.kernel.org/netdev/net-next/c/32535b9410b8
  - [v3,2/2] dt-bindings: net: qcom,ethqos: add description for qcs8300
    https://git.kernel.org/netdev/net-next/c/0fb248365993

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



