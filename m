Return-Path: <linux-arm-msm+bounces-20412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06328CE85E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 18:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4DFE1C20DDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB2612E1CA;
	Fri, 24 May 2024 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="11dueYCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6312CD81;
	Fri, 24 May 2024 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716566393; cv=none; b=QSg0dnXHLebZAingScfPjdadzHxjXipW231jp5i6eissHGgb4XkuQgKpJ2Q7l8554Tz5Gper7E0XoD3+CuQbmK2U9v+FBAISw3hYoiBA7nn2/V5JeSBCE9jh8wFK05s6Hvh/J2MapERpif/34ygaEYn6OheQQJq/IicrsuRb2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716566393; c=relaxed/simple;
	bh=j9GnoRnBxKAfJMniMK4+244GYKRDu3EYSWND1e65eu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiI09nX77rrbrYz1w1rZxYLhagjot3WesG3AHf8O0uLeGjwrv0G4FlQrd1LmEW8AtoJCZ+FnklR6oyebYuDbwKC77v6AuaQzTDXZE3FyYFsRj/8GPQskhHKwYKZHNusM9NP5Jk+pihnHkepiH6+kRgmJfobXBqmX9jjswTTIiRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=11dueYCk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tsrTfcYlYoIi2ULwMP08t3DckkAKUuWgxb+N8QZWBaE=; b=11dueYCkrcEi9jIL+v4GRPpGqn
	vlBk6bj7dhclDbDGGaCQJmVTpXhlte3CsJWNeVDUUa9nygCWlkyVum42FTOHlirzlJSrqZwTq3T0y
	reFptUa8ntGRuEhix5xUEkOBKH9v7ZQP0lTfvfvaSiVWCFKiVRZbKNrma0mOCK+ulfFk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sAXKL-00Fxpn-An; Fri, 24 May 2024 17:59:29 +0200
Date: Fri, 24 May 2024 17:59:29 +0200
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
	Andrew Halaney <ahalaney@redhat.com>,
	Russell King <linux@armlinux.org.uk>, kernel@quicinc.com
Subject: Re: [PATCH net-next 1/2] net: stmmac: Add support for multiple phy
 interface for integrated PCS
Message-ID: <33339d78-9ca4-4e60-83c2-f6701b840928@lunn.ch>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
 <20240524130653.30666-2-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524130653.30666-2-quic_snehshah@quicinc.com>

On Fri, May 24, 2024 at 06:36:52PM +0530, Sneh Shah wrote:
> In case of integrated PCS ethernet does't have external PCS driver.
> Currently stmmac supports multiple phy interfaces if there is external PCS.
> Add a function to support mupliple phy interfaces when PCS is integrated.

s/mupliple/multiple.

	Andrew

