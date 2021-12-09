Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D430B46F336
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 19:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhLISi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 13:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhLISi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 13:38:26 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0976C0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 10:34:52 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id be32so9848625oib.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ERsV9Ugjnd+vnox6XPtUISvlSBZGOiqHJZyvWF5wfcY=;
        b=gm1eOcArpd8WARMO+6JEScZ5UTsuIc8EdAI0vWUsPkDrIirsZHJ397BoFreqBovv5k
         /dbKBf9wQuOm2Z5p+0/VXWLBgNxNzRUMQ4xmXMHsyTQ5yVvxNsZy/pFenhaEJA2UJSBU
         qcH2PQsoq6COc4jv2dqkVQgbiaMVky4MAC8SE9Mkef6JDfCQ3fClbp6CPXd8FcpUn227
         fPwPdRtdMOdL1JXvTyaINkmJOjgn8dOBrpECWjCjDLVbqtW319CRTDfRkbUEwSgwIQSd
         F57TqbeQOlzELJTio2sdNVALPVrXcXlqlau16DysafsgMDuX5jBIOCNY6TKqtZPfNBUe
         UP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ERsV9Ugjnd+vnox6XPtUISvlSBZGOiqHJZyvWF5wfcY=;
        b=wfoEi9FwMf+/ODxItBstHTNXLTnMJwpMMAnBevqKGebEbdqHaHYLrSWw2KcmA+l41m
         Hk+LRgqNz0wje5yXeJuas96eDiaKLHgm/LGL57DEktrzi5wuHEf80j31UbfG6NTrr8Aw
         uhoRfUODnFzLMXtjxNb+s0IFMZOBOboz6Pe8DtvGqNpqctiqlcjHhjEziviqeu/xc/Ck
         wy7T5i44oWY68dUPeg3KLUVP6kdFm/FxKmh4tpMrx9q3zWKkt4zuamXq15QxeI8317rn
         T3QV+UDrXCSc7G/XX0KWRb6Oe/dVGFEXFhBtYtw8I4wnPC1J6ReC1SUNNIKDezxQHiyg
         Exhg==
X-Gm-Message-State: AOAM5321Pbfg5r8y0NiKu1MLQlLm9UMf1U16EEl9JGwKu6Ip20859X2H
        6RGY4k4fzp7kC66v9dlTnHWggw==
X-Google-Smtp-Source: ABdhPJxNe7Puu8I8xeQWUuZNJkLylGzIC8XuYFOONvT0nM+gaBLwZA3M8BUFWcAFvX8r4B90ALFFnw==
X-Received: by 2002:aca:61c6:: with SMTP id v189mr7249046oib.103.1639074891907;
        Thu, 09 Dec 2021 10:34:51 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d8sm156896oiw.24.2021.12.09.10.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 10:34:51 -0800 (PST)
Date:   Thu, 9 Dec 2021 10:36:14 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: Re: [PATCH 1/2] clk: qcom: add API to safely park RCG2 sources
Message-ID: <YbJMnvg/IDwHNeWS@ripper>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-2-dmitry.baryshkov@linaro.org>
 <20211209083727.30DD2C004DD@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209083727.30DD2C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Dec 00:37 PST 2021, Stephen Boyd wrote:

> Quoting Dmitry Baryshkov (2021-12-07 18:22:09)
> > Some of RCG2 clocks can become stuck during the boot process, when
> > device drivers are enabling and disabling the RCG2's parent clocks.
> > To prevernt such outcome of driver probe sequences, add API to park
> 
> s/prevernt/prevent/
> 
> > clocks to the safe clock source (typically TCXO).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I'd prefer this approach vs. adding a new clk flag. The clk framework
> doesn't handle handoff properly today so we shouldn't try to bandage
> that in the core.
> 

I'm not against putting this responsibility in the drivers, but I don't
think we can blindly park all the RCGs that may or may not be used.

Note that we should do this for all RCGs that downstream are marked as
enable_safe_config (upstream should be using clk_rcg2_shared_ops)
and disabling some of those probe time won't be appreciated by the
hardware.


If you don't like the flag passed to clk_disable_unused (which is like a
very reasonable objection to have), we need to make progress towards a
proper solution that replaces clk_disable_unused().

> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index e1b1b426fae4..230b04a7427c 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -1036,6 +1036,40 @@ static void clk_rcg2_shared_disable(struct clk_hw *hw)
> >         regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
> >  }
> >  
> > +int clk_rcg2_park_safely(struct regmap *regmap, u32 offset, unsigned int safe_src)

This seems to just duplicate clk_rcg2_shared_disable()?

Regards,
Bjorn

> 
> Please add kernel doc as it's an exported symbol.
> 
> > +{
> > +       unsigned int val, ret, count;
> > +
> > +       ret = regmap_read(regmap, offset + CFG_REG, &val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* assume safe source is 0 */
> 
> Are we assuming safe source is 0 here? It looks like we pass it in now?
> 
> > +       if ((val & CFG_SRC_SEL_MASK) == (safe_src << CFG_SRC_SEL_SHIFT))
> > +               return 0;
> > +
> > +       regmap_write(regmap, offset + CFG_REG, safe_src << CFG_SRC_SEL_SHIFT);
> > +
> > +       ret = regmap_update_bits(regmap, offset + CMD_REG,
> > +                                CMD_UPDATE, CMD_UPDATE);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Wait for update to take effect */
> > +       for (count = 500; count > 0; count--) {
> > +               ret = regmap_read(regmap, offset + CMD_REG, &val);
> > +               if (ret)
> > +                       return ret;
> > +               if (!(val & CMD_UPDATE))
> > +                       return 0;
> > +               udelay(1);
> > +       }
> > +
> > +       WARN(1, "the rcg didn't update its configuration.");
> 
> Add a newline?
> 
> > +       return -EBUSY;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_rcg2_park_safely);
> > +
