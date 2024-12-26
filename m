Return-Path: <linux-arm-msm+bounces-43378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F89FCC68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49C6C7A0795
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 17:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239BC136353;
	Thu, 26 Dec 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qAkkU0uX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF082AEE0;
	Thu, 26 Dec 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735233685; cv=none; b=VNGTxvME0Yl/iH5FzDz94aY1UC5N2ltAhzuvvqpz+oP96+onOckYNf5MLjhY4zvbHa1+QjlNyCMWrMp+WCjXNV/tPiuMDcpbHt2EXru55jtGCW3S2qeAwDrD+sTgLfWtVTeGdDtDQEOnYA9GY4c1Y9kl3RggWXd06Y43X/8fr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735233685; c=relaxed/simple;
	bh=5kZVBKaaxLNmw0g83FKHMa65Cp3iex2kCA+OMNcKW/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b348eUpQtZPQDR+QV5FMbtT9R8JKzZDvQglXtSu5XQsN61U3gAGB4BGM+aCmYwEXIdlA13wEHeewty+UAhdw0CmngCGqvINQW8lGxQ9UeiYB63RNnh0NVT8tpnjOGd6iTasiP8prSp0qx4igiZOp2mRaeQHNSDVpXU/2Dfbf+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qAkkU0uX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5N+wx0Qk5TqbeXwXzSz+Fa7T6lAtBAss99O2QCq8s3Q=; b=qAkkU0uXstPl9370wu/aPWwF6F
	n7bPhHYuNGdw+aYgEPOqMZ6AUjgUqd41KmjtMYBxSJ1NNoQv5QKIy4f6qG2ZkzraAaL9zVwLBZY4B
	CFhkBjr/xoKQ7gbEHQ6tOCXJ6ohc1T1CSOZOYA5ocqJNarZTb7di/ofgClcbRHAsxi9o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQrXk-00GQ7T-3M; Thu, 26 Dec 2024 18:21:04 +0100
Date: Thu, 26 Dec 2024 18:21:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable
 swap on qcs615
Message-ID: <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>

On Thu, Dec 26, 2024 at 10:29:45AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-25 19:37, Krzysztof Kozlowski wrote:
> > On 25/12/2024 11:04, Yijie Yang wrote:
> > 
> > >   static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   {
> > > -	struct device_node *np = pdev->dev.of_node;
> > > +	struct device_node *np = pdev->dev.of_node, *root;
> > >   	const struct ethqos_emac_driver_data *data;
> > >   	struct plat_stmmacenet_data *plat_dat;
> > >   	struct stmmac_resources stmmac_res;
> > > @@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
> > >   	if (ret)
> > >   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
> > > +
> > > +	root = of_find_node_by_path("/");
> > > +	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
> > 
> > 
> > Nope, your drivers are not supposed to poke root compatibles. Drop and
> > fix your driver to behave correctly for all existing devices.
> > 
> 
> Since this change introduces a new flag in the DTS, we must maintain ABI
> compatibility with the kernel. The new flag is specific to the board, so I
> need to ensure root nodes are matched to allow older boards to continue
> functioning as before. I'm happy to adopt that approach if there are any
> more elegant solutions.

Why is it specific to this board? Does the board have a PHY which is
broken and requires this property? What we are missing are the details
needed to help you get to the correct way to solve the problem you are
facing.

	Andrew


