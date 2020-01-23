Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1081614684B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 13:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAWMov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 07:44:51 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50131 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgAWMov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 07:44:51 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MZTyo-1j9XgV2pyo-00WZMJ; Thu, 23 Jan 2020 13:44:49 +0100
Received: by mail-qk1-f182.google.com with SMTP id c16so3228162qko.6;
        Thu, 23 Jan 2020 04:44:49 -0800 (PST)
X-Gm-Message-State: APjAAAWSsaYAsKt+GzTkmZhCFhtn/77VIYL+qn/YIEiLTNeVFOhPjKpX
        CAWB4mW1LmjVv5cSu/VkhHn+hc8I0ffOJH8Di0c=
X-Google-Smtp-Source: APXvYqy+NPjU7L2Ush8SrU0PNW4EjDwGSpHPHcwq1X5SrasivaFHMX8DrhVGiPzkXicpyHiCBQUB2c/r5ISm9gultj4=
X-Received: by 2002:a05:620a:cef:: with SMTP id c15mr15915962qkj.352.1579783488505;
 Thu, 23 Jan 2020 04:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-6-manivannan.sadhasivam@linaro.org> <CAK8P3a2pZEdsAi6YQ5z3YD=zD1iZLu+WPirhwmxeZ33k7sjkeg@mail.gmail.com>
 <20200123120050.GB8937@mani>
In-Reply-To: <20200123120050.GB8937@mani>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jan 2020 13:44:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1ACFdUdEywEQRAJ=HRYOp+0Y051ffNgAgqvSgjOEGyMA@mail.gmail.com>
Message-ID: <CAK8P3a1ACFdUdEywEQRAJ=HRYOp+0Y051ffNgAgqvSgjOEGyMA@mail.gmail.com>
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rQjjAaxqBLcTJuGIXiBzYUo71KJX2y4OhWCrnKx/6zbuUipRE4Z
 BgVgRGladtFrnVXZDZpWaZDDL6SfubMNNYi7UghHc0kRWK/AwCuffjUdlcP8u+LgmO02mgT
 SWDUXKYmoMLGx9W9B7k/9qWOpmm3/MM2M9AgWxdM5gJ9mYHbTPNYcs4f3ZxS/HXGY6hM+n0
 slOTbxg9bbZXs5cXcE5VA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hPSUIdGuHW4=:ZkvAzSqYdikgAL2XeamqfB
 xdSeTKveI9OiObfo2W/MQ89ZMZZDbMSV2xvKkgHEA8cku/qK60hFUMqTM5/0O8QfqXcxYqMOk
 BU1/BS+N0lmz+Zz6fuZLrxYN1BwYygYVs61l/yTIOl/GxKjUj0Hw62PlhGN2ZvHBnj8BUfT1J
 wo87NgOg60H2CgzESXrFqHHfCkWSFO7W6okOMYlCMLHBN56tGPzCzHRQ2CP8qOTmyUlVTAXEz
 mzHwlYt7pnJ1hC+d79me4trDdIwIz4OWtuWE/b70vwL4Fv6LrgyXHzlPOxW8t6MM71VYllzl9
 j4xqPCWAdJ3JtFwg204prFW/Yb0qJI9gDiWyd1Xov+fTXcipEdVQXcBPg4HkBgUmc3TL81G59
 OSd4J/iY22US0M8JmF1Rm7z6KAZ03XFofF9Wlb1BHcqf4doSupjw6SqFE95Y+Qv8st3nw++96
 pEJI1IkO6kXA2BxRe9KdhZCaTOZkgk1JIJviJUYdsA65iUmbNRz8GVnVSIidh++cg9o43+6Vy
 LklD2Ru0kc6sCA9fjF2PgvfM0KfiWhVyPuSVwxby1RWz+AYFHX5mEw7wcg/G/PfakdC8sMkRa
 5sdMEzm/qPwyIRS5DSGVFlRFeSovOjvu6eIbFG/zItGUBBV9CVesyUwRrkB2Db+NAr4BZhBwc
 TYj3aU+m6tVgl63U5fUWvEFZU+ddJr2+pTOK5PPDKcS8a8CeW65l8s6EXyOhNrQwJU7hAhSXa
 B+b4fnJMA4izuIQSdS793poSe4PeqF1Ed9+VLv7I0tTGcjOQ09Xoa0uSQ2zJ4VwDQb+2zTbZ0
 1rwfTkKqBzieGpeVSGLvvT/GLztKLeh4SCWJ9sZNd2R17HDE08=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 1:01 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> On Thu, Jan 23, 2020 at 12:39:06PM +0100, Arnd Bergmann wrote:
> > On Thu, Jan 23, 2020 at 12:19 PM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> >
> > > +int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
> > > +                             void __iomem *base, u32 offset, u32 *out)
> > > +{
> > > +       u32 tmp = readl_relaxed(base + offset);
> > ....
> > > +void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
> > > +                  u32 offset, u32 val)
> > > +{
> > > +       writel_relaxed(val, base + offset);
> >
> > Please avoid using _relaxed accessors by default, and use the regular
> > ones instead. There are a number of things that can go wrong with
> > the relaxed version, so ideally each caller should have a comment
> > explaining why this instance is safe without the barriers and why it
> > matters to not have it.
> >
> > If there are performance critical callers of mhi_read_reg/mhi_write_reg,
> > you could add mhi_read_reg_relaxed/mhi_write_reg_relaxed for those
> > and apply the same rules there.
> >
> > Usually most mmio accesses are only needed for reconfiguration or
> > other slow paths.
> >
>
> Fair point. I'll defer to readl/writel APIs and I also need to add
> le32_to_cpu/cpu_to_le32 to them.

What do you need the byteswap for? All of the above already
assume that the registers are little-endian.

       Arnd
