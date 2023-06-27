Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA687402D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 20:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjF0SJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 14:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjF0SJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 14:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C41187
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687889325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XIzaMLEoZseg15rsHJ94wr9W2L80SXyc2pmPqG7NjnU=;
        b=KRxG/Vs9StJ623EP04GS/u5tkac1V3Mb02Iep7H2DhNnowgmFSIptOPF7Hz4pM+VhYYp7f
        4vXcgn9QVYfVUpHx42sazp+o+IvUMMnZl2sGyFW0gsbcAjzuwX0h2OLzYXHqt4v8akro3G
        cleQ1aO6rkdQJtPGFsoV3o8sIpO0Muk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-EFY3so1GNnCWbGsgdXu4UQ-1; Tue, 27 Jun 2023 14:08:44 -0400
X-MC-Unique: EFY3so1GNnCWbGsgdXu4UQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-765a1a97103so306572485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 11:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687889324; x=1690481324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIzaMLEoZseg15rsHJ94wr9W2L80SXyc2pmPqG7NjnU=;
        b=KSaApNDE8EgGRshbeE8IQdZMdejkQEoHZV4UkfmhxJSPpydNKftEGIOVS8XQEfmYeX
         nSzXKuYD5/FeNJ+Jpjj1QCli2lBsSBOsMPBbWwbxNkhHLj7lqxGaF8Cmcrf0l3RpzNWC
         9W1JmsnVCGEcSR8yi26pZVrj8+NfDot7eSyKo6x1M1Z9qWJVxPaPkEwCoq78AYB1AixU
         pQ49x8nsfrpggiSHkOxP3luxIDMdvz9Wkd5nvY35/XjTdN1M2QbHOkVy5Dy4TNB4YUp7
         8Ac9Igq5/GhWGyHN+jFyQkZsD74fngUXrUVnxaBZN6V/O+s1XE1HC/TtDMTLeA3jbjRE
         OYyw==
X-Gm-Message-State: AC+VfDyIUK6RRt3xnrOx4poytOvAOfHtmGEhb4ggybTNP6pYC3XqoLc6
        474ofVn4CgitQvIq5Mr2q5+zgWyzE7wR1dxxwsZVh0BsmPMgm6BQgi4fVhzeFaM8Xv2U8WdL0VD
        5Y9VczpyEFILy6ijfsO78TS5o7w==
X-Received: by 2002:a05:620a:4087:b0:766:fbe6:ccbc with SMTP id f7-20020a05620a408700b00766fbe6ccbcmr5700133qko.29.1687889324173;
        Tue, 27 Jun 2023 11:08:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7TDVN2FeMGh6qcSDmZy8YGLhDuYZ5iNM3siut168C5HboPBzGXzZVtnAVC+3BFKsCrtFSPcQ==
X-Received: by 2002:a05:620a:4087:b0:766:fbe6:ccbc with SMTP id f7-20020a05620a408700b00766fbe6ccbcmr5700109qko.29.1687889323884;
        Tue, 27 Jun 2023 11:08:43 -0700 (PDT)
Received: from fedora ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id u12-20020ae9c00c000000b0076264532630sm4141287qkk.121.2023.06.27.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 11:08:43 -0700 (PDT)
Date:   Tue, 27 Jun 2023 14:08:41 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/3] phy: qcom-snps-femto-v2: add system sleep PM ops
Message-ID: <ZJslqaHZqdizSGbc@fedora>
References: <20230622194021.80892-1-athierry@redhat.com>
 <20230622194021.80892-3-athierry@redhat.com>
 <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Jun 22, 2023 at 02:43:07PM -0700, Bjorn Andersson wrote:
> On Thu, Jun 22, 2023 at 03:40:19PM -0400, Adrien Thierry wrote:
> > The downstream driver [1] implements set_suspend(), which deals with
> > both runtime and system sleep/resume. The upstream driver already has
> > runtime PM ops, so add the system sleep PM ops as well, reusing the same
> > code as the runtime PM ops.
> > 
> > [1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c
> > 
> > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index ce1d2f8b568a..378a5029f61e 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -179,7 +179,7 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
> >  	readl_relaxed(base + offset);
> >  }
> >  
> > -static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> > +static int qcom_snps_hsphy_do_suspend(struct qcom_snps_hsphy *hsphy)
> >  {
> >  	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
> >  
> > @@ -199,7 +199,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> >  	return 0;
> >  }
> >  
> > -static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> > +static int qcom_snps_hsphy_do_resume(struct qcom_snps_hsphy *hsphy)
> >  {
> >  	int ret;
> >  
> > @@ -214,25 +214,25 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> >  	return 0;
> >  }
> >  
> > -static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> > +static int __maybe_unused qcom_snps_hsphy_suspend(struct device *dev)
> >  {
> >  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
> >  
> >  	if (!hsphy->phy_initialized)
> >  		return 0;
> >  
> > -	qcom_snps_hsphy_suspend(hsphy);
> > +	qcom_snps_hsphy_do_suspend(hsphy);
> >  	return 0;
> >  }
> >  
> > -static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
> > +static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
> >  {
> >  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
> >  
> >  	if (!hsphy->phy_initialized)
> >  		return 0;
> >  
> > -	qcom_snps_hsphy_resume(hsphy);
> > +	qcom_snps_hsphy_do_resume(hsphy);
> >  	return 0;
> >  }
> >  
> > @@ -518,8 +518,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
> >  MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
> >  
> >  static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
> > -	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
> > -			   qcom_snps_hsphy_runtime_resume, NULL)
> > +	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_suspend,
> > +			   qcom_snps_hsphy_resume, NULL)
> > +	SET_SYSTEM_SLEEP_PM_OPS(qcom_snps_hsphy_suspend,
> > +				qcom_snps_hsphy_resume)
> 
> Won't this cause issues if you system suspend the device while it's
> already runtime suspended?
>

I'm not sure if it would cause issues, but after reflexion and discussion
with Andrew, I think it's unnecessary to add system PM ops in the femto
PHY driver. 

In the dwc3 core, both system and runtime suspend end up calling
dwc3_suspend_common(). From there, what happens depends on the USB mode
and whether the controller is entering system or runtime suspend.

HOST mode:
  (1) system suspend on a non-wakeup controller

  The [1] if branch is taken. dwc3_core_exit() is called, which ends up
  calling phy_power_off() and phy_exit(). Those two functions decrease the
  PM runtime count at some point, so they will trigger the PHY runtime sleep
  (assuming the count is right).

  (2) runtime suspend / system suspend on a wakeup controller  

  The [1] branch is not taken. dwc3_suspend_common() calls
  phy_pm_runtime_put_sync(dwc->usb2_generic_phy). Assuming the ref count is
  right, the PHY runtime suspend op is called.

DEVICE mode:

  dwc3_core_exit() is called on both runtime and system sleep
  unless the controller is already runtime suspended.

OTG mode:
  (1) system suspend : dwc3_core_exit() is called

  (2) runtime suspend : do nothing

With that in mind:

1) Does the PHY need to implement system sleep callbacks? 

dwc3 core system sleep callback will already runtime suspend the PHY, and
also call phy_power_off() and phy_exit() for non-wakeup controllers. So,
adding system PM ops to the femto PHY driver would be redundant.

2) Should the ref_clk be disabled for runtime sleep / wakeup controller
system sleep, or only for non-wakeup controller system sleep?

I'm a little hesitant here. In my submission I'm disabling it in both, but
looking at the downstream code you provided, it seems it's only disabled
for system sleep. ref_clk is disabled by phy->set_suspend() [2] which IIUC
is only called in the system sleep path through dwc3_core_exit() [3].
Moreover, in host mode the upstream code seems to make a distinction
between 1) runtime sleep / system sleep for wakeup controller, and 2)
system sleep for non-wakeup controller where phy_power_off() and
phy_exit() are only called in the latter. This suggests the PHY is not
supposed to be in a fully powered-off state for runtime sleep and system
sleep for wakeup controller. So, it's possible the ref_clk should be kept
enabled in this case. What is your take on this? I could only disable
ref_clk in the femto phy->exit() callback to keep ref_clk enabled during
runtime sleep and make sure it's only disabled on system sleep for
non-wakeup controller.

Hoping I'm not missing anything here.

Best,

Adrien

[1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/core.c#L1988
[2] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c#L524
[3] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/dwc3/core.c#L1915

> Regards,
> Bjorn
> 
> >  };
> >  
> >  static void qcom_snps_hsphy_override_param_update_val(
> > -- 
> > 2.40.1
> > 

