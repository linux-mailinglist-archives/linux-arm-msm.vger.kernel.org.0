Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3546225C79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 06:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfEVED5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 00:03:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35071 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfEVED5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 00:03:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id t87so598300pfa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 21:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b2k9DyGZqJa/jdZhHVNji1ocJUEeDsRNZidrVHXyJZw=;
        b=qjAZ09gg0Rrjya6KQlEp15vtXmiAQqlMm621QpuxmBs5IgOqFr0JewOUsNLNdDhaDL
         ACA6PDIU1IEPfn6k/McNb3BOJ+fuNA62UlkBtAwVr7D78DMiPH2nHOJz6LyKdShdFnp6
         RsrqwOUKraVMiJ73QYAjEUk2noNQqxDEjmNMD0seJlr4NGCieMn1xmsMMRoZNS25j4bQ
         BlV25HcLeKw181OlB2L8PL4BQkrfIumlUDFCjuxT0pn/NVmhb7+YFZBxRxYGq2PCFvgT
         xFDI5/6gmr+hKwIV8nlz1jBIKDH9wD8Z0pjND2mudmkPgtS5x/XwTleVdsZU/72OCQKl
         xVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b2k9DyGZqJa/jdZhHVNji1ocJUEeDsRNZidrVHXyJZw=;
        b=ZTND8fVpBEKpXzgP3C2BKXR0TPJTysAxOK4eCZmi6NWgYOkfn3p5EM2ggkiMYYu8v8
         R8SADWqhLQEri2QZ3SIRSvw97XZwSf2NJ8Hd1nTRxNuiIvlFucE7eZS/Sguba8ThCsKb
         PWzQHw9NYpNtHuEeD1TvIZr5iY9S/+jSwOsp4cQdV3xxp+EvdHOU5GiVWILs3PPNQ+OF
         BekfSZlDN+bglRBcTsQI4zAV8VkSeRq5pAgNGyZusrRPyenyoBNuRZUv0098LFXwdObn
         SbwN31BEaij0f9sItB5TrNToOHttxHCZKKbciAa3pmaWkICeEengVlsS5KCBty64U6kh
         okeg==
X-Gm-Message-State: APjAAAVFM5SDjN6tYImqPc+6o0dkOfph7EZV7p0OpJ+0wWEQavEliCV0
        WilhkDhUXv4g+3H9TX8RwuA3BA==
X-Google-Smtp-Source: APXvYqy9GggK8gImhFMFaCFuwhcm0H5a066GPyfk6o4SuUl03GnvkcsWmLSDc0nGga9HJ9TJ7746MA==
X-Received: by 2002:a63:1f55:: with SMTP id q21mr26777395pgm.51.1558497836781;
        Tue, 21 May 2019 21:03:56 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x18sm21770173pfo.8.2019.05.21.21.03.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 21:03:55 -0700 (PDT)
Date:   Tue, 21 May 2019 21:03:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
Message-ID: <20190522040353.GP3137@builder>
References: <20190114184255.258318-1-mka@chromium.org>
 <CAHLCerP+F9AP97+qVCMqwu-OMJXRhwZrXd33Wk-vj5eyyw-KyA@mail.gmail.com>
 <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
 <155786856719.14659.2902538189660269078@swboyd.mtv.corp.google.com>
 <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 May 04:54 PDT 2019, Amit Kucheria wrote:

> (cc'ing Andy's correct email address)
> 
> On Wed, May 15, 2019 at 2:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Amit Kucheria (2019-05-13 04:54:12)
> > > On Mon, May 13, 2019 at 4:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > > >
> > > > On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> > > > > ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> > > > > that describes this topology.
> > > >
> > > > This is partly true. There are two groups of gold and silver cores,
> > > > but AFAICT they are in a single cluster, not two separate ones. SDM845
> > > > is one of the early examples of ARM's Dynamiq architecture.
> > > >
> > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > >
> > > > I noticed that this patch sneaked through for this merge window but
> > > > perhaps we can whip up a quick fix for -rc2?
> > > >
> > >
> > > And please find attached a patch to fix this up. Andy, since this
> > > hasn't landed yet (can we still squash this into the original patch?),
> > > I couldn't add a Fixes tag.
> > >
> >
> > I had the same concern. Thanks for catching this. I suspect this must
> > cause some problem for IPA given that it can't discern between the big
> > and little "power clusters"?
> 
> Both EAS and IPA, I believe. It influences the scheduler's view of the
> the topology.
> 
> > Either way,
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Thanks.
> 
> Andy/Bjorn, can we squeeze this in for -rc2 as a bugfix?
> 

Yes, I've picked this up among a few other fixes.

Regards,
Bjorn
