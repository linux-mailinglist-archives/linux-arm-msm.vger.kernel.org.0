Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5AA3C89B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 19:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238178AbhGNR0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238085AbhGNR0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 13:26:38 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CF3C061762
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 10:23:45 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id c197so3073788oib.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xQZN3icDsBkvO9cDDwLhgogPceNHTrTo1SCrhA6YUsI=;
        b=zay8GJlYMMCpW9N+3AwgKok2LmG/Fcup6oo9MKk+B6g3v8LF0bJocGP01P9Y0yNQ8S
         qxQQYHaX+dIZjK6/fvxuozcpC8G1nWY+Pruy/FoN/ofrFlFo3t6HnkMJwPcOF6a0lG1n
         fhCAUX9m7FIkv4ZmCkZwS1MsQOEPyMTWOSutcSHq9er35C3PzgNGBvcD3H9fcl3JjmlE
         WNOJAVT55UZV1pBIsaW6ig5FVKGhe2N1sogoQWmLLsvV77JwH7kd1mFUvqA/hP3q7z23
         dsMvqaqYJDvK4x1qZPoKvO6G+cfYRW7Tp0lt1EayHinr+zk8QaZY7DCCMV6sv8dy3AOZ
         SXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xQZN3icDsBkvO9cDDwLhgogPceNHTrTo1SCrhA6YUsI=;
        b=qo0jiOBZ5Jr9gQ6m26BJTGF4uSU6a/E6ah7u7j8mLYv126u7BgZc0+r8dXvUrXf0GS
         At1vmyQq6gT75klUne/GDln9Jk4A0wY7/UDJWzSTXyahacjrTlB+/4CAehM3XiOvPHpD
         XBPP1uYas6lYKpDmvYr9+6sKMqfrgIIA0V2R8Y2q8T5734IeHuAYxeFqZk+ePNCmnEO6
         d/Ml7mKL5DbnckI4r1I38Y6bq075JI3KIdNQNE305i/d9fAMqFSqTE44F5sjTt8JcScB
         BeYkjHKuU0yIPGy8DM/Xwrz88Y7lGuRe9WWlP4+AbpfapPEIg/MIvRdqWsMLmRM8d91v
         ppIQ==
X-Gm-Message-State: AOAM5317796PgqXafkWYGxalsQVxW/Qum5r8Afa8HSQCG4n4VSz+Czw9
        HiY6sKalhVDGp+mSq/BxR8QxMQ==
X-Google-Smtp-Source: ABdhPJwM0np9CfM0k4rj4WeO6SuzIyzCjbFRY9p44kNiFnz2AL6mmIc1PvRhoUdlc97FFDvMcoHxSA==
X-Received: by 2002:aca:ef84:: with SMTP id n126mr8158730oih.59.1626283425029;
        Wed, 14 Jul 2021 10:23:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y6sm620261oiy.18.2021.07.14.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 10:23:44 -0700 (PDT)
Date:   Wed, 14 Jul 2021 12:23:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
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
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <YO8dnRE9pq5T64PD@yoga>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk>
 <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Jul 05:09 CDT 2021, Ulf Hansson wrote:

> - Peter (the email was bouncing)
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
> 
> Therefore, I think it would be worth having a common solution for
> this, rather than a solution per subsystem or even worse, per device.
> 

Representing the chip and its power needs, separate from the busses does
seem reasonable. It's pretty much what Dmitry suggested originally, but
his attempts to use either power-domain or regulator references to
ensure ordering has been objected.


Beyond this, there is a similar case (that you and I have talked about
earlier) in supporting the SDX55 PCIe modem found in some devices.
Where in addition to ensuring that the power rails are configured, a
couple of gpios needs to be controlled and there's an incoming gpio line
indicating that the firmware of the device has locked up and the power
needs to be toggled and the device re-enumerated.

> Unfortunately, it looks like Peter's email is bouncing so we can't get
> an update from him.
> 

And for this second part, where we need some additional logic it seems
to go beyond what the power sequence discussions has touched upon so
far.

Regards,
Bjorn
