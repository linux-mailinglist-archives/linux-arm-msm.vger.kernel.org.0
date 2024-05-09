Return-Path: <linux-arm-msm+bounces-19557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 414788C094D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 03:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C7E6B21518
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 01:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0689413C822;
	Thu,  9 May 2024 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0LSJbbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70113B5B3;
	Thu,  9 May 2024 01:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715219427; cv=none; b=HdmT2YDMc1+mBkdj5MCzdmYHRc9sYyU2oLqtH3dDq7KDStGdBj8vj9iI5k+VwLWUAV46oIUCTNIrHYUN2yV86OBZoW93k1xcqnO1sHA6qoafrUaQuiGPhk9zDPT6RhrAHAqBwZLwzHDKeIEKRZDvXxsQ6OCANjsKsOuuit9c5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715219427; c=relaxed/simple;
	bh=TjFtPczTySps3gtYiaLaMfzP0mzVJYqLHUsJpNxYMLg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Vt6NTQo0QhCJX9mMS7LE774sXugI4EWIylBTOiOeXO07s3FI8IZgkbi7tB56XQinuImOkfYj0D9Sk1hRq7h5Aloc23MfVEdGG6bmwLH7jTVJX10Tw6G4+5/TGJA6ouB6PScZhDBaz5IxT764gUjvS92ungIRycuS5O5xzMvHxHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0LSJbbQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52B09C3277B;
	Thu,  9 May 2024 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715219427;
	bh=TjFtPczTySps3gtYiaLaMfzP0mzVJYqLHUsJpNxYMLg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d0LSJbbQHDxyrM0TgTU4yAMD3lPyubH2P8+gvVy/YZtmEKiUyVA6c2cR3wkJJD5PH
	 +9N1wwzr7GxlBbRdDnpRqCYFT0t/gt/NdBMU70VpyQUC9WIdoAL7/3+BzsRglHYMb/
	 YURTen9dfj7Gxs+uVbi6Y3EOcvhrS0Yk0Z3loASbJFrtKEVP9BrWz4zZbJVTr2dtpE
	 DGPUsy6i5tOVw7Gf8ZeDX1IfKddHVv4Jr2zRqvcHWGzJljHuld0ys7g1LjwOY0IlKD
	 bfIDssEo1r6lW9JPo+VsxhfB0JhomkPTv7L6jfQbc/rvgJl9kxFVQEDZ3VgV5DtotZ
	 o5qQyK0nXiRwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 406EAC43331;
	Thu,  9 May 2024 01:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] dt-bindings: net: ipq4019-mdio: add IPQ9574 compatible
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171521942726.27440.15024502968877873009.git-patchwork-notify@kernel.org>
Date: Thu, 09 May 2024 01:50:27 +0000
References: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
In-Reply-To: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robert.marko@sartura.hr,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  6 May 2024 21:47:57 -0500 you wrote:
> Add a compatible property specific to IPQ9574. This should be used
> along with the IPQ4019 compatible. This second compatible serves the
> same purpose as the ipq{5,6,8} compatibles. This is to indicate that
> the clocks properties are required.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: ipq4019-mdio: add IPQ9574 compatible
    https://git.kernel.org/netdev/net-next/c/3a2a192b0ef1
  - [v2,2/2] arm64: dts: qcom: ipq9574: add MDIO bus
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



