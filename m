Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61E11BE379
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 18:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgD2QKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 12:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726580AbgD2QKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 12:10:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F57AC03C1AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 09:10:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v2so991412plp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LnuTF6O3dTHufQHM9/HzI8kaM8mgrKqwmBK7x40VgOY=;
        b=E+1sReA/rPS4Wxrucm7parVrJlgzQBxp+yDdUbgqUHMlrYdMNELOGIHVhOcJgqlnIN
         Yn60kUWv9AaxuAMIbCj+gZ9BMzowNAPVTCkTraVat3Bb/Way5CrkVk+c0XwyeRZvzZnY
         wFgxKpzq6evnLk7dg2tGgiTOZ7tr3x+P4kVdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LnuTF6O3dTHufQHM9/HzI8kaM8mgrKqwmBK7x40VgOY=;
        b=Y0MkDpNnkjbV84UfVoqgPO6nhuN6jDvzMiupgJt7jdRuHwDS0Q6eVWya1SHjWI9Woe
         OjY50LSQLBtTaCEXFoCUQcAVlYsVjhEDo0GzbYDydXhOWdbBmtO0DHFZS6rU5mB0thM4
         cpHNcPMuw7KscgEb1ti7Bu6gkHIkKcKnuTM+hC6X5VsrwHm0Ncf+4vq028t2CrHrKL0I
         +Et29elkCaq5NMHUEh+9gUC8KmHD9q53VJ0EX20USfqMnFJRAorCi+66v4XpGzUfptrM
         TzRlFqmMQzWmuFvt8DhXgHwU4vgfG8bnnk5oJ/HG15+WIJgBGD8c37XOomWtSeN4tDs8
         nBug==
X-Gm-Message-State: AGi0PubqYK9q7VJ3ah7xLKzUpBD73WY7n5fEqbEnah6ZKxyqQ6ZNXCpC
        RIF7Pi9RbJBy95L0yF5XK/IDfQ==
X-Google-Smtp-Source: APiQypIhbmZV3M+yvQy7EICR9p/bpqweCECRrfH43rHTb+hLEIUs/2b2VFvnPWm9xkrZAjbus9nyFw==
X-Received: by 2002:a17:902:a586:: with SMTP id az6mr18257939plb.201.1588176648955;
        Wed, 29 Apr 2020 09:10:48 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j32sm1319886pgb.55.2020.04.29.09.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 09:10:47 -0700 (PDT)
Date:   Wed, 29 Apr 2020 09:10:46 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 03/17] arm64: dts: sdm845: Add OPP table for all qup
 devices
Message-ID: <20200429161046.GR4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-4-git-send-email-rnayak@codeaurora.org>
 <20200429000234.GK4525@google.com>
 <fe4b60f9-8aa6-0173-a67f-2f0f8451ad85@codeaurora.org>
 <cc425e51-9e27-76a3-8ce6-1a751960ff7a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc425e51-9e27-76a3-8ce6-1a751960ff7a@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 29, 2020 at 08:23:30PM +0530, Rajendra Nayak wrote:
> 
> On 4/29/2020 7:45 PM, Rajendra Nayak wrote:
> > 
> > On 4/29/2020 5:32 AM, Matthias Kaehlcke wrote:
> > > Hi Rajendra,
> > > 
> > > On Tue, Apr 28, 2020 at 07:02:51PM +0530, Rajendra Nayak wrote:
> > > > qup has a requirement to vote on the performance state of the CX domain
> > > > in sdm845 devices. Add OPP tables for these and also add power-domains
> > > > property for all qup instances.
> > > > 
> > > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sdm845.dtsi | 115 +++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 115 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > index 8f926b5..36b9fb1 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > @@ -804,6 +804,25 @@
> > > >               clock-names = "core";
> > > >           };
> > > > +        qup_opp_table: qup-opp-table {
> > > > +            compatible = "operating-points-v2";
> > > > +
> > > > +            opp-19200000 {
> > > > +                opp-hz = /bits/ 64 <19200000>;
> > > > +                required-opps = <&rpmhpd_opp_min_svs>;
> > > > +            };
> > > > +
> > > > +            opp-75000000 {
> > > > +                opp-hz = /bits/ 64 <75000000>;
> > > > +                required-opps = <&rpmhpd_opp_low_svs>;
> > > > +            };
> > > > +
> > > > +            opp-100000000 {
> > > > +                opp-hz = /bits/ 64 <100000000>;
> > > > +                required-opps = <&rpmhpd_opp_svs>;
> > > > +            };
> > > > +        };
> > > > +
> > > 
> > > Judging from SDM845 (which has more OPP tables) the convention seems to be
> > > to add OPP tables to the nodes that use them, which seems reasonable and
> > > keeps them out of the device list.
> > > 
> > > Unfortunately this convention isn't completely suitable for cases like this
> > > (and the DSI OPPs later in this series), where the same OPP table is used by
> > > multiple devices. A possible compromise would be to add the table to the
> > > node of the first device that uses them.
> > 
> > Sounds fair, I will do that and respin. Thanks.
> 
> Looking into this some more, I see we do have..
> 
> static const struct of_device_id of_skipped_node_table[] = {
>         { .compatible = "operating-points-v2", },
>         {} /* Empty terminated list */
> };
> 
> ..in drivers/of/platform.c, so its not being added to the device list.

sure, I didn't mean that the OPP table is added by the kernel as a device, but
that the table breaks with the structure of the DT of device nodes ordered by
address.

> And atleast in case of qup, I am having to duplicate the OPP tables once for
> each qup instance. Not to mention, having them inside the first qup device
> just makes it a little confusing to read who the OPP table belongs to.

I'm not advocating for duplicating the OPP tables. An alternative to having
them in the first QUP device could be to have an dedicated node with shared
opp tables outside of the device list, similar to thermal-zones.

I tend to like consistency and the sprinkled in OPP tables break with that,
but ultimately it's up to Bjorn.
