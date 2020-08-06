Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA9C23D9DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 13:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHFLSd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 07:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgHFLPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 07:15:35 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F94C0617A4
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 04:06:22 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id b22so16542958oic.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zDiKZFm/DKBG3ZOKFXLxuBs2P7seO7llz6RT0NqT3bo=;
        b=jcOMn0UrBeP5geOnYnlQ8z4juZNEc9OXmo6IBcl6Rnq87ACgANLb3yILTOqmNAqrrA
         jI81kv8iXQ6fWMWXCDh+B+QWkIiKBN94CEsTNJ9EcfUy06qWF3YFszenTvh6BLJgXvbE
         FhZSUlOw7CwnZRe2+S/1YAiZkxEvKmMJRDMHybduKwXYk2EvW5VlaP0IpXR2+OR8UT3w
         OtxpnVRG06smB+Z+LlpYRbZmHp8oWGibEe4LMCbYOOEhl3hP4EUcjb9jJVtOLY3nQxRT
         WhTH0QPiPU7CfiY5W7FDhuT/YiMwFvtqVCbDBdVa0phkZuQ+91Hix75pFFPKtfir9UI6
         vXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zDiKZFm/DKBG3ZOKFXLxuBs2P7seO7llz6RT0NqT3bo=;
        b=dyVnF4J8ASHNQhCf2nNHqkKAsa4imi4lK/RwOTEvSMFjo+X8L8zfsEqXpgpTMBYUMh
         4BFRTPBJP02P4YMxU/ZEAP51rVu4FBOjxDadKnBUEOQMWpkHxnZ7+awg8jIQkW9H3q0M
         5qSugf1cHj8cr1qfcvKKlBWZK+KGhJ3AFBeCDn50DGodyGF5cGHbmNYMy5pyx/vQQ+72
         R2l9uSzBMji0B+40ONl53sY1CZ2/citiKFZc+Ss1Vpsh6BO+IJqB7ICKHXPFHizI8DqW
         1b/mDehFh6gS/FA2b5lBUmlj+KRyfxOtAamL1Z6TfB7x64fSKbFD9LJjvF2/mJcptvvG
         4iiA==
X-Gm-Message-State: AOAM530+JAbSh35GKxR277N9ix4FIwG+e6nEnDBEPy5U5sc3TWoDutSz
        yYb2Yk/9cAJa/VK08fA2Kxj2p3h9p84wbJ2SRjGluQ==
X-Google-Smtp-Source: ABdhPJyVlbMTsMQFzsrlc2hcmjITWeegvU4Gjtb6ZL3RWPK683BES2aE4HFBq4sNHPg8JcbDApxNkBr+pzHHua8sFr8=
X-Received: by 2002:aca:6708:: with SMTP id z8mr6388273oix.96.1596711976097;
 Thu, 06 Aug 2020 04:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-3-robert.marko@sartura.hr> <20200504073914.GQ1375924@vkoul-mobl>
 <CA+HBbNEiB+o4KxonAu4-ra+P11Yb649v6AFaPjFc8JQDQ8T=CA@mail.gmail.com>
 <CA+HBbNFsZ-v_2cMhDNGnQXTFaqsjGzB+1rAS3=_CLQhd0N4OKQ@mail.gmail.com> <20200609161903.GE1084979@vkoul-mobl>
In-Reply-To: <20200609161903.GE1084979@vkoul-mobl>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 6 Aug 2020 13:06:04 +0200
Message-ID: <CA+HBbNEiU8ubZLK2fP-STgTyRXf4F80OfO7aQ0_FHPKgUkqjBQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 9, 2020 at 6:19 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hi Robert,
>
> On 09-06-20, 16:45, Robert Marko wrote:
> > HI,
> > Vinod can you maybe pick this?
>
> Sorry can't do.. this needs to go thru Bjorn..
>
> We are in merge window so it is too late for that.
> Bjorn can pick this for 5.9...
Hi, can this be picked up for 5.9?
Driver and DT bindings are already in 5.8

Thanks
>
> >
> > It would be great to have nodes in 5.8 along the driver
> >
> > Thank
> > Robert
> >
> > On Fri, May 29, 2020 at 11:36 AM Robert Marko <robert.marko@sartura.hr> wrote:
> > >
> > > On Mon, May 4, 2020 at 9:39 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > >
> > > > On 03-05-20, 22:18, Robert Marko wrote:
> > > > > From: John Crispin <john@phrozen.org>
> > > > >
> > > > > Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
> > > >
> > > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > > >
> > > > Bjorn, I have picked the phy and dt binding, feel free to apply this one
> > > >
> > > > Thanks
> > > > --
> > > > ~Vinod
> > >
> > > Any chance of this landing into 5.7?
> > > Driver and bindings have been merged, but I don't see DT nodes queued.
> > >
> > > Regards,
> > > Robert
>
> --
> ~Vinod
