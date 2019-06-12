Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E361C41B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 07:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbfFLFKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 01:10:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:51250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfFLFKe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 01:10:34 -0400
Received: from localhost (unknown [106.200.205.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 174A32086A;
        Wed, 12 Jun 2019 05:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560316233;
        bh=nNjKAxSLRS5Wjiv8q+eu2ijlG5c33+pSJg4RaD8PxrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BIui0OQqALdAHPyilX/7/gKaWBcm80sNz4iluadBIGiCO4PvyOxQUogUIMybCxNDO
         ymaLV5apKyngtuMFhzPRcMSFRTaYsf+QNJXppTCr34BfMpHMk01Cr1YblkhlpOCAhu
         R1m6hdfRTBroOOGyOFQ2qAXwNsFOrzWsXkQDgNb4=
Date:   Wed, 12 Jun 2019 10:37:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for SM8150
Message-ID: <20190612050725.GA9160@vkoul-mobl.Dlink>
References: <20190607101234.30449-1-vkoul@kernel.org>
 <20190607101234.30449-2-vkoul@kernel.org>
 <20190607174353.31EDA208C3@mail.kernel.org>
 <20190608091537.GG9160@vkoul-mobl.Dlink>
 <20190610150827.607F6207E0@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610150827.607F6207E0@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-19, 08:08, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-08 02:15:37)
> > On 07-06-19, 10:43, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-06-07 03:12:34)
> > > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > > > new file mode 100644
> > > > index 000000000000..1cbc884444c9
> > > > --- /dev/null
> > > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > > +static const struct parent_map gcc_parent_map_0[] = {
> > > > +       { P_BI_TCXO, 0 },
> > > > +       { P_GPLL0_OUT_MAIN, 1 },
> > > > +       { P_GPLL0_OUT_EVEN, 6 },
> > > > +       { P_CORE_BI_PLL_TEST_SE, 7 },
> > > > +};
> > > > +
> > > > +static const char * const gcc_parent_names_0[] = {
> > > 
> > > We have a new way of specifying clk parents now. Can you use that
> > > instead of using strings everywhere?
> > 
> > Okay I will update, any pointers on new implementation I can look up?
> > 
> 
> Not really yet. Chen-Yu is working on the Allwinner driver
> (drivers/clk/sunxi-ng/) and some work from Jeff for MSM8998 is on the
> list that you can look at.

Thanks for the pointer, I have done the conversion and will post the
update in v2

-- 
~Vinod
