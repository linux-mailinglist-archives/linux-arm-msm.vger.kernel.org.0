Return-Path: <linux-arm-msm+bounces-33130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CB99052D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34C7D1F22050
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4FC212EF7;
	Fri,  4 Oct 2024 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vGDjZQ0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4BB15748E;
	Fri,  4 Oct 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050543; cv=none; b=ah+gc/bW0T5KtoG/iBjAD2uCmFLkmURXvBHABT56u21B6j9L6/wTTrs1MGUdysCoTy/IJdt4sDlSpD4vK2vDg6XPVaCk4BS6qy8hgP9NVRN0WgCQ1LvXXGtjDICefZ/1CunIquyIg9kSvXjc5RdpU31eboYrPqW41U7QzmkRkns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050543; c=relaxed/simple;
	bh=QW0C9c3/EVKwVlM57ULE+y2nHs7/G/DlCmIwV5GuFm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gu5RflgWuXoOjGiGjZjW3sy/V0egx2b+HJ5ydjWM0D7cjDYX7n8RpdV7OjEik3tdZd8J2ZAPhR2owofd7S51OnUzb8JiGt44w2ldDETQdGqCjw+2/WfnObXEt5OpGgjrp2QP59f5r4HWlQdoKRgQ4KvGb3Hozs6td8cjwz10eVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vGDjZQ0Z; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=fu3VaCt1xTWMku+JYWxGDTg9qgPJOaVq3TcXvd2ZQk0=; b=vG
	DjZQ0Z6kq+zCzKgcW5p0z5r/rfnsOF4L0viMGGQkKkh3IyoHMaplUQgf/gEKCcdUv69jL7InwOmt8
	EqWV6vC1fJA07as/7eE2OthCZbCAbBCKynUK/CVI1slEiIr0i5nCOlpVB7EyYRYgR2GYQTG/v85KD
	Kt/cztepW5f4grs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1swisa-0093HV-S5; Fri, 04 Oct 2024 16:02:00 +0200
Date: Fri, 4 Oct 2024 16:02:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@linaro.org,
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
	richardcochran@gmail.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	arnd@arndb.de, m.szyprowski@samsung.com, nfraprado@collabora.com,
	u-kumar1@ti.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <6a431336-621d-4284-a0ca-b68921de22eb@lunn.ch>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com>
 <f9d3f263-8559-4357-a1c6-8d4b5fa20b8c@lunn.ch>
 <302298ef-7827-49e1-8b0f-04467cb38ad7@quicinc.com>
 <29b84acf-2c57-4b0e-81f0-82eb6c1e5b18@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29b84acf-2c57-4b0e-81f0-82eb6c1e5b18@quicinc.com>

On Fri, Oct 04, 2024 at 01:25:52PM +0530, Manikanta Mylavarapu wrote:
> 
> 
> On 6/26/2024 8:09 PM, Devi Priya wrote:
> > 
> > 
> > On 6/25/2024 8:09 PM, Andrew Lunn wrote:
> >>> +static struct clk_alpha_pll ubi32_pll_main = {
> >>> +    .offset = 0x28000,
> >>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
> >>> +    .flags = SUPPORTS_DYNAMIC_UPDATE,
> >>> +    .clkr = {
> >>> +        .hw.init = &(const struct clk_init_data) {
> >>> +            .name = "ubi32_pll_main",
> >>> +            .parent_data = &(const struct clk_parent_data) {
> >>> +                .index = DT_XO,
> >>> +            },
> >>> +            .num_parents = 1,
> >>> +            .ops = &clk_alpha_pll_huayra_ops,
> >>> +        },
> >>> +    },
> >>> +};
> >>> +
> >>> +static struct clk_alpha_pll_postdiv ubi32_pll = {
> >>> +    .offset = 0x28000,
> >>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
> >>> +    .width = 2,
> >>> +    .clkr.hw.init = &(const struct clk_init_data) {
> >>> +        .name = "ubi32_pll",
> >>> +        .parent_hws = (const struct clk_hw *[]) {
> >>> +            &ubi32_pll_main.clkr.hw
> >>> +        },
> >>> +        .num_parents = 1,
> >>> +        .ops = &clk_alpha_pll_postdiv_ro_ops,
> >>> +        .flags = CLK_SET_RATE_PARENT,
> >>> +    },
> >>> +};
> >>
> >> Can these structures be made const? You have quite a few different
> >> structures in this driver, some of which are const, and some which are
> >> not.
> >>
> > Sure, will check and update this in V6
> > 
> > Thanks,
> > Devi Priya
> >>     Andrew
> >>
> 
> Hi Andrew,
> 
> Sorry for the delayed response.
> 
> The ubi32_pll_main structure should be passed to clk_alpha_pll_configure() API to configure UBI32 PLL. clk_alpha_pll_configure() API expects a non-const structure. Declaring it as const will result in the following compilation warning
> 
> drivers/clk/qcom/nsscc-ipq9574.c:3067:26: warning: passing argument 1 of ‘clk_alpha_pll_configure’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>   clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
>                           ^
> In file included from drivers/clk/qcom/nsscc-ipq9574.c:22:0:
> drivers/clk/qcom/clk-alpha-pll.h:200:6: note: expected ‘struct clk_alpha_pll *’ but argument is of type ‘const struct clk_alpha_pll *’
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>       ^~~~~~~~~~~~~~~~~~~~~~~

As far as i can see, clk_alpha_pll_configure() does not modify pll.

https://elixir.bootlin.com/linux/v6.12-rc1/source/drivers/clk/qcom/clk-alpha-pll.c#L391

So you can add a const there as well.

> The ubi32_pll is the source for nss_cc_ubi0_clk_src, nss_cc_ubi1_clk_src, nss_cc_ubi2_clk_src, nss_cc_ubi3_clk_src. Therefore, to register ubi32_pll with clock framework, it should be assigned to UBI32_PLL index of nss_cc_ipq9574_clocks array. This assignment will result in the following compilation warning if the ubi32_pll structure is declared as const.
> 
> drivers/clk/qcom/nsscc-ipq9574.c:2893:16: warning: initialization discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>   [UBI32_PLL] = &ubi32_pll.clkr,

Which suggests you are missing a const somewhere else.

Getting these structures const correct has a few benefits. It makes
you code smaller, since at the moment at load time it needs to copy
these structures in to the BSS so they are writable, rather than
keeping them in the .rodata segment. Also, by making them const, you
avoid a few security issues, they cannot be overwritten, the MMU will
protect them. The compiler can also make some optimisations, since it
knows the values cannot change.

Now, it could be getting this all const correct needs lots of patches,
because it has knock-on effects in other places. If so, then don't
bother. But if it is simple to do, please spend a little time to get
this right.

	Andrew

