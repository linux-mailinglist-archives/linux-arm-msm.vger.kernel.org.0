Return-Path: <linux-arm-msm+bounces-3464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF180583F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 16:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0A91F2177A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 15:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C3167E91;
	Tue,  5 Dec 2023 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nPxPoHJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD0C10F0;
	Tue,  5 Dec 2023 07:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aZu+uSCJ3lEYSB0j9Iy80vIfNxTNXJ4VelOQ0ZqcQ9Q=; b=nPxPoHJbve3mGPvEHFEoeLrtBk
	jkOPjUcYqrgRJLSrgG/8KgIGxRFRNUHi548qip3P/fC2dpH7Ph0lJpkZKxtTT7KXcVraExgj6P++M
	VQr9Dws6oOV9lu3yQ/ltTrvf5uiQXMmlbhdcwNvWQ6rduX2Rud8zc0gfgBdhxFuCP5Gs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rAX2E-0026f7-EH; Tue, 05 Dec 2023 16:08:30 +0100
Date: Tue, 5 Dec 2023 16:08:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs nodes for
 qcom ethqos
Message-ID: <3e4a1b9c-ed0f-466e-ba11-fc5b7ef308a1@lunn.ch>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204084854.31543-1-quic_snehshah@quicinc.com>

On Mon, Dec 04, 2023 at 02:18:54PM +0530, Sneh Shah wrote:
> Add sysfs nodes to conifigure routing of specific vlan id to GVM queue.
> GVM queue is not exposed to PVM stmmac, so TC ops can't configure routing.

Adding files in /sysfs has ~0 chance of being accepted.

As requested, please explain what all these different hardware blocks
are, and what you are trying to achieve. We can then recommend the
correct interface.

    Andrew

---
pw-bot: cr

