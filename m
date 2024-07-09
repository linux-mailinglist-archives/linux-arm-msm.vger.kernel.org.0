Return-Path: <linux-arm-msm+bounces-25698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50AA92BE7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6CC21C21E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA64E158A0D;
	Tue,  9 Jul 2024 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1oudxLfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C33612D;
	Tue,  9 Jul 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720539206; cv=none; b=Y0cagndeqEvbM00PjKO4r958l9I58wLc/YkuoYeQ8lJAvQVPSddb+8LIohPCJCbs/AaSmUSrw4dejXYuxcLcE4/c8XhN3EpgJlauHk4zSVG6qCqiAeBl50/a6vn2rVIQvxompAIrAkUAcHbIvBMJukQLSEJmaK5S3wWwkn8Z7JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720539206; c=relaxed/simple;
	bh=pY25WsTXcfXBN8yFknJRY2jmv9s2nDkXO4pyC+FRaNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJinaxi+iwpIw7RSXQmZJ+LHQoTNFLkeaK+zBOQGOqrAY4FgTFLGjay7+c72comDs5NNE/ID1gfnQdpC6tLSmRQz0QoPOupGxaazRC3CrzEtBA+D/jCzE7CF5N5FMwn9zEa35ynLxGPXD3S3UaBT+eClLYfRU2UhK5QDEUuAHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1oudxLfh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mkymJhpeavluqOFMiJvyV+2k3L6noINCsr3A0Nquf2k=; b=1oudxLfhdXbwEnf+Ad8eNy9dxx
	CDjjadWAteVZi9kS9U1kGcr9M6DHvcyVBTMS6VtQTfs0+ZN5UOZKCbFF1RuOo960XdhuzbsqrhfZ8
	9srazH+1+y3s/LC0YE9kI9OJfMMLXCWrtFOepxcX40hEtd2oDN3qEWMZ5G16D/IK7Kho=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sRCq0-0029ml-BN; Tue, 09 Jul 2024 17:33:04 +0200
Date: Tue, 9 Jul 2024 17:33:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@quicinc.com,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos: add support for
 emac4 on qcs9100 platforms
Message-ID: <2427a6fe-834c-432c-8e5a-4981354645d2@lunn.ch>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
 <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>

On Tue, Jul 09, 2024 at 09:40:55AM -0500, Andrew Halaney wrote:
> These patches are for netdev, so you need to follow the netdev
> rules, i.e. the subject should be have [PATCH net-next] in it, etc as
> documented over here:
> 
>     https://docs.kernel.org/process/maintainer-netdev.html#tl-dr
> 
> On Tue, Jul 09, 2024 at 10:13:18PM GMT, Tengfei Fan wrote:
> > QCS9100 uses EMAC version 4, add the relevant defines, rename the
> > has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
> > and add the new compatible.
> 
> This blurb isn't capturing what's done in this change, please make it
> reflect the patch.

Hi Tengfei

If i remember correctly, there was a similar comment made to one of
the patches in the huge v1 series.

The commit messages are very important, just as important as the code
itself. Please review them all and fixup issues like this before you
repost.

    Andrew

---
pw-bot: cr

