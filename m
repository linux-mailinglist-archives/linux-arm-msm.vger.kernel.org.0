Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0087B2B3C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 06:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgKPF0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 00:26:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:50910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgKPF0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 00:26:05 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B73BF22280;
        Mon, 16 Nov 2020 05:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605504364;
        bh=fQUgrMcbFWfiS0A0RxiAzadJ++hVicH+Uu5uHwuRK8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h1T0USu1pTOtun6J69QO3sIhrfIPE0ZHtyNcLTGfFxUI4OAG+heLLCT3D6Nlbep7K
         0igVsG8gDenqAmMOUIBpkDJHOdW0QRlHgYJ1FGOzfI+MRDARU+Dbc1bFQ2rp29ohVh
         lCmYPgP/nlKuxB2feOWfixOKJ5oZMD68vbhLf8hA=
Date:   Mon, 16 Nov 2020 10:56:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add SDX55 GCC support
Message-ID: <20201116052600.GA7499@vkoul-mobl>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-3-manivannan.sadhasivam@linaro.org>
 <20201106093819.GE2621@vkoul-mobl>
 <20201115011711.GI332990@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201115011711.GI332990@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-11-20, 19:17, Bjorn Andersson wrote:

> > > +enum {
> > > +	P_BI_TCXO,
> > > +	P_CORE_BI_PLL_TEST_SE,
> > 
> > This is for test and we removed this for upstream, so can you do that as
> > well (not parent will decrease for clks below)
> > 
> 
> We have several other platforms that includes the bi_pll_test clock -
> and it's there in the hardware, so I think we should just keep it.

I dont mind either way ;)

> Is it causing any issues?

Not that I am aware off.. It was request from Steve to remove these as
they will not be used upstream

-- 
~Vinod
