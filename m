Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D6F716CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 20:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjE3SrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 14:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjE3SrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 14:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F6DFE
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685472371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0LI6CN4AqBzxYXMeybknZnsUHQpyhfqhi5JUJbBAtlM=;
        b=JfBvxDtFFdUudEj6uxpt8VfX1YRD+Tp6mOyuZNEzjHvgeqRzRjUNNaO/3/YKWvmoVqlGuE
        l9Jh25x/s1aw+8A4vzho25+2O0KLQKQVLKBFAwwC2NTTOE8u3aSYlAVyTH7+aT+E0YF0nk
        KCdYKb+sXgoBgdjBjiEco0S+EpHfY+I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-nTFKesgGNvmz8pdeGe8BaA-1; Tue, 30 May 2023 14:46:09 -0400
X-MC-Unique: nTFKesgGNvmz8pdeGe8BaA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6213569ba95so75976866d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 11:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685472368; x=1688064368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LI6CN4AqBzxYXMeybknZnsUHQpyhfqhi5JUJbBAtlM=;
        b=GIpWn+N9CKUSXVCKsEq4lh2wtToZnHOHJeQ6ZMldfh5AlR9HQZYdJNMZj3iCyUZAUi
         tfth0JWWZkdQPsX9UNaFErMMz2fQg9gUtQhmeKDWip1UQmzIBXMARr+yV3Hy4qDkO1s7
         XjtJFf+u2KNtCK7OFpLcF1G2l9V+gJELhRidiD0i9LEbqjj4gaDP6P6EDf5o98jma07w
         0mDuNYDZFBj0w8U+8aEqAxFte/jkPfJ5m/TJFGEa0Hk4ySOBg+fWIpfalycAl89wqeix
         VZv6DSJnm0669IRAl6hOBxr0xEehfwCezx+vTdLRDTvZjbBXXAhdFJmbtw3UktD0Gl21
         ACjw==
X-Gm-Message-State: AC+VfDwtAo/2YQVZ0zPRMqUytlg5hHacnt8TtxPQfTaQ3XLYi2XXAPq3
        6208G8P/COy5hrW43rmE4mRLT6196xJijEdWMRfIwo4TaXHElNZut7/NFl6Mw/pPh2Hr1bMDJtv
        Jolu/+LNJZBwWQBPEBvwBXResRZK/bf6FVQ==
X-Received: by 2002:a05:6214:48e:b0:625:aa49:9abd with SMTP id pt14-20020a056214048e00b00625aa499abdmr3116360qvb.65.1685472368538;
        Tue, 30 May 2023 11:46:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5OTSOBM8dx5z4mye3zPw8Hjinloz9YveX76huti2t8fKlrYpX7Lxwgwe0kQ/j7T4maQJKryg==
X-Received: by 2002:a05:6214:48e:b0:625:aa49:9abd with SMTP id pt14-20020a056214048e00b00625aa499abdmr3116347qvb.65.1685472368304;
        Tue, 30 May 2023 11:46:08 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id df2-20020a056214080200b005ef54657ea0sm4874115qvb.126.2023.05.30.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 11:46:07 -0700 (PDT)
Date:   Tue, 30 May 2023 14:46:05 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] phy: qcom-snps-femto-v2: properly enable ref
 clock
Message-ID: <ZHZEbW+aSJ5xLOlO@fedora>
References: <20230529185638.32376-1-athierry@redhat.com>
 <20230529185638.32376-2-athierry@redhat.com>
 <20230529211629.7sw542tyyygv4tcs@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529211629.7sw542tyyygv4tcs@ripper>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn, thanks for your reply!

On Mon, May 29, 2023 at 02:16:29PM -0700, Bjorn Andersson wrote:
> On Mon, May 29, 2023 at 02:56:36PM -0400, Adrien Thierry wrote:
> > The driver is not enabling the ref clock, which thus gets disabled by
> > the clk_disable_unused initcall. This leads to the dwc3 controller
> > failing to initialize if probed after clk_disable_unused is called, for
> > instance when the driver is built as a module.
> > 
> 
> Good catch!
> 
> A side note though, clk_disable_unused() has no way to take kernel
> modules into consideration today, and it doesn't handle the case where
> clock drivers are built as modules appropriately.
> Work has started to address this, but as of todaybooting the system
> without clk_ignore_unused is not recommended...
>

For my understanding, do you have an example of a situation that would
fail with modules when not using clk_ignore_unused?

> > To fix this, add calls to clk_prepare_enable/clk_disable_unprepare at
> > the proper places.
> > 
> 
> If I parse the downstream kernel correctly the refclock should be
> turned off across runtime and system suspend as well.
> 

Which downstream kernel are you using? I'm not seing a system suspend
callback in mine [1]. refclock should be turned off on runtime suspend in
my patch, in qcom_snps_hsphy_suspend, which is called by
qcom_snps_hsphy_runtime_suspend.

[1] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/blob/kernel.lnx.5.14.r2-rel/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c

> Regards,
> Bjorn
> 
> > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index 6c237f3cc66d..8abf482e81a8 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -166,6 +166,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> >  	}
> >  
> >  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> > +	clk_disable_unprepare(hsphy->ref_clk);
> >  	return 0;
> >  }
> >  
> > @@ -181,6 +182,12 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> >  		return ret;
> >  	}
> >  
> > +	ret = clk_prepare_enable(hsphy->ref_clk);
> > +	if (ret) {
> > +		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
> > +		return ret;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -380,10 +387,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> >  		goto poweroff_phy;
> >  	}
> >  
> > +	ret = clk_prepare_enable(hsphy->ref_clk);
> > +	if (ret) {
> > +		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
> > +		goto disable_ahb_clk;
> > +	}
> > +
> >  	ret = reset_control_assert(hsphy->phy_reset);
> >  	if (ret) {
> >  		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> > -		goto disable_ahb_clk;
> > +		goto disable_ref_clk;
> >  	}
> >  
> >  	usleep_range(100, 150);
> > @@ -391,7 +404,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> >  	ret = reset_control_deassert(hsphy->phy_reset);
> >  	if (ret) {
> >  		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> > -		goto disable_ahb_clk;
> > +		goto disable_ref_clk;
> >  	}
> >  
> >  	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> > @@ -448,6 +461,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> >  
> >  	return 0;
> >  
> > +disable_ref_clk:
> > +	clk_disable_unprepare(hsphy->ref_clk);
> >  disable_ahb_clk:
> >  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> >  poweroff_phy:
> > @@ -462,6 +477,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
> >  
> >  	reset_control_assert(hsphy->phy_reset);
> >  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> > +	clk_disable_unprepare(hsphy->ref_clk);
> >  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> >  	hsphy->phy_initialized = false;
> >  
> > -- 
> > 2.40.1
> >

Best,
Adrien

