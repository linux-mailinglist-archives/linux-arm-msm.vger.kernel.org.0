Return-Path: <linux-arm-msm+bounces-61760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DBADF623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86183ABE80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 18:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9412F948C;
	Wed, 18 Jun 2025 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bg30LeSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA12F9489;
	Wed, 18 Jun 2025 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272284; cv=none; b=AH1oZhCHFjOrOsEpeo/dC1qebBBaViZQYndsRUNX+Q8ZHnVG9gizPHYkb1VrXEPixSnvpF7MVooUG13UB5Ofqq56TA5ViujuUn/dg0Yt85HoiWu308Xa4BPtyzLV+RCRsAjT5hxYVfpP5Duu5ETCktuLPBU//D4D2UDSvuTbSmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272284; c=relaxed/simple;
	bh=FlkPWKCF+vrWk0zCgUpHWTZNjZJiKx1wM3zXfGDaXsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJr9iOF0KEan+AFlgevtuqvTMgEIV1lzcAATDhCtKVBjwpXzMnlQ+O3WioCEoTDvyhyNcfU5q/eCJxCxN/YIjmLpsL9D2E29u1xCzoKpYOkMjxDBw5JE6RIk3NalgWqStlZf/rDN7qOVWOsgfzQ+Z6NbI/yE0JBQK9w40cY1XWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bg30LeSS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14C3C4CEE7;
	Wed, 18 Jun 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272284;
	bh=FlkPWKCF+vrWk0zCgUpHWTZNjZJiKx1wM3zXfGDaXsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bg30LeSSE32MgC797Sw+q+dZZ+xVcEMIkll39N7Di6bIuOWcH/OEsrGIEPkWohOVE
	 eJ6ZnbdFdUmq3qlYI/4ZN24ym1SJTUOwr+qlvlstkyFErb8ljRHqmcqFGGb+MxAIk1
	 Wf1XvjEY2MdbpC8TQD5dCvisfYk00Ar8EwU3dEn6KwrkheyvOLf+9fyfPEfykRs4U7
	 SAi5V7OQkA+c7TuhaDViLEu199e05SWJzcqKruIfs1R7s55HuVzR/0UFkYH5ghKYrX
	 UQ18Biekpca6VwEXWP/nGleW/7yKzowRnrmgJ9+ZfeHewU58FV71DQ0Alx6278u06b
	 X/OHw5Il3vtTQ==
Date: Wed, 18 Jun 2025 19:44:39 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: replace ioaddr with stmmac_priv
 for pcs_set_ane() method
Message-ID: <20250618184439.GY1699@horms.kernel.org>
References: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>

On Wed, Jun 18, 2025 at 12:05:12PM +0100, Russell King (Oracle) wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


