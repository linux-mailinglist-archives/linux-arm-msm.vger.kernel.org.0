Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA0923D2E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 22:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgHEUT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 16:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgHEUTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 16:19:46 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D81C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 13:19:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id z20so5342626plo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVjtbYhstiKuNQL6JeVbBPs4G1xXwyHdcoC1ZxR9HUQ=;
        b=lBeyGQOGbakQKscP5qJp87U0BD2iPT7BShFj1oh45m4vW3V+uOyjQZjzqLblxE+DoG
         ub+MTpdonw61jGuhYukxNyO/HMUXjsmaRDFu5GslTldXpvTE1UfUzpXvKOGxj4GBOLFJ
         o1jzDk6g7iUKQwYW/KEivXAieYBSN294EgsiL2TdFPLYA4zX/pRBxN4U3YNsKkDsBxqR
         aW+1CWTbx8Oktp2rcBVnX7xXXbWHanLCj0j5d3/0RGRRX8bdH+kVmgZKOjHTKoPbwrjy
         kD9dI/VFWynhcgO7mpFsAc5PiwBbeklTcxzilRT/p1dFwFyC+yDqdJhCmaEC7t6r8Ihd
         ix+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVjtbYhstiKuNQL6JeVbBPs4G1xXwyHdcoC1ZxR9HUQ=;
        b=T6ecrTbKOvqGwD87tG4nelxH5olT04Fq9PuGfDC5ZuYgQe3zAwbMtuySAgfMaezYFx
         Kp41ofdbiMSm8y7mM9OEUuAsDQLY0m42nf9DTENPifzVFQUjFIJx/UWSCwE/Kp56XiiW
         opLrgW8YhqqWWhBMhlyKM/ZApL2bCNzfz7P4ExWIHwbHhDMLPTE1vgWGhHssBA0FTc1y
         K7aBrMX4eeqAJeHKHF5DXx++7irvRG4QaiIHqCO6KSxbBrN9TtqCyANXHEYzpFltIHG8
         UN2jvlErGXCj/w9prb5agRx5cBxX5nZI6CvRLzsuPJ/Wm7rrZW4jAkCNpPUb9ghiLrQ+
         IZvw==
X-Gm-Message-State: AOAM5331NiTUD7DHgS7NWSAdxriV28etcpXswqgVRArIConEe2EZ5fv4
        y43SHEbc0v2O3IRayxXJOFzWjez4PC9reOpFfUpFSQ==
X-Google-Smtp-Source: ABdhPJyzC3W0lW0kRAsgMCPz7TzprnpMpUFYzlQwQ8cedIEf9CqmMuoAlFAGdxAKZ6AyjNgpHiemuwv1bJvRpW+qLtA=
X-Received: by 2002:a17:90a:17e9:: with SMTP id q96mr4963217pja.91.1596658785977;
 Wed, 05 Aug 2020 13:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
In-Reply-To: <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 5 Aug 2020 13:19:10 -0700
Message-ID: <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     John Stultz <john.stultz@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
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
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
>
> On Fri, Jul 17, 2020 at 5:06 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > Switch the driver to use the helper macros. In addition to reducing the
> > number of lines, this also adds module unload protection (if the driver
> > is compiled as a module) by switching from module_platform_driver to
> > builtin_platform_driver.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
> >  1 file changed, 3 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 5b624e3295e4..c1c5dfad57cc 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> >         return ret;
> >  }
> >
> > -static int qcom_pdc_probe(struct platform_device *pdev)
> > -{
> > -       struct device_node *np = pdev->dev.of_node;
> > -       struct device_node *parent = of_irq_find_parent(np);
> > -
> > -       return qcom_pdc_init(np, parent);
> > -}
> > -
> > -static const struct of_device_id qcom_pdc_match_table[] = {
> > -       { .compatible = "qcom,pdc" },
> > -       {}
> > -};
> > -MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> > -
> > -static struct platform_driver qcom_pdc_driver = {
> > -       .probe = qcom_pdc_probe,
> > -       .driver = {
> > -               .name = "qcom-pdc",
> > -               .of_match_table = qcom_pdc_match_table,
> > -               .suppress_bind_attrs = true,
> > -       },
> > -};
> > -module_platform_driver(qcom_pdc_driver);
> > +IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
> > +IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
> > +IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
> >  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> >  MODULE_LICENSE("GPL v2");
>
> <sigh>
> So this is where I bashfully admit I didn't get a chance to try this
> patch series out, as I had success with a much older version of
> Saravana's macro magic.
>
> But unfortunately, now that this has landed in mainline, I'm seeing
> boot regressions on db845c. :( This is in the non-modular case,
> building the driver in.

Does that mean the modular version is working? Or you haven't tried
that yet? I'll wait for your reply before I try to fix it. I don't
have the hardware, but it should be easy to guess this issue looking
at the code delta.

The only significant change from what your probe function is doing is
this snippet. But it'd be surprising if this only affects the builtin
case.

+ if (par_np == np)
+         par_np = NULL;
+
+ /*
+ * If there's a parent interrupt controller and  none of the parent irq
+ * domains have been registered, that means the parent interrupt
+ * controller has not been initialized yet.  it's not time for this
+ * interrupt controller to initialize. So, defer probe of this
+ * interrupt controller. The actual initialization callback of this
+ * interrupt controller can check for specific domains as necessary.
+ */
+ if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
+         return -EPROBE_DEFER;

> I managed to bisect it down to this patch, and reverting it avoids the
> issue. I don't see what is wrong right off, but I really need to get
> to bed, so I'll dig further tomorrow.
>
> Saravana: Apologies for not getting around to testing this beforehand!

No worries. Apologies for breaking it accidentally.

-Saravana
