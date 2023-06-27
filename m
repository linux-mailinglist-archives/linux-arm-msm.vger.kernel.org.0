Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66E57406BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 01:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjF0XCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 19:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjF0XCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 19:02:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB042DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 16:02:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E8256123D
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 23:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2699EC433C0;
        Tue, 27 Jun 2023 23:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687906927;
        bh=oCt8E9FdwcBRdKNVjRBeCmeZPnPu3bQxmmPSXo/NpQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EfQV6D1VxvKG7age0lnwF27KmrbT3yV1xG5y7tmuwqangeTdGTF2R+ybkuzx356Va
         w9FvCHRoFJNLxxCqoX19A07KYFicuOOWuz9IRGJbpIrEC/Eh4QeVlL5lZIgMLEkXzN
         QuAYzUnD7CpCczUII2CSjhjqfUAyXSVt31BLFVIh5peoloY0zD0jBS7Q/6TqDUorar
         8J8QKAxdQMoOy0GSBZmdlpNZFSrMj5YT5Jb/Fng2kUe7143nA1kiy9JPZWTsD6DLAk
         R0tOwn1eXMjUwWhVpuHHzVvOnyzbS/XMbUz/IdzWfEMEFsQ6AuKNsF6d/Hc1bKJ8yZ
         9QYIOj20hqurQ==
Date:   Tue, 27 Jun 2023 16:06:00 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/3] phy: qcom-snps-femto-v2: add system sleep PM ops
Message-ID: <ntxmsvjpxczku7qmb7xzo7fpo5r6daqrenu6qbunz3qzyctfa5@2itckk3ogvip>
References: <20230622194021.80892-1-athierry@redhat.com>
 <20230622194021.80892-3-athierry@redhat.com>
 <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
 <ZJslqaHZqdizSGbc@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJslqaHZqdizSGbc@fedora>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 27, 2023 at 02:08:41PM -0400, Adrien Thierry wrote:
> Hi Bjorn,
> 
> On Thu, Jun 22, 2023 at 02:43:07PM -0700, Bjorn Andersson wrote:
> > On Thu, Jun 22, 2023 at 03:40:19PM -0400, Adrien Thierry wrote:
> > > The downstream driver [1] implements set_suspend(), which deals with
> > > both runtime and system sleep/resume. The upstream driver already has
> > > runtime PM ops, so add the system sleep PM ops as well, reusing the same
> > > code as the runtime PM ops.
> > > 
> > > [1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c
> > > 
> > > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++++++--------
> > >  1 file changed, 10 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > index ce1d2f8b568a..378a5029f61e 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > @@ -179,7 +179,7 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
> > >  	readl_relaxed(base + offset);
> > >  }
> > >  
> > > -static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> > > +static int qcom_snps_hsphy_do_suspend(struct qcom_snps_hsphy *hsphy)
> > >  {
> > >  	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
> > >  
> > > @@ -199,7 +199,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> > >  	return 0;
> > >  }
> > >  
> > > -static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> > > +static int qcom_snps_hsphy_do_resume(struct qcom_snps_hsphy *hsphy)
> > >  {
> > >  	int ret;
> > >  
> > > @@ -214,25 +214,25 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> > >  	return 0;
> > >  }
> > >  
> > > -static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> > > +static int __maybe_unused qcom_snps_hsphy_suspend(struct device *dev)
> > >  {
> > >  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
> > >  
> > >  	if (!hsphy->phy_initialized)
> > >  		return 0;
> > >  
> > > -	qcom_snps_hsphy_suspend(hsphy);
> > > +	qcom_snps_hsphy_do_suspend(hsphy);
> > >  	return 0;
> > >  }
> > >  
> > > -static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
> > > +static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
> > >  {
> > >  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
> > >  
> > >  	if (!hsphy->phy_initialized)
> > >  		return 0;
> > >  
> > > -	qcom_snps_hsphy_resume(hsphy);
> > > +	qcom_snps_hsphy_do_resume(hsphy);
> > >  	return 0;
> > >  }
> > >  
> > > @@ -518,8 +518,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
> > >  MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
> > >  
> > >  static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
> > > -	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
> > > -			   qcom_snps_hsphy_runtime_resume, NULL)
> > > +	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_suspend,
> > > +			   qcom_snps_hsphy_resume, NULL)
> > > +	SET_SYSTEM_SLEEP_PM_OPS(qcom_snps_hsphy_suspend,
> > > +				qcom_snps_hsphy_resume)
> > 
> > Won't this cause issues if you system suspend the device while it's
> > already runtime suspended?
> >
> 
> I'm not sure if it would cause issues, but after reflexion and discussion
> with Andrew, I think it's unnecessary to add system PM ops in the femto
> PHY driver. 
> 

Glad you looked further into this, I had a brief chat with Andrew and
was building a similar understanding.

> In the dwc3 core, both system and runtime suspend end up calling
> dwc3_suspend_common(). From there, what happens depends on the USB mode
> and whether the controller is entering system or runtime suspend.
> 
> HOST mode:
>   (1) system suspend on a non-wakeup controller
> 
>   The [1] if branch is taken. dwc3_core_exit() is called, which ends up
>   calling phy_power_off() and phy_exit(). Those two functions decrease the
>   PM runtime count at some point, so they will trigger the PHY runtime sleep
>   (assuming the count is right).
> 
>   (2) runtime suspend / system suspend on a wakeup controller  
> 
>   The [1] branch is not taken. dwc3_suspend_common() calls
>   phy_pm_runtime_put_sync(dwc->usb2_generic_phy). Assuming the ref count is
>   right, the PHY runtime suspend op is called.
> 
> DEVICE mode:
> 
>   dwc3_core_exit() is called on both runtime and system sleep
>   unless the controller is already runtime suspended.
> 
> OTG mode:
>   (1) system suspend : dwc3_core_exit() is called
> 
>   (2) runtime suspend : do nothing
> 
> With that in mind:
> 
> 1) Does the PHY need to implement system sleep callbacks? 
> 
> dwc3 core system sleep callback will already runtime suspend the PHY, and
> also call phy_power_off() and phy_exit() for non-wakeup controllers. So,
> adding system PM ops to the femto PHY driver would be redundant.
> 

It seems these decisions must come from the controller, in order to
handle the differences between a wakeup capable port and not. So I'm
thinking that it's correct that it should not implement this.

> 2) Should the ref_clk be disabled for runtime sleep / wakeup controller
> system sleep, or only for non-wakeup controller system sleep?
> 
> I'm a little hesitant here. In my submission I'm disabling it in both, but
> looking at the downstream code you provided, it seems it's only disabled
> for system sleep. ref_clk is disabled by phy->set_suspend() [2] which IIUC
> is only called in the system sleep path through dwc3_core_exit() [3].
> Moreover, in host mode the upstream code seems to make a distinction
> between 1) runtime sleep / system sleep for wakeup controller, and 2)
> system sleep for non-wakeup controller where phy_power_off() and
> phy_exit() are only called in the latter. This suggests the PHY is not
> supposed to be in a fully powered-off state for runtime sleep and system
> sleep for wakeup controller. So, it's possible the ref_clk should be kept
> enabled in this case. What is your take on this? I could only disable
> ref_clk in the femto phy->exit() callback to keep ref_clk enabled during
> runtime sleep and make sure it's only disabled on system sleep for
> non-wakeup controller.
> 

I suggested the same to Andrew, in our chat. Keeping sufficient
resources on, to allow the system to be woken up again by a USB device
is needed if requested. As such the handling of ref must differ between
the two cases.

It still looks a bit strange to me, having the runtime PM callbacks
prepare for wakeup from system suspend...

> Hoping I'm not missing anything here.
> 

I think you managed to capture it all. Sorry for leading you down this
incorrect path.

Regards,
Bjorn

> Best,
> 
> Adrien
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/core.c#L1988
> [2] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c#L524
> [3] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/dwc3/core.c#L1915
> 
> > Regards,
> > Bjorn
> > 
> > >  };
> > >  
> > >  static void qcom_snps_hsphy_override_param_update_val(
> > > -- 
> > > 2.40.1
> > > 
> 
