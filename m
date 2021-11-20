Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFB64580D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 23:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbhKTWuJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 17:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhKTWuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 17:50:07 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014BFC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 14:47:04 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso22538286otj.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 14:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hiKEYRmksZVz39X4sXQPBnZgHU/2MAAu5OOxfoqbUTg=;
        b=VHuW5GtaopUDShWaBsOZtzDvC1JQIB1QW9ciZ1v+rQO3W2jRmxEPi+uxdzOcVUnkAS
         C5xCCkN1CgSl40juqA5IZ8aXqvrlhZqpXO8PoxAEIh3v1eI5cjWZAAwg+px0ZIJNQDLP
         kZfTatnwIRHJV8X5Ow3bA9Z+rJiLrwnf6N9V24ZnQNnVIb73QPwLQ6r3zy1rZfiCfIyH
         YpoxjtsSvrihFYXR87oXBa6ST5viY6B19te+l3cnKRa0jwtJMFgM4hZ2fbdBKHP6JLZh
         fJ9Pbnd2Qy71q+p0NTNKQ7dH9rCcRyac/FmfU/ZUZS1sftYgMCvfsBs0AqrH0S4CM/Yg
         imgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hiKEYRmksZVz39X4sXQPBnZgHU/2MAAu5OOxfoqbUTg=;
        b=lEDxaY+r6Y6rKvbPJXbKM55z39uHi7AKe/wIRhs5jV2G8VHaDAo73xJD+69AXdhQYh
         zmGcbKkrHcD704BZyCWI4sCgUFhPQPNrE2CH78jPcPeCpmFfSahmy4jNqEmmB6M/iLda
         4Qwvzt6GTzz2Y3emocXdMKbVASuX0/t6qURtlo050JNdr5IheZ9r12iskpdhJBuEU9UD
         VM6m76IVvAvCb4XGPeaLBstVK2DCXk5mbONgI38cGMkswpTzdtoPA7UxZzm6jMkR/4s7
         f+RO/x+oud2wRQNUodkO5zdPx9K2/ggp2s0DweYnmdjp/AQ1VLuXfGe0yIXLEQAVLhDg
         +Uqg==
X-Gm-Message-State: AOAM531AdNVENnb6tkGMTEeXO8jtkYg+iO+5h346uWUV7O3upPvrEOPk
        1tHzmPzg9O2xbR5cj/Tok+q8VQ==
X-Google-Smtp-Source: ABdhPJycPOmLksGN/4OsJdyX+833dqdPLTdJuaD93hTQtISfX9pBzau2QLx0+eKpqI325zCF2vdpBw==
X-Received: by 2002:a05:6830:1e25:: with SMTP id t5mr14579681otr.291.1637448423184;
        Sat, 20 Nov 2021 14:47:03 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x23sm737263ooo.34.2021.11.20.14.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 14:47:02 -0800 (PST)
Date:   Sat, 20 Nov 2021 14:48:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Pavel Kubelun <be.dissent@gmail.com>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: fix sleep clock
Message-ID: <YZl7Ujxy4zBNsCJw@ripper>
References: <20211031155650.487158-1-chunkeey@gmail.com>
 <YZWsAN+bWkmiHkM6@builder.lan>
 <3c73ee75-f588-f598-3942-de0c1738b722@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c73ee75-f588-f598-3942-de0c1738b722@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 20 Nov 14:11 PST 2021, Christian Lamparter wrote:

> Hi,
> 
> On 18/11/2021 02:27, Bjorn Andersson wrote:
> > On Sun 31 Oct 10:56 CDT 2021, Christian Lamparter wrote:
> > 
> > > From: Pavel Kubelun <be.dissent@gmail.com>
> > > 
> > > It seems like sleep_clk was copied from ipq806x.
> > > Fix ipq40xx sleep_clk to the value QSDK defines.
> > > 
> > > Also rename the sleep clock node like the GCC driver names it.
> > > 
> > > Link: https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/commit/?id=d92ec59973484acc86dd24b67f10f8911b4b4b7d
> > > Link: https://patchwork.kernel.org/comment/22721613/
> > > Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
> > > Signed-off-by: Christian Lamparter <chunkeey@gmail.com> (resend)
> > > ---
> > >   arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > > index 7a181352b306..ed40bef91e45 100644
> > > --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > > +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > > @@ -144,9 +144,9 @@ pmu {
> > >   	};
> > >   	clocks {
> > > -		sleep_clk: sleep_clk {
> > > +		sleep_clk: gcc_sleep_clk_src {
> > 
> > Underscore is not a valid character in node names, so it should named
> > something like sleep-clk.
> 
> 
> Ok, this is a bit awkward. The current DeviceTree Specification 0.3v list
> the "underscore" in "Table 2.1: Valid characters for node names". (Page 7)
> <https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf>
> 
> But...
> > It would be nice if the clock driver was converted to using parent_data
> > and fw_name and a clocks reference in the gcc node to &sleep_clk, but if
> > you need something that works with the current implementation then
> > 
> >    clock-output-names = "gcc_sleep_clk_src"; >
> > is your friend.
> > 
> > 
> > But please do consider converting the gcc-ipq4019.c to acquire "xo" and
> > "sleep_clk" using parent_data instead.
> > 
> 
> 
> Yes, I think this could be done. Next month around the seasonal holidays,
> I do think there will be some free time to run this on the IPQ40xx devices
> that would otherwise be blinking away lonely at the office. (Pavel's patch
> has been here so long that I knew it is "working".)
> 
> So the next series will be:
> - change this patch to just fix the clock-frequency value.

But if gcc-ipq4019 is looking for gcc_sleep_clk_src, what changes based
on this change alone?

> - another new patch that updates gcc-ipq4019.c code
>   replace all the parent_name with "xo" and "gcc_sleep_clk_src"
>   with parent_data + fw_name (in the same way in which
>   gcc-ipq6018.c seems to be doing it).
> 

Given that you're planning to move away from using a significant name I
don't think it's worth fixing up the driver to find "sleep_clk" and then
drop that again.

So if you just want to give the sleep clock its correct value, let's
just fix the rate. If you need that clock, with the new rate, to be
present among the parents of the gcc clocks then add the
clock-output-names = "gcc_sleep_clk_src" (and skip changing the driver
at this point).

If you do the latter, and then move to parent_data that new kernel will
fail to find the clock in a dtb generated between now and that point in
time, so I suggest that you anticipate that said input clock will be
given the identifier "sleep_clk".
So in the gcc node you add clocks = <&sleep_clk>; clock-names =
"sleep_clk".

That way, it will find the right clock using the global name from now
on and when you move the driver to parent_data it will find the new
reference.

Regards,
Bjorn

> Is there anything I missed?
> 
> (I could throw in the sleep_clk -> sleep(-clk) change as well.
> But I'll need find a justification for replacing "_" vs "-" there,
> since I can't really lean on the Device-Tree spec since it
> proclamates that the underscore is a "valid character"?!)
> 
> Thanks,
> Christian
