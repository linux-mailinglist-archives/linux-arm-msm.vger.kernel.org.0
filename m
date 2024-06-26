Return-Path: <linux-arm-msm+bounces-24332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE0B918A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE502285C97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0057819004D;
	Wed, 26 Jun 2024 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="THZBAYg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724F18FDD4;
	Wed, 26 Jun 2024 17:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422810; cv=none; b=mccflGDDJDeV+Aa/HeQu3Nx4ylkXx0QClJSZPaunid6XgSLMzMTZe+DZsJ6wIUGupKEUUS8fJhwYpTCZQgKo6RD1ZeEsafOumMEQ6Rszy85+OUoruydgZqTcYqzFR4wh7EZoIrkUxBR4SeG6XsThKUb+XehFMXoBw2zLr50G7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422810; c=relaxed/simple;
	bh=0yMnKGY439ZJXOuVIw2kqCCYUMshb58EVAHnlZdiX8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3b93M8aGfLuNllf+WRBbV0x+t8DzPsyLUoUkBgJTErUu4QY0KZezUVdOhBNhY1AydBPH/o6OPXTt5XaRobLzdSukVQxqbUHFhA220BhB4Rv6zRhxCNxjQIe2yssO49AO7BmVeU7p0I0nLRszmpwvlS8EkrhCdMI/QRBIJa86jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=THZBAYg6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=shjrQOgLm3XfFHmcQBDx0vYvLb6ShIsh3+fZWsScilM=; b=THZBAYg6BuxoU53DcDGfN8IP6l
	R451SX0J+E/Sz4UUSDzM2ZH7F5hIBbxe0MTCREd0Rn5JG5lStHz/nyw7AhE8BKOFAWT2hvH4yHqyW
	T+XexreCT2bQVOJqVc7bg05rkbA7LZliRwMTgVjYbA3U9zct4QBhOX3QjEHzjoJIzEEI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMWPg-0013pv-6T; Wed, 26 Jun 2024 19:26:32 +0200
Date: Wed, 26 Jun 2024 19:26:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: Devi Priya <quic_devipriy@quicinc.com>, catalin.marinas@arm.com,
	u-kumar1@ti.com, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, geert+renesas@glider.be,
	neil.armstrong@linaro.org, nfraprado@collabora.com,
	mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, netdev@vger.kernel.org,
	konrad.dybcio@linaro.org, m.szyprowski@samsung.com, arnd@arndb.de,
	richardcochran@gmail.com, will@kernel.org, sboyd@kernel.org,
	andersson@kernel.org, p.zabel@pengutronix.de,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
Message-ID: <eeea33c7-02bd-4ea4-a53f-fd6af839ca90@lunn.ch>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
 <171941612020.3280624.794530163562164163.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171941612020.3280624.794530163562164163.robh@kernel.org>

On Wed, Jun 26, 2024 at 09:35:20AM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
> > Add NSSCC clock and reset definitions for ipq9574.
> > 
> > Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  Changes in V5:
> > 	- Dropped interconnects and added interconnect-cells to NSS
> > 	  clock provider so that it can be  used as icc provider.
> > 
> >  .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
> >  .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
> >  .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
> >  3 files changed, 360 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
> >  create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
> FATAL ERROR: Unable to parse input tree

Hi Devi

Version 4 of these patches had the same exact problem. There was not
an email explaining it is a false positive etc, so i have to assume it
is a real error. So why has it not been fixed?

Qualcomm patches are under a microscope at the moment because of how
bad things went a couple of months ago with patches. You cannot ignore
things like this, because the damage to Qualcomm reputation is going
to make it impossible to get patches merged soon.

	Andrew

