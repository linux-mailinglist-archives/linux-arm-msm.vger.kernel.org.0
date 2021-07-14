Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5793C88E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 18:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236720AbhGNQuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 12:50:07 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:33356 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhGNQuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 12:50:07 -0400
Received: by mail-io1-f44.google.com with SMTP id z11so2990134iow.0;
        Wed, 14 Jul 2021 09:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CbgkBCUa11GQ5LNU6tes0AVH4LcZ1fR3h82JApyQHQc=;
        b=B7CJTxvlZ6tK33gz5SDdv/XSeGzy/qbfTJiL94xB4S/lu0NWk2+oGnYKvBMjoGm0kw
         bzEXucYBzoU32RxeloWV/jq621bpVKFCy31d1ac8BIAnXQNjyBwGIsmhzmXcU6YZtYYG
         X59zNRMaI6KLXSoYb23VyF7R8tic2lVPxXzZozjh4n7ixRLhcKRXSicLXew7J6VoEb1f
         tJTTNO1RZdEBFrTTkzA+/x3esUC8+q/etfKXL1SHZoFvQfUFH9v2zUzeNB05eLJ3kj5L
         s4akmjmzMrIfIR2EcmDsMlAkckfX1Qcde2uEodNv41ayrwwCBBEYtuomqjprQG/InZVj
         pqDw==
X-Gm-Message-State: AOAM533pyNBYqx0IF5FGSNmyie6yxlMdLF68VuZQ++BnckL1z2dANZSc
        Cq3E5EtyIyv+vZUS1IVyxg==
X-Google-Smtp-Source: ABdhPJy1brnVoPawsPOQ1v9Mmude0z3jpOErBcHEsG+NFTSxBYxUc9zxBMsN/DgzdS6lOUXJ+fINaQ==
X-Received: by 2002:a6b:7514:: with SMTP id l20mr7629923ioh.96.1626281234690;
        Wed, 14 Jul 2021 09:47:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q186sm1586818ioq.1.2021.07.14.09.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 09:47:13 -0700 (PDT)
Received: (nullmailer pid 2734691 invoked by uid 1000);
        Wed, 14 Jul 2021 16:47:10 -0000
Date:   Wed, 14 Jul 2021 10:47:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <20210714164710.GC2719790@robh.at.kernel.org>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk>
 <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
 <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 08, 2021 at 02:37:44PM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Thu, 8 Jul 2021 at 13:10, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > - Peter (the email was bouncing)
> 
> + Peter's kernel.org address
> 
> >
> > On Tue, 6 Jul 2021 at 13:55, Mark Brown <broonie@kernel.org> wrote:
> > >
> > > On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
> > > > On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
> > >
> > > > > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > > > > being controlled through the UART and WiFi being present on PCIe
> > > > > bus. Both blocks share common power sources. Add device driver handling
> > > > > power sequencing of QCA6390/1.
> > >
> > > > Power sequencing of discoverable buses have been discussed several
> > > > times before at LKML. The last attempt [1] I am aware of, was in 2017
> > > > from Peter Chen. I don't think there is a common solution, yet.
> > >
> > > This feels a bit different to the power sequencing problem - it's not
> > > exposing the individual inputs to the device but rather is a block that
> > > manages everything but needs a bit of a kick to get things going (I'd
> > > guess that with ACPI it'd be triggered via AML).  It's in the same space
> > > but it's not quite the same issue I think, something that can handle
> > > control of the individual resources might still struggle with this.
> >
> > Well, to me it looks very similar to those resouses we could manage
> > with the mmc pwrseq, for SDIO. It's also typically the same kind of
> > combo-chips that moved from supporting SDIO to PCIe, for improved
> > performance I guess. More importantly, the same constraint to
> > pre-power on the device is needed to allow it to be discovered/probed.
> 
> In our case we'd definitely use pwrseq for PCIe bus and we can also
> benefit from using pwrseq for serdev and for platform busses also (for
> the same story of WiFi+BT chips).
> 
> I can take a look at rewriting pwrseq code to also handle the PCIe
> bus. Rewriting it to be a generic lib seems like an easy task,
> plugging it into PCIe code would be more fun.
> 
> Platform and serdev... Definitely even more fun.

I don't want to see pwrseq (the binding) expanded to other buses. If 
that was the answer, we wouldn't be having this discussion. It was a 
mistake for MMC IMO. 

If pwrseq works as a kernel library/api, then I have no issue with that.

> 
> > Therefore, I think it would be worth having a common solution for
> > this, rather than a solution per subsystem or even worse, per device.

Power sequencing requirements are inheritently per device unless we're 
talking about standard connectors. 

This is a solved problem on MDIO. It's quite simple. If there's a DT 
node for a device you haven't discovered, then probe it anyways.

Rob
