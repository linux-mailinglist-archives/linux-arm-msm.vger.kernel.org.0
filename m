Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499F171F055
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbjFARKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjFARKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B46D1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685639404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AQ46YHscoz6R/uQfk362V/AjgA+jv0Q6KB7cKqmivZo=;
        b=BYC7h8ZAtxMnFfbhLMEKbZwhUPPziHV33MsGbM97bsw75SN0De4ROm7itcYvSSE3sWWdIB
        07HMSvuKPrZdYfxM2tUT8/Z9AQCg+B1afps0UZvYfmIlZGDEmOAZOqowjMEkrKPcJMk87J
        fnsO98c3M09m7wNAaeGqcRlZjHUl6fU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-ShTTCp2xMoO9k5PNVEi73w-1; Thu, 01 Jun 2023 13:10:03 -0400
X-MC-Unique: ShTTCp2xMoO9k5PNVEi73w-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5eee6742285so15230736d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685639402; x=1688231402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ46YHscoz6R/uQfk362V/AjgA+jv0Q6KB7cKqmivZo=;
        b=PeSOfaysj0J3FB+FY0etgDJRrdgtPX5nxMHL2xplch/mbTTRgvnJOeAspwVbE+ke4q
         xArbepAfU/HXK6CjR7gUP+tvEWR3VOZXb8DHTnN9UeJfT+9CCetiEgdmFTFrjHYLqb1l
         XiGfG9+ARpc7XxmiIwTM23mMr0RwixY9qGlyxwRY3YYsHHwVELU+jGs1WGPR6Neag0JZ
         6eKB8+tkhA+J9ovDLJimHW3En33lHJ+Arx7XQNplfMOnjLXnyIhfwTItQAuQbev7njuY
         JNneA+nsN7W/QMCHgFotHIXlBGVwnXqUpZ5sI3LqmZJkp1axEPqQ+DDpWRy1847kTIH0
         NsiA==
X-Gm-Message-State: AC+VfDz7A2Shm4HaTIjTcvnl5nD9hmJ0G/FAg4QRJ74Ec82fyyDegGP0
        iTXb0bdK3kUUadBlwXLLqKjDDMC1m8qN1GqCxOPrbnCuPQ5AZB6smeMTJMyTyzYa3r3NSKEuqEb
        EgnV33Fs/LJzDwRvaCoDFq4yXeE7WNKFB9Q==
X-Received: by 2002:a05:6214:29e9:b0:626:2b44:40c with SMTP id jv9-20020a05621429e900b006262b44040cmr10212872qvb.59.1685639401978;
        Thu, 01 Jun 2023 10:10:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dUqdxQlAlxBL1EhNnf57Lqmh5ZOha/OK75FWVfZPPqCCLt0oSG09+YKOs+j8tJ1bqTCzyWA==
X-Received: by 2002:a05:6214:29e9:b0:626:2b44:40c with SMTP id jv9-20020a05621429e900b006262b44040cmr10212843qvb.59.1685639401653;
        Thu, 01 Jun 2023 10:10:01 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id m10-20020ad44a0a000000b006235e8fe94esm2307987qvz.58.2023.06.01.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:10:00 -0700 (PDT)
Date:   Thu, 1 Jun 2023 13:09:58 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] phy: qcom-snps-femto-v2: properly enable ref
 clock
Message-ID: <ZHjQ5lvfSjKA3zqe@fedora>
References: <20230529185638.32376-1-athierry@redhat.com>
 <20230529185638.32376-2-athierry@redhat.com>
 <20230529211629.7sw542tyyygv4tcs@ripper>
 <ZHZEbW+aSJ5xLOlO@fedora>
 <20230531023441.4dpbsdklerbu2zqx@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531023441.4dpbsdklerbu2zqx@ripper>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 30, 2023 at 07:34:41PM -0700, Bjorn Andersson wrote:
> On Tue, May 30, 2023 at 02:46:05PM -0400, Adrien Thierry wrote:
> > Hi Bjorn, thanks for your reply!
> > 
> > On Mon, May 29, 2023 at 02:16:29PM -0700, Bjorn Andersson wrote:
> > > On Mon, May 29, 2023 at 02:56:36PM -0400, Adrien Thierry wrote:
> > > > The driver is not enabling the ref clock, which thus gets disabled by
> > > > the clk_disable_unused initcall. This leads to the dwc3 controller
> > > > failing to initialize if probed after clk_disable_unused is called, for
> > > > instance when the driver is built as a module.
> > > > 
> > > 
> > > Good catch!
> > > 
> > > A side note though, clk_disable_unused() has no way to take kernel
> > > modules into consideration today, and it doesn't handle the case where
> > > clock drivers are built as modules appropriately.
> > > Work has started to address this, but as of todaybooting the system
> > > without clk_ignore_unused is not recommended...
> > >
> > 
> > For my understanding, do you have an example of a situation that would
> > fail with modules when not using clk_ignore_unused?
> > 
> 
> The prime example relates to the display clocks, where the bootloader
> typically leave clocks on and at lateinit we haven't yet loaded enough
> modules to bring up the display. And to make matters worse, the code
> ends up disabling the PLL feeding the clock tree without first disabling
> some of the muxes - which has side effects...
> 
> Another case, although much less concerning in the short run, is when
> you have any of the clock drivers built as modules. clk_disable_unused()
> will be invoked before they are loaded, so your expectation that unused
> clocks are turned off is just not fulfilled.
>

Thanks for the explanation!

> > > > To fix this, add calls to clk_prepare_enable/clk_disable_unprepare at
> > > > the proper places.
> > > > 
> > > 
> > > If I parse the downstream kernel correctly the refclock should be
> > > turned off across runtime and system suspend as well.
> > > 
> > 
> > Which downstream kernel are you using? I'm not seing a system suspend
> > callback in mine [1]. refclock should be turned off on runtime suspend in
> > my patch, in qcom_snps_hsphy_suspend, which is called by
> > qcom_snps_hsphy_runtime_suspend.
> > 
> 
> Forgive me, but isn't [1] the driver you're modifying?
> 
> I'm looking at [2], with set_suspend() being invoked from the runtime
> and system suspend/resume handlers.
> 
> > [1] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/blob/kernel.lnx.5.14.r2-rel/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> 
> [2] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c#L908
> 

Thank you. The femto PHY driver is not using set_suspend(), but has
runtime PM ops. Is it ok if I add the system sleep PM ops as well with
SET_SYSTEM_SLEEP_PM_OPS() ?

> Regards,
> Bjorn
> 
> > 
> > > Regards,
> > > Bjorn
> > > 
> > > > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +++++++++++++++++--
> > > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > index 6c237f3cc66d..8abf482e81a8 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > @@ -166,6 +166,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> > > >  	}
> > > >  
> > > >  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> > > > +	clk_disable_unprepare(hsphy->ref_clk);
> > > >  	return 0;
> > > >  }
> > > >  
> > > > @@ -181,6 +182,12 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > +	ret = clk_prepare_enable(hsphy->ref_clk);
> > > > +	if (ret) {
> > > > +		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > >  	return 0;
> > > >  }
> > > >  
> > > > @@ -380,10 +387,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> > > >  		goto poweroff_phy;
> > > >  	}
> > > >  
> > > > +	ret = clk_prepare_enable(hsphy->ref_clk);
> > > > +	if (ret) {
> > > > +		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
> > > > +		goto disable_ahb_clk;
> > > > +	}
> > > > +
> > > >  	ret = reset_control_assert(hsphy->phy_reset);
> > > >  	if (ret) {
> > > >  		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> > > > -		goto disable_ahb_clk;
> > > > +		goto disable_ref_clk;
> > > >  	}
> > > >  
> > > >  	usleep_range(100, 150);
> > > > @@ -391,7 +404,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> > > >  	ret = reset_control_deassert(hsphy->phy_reset);
> > > >  	if (ret) {
> > > >  		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> > > > -		goto disable_ahb_clk;
> > > > +		goto disable_ref_clk;
> > > >  	}
> > > >  
> > > >  	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> > > > @@ -448,6 +461,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> > > >  
> > > >  	return 0;
> > > >  
> > > > +disable_ref_clk:
> > > > +	clk_disable_unprepare(hsphy->ref_clk);
> > > >  disable_ahb_clk:
> > > >  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> > > >  poweroff_phy:
> > > > @@ -462,6 +477,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
> > > >  
> > > >  	reset_control_assert(hsphy->phy_reset);
> > > >  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> > > > +	clk_disable_unprepare(hsphy->ref_clk);
> > > >  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> > > >  	hsphy->phy_initialized = false;
> > > >  
> > > > -- 
> > > > 2.40.1
> > > >
> > 
> > Best,
> > Adrien
> > 

