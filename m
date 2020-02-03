Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9B31510BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 21:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgBCUEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 15:04:47 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43533 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgBCUEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 15:04:47 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so8100773pfh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 12:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QjkulTeybGn9hNr5RiBCHxoPg8v6iMLSI5yxep0HG28=;
        b=P3ZrHiZJfNNMAoSNpfqY0kRzBLBThgv6uhIlB0hQnndEa8t4ACeotN76+b92LOyAR1
         /AHTa0vrCdE936p8ODrCDeKIbImfC5Y3nIfpqYVyhF+ME6XxIWACUy+MVd2nb50JnKmC
         btOtt92Dso9wsr0VBbaSqkpCsYFhVmmKv8HY8yfGOKeSyFk3sjsuPnDDAsDdmIKl9hcv
         TDBgcvO09BtD+D3AsjhB/K7X3lo40cs7TLmyTKtscF4WfwQzE2pG++6iNIWdA9cJmxOi
         fFejvfq/sedP1cHmT19AgmFUudrvBpGoQwk9ziMIEKhRAK+K5Zg7cWypjXTXEdwkvD29
         6jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QjkulTeybGn9hNr5RiBCHxoPg8v6iMLSI5yxep0HG28=;
        b=WlGbsMzkw4TAyCfj81yTgdtO786IuxhYIds66OOrvtJE4mIwfx8pn5sIGlmR9nkgNQ
         XWvc26qVJaJe5I1rCgw/vq1XSEgg7MSpFE4rQSLwenma+1wAGLaZoAGp3XjJVsTTWP4e
         wjgn5Cs2hlgLBieUhby2hW6CTtsQLE0hFhLuzjNPV0Wpu/59HpJw0wzYgyVZ0xhYm4lx
         KmdK9M4JECMgp6+BaLd4pjmGUkS7gcWgo3Kwlbu0iSlJ5udgPfNfW2DKbvIZ9feYfDGU
         UgecgjWE41bheSTyFgO8bbt9S8BLQyjPmg2ZrpnrxlufNY45iPrqsgXEtkeqLxw7SIUa
         9RBg==
X-Gm-Message-State: APjAAAVcNK3Xm1sYgTAdSp6hcKPgSgZJbj4I+4XrvXlOvs71kSBgLfnu
        RNmRF5PMehHvAuJOr7LIAtkNFw==
X-Google-Smtp-Source: APXvYqxSX3IT/Y4QU0IY3LL1ZOt6lUaeo4Pou0WcpI4oIESu5GLix0UbJ3MWDPLyKtppw2IV0Fskdw==
X-Received: by 2002:a62:1a16:: with SMTP id a22mr26237902pfa.34.1580760286486;
        Mon, 03 Feb 2020 12:04:46 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s14sm5229407pgv.74.2020.02.03.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 12:04:45 -0800 (PST)
Date:   Mon, 3 Feb 2020 12:04:43 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 00/15] clk: qcom: Fix parenting for
 dispcc/gpucc/videocc
Message-ID: <20200203200443.GN3948@builder>
References: <20200203183149.73842-1-dianders@chromium.org>
 <20200203193027.62BD22080D@mail.kernel.org>
 <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 03 Feb 11:41 PST 2020, Doug Anderson wrote:

> Hi,
> 
> On Mon, Feb 3, 2020 at 11:30 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Douglas Anderson (2020-02-03 10:31:33)
> > >
> > >  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 --------------
> > >  ...om,dispcc.yaml => qcom,msm8998-gpucc.yaml} | 33 +++----
> > >  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
> > >  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 ++++++++++++++
> > >  .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 ++++++++++++
> > >  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
> > >  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 ++++++++++++++
> > >  ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++---
> > >  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 47 +++++++++
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 28 +++++-
> >
> > I don't want to take patches touching dts/qcom/. These aren't necessary
> > to merge right now, correct? Or at least, they can go via arm-soc tree?
> 
> Right.  They can go later.
> 
> Specifically for sdm845 until the sdm845 patches lands the old dts
> trees will yell about the missing clocks, but it's not like they will
> compile fail.  Also the bindings themselves will validate fine.
> There's no other way forward, though, and the old bindings caused
> similar yells.
> 

Can you please help me parse this, will old DT cause complaints or will
it fail to boot?

> For sc7180 there's no usage of any of these clocks and this adds the
> first usage, so definitely no problem there.
> 
> Once you've landed then Bjorn or Andy can pick up the dts.
> 

Do I need to apply these after Stephen picks the driver patches? Or are
they simply nop until the driver patches lands?

Regards,
Bjorn
