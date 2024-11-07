Return-Path: <linux-arm-msm+bounces-37217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B70129C01A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DF4D1F23DFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF76B1E2820;
	Thu,  7 Nov 2024 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUn0HUiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B60C1DFE2C;
	Thu,  7 Nov 2024 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973569; cv=none; b=FNO1sY1qK08lkxyBX2cpg9S1p3HUNaLsymbNUhOf6jL3nNmAApWx/hE7FJrmVp/S38ei7V25dE7N8EQ9hG14HT8X4LRJIKyQsgJWRegBskku7x2HZoNEL0EeG++ZXZBe/idoHQCmKUYCuVLMijvVGkwtoqhOc4KNh4GnTtHquNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973569; c=relaxed/simple;
	bh=lm6Uf3w1PHBR+JNyeCGAE9XqYARiomKV5IfnGY3EVu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucfaCRbP7EhncVyFL9CpKlGWuOq9upm7ws5v+4RFIa4cvgl3aRamVOPbiO1MkkH14QFpy7wsLUuzv70AwfQaxKC5tKlBvROJmImGnnDHK6TOz8djm+oMaIxWjxRmIvqWEv1ucFyvdBNg85Ck1bdc2g7QR0Re2OCVnx0mWUZ288o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUn0HUiF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E199C4CECC;
	Thu,  7 Nov 2024 09:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730973569;
	bh=lm6Uf3w1PHBR+JNyeCGAE9XqYARiomKV5IfnGY3EVu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUn0HUiFOP9Yx9v3cBxoXlC7eNqQFEmg4H4dKD+RknqzrhrwSewx0Y3YdLFLQ2Gzk
	 DUpyj4T6Q97XMHgwdnOXmnNwHoQes4x+ICiH43BuPNoAq4rZIKZZ7KFdlTuQ7rdc2z
	 bCSGnIN/AokeEnLUVgetMjE9snnZD4n7hNI7NbYTtqgVbjHFCQw8l0dQTZHk19xo4f
	 szrueCBL3fyH/xXO/u+R3volcKkEEgigJC8DSGhYcJ2R3Lil9JiuqLVBswC+hNdl5l
	 99JFqEuszEH2MSQt88c0+zxab4uOzZt1JYZxFeTON5Jvhrzb1eQ6Yfz61mIFgR6ro4
	 OwtU4f2d+4BIA==
Date: Thu, 7 Nov 2024 10:59:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_narepall@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter
 flag for SD card
Message-ID: <qffggh2ld2cw7d3eqwaerzicerhvdqojwsasherx7dgoda42b7@bigsjxr6vtao>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-2-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107080505.29244-2-quic_sartgarg@quicinc.com>

On Thu, Nov 07, 2024 at 01:35:03PM +0530, Sarthak Garg wrote:
> Introduce a flag to indicate if the Qualcomm platform has a level
> shifter for SD cards. With level shifter addition some extra delay is
> seen on RX data path leading to CRC errors. To compensate these delays
> and avoid CRC errors below things needs to be done:
> 
> 1) Enable tuning for SDR50 mode
> 2) Limit HS mode frequency to 37.5MHz from 50MHz
> 
> Add this flag for all targets with a level shifter to handle these
> issues for SD card.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

This wasn't tested, so just short review - platform means SoC usually,
so this looks SoC specific, thus implied by compatible.

Best regards,
Krzysztof


