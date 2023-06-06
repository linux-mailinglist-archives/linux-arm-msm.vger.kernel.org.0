Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8AF724644
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 16:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237553AbjFFOgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 10:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbjFFOgM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 10:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAF0E6E
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686062122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0ACc+nO/rqX5bFrH4LrwXPZUBRGP8worhyNyqkSAZpc=;
        b=fjWLmiH3hF+hYnDNHxCy8/2rNU4HuJ4P9raYp/QY/mzPhv5sRjE40lFfVXu9c1YPmiLf7E
        EQTUIObgYgrBH0Qha7GEiYD7E0ZIH85tnLNxvlPWlHF7RWlhNzSpw1Pxrkp4CN+AG/Zj9B
        XCPXkaS8kbZfoao/LJXMUq6orsK8p5E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-wYhmERrTPO2g5zm3Z56sxQ-1; Tue, 06 Jun 2023 10:35:21 -0400
X-MC-Unique: wYhmERrTPO2g5zm3Z56sxQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-3f86c1990c7so31053361cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 07:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686062120; x=1688654120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ACc+nO/rqX5bFrH4LrwXPZUBRGP8worhyNyqkSAZpc=;
        b=HPSzYrjQQ8Qp4mwTM8TUWR3lkkMQuGJ17EJ7+4AGrPGN8iKrHvON9bE3YkXKb5vFn1
         8G2hIGoao8CfcE6GwxNLmoA6cO5zpE9HzBUnfz9Imdc0aNFT6eCvpbJWMFxpT1cYMzFU
         UW1PhuipB5W9oXXpKJkQUkNeOgYwZ9vDY/PBO4JKQtc5gnW5uGYVPmnt38kfN8Lo9CGu
         +afKjri3hgf43P4rVAMcL4RmGIZ6ymcoVitgDBMz74A9SawdM13K+PGStU+PuwUNllpI
         n8wB5DlFg2mzhKmBx/kMQ4cr0+dLx+ow1GdnealCJn1n/6SZXEN/LenLUbn6C1di247C
         ee+A==
X-Gm-Message-State: AC+VfDyquEFvAdpR8k13KxM6droJ2BOlCOqJqUwXKUulSDtNV1B4o9w2
        e8f9Bnq1P1nUxz73ybTPA70fof4XHH4YgrwF2UmNFXgynDe2G3HjMldTDP3j/ZQP7yGghZ/G/SP
        yr1cdL1ISaSwluFCkdx8ZvGjUww==
X-Received: by 2002:ac8:7f50:0:b0:3f4:dec2:76c3 with SMTP id g16-20020ac87f50000000b003f4dec276c3mr2166172qtk.22.1686062120357;
        Tue, 06 Jun 2023 07:35:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FMBEjdhk60sTgnBtFRPFO/Ri01rTuW3D530U8twgZB6YG7GiehJcAzFCboEtkwbccxVk5mQ==
X-Received: by 2002:ac8:7f50:0:b0:3f4:dec2:76c3 with SMTP id g16-20020ac87f50000000b003f4dec276c3mr2166145qtk.22.1686062120010;
        Tue, 06 Jun 2023 07:35:20 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id fg26-20020a05622a581a00b003f9a79fe046sm1690585qtb.38.2023.06.06.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 07:35:19 -0700 (PDT)
Date:   Tue, 6 Jun 2023 10:35:17 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/2] phy: qcom-snps-femto-v2: properly enable ref clock
Message-ID: <ZH9EJfkeQN7c5KHU@fedora>
References: <20230605184455.34832-1-athierry@redhat.com>
 <20230605184455.34832-2-athierry@redhat.com>
 <fe51f704-3d24-d184-0251-39dc64a25598@linaro.org>
 <20230606135516.beujjl2oyvt6gaig@halaney-x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606135516.beujjl2oyvt6gaig@halaney-x13s>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your feedback Konrad and Andrew!

On Tue, Jun 06, 2023 at 08:55:16AM -0500, Andrew Halaney wrote:
> On Tue, Jun 06, 2023 at 01:14:00AM +0200, Konrad Dybcio wrote:
> > 
> > 
> > On 5.06.2023 20:44, Adrien Thierry wrote:
> > > The driver is not enabling the ref clock, which thus gets disabled by
> > > the clk_disable_unused initcall. This leads to the dwc3 controller
> > > failing to initialize if probed after clk_disable_unused is called, for
> > > instance when the driver is built as a module.
> > > 
> > > To fix this, switch to the clk_bulk API to handle both cfg_ahb and ref
> > > clocks at the proper places.
> > > 
> > > Note that the cfg_ahb clock is currently not used by any device tree
> > > instantiation of the PHY. Work needs to be done separately to fix this.
> > > 
> > > Link: https://lore.kernel.org/linux-arm-msm/ZEqvy+khHeTkC2hf@fedora/
> > > Fixes: 51e8114f80d0 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> > > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 67 ++++++++++++++-----
> > >  1 file changed, 49 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > index 6c237f3cc66d..ce1d2f8b568a 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > @@ -110,11 +110,13 @@ struct phy_override_seq {
> > >  /**
> > >   * struct qcom_snps_hsphy - snps hs phy attributes
> > >   *
> > > + * @dev: device structure
> > > + *
> > >   * @phy: generic phy
> > >   * @base: iomapped memory space for snps hs phy
> > >   *
> > > - * @cfg_ahb_clk: AHB2PHY interface clock
> > > - * @ref_clk: phy reference clock
> > > + * @num_clks: number of clocks
> > > + * @clks: array of clocks
> > >   * @phy_reset: phy reset control
> > >   * @vregs: regulator supplies bulk data
> > >   * @phy_initialized: if PHY has been initialized correctly
> > > @@ -122,11 +124,13 @@ struct phy_override_seq {
> > >   * @update_seq_cfg: tuning parameters for phy init
> > >   */
> > >  struct qcom_snps_hsphy {
> > > +	struct device *dev;
> > > +
> > >  	struct phy *phy;
> > >  	void __iomem *base;
> > >  
> > > -	struct clk *cfg_ahb_clk;
> > > -	struct clk *ref_clk;
> > > +	int num_clks;
> > > +	struct clk_bulk_data *clks;
> > >  	struct reset_control *phy_reset;
> > >  	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
> > >  
> > > @@ -135,6 +139,32 @@ struct qcom_snps_hsphy {
> > >  	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
> > >  };
> > >  
> > > +static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
> > > +{
> > > +	struct device *dev = hsphy->dev;
> > > +
> > > +	hsphy->num_clks = 2;
> > > +	hsphy->clks = devm_kcalloc(dev, hsphy->num_clks, sizeof(*hsphy->clks), GFP_KERNEL);
> > > +	if (!hsphy->clks)
> > > +		return -ENOMEM;
> > > +
> > > +	/*
> > > +	 * HACK: For cfg_ahb clock, use devm_clk_get_optional() because currently no device
> > > +	 * tree instantiation of the PHY is using the clock. This needs to be fixed in order
> > > +	 * for this code to be able to use devm_clk_bulk_get().
> > > +	 */
> > > +	hsphy->clks[0].id = "cfg_ahb";
> > > +	hsphy->clks[0].clk = devm_clk_get_optional(dev, "cfg_ahb");
> > Hm, maybe you could first check if we can get this clock
> > properly (!IS_ERR_OR_NULL) and then allocate the second
> > slot..
> > 
> 
> The bulk clk api handles NULL clks without issue if I am reading right,
> so personally if we're going to use the bulk api I say we carry the extra
> slot unconditionally. No expert on this stuff but that seems more
> straightforward. Honestly I wouldn't mind using the bulk optional API,
> then checking the "non optional ref clock" manually. That's closer to
> the ideal flow to me. Super opinionated though, don't take my word as
> right.
>

Agree with Andrew. Since cfg_ahb is always NULL, I'm certainly "wasting"
an array cell here but I think it also better highlights the fact that
it's a hack and that cfg_ahb needs to be properly wired in the DTs. As for
using the bulk optional API, I'm fine with both!

> > > +
> > > +	hsphy->clks[1].id = "ref";
> > > +	hsphy->clks[1].clk = devm_clk_get(dev, "ref");
> > > +	if (IS_ERR(hsphy->clks[1].clk))
> > > +		return dev_err_probe(dev, PTR_ERR(hsphy->clks[1].clk),
> > > +				     "failed to get ref clk\n");
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
> > >  						u32 mask, u32 val)
> > >  {
> > > @@ -165,7 +195,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> > >  					   0, USB2_AUTO_RESUME);
> > >  	}
> > >  
> > > -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> > > +	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
> > >  	return 0;
> > >  }
> > >  
> > > @@ -175,9 +205,9 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> > >  
> > >  	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
> > >  
> > > -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> > > +	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
> > Aren't you dereferencing NULL if the optional clock is absent?
> > 
> 
> Similar to above, the bulk api seems to handle NULL clks gracefully.
>

devm_clk_get_optional() will return NULL for cfg_ahb, but AFAIU NULL
serves as a dummy clock [1] with which the clock API deals gracefully. The
various functions like clk_prepare(), clk_enable() check if the clock is
NULL and return 0 immediately if that's the case (see for instance [2]).

[1] https://elixir.bootlin.com/linux/v6.4-rc5/source/include/linux/clk.h#L514
[2] https://elixir.bootlin.com/linux/v6.4-rc5/source/drivers/clk/clk.c#L1045

Best,
Adrien

> Thanks,
> Andrew
> 

