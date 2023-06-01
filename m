Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BFD71F063
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbjFARM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbjFARM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5E1D1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685639528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5JK5bagIl4mNu2bd8dqzC2ZaUL1SOPOyDNs1gFUPJVk=;
        b=ZZdHtrLeiuzad1w2Mq1QconDRnvfrzQ0ue4hg/Sl7ihVw6pSas8mZPdCLjAMX+dgTFUJxg
        uvjl/GIbkNbREZp3oU+Sv1xiWsCKtZvMgDxTDZdzOorHDa3+dXDrGbIoshQm9tDeXRvAwS
        nR+crP7wFBg4CIRgNNCi/+Rf15wc6P0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-n9CInOuXMCy3tWZ2RYkQ5g-1; Thu, 01 Jun 2023 13:12:07 -0400
X-MC-Unique: n9CInOuXMCy3tWZ2RYkQ5g-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6262e6c3b44so15852416d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685639526; x=1688231526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JK5bagIl4mNu2bd8dqzC2ZaUL1SOPOyDNs1gFUPJVk=;
        b=P0+sb5WsTtcluxI8E44J4Na9ViU+51nQ1bYcRZUGEjs3D8aXFKb1jAKrqjSxcLpKgp
         wQ7pkWTKGvNEeoHqwIuT1tqq7QRGZCC7N3pq++HAmLy8oUT5IRQe6ChSs1u6078ZifkX
         FvNOoSpPrCmXfD965t6+zK1bVdTZDyYAzD2fMfeffYpS5NkJ/ED+VbaOP7NfaHBCYLfM
         rqux8iRaEygtK19tTlb7p/a4vPR7cn9j/ubqRQXp6ukysa5sMQDpJtOgA+91KstSQzH8
         JNOXt9faEWwd2ce0VzgDEmFS/opnK+CIRFbGgFd9mMTbRGl9vIlZHSpaRQkknvxzoYF4
         71LQ==
X-Gm-Message-State: AC+VfDyGZ2ST56FoPC851ceLK5yreEt/QkAFm8can8Z3JLCBDUV3D6qg
        MPQAhMhtSnVV753Dy9eCewv5Zg4PajzkDgXzUgMOus2j+n8t+b/01sO1Xjwbc6/d+Qeykw2sqji
        55DVGnN7502tgGoLZqh5VH7ScSdkxGM3vHw==
X-Received: by 2002:ad4:5f8e:0:b0:5f8:f168:e0e7 with SMTP id jp14-20020ad45f8e000000b005f8f168e0e7mr12816493qvb.29.1685639525981;
        Thu, 01 Jun 2023 10:12:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6I8R3fgCzuYzNgh+LioVv3oB78WfcfQrA7Q0GbkEvyKz+5epvEpwpfuytr1FokUwT/oOyJCA==
X-Received: by 2002:ad4:5f8e:0:b0:5f8:f168:e0e7 with SMTP id jp14-20020ad45f8e000000b005f8f168e0e7mr12816471qvb.29.1685639525725;
        Thu, 01 Jun 2023 10:12:05 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id pm22-20020ad446d6000000b006263c531f61sm3313822qvb.24.2023.06.01.10.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:12:04 -0700 (PDT)
Date:   Thu, 1 Jun 2023 13:12:02 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 2/2] phy: qcom-snps-femto-v2: Remove AHB2PHY
 interface clock
Message-ID: <ZHjRYpjwHI3bP4yC@fedora>
References: <20230529185638.32376-1-athierry@redhat.com>
 <20230529185638.32376-3-athierry@redhat.com>
 <20230529211921.imf6tttlrkza4lc3@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529211921.imf6tttlrkza4lc3@ripper>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, May 29, 2023 at 02:19:21PM -0700, Bjorn Andersson wrote:
> On Mon, May 29, 2023 at 02:56:37PM -0400, Adrien Thierry wrote:
> > The AHB2PHY interface clock cfg_ahb_clk is not assigned anywhere in the
> > driver. Moreover, it's not used by any device tree, nor is present in
> > the qcom,usb-snps-femto-v2 bindings. Remove it.
> > 
> 
> The downstream driver deals with cfg_ahb as well, so I think it would be
> more appropriate to ensure that it's actually wired up.
> 
> And in that case, I would find it preferable to switch to use the
> clk_bulk API for the introduction of the ref clk - to clean up the error
> paths if nothing else.
>

I won't be able to properly wire the cfg_ahb clock in the device trees
because I've got no way of knowing which clock to use for cfg_ahb in the
various SoCs, but I can at least try to clean the code by using the
clk_bulk API.

> Regards,
> Bjorn
> 
> > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > ---
> > I'm not 100% sure if the clock should be removed, or if it should be added
> > to bindings and device trees that use this PHY. Better informed opinions
> > on the topic are highly welcome.
> > 
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index 8abf482e81a8..2d9c1105e28c 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -113,7 +113,6 @@ struct phy_override_seq {
> >   * @phy: generic phy
> >   * @base: iomapped memory space for snps hs phy
> >   *
> > - * @cfg_ahb_clk: AHB2PHY interface clock
> >   * @ref_clk: phy reference clock
> >   * @phy_reset: phy reset control
> >   * @vregs: regulator supplies bulk data
> > @@ -125,7 +124,6 @@ struct qcom_snps_hsphy {
> >  	struct phy *phy;
> >  	void __iomem *base;
> >  
> > -	struct clk *cfg_ahb_clk;
> >  	struct clk *ref_clk;
> >  	struct reset_control *phy_reset;
> >  	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
> > @@ -165,7 +163,6 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> >  					   0, USB2_AUTO_RESUME);
> >  	}
> >  
> > -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> >  	clk_disable_unprepare(hsphy->ref_clk);
> >  	return 0;
> >  }
> > @@ -176,12 +173,6 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> >  
> >  	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
> >  
> > -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> > -	if (ret) {
> > -		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
> > -		return ret;
> > -	}
> > -
> >  	ret = clk_prepare_enable(hsphy->ref_clk);
> >  	if (ret) {
> >  		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
> > @@ -381,16 +372,10 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> > -	if (ret) {
> > -		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> > -		goto poweroff_phy;
> > -	}
> > -
> >  	ret = clk_prepare_enable(hsphy->ref_clk);
> >  	if (ret) {
> >  		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
> > -		goto disable_ahb_clk;
> > +		goto poweroff_phy;
> >  	}
> >  
> >  	ret = reset_control_assert(hsphy->phy_reset);
> > @@ -463,8 +448,6 @@ static int qcom_snps_hsphy_init(struct phy *phy)
> >  
> >  disable_ref_clk:
> >  	clk_disable_unprepare(hsphy->ref_clk);
> > -disable_ahb_clk:
> > -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> >  poweroff_phy:
> >  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> >  
> > @@ -476,7 +459,6 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
> >  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> >  
> >  	reset_control_assert(hsphy->phy_reset);
> > -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> >  	clk_disable_unprepare(hsphy->ref_clk);
> >  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> >  	hsphy->phy_initialized = false;
> > -- 
> > 2.40.1
> > 

