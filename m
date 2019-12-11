Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0511911A46F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 07:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLKG0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 01:26:05 -0500
Received: from mail-pg1-f172.google.com ([209.85.215.172]:42505 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfLKG0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 01:26:04 -0500
Received: by mail-pg1-f172.google.com with SMTP id s64so3531662pgb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 22:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9ywxSAmFMDcklVHHbtnm3b9SusYrKnOR9PFiBt3VFqw=;
        b=PjYdx8W7h5dMRJWwmaGpnifTVEzIjyjKznHVgfzdCkpG7ad8JRxMPSBdI76nI48vYN
         oI16Sq7/04f+sCdA5MSQAkbxAROdEiPA7MivwAOXSkmXRnU9y55IUJ8gGOgsnkN9026x
         eDBEZwKouMLoc02jWM1vzxmY1Yz+Nl84jcRuZXIWPkmCK6ZzUPWN3ohFIStsNwl3EP/b
         SRDi67PA800VtcZzBuwFP6HlfeH9LD5TQq9u4EfN+cs492ZVWN4L/5X+HTZEPTK20kaS
         EC66+rG3ewWy29gn7e6ZiX9nL67A1dzf2Vi8bMkxBcyJvh7BmduJKtcKKL2apuJM8DoQ
         hjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ywxSAmFMDcklVHHbtnm3b9SusYrKnOR9PFiBt3VFqw=;
        b=Y6C4hW6ERtNaZBtT2ik7ytfAGEojYE7mw244PbRyun+nqpimzpDtohaDvBfLPNKrD3
         IaiiKPhxzEDE3inIamorV3NBsB4WGRPRNK0zf+l8GTE+m9IGgo9jFfzYQbiw1LhGxgSm
         xFHw8zEtl0vSBYwrVqiWj4AU+03Lje6Vc6zwCmHgpogfKgK5+dJ75taeDZ6bqXRN8cun
         5dLb06sTei50RibkiJwQ+kcIEX0e7U78Vw+ZX2/jiOgn5MQuAmc4D++RILDaEfozlYsW
         QBS21g0dL7z6OIqW3n4GiYk+S3nMuV9M1EZkh819kc68vfUU/8wLPlo+JKWehaKXUhRg
         o/CQ==
X-Gm-Message-State: APjAAAW3m3Fc4V3Lmy/wwHQN585iggEMIL+yA2RV+WtnKPSjZj9pWzm4
        B2UaxPOPRHrw/PAWs2VM7o9YSw==
X-Google-Smtp-Source: APXvYqyxrTqXxdxMhhec081Ss6ZKYYEGPxARHygEswvHi3T7DdSKKKe4QvDqVMIAePufyWzS+96zIA==
X-Received: by 2002:a63:3e03:: with SMTP id l3mr2358660pga.118.1576045563559;
        Tue, 10 Dec 2019 22:26:03 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 100sm1084840pjo.17.2019.12.10.22.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 22:26:02 -0800 (PST)
Date:   Tue, 10 Dec 2019 22:26:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Olof Johansson <olof@lixom.net>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
Message-ID: <20191211062600.GK314059@yoga>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org>
 <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
 <20191108031854.GA12993@hector.lan>
 <20191210105737.GB228968@gerhold.net>
 <CAHLCerPs8+Fp1N-x7cQ2ETQ8d+fHN5b08V-jVFyFdQLYDndoBA@mail.gmail.com>
 <20191210181725.GD314059@yoga>
 <CAOesGMiiMG8kND=ZGv93t525B4L3ogA7py+3fdw2F6XaZspw_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMiiMG8kND=ZGv93t525B4L3ogA7py+3fdw2F6XaZspw_w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Dec 13:00 PST 2019, Olof Johansson wrote:

> On Tue, Dec 10, 2019 at 10:17 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 10 Dec 09:36 PST 2019, Amit Kucheria wrote:
> >
> > > On Tue, Dec 10, 2019 at 4:27 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > > >
> > > > On Thu, Nov 07, 2019 at 09:18:54PM -0600, Andy Gross wrote:
> > > > > On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> > > > > > (Removing arm-soc)
> > > > > >
> > > > > > Hi Andy,
> > > > > >
> > > > > > On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> > > > > > >
> > > > > > > Arnd, Olof, and Kevin,
> > > > > > >
> > > > > > > I have one slight faux paux in this pull request.  A drivers: soc change got
> > > > > > > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > > > > > > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > > > > > > sorry for this inclusion.  I'll scrub this better next time.
> > > > > > >
> > > > > > > Andy
> > > > > >
> > > > > > > ----------------------------------------------------------------
> > > > > > > Amit Kucheria (5):
> > > > > > >       arm64: dts: qcs404: thermal: Add interrupt support
> > > > > > >       arm64: dts: msm8998: thermal: Add interrupt support
> > > > > > >       arm64: dts: msm8996: thermal: Add interrupt support
> > > > > > >       arm64: dts: sdm845: thermal: Add interrupt support
> > > > > > >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> > > > > >
> > > > > > One of my patches to add interrupt support to msm8916 tsens is missing
> > > > > > here. Specifically this one:
> > > > > > https://patchwork.kernel.org/patch/11201853/
> > > > > >
> > > > > > Will there be a second PR this cycle?
> > > > >
> > > > > I can work up another and throw it on top.
> > > > >
> > > >
> > > > FYI, the patch seems to be still missing in 5.5-rc1.
> > > > tsens now fails to probe on MSM8916 with:
> > > >
> > > >   qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found
> > > >
> > > > Can you queue up the patch as fix for 5.5?
> > >
> > > Indeed. Andy/Bjorn, let me know if you need anything from me to get
> > > this into -rc2.
> > >
> >
> > I'm pulling in some fixes for a rc-pull, so I could add it there.
> >
> > But why are we breaking backwards compatibility with existing dtbs to
> > add a new (optional) feature? Shouldn't there be a rc-fix in the driver
> > for this regression?
> 
> 100% agreed.
> 
> Driver shouldn't require the DT update to continue to function. It
> needs to fill in the previous behavior as default.
> 
> As a matter of fact, based on that I don't want to see that DT patch
> as a fix, please queue it up for 5.6 instead.
> 

I've picked the patch for 5.6

Thanks,
Bjorn
