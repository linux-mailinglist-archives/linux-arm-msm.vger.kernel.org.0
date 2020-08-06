Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA6123DED1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 19:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbgHFRcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 13:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:55150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729957AbgHFRcF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 13:32:05 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 461EE22D6E;
        Thu,  6 Aug 2020 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596715961;
        bh=RnBeNxWWl4q9QSN+tmbvArEJ2MhaOfF3wq7wtPI6v9s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SpOS6lQOAH9r/CIi/S3TDpOXthbyTOKoERVxpMjkp7ZKNYvD23xa640uTIbU9WnDB
         cxSWbc5tiraE9L9evnyesXRnDvQudHa7kX43Yh+bL/62IQsDaMslV9TX13RIT5Fru6
         hQZuwnjielyHPVPInWo9WoM/PrFKOq72Zxlso0Ig=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k3bal-000Eyu-7Y; Thu, 06 Aug 2020 09:49:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 Aug 2020 09:49:39 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>, steev@kali.org
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
In-Reply-To: <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: john.stultz@linaro.org, saravanak@google.com, tglx@linutronix.de, jason@lakedaemon.net, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, hanks.chen@mediatek.com, cc.hwang@mediatek.com, loda.chou@mediatek.com, steev@kali.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 02:24, John Stultz wrote:
> On Wed, Aug 5, 2020 at 1:19 PM Saravana Kannan <saravanak@google.com> 
> wrote:
>> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> 
>> wrote:
>> > On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
>> > >
>> > > Switch the driver to use the helper macros. In addition to reducing the
>> > > number of lines, this also adds module unload protection (if the driver
>> > > is compiled as a module) by switching from module_platform_driver to
>> > > builtin_platform_driver.
>> > >
>> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
>> > > ---
>> > >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
>> > >  1 file changed, 3 insertions(+), 23 deletions(-)
>> > >
>> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> > > index 5b624e3295e4..c1c5dfad57cc 100644
>> > > --- a/drivers/irqchip/qcom-pdc.c
>> > > +++ b/drivers/irqchip/qcom-pdc.c
>> > > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>> > >         return ret;
>> > >  }
>> > >
>> > > -static int qcom_pdc_probe(struct platform_device *pdev)
>> > > -{
>> > > -       struct device_node *np = pdev->dev.of_node;
>> > > -       struct device_node *parent = of_irq_find_parent(np);
>> > > -
>> > > -       return qcom_pdc_init(np, parent);
>> > > -}
>> > > -
>> > > -static const struct of_device_id qcom_pdc_match_table[] = {
>> > > -       { .compatible = "qcom,pdc" },
>> > > -       {}
>> > > -};
>> > > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
>> > > -
>> > > -static struct platform_driver qcom_pdc_driver = {
>> > > -       .probe = qcom_pdc_probe,
>> > > -       .driver = {
>> > > -               .name = "qcom-pdc",
>> > > -               .of_match_table = qcom_pdc_match_table,
>> > > -               .suppress_bind_attrs = true,
>> > > -       },
>> > > -};
>> > > -module_platform_driver(qcom_pdc_driver);
>> > > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
>> > > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
>> > > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
>> > >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
>> > >  MODULE_LICENSE("GPL v2");
>> >
>> > <sigh>
>> > So this is where I bashfully admit I didn't get a chance to try this
>> > patch series out, as I had success with a much older version of
>> > Saravana's macro magic.
>> >
>> > But unfortunately, now that this has landed in mainline, I'm seeing
>> > boot regressions on db845c. :( This is in the non-modular case,
>> > building the driver in.
>> 
>> Does that mean the modular version is working? Or you haven't tried
>> that yet? I'll wait for your reply before I try to fix it. I don't
>> have the hardware, but it should be easy to guess this issue looking
>> at the code delta.
> 
> I've not yet tested with modules with your patch.
> 
>> The only significant change from what your probe function is doing is
>> this snippet. But it'd be surprising if this only affects the builtin
>> case.
>> 
>> + if (par_np == np)
>> +         par_np = NULL;
>> +
>> + /*
>> + * If there's a parent interrupt controller and  none of the parent 
>> irq
>> + * domains have been registered, that means the parent interrupt
>> + * controller has not been initialized yet.  it's not time for this
>> + * interrupt controller to initialize. So, defer probe of this
>> + * interrupt controller. The actual initialization callback of this
>> + * interrupt controller can check for specific domains as necessary.
>> + */
>> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
>> +         return -EPROBE_DEFER;
> 
> Yep. We're getting caught on the irq_find_matching_host() check. I'm a
> little lost as when I look at the qcom,pdc node in the dtsi its not
> under a parent controller (instead the soc node).
> Not sure if that's an issue in the dtsi or if par_np check needs to
> ignore the soc node and pass null?

I think you have nailed it. This checks for a domain attached to
the driver we are about to probe, and this domain cannot possibly
exist. Instead, it is the *parent* this should check for, as we
depend on it for successful probing.

Can you please give this a go?

Thanks,

         M.

diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 1bb0e36c2bf3..d2341153e181 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -52,7 +52,7 @@ int platform_irqchip_probe(struct platform_device 
*pdev)
  	 * interrupt controller. The actual initialization callback of this
  	 * interrupt controller can check for specific domains as necessary.
  	 */
-	if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
+	if (par_np && !irq_find_matching_host(par_np, DOMAIN_BUS_ANY))
  		return -EPROBE_DEFER;

  	return irq_init_cb(np, par_np);

-- 
Jazz is not dead. It just smells funny...
