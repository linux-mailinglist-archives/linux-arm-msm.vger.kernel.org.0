Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13537476908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 05:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhLPEXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 23:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhLPEXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 23:23:00 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8317BC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 20:23:00 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so27477957otv.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 20:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GDdv/EeBUFLk3bv9K+cRCt6BYkbbDx2RqVmNewbZxFw=;
        b=Ieq4eq6kQDwb37q6f2KGArlHmOblH6W/9exjQQ8JlVElP5O8MfHHM8kNcrk+MJT7El
         JSVHUV/Y9VNwNGou7UidGHL4sYBz3+rdrQFbuFqmSTSbhTaVVj1hYfKHrzVOdO3KyG25
         pY3wWDGkY2Ty7YTo+VmkXoSUa92YxGDTYdfsRsn9LyuuT+tH2d9G5SWHd78nGwF5xmYI
         s7acF/FpGYeS6pAnaxIqrkB8beG4BRcjEWKWOrx3rwkwMhxof6TnRfp/uzvbSLMmTZOK
         hK/fvgRGaZ/ceKyIrmtOZVwNWV6+b1nEY6hGcRQ+QUYN9Q4cT33m+zVDBgyFfsD6y36X
         c2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GDdv/EeBUFLk3bv9K+cRCt6BYkbbDx2RqVmNewbZxFw=;
        b=Y/WwLeoseYRsfofYdWIVdkUbMSlwL1KViF9meXeUB6iMXWfhLDZB8SDRgKbCyvpYIv
         BzL4GqlupfpXxTed9s9y3kiOPd9+mYgrvBnzd9M46+rfZ+DfvNfU8NDzD/V9tRfwxIXk
         3C7abSRpQkszDOwG0BwTezlHe1E7YVmiq2E9+0IIlgNGO/zBz14WMW1SIPRcvIcRLb6D
         Rlm6T+hepkK5niAVEbtCj6Zf6JnEo27ZlOXWi2l2xoECioqzDJZQq0NdnJ8hzVCcrUv8
         LUh3Mt3qmC+ke2kk7N/gdd9yVMOCKzoxFj2LC70kpSs2C7qN7qXRNdg//QIsaI3mB5WB
         rP7Q==
X-Gm-Message-State: AOAM533GSWv7acBcOhsXJ97aSp81m7CiLeXHSy6b10oatGd91cBOuunZ
        LJIaqNBYwNWnJUXK8jRjr/hVmQ==
X-Google-Smtp-Source: ABdhPJyXSvtJiilAgiFt5npZLoQVuJqbM9RSKg7ZvlUVhEiW49q8q7GVeSTsr2LFhhzV5WXWaeNchA==
X-Received: by 2002:a9d:578a:: with SMTP id q10mr11102993oth.149.1639628579733;
        Wed, 15 Dec 2021 20:22:59 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 69sm839183otf.33.2021.12.15.20.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 20:22:59 -0800 (PST)
Date:   Wed, 15 Dec 2021 20:24:14 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: Re: [PATCH 1/2] clk: qcom: add API to safely park RCG2 sources
Message-ID: <Ybq/brI4mMHv3/kn@ripper>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-2-dmitry.baryshkov@linaro.org>
 <20211209083727.30DD2C004DD@smtp.kernel.org>
 <YbJMnvg/IDwHNeWS@ripper>
 <995c66b7-ef69-56a4-93cc-59be52977972@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995c66b7-ef69-56a4-93cc-59be52977972@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Dec 13:14 PST 2021, Dmitry Baryshkov wrote:

> On 09/12/2021 21:36, Bjorn Andersson wrote:
> > On Thu 09 Dec 00:37 PST 2021, Stephen Boyd wrote:
> > 
> > > Quoting Dmitry Baryshkov (2021-12-07 18:22:09)
> > > > Some of RCG2 clocks can become stuck during the boot process, when
> > > > device drivers are enabling and disabling the RCG2's parent clocks.
> > > > To prevernt such outcome of driver probe sequences, add API to park
> > > 
> > > s/prevernt/prevent/
> > > 
> > > > clocks to the safe clock source (typically TCXO).
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > I'd prefer this approach vs. adding a new clk flag. The clk framework
> > > doesn't handle handoff properly today so we shouldn't try to bandage
> > > that in the core.
> > > 
> > 
> > I'm not against putting this responsibility in the drivers, but I don't
> > think we can blindly park all the RCGs that may or may not be used.
> > 
> > Note that we should do this for all RCGs that downstream are marked as
> > enable_safe_config (upstream should be using clk_rcg2_shared_ops)
> > and disabling some of those probe time won't be appreciated by the
> > hardware.
> 
> Only for the hardware as crazy, as displays. And maybe gmu_clk_src. I don't
> think we expect venus or camcc to be really clocking when kernel boots.
> 

SM8350 GCC has 44 clocks marked as such downstream.

> > 
> > 
> > If you don't like the flag passed to clk_disable_unused (which is like a
> > very reasonable objection to have), we need to make progress towards a
> > proper solution that replaces clk_disable_unused().
> 
> The issue is that at the time of clk_disable_unused() it can be too late,
> for example because msm being built-in into the kernel has already tried to
> play with PLLs/GDSCs and thus made RCG stuck.

Makes sense, so this logic will have to consider both the hardware state
(or make assumptions thereof) and the clock votes in the kernel.

> This is what I was observing
> on RB3 if the msm driver is built in and the splash screen is enabled.
> 

Which clock was this?

We should be able to assume that the bootloader will hand us a clock
tree that's functionally configured, so reparenting etc of the RCGs
should not cause issues because the old parent will be ticking and we
will explicitly start the new parent.

One case that might not be handled though is the externally sourced
clocks, where if you reconfigure the DSI phy without first parking the
RCG you might lock up the RCG. So I think that whenever we mess with
those clocks we need to make sure that the downstream RCGs are not
ticking off them.

> > 
> > > > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > > > index e1b1b426fae4..230b04a7427c 100644
> > > > --- a/drivers/clk/qcom/clk-rcg2.c
> > > > +++ b/drivers/clk/qcom/clk-rcg2.c
> > > > @@ -1036,6 +1036,40 @@ static void clk_rcg2_shared_disable(struct clk_hw *hw)
> > > >          regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
> > > >   }
> > > > +int clk_rcg2_park_safely(struct regmap *regmap, u32 offset, unsigned int safe_src)
> > 
> > This seems to just duplicate clk_rcg2_shared_disable()?
> 
> A light version of it. It does not do force_on/_off. And also it can not
> rely on clkr->regmap or clock name being set. Initially I used
> clk_rcg2_shared_disable + several patches to stop it from crashing if it is
> used on the non-registered clock. Then I just decided to write special
> helper.
> 

Okay, makes sense then. But I don't think we want to shoot down clocks
at clock probe time.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > 
> > > Please add kernel doc as it's an exported symbol.
> 
> Ack
> 
> > > 
> > > > +{
> > > > +       unsigned int val, ret, count;
> > > > +
> > > > +       ret = regmap_read(regmap, offset + CFG_REG, &val);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       /* assume safe source is 0 */
> > > 
> > > Are we assuming safe source is 0 here? It looks like we pass it in now?
> 
> Leftover, will remove if/when posting v2.
> 
> > > 
> > > > +       if ((val & CFG_SRC_SEL_MASK) == (safe_src << CFG_SRC_SEL_SHIFT))
> > > > +               return 0;
> > > > +
> > > > +       regmap_write(regmap, offset + CFG_REG, safe_src << CFG_SRC_SEL_SHIFT);
> > > > +
> > > > +       ret = regmap_update_bits(regmap, offset + CMD_REG,
> > > > +                                CMD_UPDATE, CMD_UPDATE);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       /* Wait for update to take effect */
> > > > +       for (count = 500; count > 0; count--) {
> > > > +               ret = regmap_read(regmap, offset + CMD_REG, &val);
> > > > +               if (ret)
> > > > +                       return ret;
> > > > +               if (!(val & CMD_UPDATE))
> > > > +                       return 0;
> > > > +               udelay(1);
> > > > +       }
> > > > +
> > > > +       WARN(1, "the rcg didn't update its configuration.");
> > > 
> > > Add a newline?
> 
> Ack.
> 
> > > 
> > > > +       return -EBUSY;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(clk_rcg2_park_safely);
> > > > +
> 
> 
> -- 
> With best wishes
> Dmitry
