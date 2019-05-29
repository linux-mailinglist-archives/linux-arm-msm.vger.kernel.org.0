Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830492D312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 03:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbfE2BGc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 21:06:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33123 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfE2BGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 21:06:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id z28so452922pfk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 18:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=50V9t41UXg85VFErBSYKMIzUvnbt87kmuJK3a+Xg/Wg=;
        b=TCqFea28JX1N/A+mJWgy8qt91/jv2aKbK2/msQWWoOqLQfhty9g8wUQ5N46u1dFXF6
         cz0lmHsbG8mi4f4kh00DYZthBomaxT5612fjeDHbz2bxmxjMvqkJMHwCnrJCh3ZN7s0k
         X4VP+Dwc0IZW4Vv7cIOnSRmn+hXbfSzzBF3PI7nBBv6DE0RxWZJDhmhh9FKWlH7FJc00
         oQKWQuZ+L9ZY4Zm3FZOQV4pJ2WD4li/RZjrMY2F0oPt45RNYF0RT+iCsXf/B7xCFgMbT
         ZPMguDFOCXt7yJENvrwzDkuAH2hkBIjs6kFsoSTm+hqXnsyojgWrG7oz6BqGH1MUW25P
         sRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=50V9t41UXg85VFErBSYKMIzUvnbt87kmuJK3a+Xg/Wg=;
        b=g1ivuxB431US0XSqhWKWucygW0g22iDyaONhKK/IVBc/loF2FfKvi/OAsX8HgenPkk
         i+QqExl+/KanKNta6i3Vbrbk0LcfMnXMVAFuNIdoBndxHVnphuo9txCOQph/HmLWNwIR
         JFzFnz7atl6Nt7LNJkVaQ3h5e6l5MF7C13HlujQQYiQN8Vvg2agCeuA4XUYKYOhmF6SB
         cWMwmwoyQLD+RoBh+3HXE2mDS6NVPREvLXc5c8k0zEaAoUrOiJeiRcjysTwXI0QRBr4b
         iEfCCPhpfDD1hqrHOEEoSfm/p71LWoRGr0a6g9sVfRMiz7hMKLPIMtBcVG6mXUSNp9rN
         A2Gw==
X-Gm-Message-State: APjAAAV9CJx24yulltivSA28d8vLR34Lx91ViCH2Lg1e2PtmHE52FLam
        fqmbkFnxjct4/wWZakVzVz0=
X-Google-Smtp-Source: APXvYqyE0D6qF1usWqtrPpTiqU9xwIL4Qn41YONstYKrxB8qp9AW128EcFx8eKQsdnIxSLc2lU/CUQ==
X-Received: by 2002:a63:1b56:: with SMTP id b22mr41515239pgm.87.1559091991609;
        Tue, 28 May 2019 18:06:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:644:8201:32e0:7256:81ff:febd:926d])
        by smtp.gmail.com with ESMTPSA id h7sm9499491pfo.108.2019.05.28.18.06.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 18:06:30 -0700 (PDT)
Date:   Tue, 28 May 2019 18:06:28 -0700
From:   Eduardo Valentin <edubezval@gmail.com>
To:     Andy Gross <andygro@gmail.com>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>,
        Kevin Hilman <khilman@baylibre.com>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20
 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
Message-ID: <20190529010627.GA8566@localhost.localdomain>
References: <5ce71d79.1c69fb81.dd0de.33cf@mx.google.com>
 <7hv9y01z85.fsf@baylibre.com>
 <20190524012913.D9BB72168B@mail.kernel.org>
 <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
 <CAJ=6tTqdvgsoVH+3=_6ucAyuhgSjjVSROBKwtxjYwO1vmFvxfg@mail.gmail.com>
 <CAJ=6tTr4EaLLiavN+aRpU3JnJ5MuAtU-uer_8iLm7QMh6i4rAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ=6tTr4EaLLiavN+aRpU3JnJ5MuAtU-uer_8iLm7QMh6i4rAg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Tue, May 28, 2019 at 04:37:15PM -0500, Andy Gross wrote:
> +Eduardo
> 
> On Tue, May 28, 2019 at 1:09 PM Andy Gross <andygro@gmail.com> wrote:
> 
> > On Sun, May 26, 2019 at 4:51 PM Amit Kucheria <amit.kucheria@linaro.org>
> > wrote:
> >
> > <snip>
> >
> > > Sorry for breaking the boot on 8064. That was one of the platforms
> > > that I didn't convert over to regmap (needs more refactoring). I had
> > > hoped kernelci would catch any issues but looks like thermal-soc tree
> > > entered linux-next quite late and didn't catch this.
> > >
> > > Does reverting 3e6a8fb33084 ("drivers: thermal: tsens: Add new
> > > operation to check if a sensor is enabled") fix the issue? If so,
> > > reverting that commit might be the best course of action since I've
> > > started vacations and can't fix this for 8064 in a meaningful amount
> > > of time (until 3rd week of June). cc'ing Bjorn in case this needs more
> > > investigation, but I think that patch is fairly self contained and
> > > reverting it shouldn't have any knock-on effects.
> >
> > I am ok with this.  I'll check with Bjorn before adding this to a
> > fixes for -rc2.
> >
> 
> Eduardo, we have a situation with the Qcom tsens driver and
> commit  3e6a8fb33084.  Do you mind if I send in a revert for this through
> my tree or can you do this for us for -rc2?

I can revert this patch. I can confirm that it is selfcontained and
reverting seams to work. I am sending the revert to -rc3, as rc2 is
already out.

> 
> Thanks,
> Andy
