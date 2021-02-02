Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDED30CDFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 22:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhBBVgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 16:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhBBVgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 16:36:52 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3811BC0613ED;
        Tue,  2 Feb 2021 13:36:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 190so3774095wmz.0;
        Tue, 02 Feb 2021 13:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u7YwChCFCmx7GzSkTHX1KsXA0x16yyNQloyNQVAkEuk=;
        b=m51K8ii4QQ+qoG6JIDj9R/YWGGg0l/iOAczNPitgSnBtMvc0VJbLR0XFGgIto1KLBo
         QsqOvAc6HapUTknKd4kv9dTtjyncuSvxWv0MkyLWDhaH5FHcWQSvYDaZOp9pczNXI5Sg
         OJlnwWF1tXHF5L94250z+zOltpUHoMd8IJStl9JYyV7V69lSH+yh6aMIAdG5X2joWPRl
         eK+AzBvwDoYzJwD/wZR/gA/8Vf45yyrrirTptkvxYY0o+G/yyvw5EHqtOAbiIgYNsoJe
         M0IWdqY27ZxbkWiyioDRN0LAw5QQMa/8fPicD0K13Llnjw/gHkPMJkPnb9RwO8wuPtj7
         7USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u7YwChCFCmx7GzSkTHX1KsXA0x16yyNQloyNQVAkEuk=;
        b=JeXkVMcVGoWWMz/XbZ8MJCQSgX9QvPNfcbccS8EH/Qoz2Yg4Qmp/tapnAxcEgCgtYu
         5D+b1pDDpPO4Gyz++ACuNnGK7LQuNvSQjysfr/9VESB6YdxogY0TM7AAZD2rebeEjnMV
         9CUydYYQq3o+344J9Fr+yRr3eWvhMsPCTpsxYNRvCY1L6KhE7qoXU2+19fMo1AzpE4Ly
         ZosbBBOTl99bYfHHup3jKrMGUJUpSU2GkKFyqGa9uyltTFNlR5LqExrVnMz618mZZHhj
         hzTFBa3Ep+0cGyFc6Qopg8c+aH/sD1jretSzRL09DSDNOahH8VdYcSz9Pl9ju93gmKl8
         qUdA==
X-Gm-Message-State: AOAM533/1RcE1Lfqbo5ayFgbW2OZ24BAMqzUesqkoP+8Tns/9X1h3u1m
        9bk9nfOVE8mXTfDxjeE0oYOH7sysdFP5M9o6H0g=
X-Google-Smtp-Source: ABdhPJwu9RoFvMLEGWbawWPiJHdzW2KJ/fX+VI3SCRJ52NzHm0MZ6fYdakbPQzNUTStq9FMVe3H/QGgS9RDYaksVwEI=
X-Received: by 2002:a7b:c45a:: with SMTP id l26mr9356wmi.164.1612301770881;
 Tue, 02 Feb 2021 13:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
 <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
 <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com>
 <8f8c7c37-f7b2-f763-19e1-d89e5c454ab4@somainline.org> <CAF6AEGsQp4xHpH2brUdHmAX1ic2k88EFJRVVWDRxWXUqF9njfw@mail.gmail.com>
 <CAF6AEGueo71HVBcLW2Mtu5GQ=9HgwL43WczUGLuTk2JWLoH=ew@mail.gmail.com>
 <CAF6AEGspvnwRrXurmRvvRhr8dsFRc6fNnLsSo52Te0rHXtj4jA@mail.gmail.com>
 <CAF6AEGsDL-qRyXWftTgzHGn=UTvz=rcyEUcJv+oGtVXCkYibug@mail.gmail.com>
 <e338e4bd-0e8c-9199-caa1-93945ed2b94b@somainline.org> <CAF6AEGsm4nzU4rJsKFSShb4s6GCi93=+kzcETngQkoC3KD1sqw@mail.gmail.com>
 <3e3e5555-ddeb-c706-0566-7427e71ad761@somainline.org> <CAF6AEGtg2_CNTMMY4adSxiA8Z0=VSYFy7HaK3w_a2rhokmY2Zg@mail.gmail.com>
In-Reply-To: <CAF6AEGtg2_CNTMMY4adSxiA8Z0=VSYFy7HaK3w_a2rhokmY2Zg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 2 Feb 2021 13:35:59 -0800
Message-ID: <CAF6AEGurHVQUhNBzkb8iVxHKrFf1sThyUC0mCDHBoEDnVOTk=w@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation
 and prescaler
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 2, 2021 at 11:08 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Feb 2, 2021 at 10:46 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> >
> > Il 02/02/21 19:45, Rob Clark ha scritto:
> > > On Tue, Feb 2, 2021 at 6:32 AM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@somainline.org> wrote:
> > >>
> > >> Il 01/02/21 18:31, Rob Clark ha scritto:
> > >>> fwiw, this is the clk_summary diff with and without this patch:
> > >>>
> > >>> ------------------
> > >>> 270,282c270,282
> > >>> <     dsi0_pll_out_div_clk              1        1        0
> > >>> 887039941          0     0  50000         Y
> > >>> <        dsi0_pll_post_out_div_clk       0        0        0
> > >>> 221759985          0     0  50000         Y
> > >>> <        dsi0_pll_bit_clk               2        2        0
> > >>> 887039941          0     0  50000         Y
> > >>> <           dsi0_pclk_mux               1        1        0
> > >>> 887039941          0     0  50000         Y
> > >>> <              dsi0_phy_pll_out_dsiclk       1        1        0
> > >>> 147839991          0     0  50000         Y
> > >>> <                 disp_cc_mdss_pclk0_clk_src       1        1        0
> > >>>     147839991          0     0  50000         Y
> > >>> <                    disp_cc_mdss_pclk0_clk       1        1        0
> > >>>    147839991          0     0  50000         Y
> > >>> <           dsi0_pll_by_2_bit_clk       0        0        0
> > >>> 443519970          0     0  50000         Y
> > >>> <           dsi0_phy_pll_out_byteclk       1        1        0
> > >>> 110879992          0     0  50000         Y
> > >>> <              disp_cc_mdss_byte0_clk_src       2        2        0
> > >>> 110879992          0     0  50000         Y
> > >>> <                 disp_cc_mdss_byte0_div_clk_src       1        1
> > >>>     0    55439996          0     0  50000         Y
> > >>> <                    disp_cc_mdss_byte0_intf_clk       1        1
> > >>>     0    55439996          0     0  50000         Y
> > >>> <                 disp_cc_mdss_byte0_clk       1        1        0
> > >>> 110879992          0     0  50000         Y
> > >>> ---
> > >>>>       dsi0_pll_out_div_clk              1        1        0   887039978          0     0  50000         Y
> > >>>>          dsi0_pll_post_out_div_clk       0        0        0   221759994          0     0  50000         Y
> > >>>>          dsi0_pll_bit_clk               2        2        0   887039978          0     0  50000         Y
> > >>>>             dsi0_pclk_mux               1        1        0   887039978          0     0  50000         Y
> > >>>>                dsi0_phy_pll_out_dsiclk       1        1        0   147839997          0     0  50000         Y
> > >>>>                   disp_cc_mdss_pclk0_clk_src       1        1        0   147839997          0     0  50000         Y
> > >>>>                      disp_cc_mdss_pclk0_clk       1        1        0   147839997          0     0  50000         Y
> > >>>>             dsi0_pll_by_2_bit_clk       0        0        0   443519989          0     0  50000         Y
> > >>>>             dsi0_phy_pll_out_byteclk       1        1        0   110879997          0     0  50000         Y
> > >>>>                disp_cc_mdss_byte0_clk_src       2        2        0   110879997          0     0  50000         Y
> > >>>>                   disp_cc_mdss_byte0_div_clk_src       1        1        0    55439999          0     0  50000         Y
> > >>>>                      disp_cc_mdss_byte0_intf_clk       1        1        0    55439999          0     0  50000         Y
> > >>>>                   disp_cc_mdss_byte0_clk       1        1        0   110879997          0     0  50000         Y
> > >>> ------------------
> > >>>
> > >>>
> > >>
> > >> This is almost exactly what I saw on my devices as well, you get a
> > >> difference of "just some Hz" (which can be totally ignored), because
> > >> of how the calculation is done now.
> > >>
> > >> Thing is, what you see as PIXEL and BYTE clocks *before* the change is
> > >> Linux thinking that your DSI is at that frequency, while the PLL will
> > >> output *half* the rate, which is exactly what the patch fixes.
> > >>
> > >> "Fun" story is: the Xperia XZ1 (8998) and XZ (8996) have got the same
> > >> display... by lowering the DSI rate on the MSM8996 phone by half, I
> > >> get the same *identical* issues as the 8998 one without this patch.
> > >> The clocks all match between one and another, because.. it's.. the same
> > >> display, after all.
> > >>
> > >> It is because of the aforementioned test that I have raised doubts about
> > >> the TI chip driver (or anything else really).. but then, anything is
> > >> possible.
> > >
> > > It does look like, *so far* the TI bridge chip is only used on qc
> > > platforms (according to grep'ing dts), so I suppose I can't rule out
> > > bugs which cancel each other out.  Although there are various other
> > > bridges used (for ex, the sdm845 rb3 board has some dsi->hdmi bridge)
> > >
> >
> > Argh...
> >
> > > I guess it would be useful if we could measure the clk somehow to
> > > confirm that it is running at the rate we think it is..
> > >
> >
> > I totally agree with you on this, I actually wanted to do it the proper
> > way, but then these clocks are really too high for my cheap oscilloscope
> > and I couldn't... :(
>
> Ok, there might actually be a way to do this.. there is a testclock
> utility (added sboyd who wrote it in CC):
>
> https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/refs/heads/main/chipset-qc845/dev-util/testclock/files/testclock.py
>
> there is a similar thing for sc7180.. for other devices, I guess it
> would require some porting..
>
> Looking at disp_cc_mdss_byte0_clk and disp_cc_mdss_pclk0_clk on
> sc7180, the rates returned by testclock roughly match what is in
> clk_summary, ie. within rounding error
>

So Doug Anderson pointed out that we can actually read the DSI clock
from the bridge, if we put it in "automatic" mode, from him:

1. Boot up.
2. i2cget -f -y 2 0x2d 0x12 # reads calculated rate that we programmed
3. i2cset -f -y 2 0x2d 0x12 0 # switch to automatic mode
4. i2cget -f -y 2 0x2d 0x12 # reads measured rate; repeat this a bunch
and it should go up/down by 1 since measurement isn't perfect.

What I see without this patch:

localhost ~ # i2cget -f -y 2 0x2d 0x12
0x58
localhost ~ # i2cset -f -y 2 0x2d 0x12 0
localhost ~ # i2cget -f -y 2 0x2d 0x12
0x58
localhost ~ # i2cget -f -y 2 0x2d 0x12
0x59
localhost ~ # i2cget -f -y 2 0x2d 0x12
0x58
localhost ~ # i2cget -f -y 2 0x2d 0x12
0x58
localhost ~ # i2cget -f -y 2 0x2d 0x12
0x58
localhost ~ #

And with this patch:

localhost ~ # i2cget -f -y 2 0x2d 0x12
0x58
localhost ~ # i2cset -f -y 2 0x2d 0x12 0
localhost ~ # i2cget -f -y 2 0x2d 0x12
0xb1
localhost ~ # i2cget -f -y 2 0x2d 0x12
0xb2
localhost ~ # i2cget -f -y 2 0x2d 0x12
0xb2
localhost ~ #

So this patch is doubling the rate

BR,
-R
