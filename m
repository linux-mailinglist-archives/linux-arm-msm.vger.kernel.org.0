Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B759397CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 23:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbfFGVbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 17:31:25 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:55550 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730931AbfFGVbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 17:31:25 -0400
Received: by mail-it1-f196.google.com with SMTP id i21so4875155ita.5;
        Fri, 07 Jun 2019 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DdUyzrMgwnb7OSBUknmdzq6QeSxNyekOjNxnEzj1SA=;
        b=QZyjmYNbrUmtT5xBRTmMfROG2NU0uvuqLYMBV801O/lYtk/0J+spnINtWEdTmKBUIq
         OeZqq7nWBjWl7iUjqaczNrOfEr75+dqmh5SSIrTyF3I3TXYrzWuh9R02Nwp3E6zWh9i6
         2Gl9gSZn8sehbjpCSZjMJ7dbZKgcDroUR2tgdBavY67FlujPHol59nba0X331HPhwC7E
         u6Q1YYVQWbrVVmmkHeU2/H4D30DCn5Q8oNTFG/4uk+34pD1mnXQ1GOmoKra6QTXUaLVn
         lUXUuXyar8+LWT8QALyC1L/pKqV9g5Sb2YE0T0xyuHdhkLmvkyYquEiy7kJtGarCDYJD
         36cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DdUyzrMgwnb7OSBUknmdzq6QeSxNyekOjNxnEzj1SA=;
        b=fsgIQe/kENBQbpP9jYfrBf1naek3QdxIGZlI/pNFe9FaYG5PZueTcxAO7r0a3nkLwV
         tEqHIkG8DrnZp+4VyUmDozIgHPWuxsrmMqn66mNjitMYgjjIlLi+umTqiwWs1xdYJFn5
         wTrSEHEX+wlpYKxHXlW4bQmHjWb202DgQzaQuqPqWsNzZYGH7ppqiNcYa1exA8xacTWM
         KwTlQhwrC/HPBnUvu/m3rlippVzhMcW0HgS3Cv0dhb9HWzyL1LRIu8OlckOZ3htv6EK4
         rsB81JZUIrAMojTcUDEiAnwBSo/OW/3e2HC5snvQ6CjdjkoSX6zJWIOyu2YOcGB+2br9
         ojqA==
X-Gm-Message-State: APjAAAUeZLi7YWbOuRE6/cTx6N7WZsrQdzQnlIulMZNNEJZmycGGlR6y
        5TQ3ceDYCtfujWS3WtvcDQ0f1sPULMh29GKHzv4=
X-Google-Smtp-Source: APXvYqwDLsWApqI7m7WAtDtXoPKvcnVVSosNF8TJ7e9pxEqMiqXjds9y/y+9gC3V5HDDaqKAaHY1Uws8QJdwlv63YL8=
X-Received: by 2002:a05:660c:343:: with SMTP id b3mr1747694itl.52.1559943084285;
 Fri, 07 Jun 2019 14:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
 <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org> <20190607203838.1361E208C3@mail.kernel.org>
In-Reply-To: <20190607203838.1361E208C3@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 7 Jun 2019 15:31:13 -0600
Message-ID: <CAOCk7NrnnUzaXtnRvH0pHyHha4sTQDQCRoVPPatHfgVuEPZr0Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 7, 2019 at 2:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-05-21 07:52:28)
> > On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> > > The multimedia clock controller (mmcc) is the main clock controller for
> > > the multimedia subsystem and is required to enable things like display and
> > > camera.
> >
> > Stephen, I think this series is good to go, and I have display/gpu stuff
> > I'm polishing that will depend on this.  Would you kindly pickup patches
> > 1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.
> >
>
> If I apply patch 3 won't it break boot until patch 2 is also in the
> tree? That seems to imply that I'll break bisection, and we have
> kernelci boot testing clk-next so this will probably set off alarms
> somewhere.

Yes, it'll break boot.  Maybe you and Bjorn can make a deal?  (more below)

Doesn't look like kernelci is running tests on 8998 anymore, so maybe
no one will complain?  As far as I am aware, Marc, Lee, Bjorn, and I
are the only ones whom care about 8998 presently, and I think we are
all good with a temporary breakage in order to get this basic
functionality in since the platform isn't really well supported yet.

>
> I thought we had some code that got removed that was going to make the
> transition "seamless" in the sense that it would search the tree for an
> RPM clk controller and then not add the XO fixed factor clk somehow.
> See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
> clocks") for the code that we removed. So ideally we do something like
> this too, but now we search for a property on the calling node to see if
> the XO clk is there?
>

Trying to remember back a bit.

I don't think its possible.  Maybe I'm wrong.  I didn't see a solution
to the below:

How does GCC know the following?
-RPMCC is compiled in the build (I guess this can be assumed)
-RPMCC has probed
-RPMCC is not and will not be providing XO
