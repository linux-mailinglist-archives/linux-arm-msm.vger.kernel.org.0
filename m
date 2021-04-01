Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B9E35232B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 01:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhDAXGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 19:06:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231550AbhDAXGX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 19:06:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BDE761056;
        Thu,  1 Apr 2021 23:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617318383;
        bh=SF34JBdGNGkWQBG6Ez1ynJ9MRJchAM/rGVl6tld7Bro=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dN/lIBk8NM3eSwSIZKvK0qg77G52o1AUhW2h39cL15YCSLvc06fCIbDI+h5uylHZg
         4BmJpmktFgo69nlLNcOieUEfQhG3B7NhHxNO74II5av4B2yMS+ufQPOyE7pd51IcsT
         1qZ3u5SbmSxSbPlGwp51QdALJWc4WAOigUik0zHRQz7Stn7ZK3UImHcWfZT7Ijsp1e
         jFxRhC2jrn5lt2mJdAswheP+VqhAhneTJhECzTwEUJQh93Uu36v4HYR7giz47H1XC/
         IVWLBFtTX/i5xCTcsR0RIFmvbfrSJcuRSRZnaKKj2RPIvoKpBZ2si5GE4Np1nzKdTm
         uY0myKyngL2cw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJprOTzjoN_Yz8M5qsdg-7FEsLaVnhN+xP3iwXxp5p6_2-A@mail.gmail.com>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org> <20210325111144.2852594-7-dmitry.baryshkov@linaro.org> <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org> <CAA8EJpoNThCf-R8+CmjNWC9bGin8x60v-AjZrsm2x=ZE+UDjgw@mail.gmail.com> <161730706709.2260335.8947402948263904863@swboyd.mtv.corp.google.com> <CAA8EJprOTzjoN_Yz8M5qsdg-7FEsLaVnhN+xP3iwXxp5p6_2-A@mail.gmail.com>
Subject: Re: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>, open list:
        COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 01 Apr 2021 16:06:21 -0700
Message-ID: <161731838176.2260335.13624037400352690850@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-01 13:58:28)
> On Thu, 1 Apr 2021 at 22:57, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2021-03-27 01:13:56)
> > > Hi Tanya,
> > >
> > > On Sat, 27 Mar 2021 at 04:49, Taniya Das <tdas@codeaurora.org> wrote:
> > > >
> > > > Hi Dmitry,
> > > >
> > > > Thanks for the patch for cleanup.
> > > > It is okay to remove TEST source, but you can still keep the sleep =
clock
> > > > source as it could be still connected to certain RCGs and could be =
used
> > > > to derive low frequencies if required.
> > > >
> > > > As these sources are generated from the HW plans it would be good i=
f we
> > > > keep them as they are except the TEST source.
> > >
> > > Please note that I've barely removed the unused enum entry, which is
> > > not used in any of clock parent maps. So I'd suggest to either add it
> > > to relevant clock parent maps and to the videocc bindings or to drop
> > > unused enum entry.
> > >
> >
> > Is this going to be resent?
>=20
> Is there a reason to resend the patches?
> I'm not removing any actual clock sources, only unused(!) enum entries
> are removed. No functional changes.
>=20

That's fine if we're just removing enums. I was hoping Taniya would
respond with a reviewed-by tag or at least to this thread so we know
everyone is OK.
