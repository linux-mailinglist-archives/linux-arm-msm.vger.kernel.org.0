Return-Path: <linux-arm-msm+bounces-36208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7BE9B3AE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835301F21934
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A6B1DE2B2;
	Mon, 28 Oct 2024 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN4fG2rp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6BF1534E9;
	Mon, 28 Oct 2024 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730145636; cv=none; b=oj+lZFBPYy6nqt45YTHrSa6zQTrWXEI2rcPyA4emVMegWfXPKkLiRQv3as1MXPjWNumsHoKtJIzu+PUMnYbdVcDVWvChWjGngjN7m8Ww36z6qyMn2CRiGkV06iLBq653t7GfeyE/ZEgP3e9baPzW2ybnFwjDWWRZlBNuC+PUYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730145636; c=relaxed/simple;
	bh=iy6cHdmKo7wCiSyYpGY1RBRuKgRlluXl0frCJL21vbs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W+shYpKUkFLbd0rjPgfj4P6uWkavHglMOn1CqUNCMKFVBm9OSmU/wmB67LRdOWGA9u/qRT8GxljW+X/xA7huGhY2F6GyAqnUqq9VXXEF1beN+bjmf3qgKtTjpQ2RtEyB/92gKBeKtsXdF2RQ0hWHOUNifem6mWAwXyTUds+vJU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN4fG2rp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A00C4CEC3;
	Mon, 28 Oct 2024 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730145635;
	bh=iy6cHdmKo7wCiSyYpGY1RBRuKgRlluXl0frCJL21vbs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bN4fG2rpJm3/sOEiT84DBZqoW1a3L15EBPRGqoZxQhtP0cGEBcXJ3MVZsyZHua2Aa
	 rAAK06mcvnVQAhfgXeiE+6hOGbp9rF8gRZnUnNExRm7IZyNthurcr+SUyY3LEBRLIB
	 JK/FN58IshAykaHjkuNFqIJjp0JQ3CFN7rLf/5T0O2pWqMPZmh1w3a4Nmh4txZSSxd
	 h5ZcKExekp/IC72vQcPoweFunKlC2ixtXtzxfvTGNRMJg8IZO1UhB3m7wgW1ndv+L2
	 c4hxcBF7QRUYLP5LHv1f5bl3Sx4B81fVGOyQmvVQ2oIfhayG3lJjqzRmbTErq68iyv
	 X+fBHX5SDNatw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE370380AC1C;
	Mon, 28 Oct 2024 20:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/6] Add Nothing Phone (1) support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173014564250.163218.2856395815785502378.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 20:00:42 +0000
References: <20241020205615.211256-1-danila@jiaxyga.com>
In-Reply-To: <20241020205615.211256-1-danila@jiaxyga.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
 quic_rjendra@quicinc.com, andre.przywara@arm.com, quic_sibis@quicinc.com,
 igor.belwon@mentallysanemainliners.org, davidwronek@gmail.com,
 ivo.ivanov.ivanov1@gmail.com, neil.armstrong@linaro.org,
 heiko.stuebner@cherry.de, rafal@milecki.pl, lpieralisi@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 20 Oct 2024 23:56:08 +0300 you wrote:
> This series of patches adds support for the Nothing Phone (1), identified
> as nothing,spacewar. The Nothing Phone (1) is built on the Qualcomm
> Snapdragon 778G+ (SM7325-AE, also known as yupik).
> 
> SM7325 is identical to SC7280 just as SM7125 is identical to SC7180, so
> SM7325 devicetree imports SC7280 devicetree as a base.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: nfc: nxp,nci: Document PN553 compatible
    https://git.kernel.org/netdev/net-next/c/05c9afb9bfa3
  - [v3,2/6] dt-bindings: arm: cpus: Add qcom kryo670 compatible
    (no matching commit)
  - [v3,3/6] arm64: dts: qcom: Add SM7325 device tree
    (no matching commit)
  - [v3,4/6] dt-bindings: vendor-prefixes: Add Nothing Technology Limited
    (no matching commit)
  - [v3,5/6] dt-bindings: arm: qcom: Add SM7325 Nothing Phone 1
    (no matching commit)
  - [v3,6/6] arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



