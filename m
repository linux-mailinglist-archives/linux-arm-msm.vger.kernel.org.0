Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFFE338EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 21:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFCTNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 15:13:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38844 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfFCTNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 15:13:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id d17so2975194oth.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2019 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=mAoddn+++8qwVdvo0LP4Flz+Y0mAR71WsumbGA5/ntU=;
        b=wUFV0A+XrqyYbdkgHK2CxppQeWvJUI4OC2TQpYTXBHH0DILNt6bkaBhKCwhB5AMwIG
         0LOIAe+9QJKpYEjKS94senTDbXCrId9d/+f/ZBIfAfPM+uzNRYXp73FwgI8keJiQH6Wx
         cNe1QAI+DNUL/c6FAldEpXYakT33XUg0x5qP0g1jDJfet10XDHsrdMDInEk52n+QnmBA
         EzuhaWMFTEIxQS84WmV0CUdoSAaZUMhAm5V8jXOjbmWjyKqFHkZizOEpvqx/kZBlpS24
         DRbZGfmxdVyKJaGeuHg6Bj5VC642CNXwqO3WOByUzpW7WkyWju0chAM6nifBRzHX6/Mc
         2x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=mAoddn+++8qwVdvo0LP4Flz+Y0mAR71WsumbGA5/ntU=;
        b=RLZoyjinhnsqXMo9rR6iUjncCeSaaG/hd5K5y5oXL+IsQGw6ipXk6q/WtjLXbCHmGW
         wUtqgLRW3YbqVWq0CghNUm1l9J5w+4+XOXU+SjYXP8uONHrkFL8ECE222NlNUcRAx3WH
         iFEJlm6lUDhkoxbVP8TjAgko1JFG8rkxQ+wstCVHR0dLZh43GO3Eh0nI7puJmnlN8Qi7
         OQHZoOxc2f9+EC3DE14Jurp2TSwkh3+rAJnvRMnHgKWh++Zx6ZYfrIof1/3BswhVSiGg
         e7WXCpWzjmcxAxG/rzvyLx0LLkC75/+3lhxK29dAoW3yeD1gQfsWS94ltPWDAQ3B01da
         PC0w==
X-Gm-Message-State: APjAAAWxvNI7R1DUuO5HPCEtkaBjh2tM/J3/oaozqICpu3sGivGv5SDZ
        CoJh7WsYgF8HocR+FNv6nPzlYvKoKRKVuLKOl7mkFg==
X-Google-Smtp-Source: APXvYqy+Lm1ofR4ZAQBNDXyeTt8ZtlyM1FjuSyKegJQbbObal6TMdDAAlb7/1ROuwQ5EjTzGHLN2r16ho6jaEfz21D8=
X-Received: by 2002:a05:6830:160c:: with SMTP id g12mr2427193otr.231.1559589186170;
 Mon, 03 Jun 2019 12:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190423132823.7915-1-georgi.djakov@linaro.org>
 <20190601021228.210574-1-saravanak@google.com> <20190603155634.GA10741@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190603155634.GA10741@jcrouse1-lnx.qualcomm.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 3 Jun 2019 12:12:30 -0700
Message-ID: <CAGETcx8yV_D+=qLnJOx5s5Nvq2RxhcJvz+gejDBN1-qrBE=Msg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Introduce OPP bandwidth bindings
To:     Saravana Kannan <saravanak@google.com>, georgi.djakov@linaro.org,
        amit.kucheria@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        daidavid1@codeaurora.org, devicetree@vger.kernel.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>, nm@ti.com,
        rjw@rjwysocki.net, Rob Herring <robh+dt@kernel.org>,
        sboyd@kernel.org, seansw@qti.qualcomm.com, sibis@codeaurora.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        vireshk@kernel.org, Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 3, 2019 at 8:56 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, May 31, 2019 at 07:12:28PM -0700, Saravana Kannan wrote:
> > I'll have to Nack this series because it's making a couple of wrong assumptions
> > about bandwidth voting.
> >
> > Firstly, it's mixing up OPP to bandwidth mapping (Eg: CPU freq to CPU<->DDR
> > bandwidth mapping) with the bandwidth levels that are actually supported by an
> > interconnect path (Eg: CPU<->DDR bandwidth levels). For example, CPU0 might
> > decide to vote for a max of 10 GB/s because it's a little CPU and never needs
> > anything higher than 10 GB/s even at CPU0's max frequency. But that has no
> > bearing on bandwidth level available between CPU<->DDR.
>
> I'm going to just quote this part of the email to avoid forcing people to
> scroll too much.
>
> I agree that there is an enormous universe of new and innovative things that can
> be done for bandwidth voting. I would love to have smart governors and expansive
> connections between different components that are all aware of each other. I
> don't think that anybody is discounting that these things are possible.
>
> But as it stands today, as a leaf driver developer my primary concern is that I
> need to vote something for the GPU->DDR path. Right now I'm voting the maximum
> because that is the bare minimum we need to get working GPU.
>
> Then the next incremental baby step is to allow us to select a minimum
> vote based on a GPU frequency level to allow for some sort of very coarse power
> savings. It isn't perfect, but better than cranking everything to 11.

I completely agree. I'm not saying you shouldn't do bandwidth voting
based on device frequency. In some cases, it's actually the right
thing to do too.

> This is
> why we need the OPP bandwidth bindings to allow us to make the association and
> tune down the vote.

Again, I'm perfectly fine with this too.

> I fully agree that this isn't the optimal solution but
> it is the only knob we have right now.
> And after that we should go nuts. I'll gladly put the OPP bindings in the
> rear-view mirror and turn over all bandwidth to a governor or two or three.

This is the problem part in the series. Once a property is exposed in
DT, we can't just take it back. A new kernel needs to continue
supporting old compiled DT binaries. So if we know we'll have to
change a DT property in the future to be "more correct", then we
should just do that one instead of "for now" bindings.

And I even proposed what the new bindings should look like and why we
should do it that way.

I'll try to get some patches out for that in the near future. But
doesn't have to be just from me. I'm just pointing out why the current
bindings aren't good/scalable.

> I'll be happy to have nothing to do with it again. But until then we need
> a solution for the leaf drivers that lets us provide some modicum of power
> control.

Agreed.

-Saravana
