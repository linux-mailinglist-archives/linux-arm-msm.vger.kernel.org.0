Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063C2B23E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730611AbfIMQNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 12:13:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40750 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730609AbfIMQNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 12:13:49 -0400
Received: by mail-pf1-f193.google.com with SMTP id x127so18365600pfb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jAupNqyyc/z6Ou3QEiGyvPGV4p/HHkcLNmIbS16XZ48=;
        b=YOhRrP610r2OT+dYPZmA28h12Ce+GFpEohCI1QCqwdmpKzJQnt14AcqKXjlg4P4rjP
         3KoF5+/69OtqEJ/12tgfPL2HWciCx8V8C90OHXde4c1KiAB8pkUW13cIJo7mQvTvDiEf
         H+rNlC5X4uJWfBnvBpoHZd3FEXNkaR9T0LsE04PTXjBUW16JaHPRDfgL2Gqjo/qgBD6f
         x3cq+WA7VwvzNOc5LmW0pX0JCzwyQdL6YqMQMc7TPqx9oiSrFk18Au+ue2LTxPEtIlSO
         Z3FQWoIsZhk6lKtzOhHPO4jcU+ul3MWPSuirq/0koG2oiIAXn8t7U+b4rvJQ87G1phK+
         7EqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jAupNqyyc/z6Ou3QEiGyvPGV4p/HHkcLNmIbS16XZ48=;
        b=CBBtvhFQu9rSsv5u0SNo0mYRBaC2PV5e4Up45DT4gtG14Szm/q7ezoAbVno+tQimQM
         f4urrlT+Jc98Xo0fb4xvPWnvzILh/mvz89IZWklrJBFHwRLM56MMJH3EyEinqSVm6yjJ
         3G3UISaopeMOU9H4nzigmhqFGbhV97PbNULhuQLRdD5r/ztCfUR7cyVwSxOZGbqzkH9F
         y7XK7GMtut5M3ZymDU4yWpA4V5I+wt+/QlpS0SWJeP9XonQScY+MlWG6pS43FfF1onD7
         nOUxyqbBjW2LfsJPNJpBx4NYWxDHPWTqAkDrv3YGoqcF4ZwAEWIBuEIzG6w4eX8mhCP9
         Cacg==
X-Gm-Message-State: APjAAAXvCYp7JU5GEqcrB8gPqjb3xg1qMCKLLbmXyrk6eMuRBDgpyGhy
        wjaEZgYIKgDKvugQ+CNYGQmlVA==
X-Google-Smtp-Source: APXvYqy8WJqbEp5Mme/EdrroxU+nLTxdO6eyhgl5X1B50zCun7w0ARHrR5xAzJjBGnxYzpft+Gourw==
X-Received: by 2002:a17:90a:6586:: with SMTP id k6mr6151408pjj.20.1568391229012;
        Fri, 13 Sep 2019 09:13:49 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g8sm23036322pgk.1.2019.09.13.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 09:13:48 -0700 (PDT)
Date:   Fri, 13 Sep 2019 09:13:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>, Arnd Bergmann <arnd@arndb.de>
Cc:     Rob Clark <robdclark@gmail.com>, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, alokc@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190913161345.GB8466@tuxbook-pro>
References: <20190905192412.23116-1-lee.jones@linaro.org>
 <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
 <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913142821.GD1022@kunai>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 13 Sep 07:28 PDT 2019, Wolfram Sang wrote:

> On Sat, Sep 07, 2019 at 10:56:34AM -0700, Rob Clark wrote:
> > On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > >
> > >
> > > > Does this mean you plan to have this merged for v5.4?
> > >
> > > Only if the machine DTS is expected to land in 5.4. But Stephen said it
> > > is not in liunx-next yet?
> > >
> > 
> > It appears to be in arm-soc for-next:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=for-next
> 
> Still not in linux-next. Please ping me or resend this patch once it
> hits linux-next.
> 

It seems linux-next is now pulling from the soc.git, rather than
arm-soc.git, but Arnd is still pushing patches to arm-soc.git.

Arnd says that the patch will be in v5.4 and I merged Arnd's tree and
gave it a spin here and this patch makes it boot. So please merge this
patch for v5.4 as well.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn
