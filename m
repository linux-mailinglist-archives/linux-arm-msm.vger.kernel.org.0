Return-Path: <linux-arm-msm+bounces-12618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C788684A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 00:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0494A285ED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 23:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE4F135A45;
	Mon, 26 Feb 2024 23:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iJfF8cvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC260864;
	Mon, 26 Feb 2024 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708990754; cv=none; b=UstDb94ctG2rEKBmuirEzQCiPUSZ3c33dNxLRYnbQxzP1ny0RYqa7gKZik50D3dv5tnkf9EjqO4I4u86oEWnNeR2kMniWPH2FM2togJTI4PbkbsmGUKsd1ZEytv5L6yF8i0pCHJyuLLAOzwkHL+/kxQtzznvnPrMLTLW72EUuvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708990754; c=relaxed/simple;
	bh=DC4XPRGfDGkd+lTP0RPnZft98OYBjzRmA203J/eHadU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8ZqRbk2FejGtmzCPXisOn7D5VRpecw8cpBmNGpaQunJdl7m8brHnBH6F91REsSIm2jNDu2DMAfTLj0ebZ1pt0HnGxizhiSRszutay4x+U1F/yfCMIZV65kBvotmrBL7UlrgvErKSx63VfFMLWURppggcLyMaLKvj1Ca1Ulad8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iJfF8cvJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7Otld8V/bzkJaFDg5xKk0LY1UIWmUWFwWmtXGjOC6yU=; b=iJfF8cvJ/VlmCEUV3k+y55j5+A
	jkGnLmwMn+4b2kyVoBJ/ZtWI/CW5V/ZkvTFCytF3AwIpxEmkYl+bihY0OvF0ggYrnagtM1bKTjEz+
	QwFY7UAe0ZIPxTtz8KS7RSTlC22W6N8L/gj80aLXSljhSBIHboaYRtnTi7ChWqLlFQ9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rekZ5-008lx7-6g; Tue, 27 Feb 2024 00:39:19 +0100
Date: Tue, 27 Feb 2024 00:39:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sarosh Hasan <quic_sarohasa@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>,
	kernel@quicinc.com, Sneh Shah <quic_snehshah@quicinc.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac-qcom-ethqos: Update link
 clock rate only for RGMII
Message-ID: <dd9b608d-aa37-4798-b1ca-20ee447d3065@lunn.ch>
References: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226094226.14276-1-quic_sarohasa@quicinc.com>

On Mon, Feb 26, 2024 at 03:12:26PM +0530, Sarosh Hasan wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

