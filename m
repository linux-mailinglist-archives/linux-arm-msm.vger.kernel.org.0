Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2C91445E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 21:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgAUU0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 15:26:49 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34295 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgAUU0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 15:26:49 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so4223513otf.1;
        Tue, 21 Jan 2020 12:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huthel+GYazN/w+4NQrVBhFyJ8fOofBu6y0OM4VOExE=;
        b=PHdZxySBOGJu7nX6RrERvEBIImUuFC/XREChIwjJBVH6I3HeBwsIte6IjFrJ9ELLa1
         Qg5xgcZjhbOF1bAOKsO7Zr707BmrE/UC6dye60kLEGB2AjjhtUwItD4ab1EF5u7dZkQH
         C6KwCyaugo88wM1E0+V3xUQr6LocpLkh0DaAC6jRm0S/BzVb9J5CLpb68ZHuIK2h5Ho7
         Ejg5fWMGFDypMLYYaXUQyGcwFz4eofDNZuHoNtAOPbGwXHSCwUqrrvVjblJaUPRxfLjj
         N9fF7KNdh3zm3B0Qw4FGBokbMD/EgMI8kYr8A/0xw/kZsivJ0byKuSwul60o0coObFUI
         aaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huthel+GYazN/w+4NQrVBhFyJ8fOofBu6y0OM4VOExE=;
        b=eJsJ9s8cbigBVRgBtnfMi1GyV0JBQvmGGXVDLV7ld95uz16cKBVImvZq8Js84lHntX
         fUjhULa9EIsVD16NGoWvBfdmGa8WPYrpB8o4k5ZgVi0SpTa+64LEIwRLxmsCpQ8/pITZ
         CJIcZqoSiBjFhb3D2OKduZVU0aZ9KX5y334OHTgmeguOOYGnTg/ZJK4YdR/8E1xEvHPv
         70Ql1LTWJzaPNLRhdsdxfeniZtfRlWmGT+Yo2Y0pHtetFnGUBzx4vFx409vBXKHoM4/Q
         UXccYYZkwigff9BJ9FK5BtPk7KSpJhiQzJRLyGmCeo1txZa1zOPwZvePZ8/DM/Jtg7+C
         dgZw==
X-Gm-Message-State: APjAAAVIGlNTmPsaI7iWhE7PQU+oJSzxC+/No6c48ytzm6zd4a7vGrjD
        XIKqfoOIsWhoRjQYPQsL9qXUEjLXrs1J+nHZvi+hgjTH
X-Google-Smtp-Source: APXvYqxVkIScTalyju4KUbjWgD8VE3P18faAzgbh803zzoaKztEzIC61Wcs20g50NLKutuaplTw4pq6DW7NdAMgnvFU=
X-Received: by 2002:a9d:6b03:: with SMTP id g3mr4900385otp.200.1579638408335;
 Tue, 21 Jan 2020 12:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20200113084005.849071-1-vkoul@kernel.org> <CANcMJZC1w+J=cdp0OiR5XDn9fFSPht70Jaf9F5S5BryFxVXVoQ@mail.gmail.com>
 <CAAd0S9Aaw8G+=EivfC-g4Lt3Xf_kpjFh6WwQk2E8pFxJUmteKQ@mail.gmail.com> <20200121064608.GA2841@vkoul-mobl>
In-Reply-To: <20200121064608.GA2841@vkoul-mobl>
From:   Christian Lamparter <chunkeey@gmail.com>
Date:   Tue, 21 Jan 2020 21:26:34 +0100
Message-ID: <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Tue, Jan 21, 2020 at 7:46 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> hey Christian,
>
> On 13-01-20, 21:33, Christian Lamparter wrote:
> > On Mon, Jan 13, 2020 at 9:10 PM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > >
> > > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > > These require firmware to be loaded and in case devices have ROM those can
> > > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > > >
> > > > This includes two patches from Christian which supported these controllers
> > > > w/o ROM and later my patches for ROM support and multiple firmware versions,
> > > > debugfs hook for rom erase and export of xhci-pci functions.
> > > >
> > >
> > > Thanks so much for updating these! They are working ok for me in my
> > > testing on db845c.
> > >
> > > Tested-by: John Stultz <john.stultz@linaro.org>
> >
> > Nice! I'll definitely give this series another try on my WNDR4700 too
> > (PowerPC Arch)
> > this weekend.
> >
> > and from me: Thanks!
>
> Did you get around to test these?

Not yet, I was too optimistic that I could get current linux-usb with the
patches running on the WNDR4700 (due to APM82181) over the
weekend. Do you think that It still counts, if I'm going with 5.4.11 on
OpenWrt instead? Because then I just swap out the old patches from
my OpenWrt APM821XX branch:
<https://git.openwrt.org/?p=openwrt/staging/chunkeey.git;a=commit;h=4dd6f62a36a3724f0363d639cd9e29e04d7b62c0>

and don't have to figure out what broke with linux-usb on the APM821xx.

Cheers,
Christian
