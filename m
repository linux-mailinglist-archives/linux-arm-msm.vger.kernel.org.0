Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762B43BF922
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 13:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhGHLkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 07:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhGHLkj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 07:40:39 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D65DC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 04:37:56 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id s4so5250994qkm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N/qY52HtEnySw8oiOqnCY6Vr04Y1zPZsw52TSvRcqL0=;
        b=X3Au6Pi/gZuIKEizEtZpkpNYlgIbyi0G/awOjci961zqy8EYfCIrI09IB45E8MZzkn
         7AVSU1L4UzvADeoHy3cJPWyN+BKIqrka7aQLlq0dTLu0v8Bd4yKSpQyb3T6Vsjf1cqC9
         pbP9wWK6juYmhotjALZkdmH+dl8zKezlghv4zvCXvk0FunQYEervgRw4wCYkBksuC557
         JGt2vEAgIUA5PDhK0O0Fhmslq7U4Av3gNG21p9JwL0p0HFzVXt93DVGB8IfThBaAfAFA
         N49Jy+lJPz3i9tWnQoQk+O0Zv5Y8rD1iMixULgWhqGkhJInmouQgldcAyfIqcTqB44ID
         9UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/qY52HtEnySw8oiOqnCY6Vr04Y1zPZsw52TSvRcqL0=;
        b=JoCUilFMsfhsqqJEujcXPpvDbo37ARr7o3BiTp38jh0GBgK5nn0m5LFYDnYOpIXFBf
         K0oaR7Dd5vO4Yza3BmEJoPxcdveG6pua6Xx8REAbmY507UWeYlPFBZqodqqVy/iWudpi
         niNGerBI4Z3vhmLrxRp8BvPdoDftOKytOhbIpptbW2kpvSBE6D2pMg2eA55yKj08YFnt
         gtPAJWIcyNaaQ1UApzvlXfNsX9Gnh99pBt5xLGnndv8sYDdQ+Ig/8N//pP/9c4DGxa0K
         VQImPeTDahc9Uc/J2yChIju07RWOUrma3mj3zC2WlleP7ud0sSM/HO9SsGfYCcJG0aV3
         W7Rg==
X-Gm-Message-State: AOAM533iwiwkIZkMQgu2jFxEzY0K4eGPLbTxOBo3WlO76wPw6/vafxLQ
        IOWXMI11qekvfvxsr31CRD+OUnuBYL33V/ByffgTtA==
X-Google-Smtp-Source: ABdhPJzLaw+Ocua2+xY6AepEwv2jQPUmOKbSjrNWV4ZgDNgxv4FrDkLyxft2BVw+2yuajvOMGGJpZ4Sga0z4xviKWRM=
X-Received: by 2002:a05:620a:13ec:: with SMTP id h12mr14862220qkl.217.1625744275692;
 Thu, 08 Jul 2021 04:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org> <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk> <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
In-Reply-To: <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Jul 2021 14:37:44 +0300
Message-ID: <CAA8EJppSV--TBjnGxGhaTHeKWdpM6uz70bg7diU3_K7OHoka4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Chen <peter.chen@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, 8 Jul 2021 at 13:10, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> - Peter (the email was bouncing)

+ Peter's kernel.org address

>
> On Tue, 6 Jul 2021 at 13:55, Mark Brown <broonie@kernel.org> wrote:
> >
> > On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
> > > On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
> >
> > > > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > > > being controlled through the UART and WiFi being present on PCIe
> > > > bus. Both blocks share common power sources. Add device driver handling
> > > > power sequencing of QCA6390/1.
> >
> > > Power sequencing of discoverable buses have been discussed several
> > > times before at LKML. The last attempt [1] I am aware of, was in 2017
> > > from Peter Chen. I don't think there is a common solution, yet.
> >
> > This feels a bit different to the power sequencing problem - it's not
> > exposing the individual inputs to the device but rather is a block that
> > manages everything but needs a bit of a kick to get things going (I'd
> > guess that with ACPI it'd be triggered via AML).  It's in the same space
> > but it's not quite the same issue I think, something that can handle
> > control of the individual resources might still struggle with this.
>
> Well, to me it looks very similar to those resouses we could manage
> with the mmc pwrseq, for SDIO. It's also typically the same kind of
> combo-chips that moved from supporting SDIO to PCIe, for improved
> performance I guess. More importantly, the same constraint to
> pre-power on the device is needed to allow it to be discovered/probed.

In our case we'd definitely use pwrseq for PCIe bus and we can also
benefit from using pwrseq for serdev and for platform busses also (for
the same story of WiFi+BT chips).

I can take a look at rewriting pwrseq code to also handle the PCIe
bus. Rewriting it to be a generic lib seems like an easy task,
plugging it into PCIe code would be more fun.

Platform and serdev... Definitely even more fun.

> Therefore, I think it would be worth having a common solution for
> this, rather than a solution per subsystem or even worse, per device.
>
> Unfortunately, it looks like Peter's email is bouncing so we can't get
> an update from him.

Let's see if the kernel.org email will get to him.

-- 
With best wishes
Dmitry
