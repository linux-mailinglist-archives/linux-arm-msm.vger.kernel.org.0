Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8D2F52029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 02:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfFYAyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 20:54:35 -0400
Received: from onstation.org ([52.200.56.107]:41140 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728340AbfFYAyf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 20:54:35 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id A00813E887;
        Tue, 25 Jun 2019 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561424074;
        bh=NAsqoWlx9/9+qIbcDabDQ+UDTfGjudulT8Oo+0tXCvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J67zsiZKAXiJjMre2OBNUybwldCs6aHDQu+0Uc5xcrTIpQqFMWbseSzKviZxKCURf
         KMYBHfiLrmpiLewUuLb54QaC7RHQFJji02lCaoufk0f5kK4C000ng3rjY8L8Po7Rqh
         LY0DG6uvzPOcXnhmM3qX/7ItJN2H0sNHPEgmANbE=
Date:   Mon, 24 Jun 2019 20:54:34 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Message-ID: <20190625005434.GA6401@onstation.org>
References: <20190516085018.2207-1-masneyb@onstation.org>
 <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
 <20190529101231.GA14540@basecamp>
 <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
 <20190623105332.GA25506@onstation.org>
 <CACRpkdYTaM+sBs-bhaXVtAwFtp6+_PWWJ_k9jobd7qB41HubDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYTaM+sBs-bhaXVtAwFtp6+_PWWJ_k9jobd7qB41HubDg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 25, 2019 at 12:29:29AM +0200, Linus Walleij wrote:
> On Sun, Jun 23, 2019 at 12:53 PM Brian Masney <masneyb@onstation.org> wrote:
> 
> > 2) Do what Linus suggests above. We can use v1 of this series from last
> >    September (see below for link) that adds this to the pwm subsystem.
> >    The locking would need to be added so that it won't conflict with the
> >    clk subsystem. This can be tied into the input subsystem with the
> >    existing pwm-vibra driver.
> 
> What I imagined was that the clk driver would double as a pwm driver.
> Just register both interfaces.
> 
> There are already plenty of combines clk+reset drivers for example.
> 
> Otherwise I'm all for this approach (but that's just me).

I agree that this makes sense. I especially like that it'll allow us
to use the existing pwm-vibra driver in the input subsystem with this
approach.

Brian
