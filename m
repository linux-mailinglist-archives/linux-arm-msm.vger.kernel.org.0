Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E451FC0BF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 21:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbfI0TKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 15:10:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:32977 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfI0TKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 15:10:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id o9so2409777otl.0;
        Fri, 27 Sep 2019 12:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SShdvwm8YmQTkXaAnJKKf+Jvu9BeG7WtDH8DT7H1nHQ=;
        b=j7i5U6c5nwbzR3j9ExxdoN0UmD0qTgYsdlMMuQWN4WQVGeBJ05InS6x/7klJMjrRjs
         RX681dikhPz8NnSajOxxNRuHFdVehIxVc8ZWHSrQEZK8DnfhmN3NgD6nED6UVglvVCnH
         Znd+KI/WB8jxgLts9MRYTsSSQjf9TQKck6UkyYSPzXwtAHv/kcbn9Xz91Zh6Bm2cSrTo
         vch/nMUfeKBl5+3gPWkhqg/h01vFFlLkOz4WW59oGId4gTgKDlPQSFLwntkuZP3WC0GR
         awjURk+su/WKcpoyC0RfLUS1aahtj3jOoMl07UNBGtbq6Rz3xP+KPHNQtrkkyPrH+FrB
         er9g==
X-Gm-Message-State: APjAAAXRmdMY3IU5e9sCig369Sdn8HOTPyq2OW9xNhux38uMAuF6aJcJ
        DZbYB15iTDkLgMLFjzapXuPmKKd9K7N5r8vXugg=
X-Google-Smtp-Source: APXvYqy5j/Y8YJ693vdOu2We7Tm361Z+yjcnT+dnwM+5DnDEJBNT2O/FoVFFQp+ndNDD75+fJh/sg1Mc3jQYsmUlvMM=
X-Received: by 2002:a9d:193:: with SMTP id e19mr4326637ote.107.1569611424113;
 Fri, 27 Sep 2019 12:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190920145543.1732316-1-arnd@arndb.de> <20190920164545.68FFB20717@mail.kernel.org>
 <CAK8P3a2j6QG19i3YtRPh7qD4Zr5TiHmK_5=s9mSD2pHVmE99HA@mail.gmail.com>
 <20190920210622.51382205F4@mail.kernel.org> <CAMuHMdWqCQD+3dzn8orUjDcXn123VujNgPQz20hLOF3=F2BP5w@mail.gmail.com>
 <20190927182604.79F3E217D7@mail.kernel.org>
In-Reply-To: <20190927182604.79F3E217D7@mail.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 21:10:13 +0200
Message-ID: <CAMuHMdUW0UcPDJcw8A4imPfVc5ywbMGuORungaeSk9j0omAjfQ@mail.gmail.com>
Subject: Re: [PATCH] mbox: qcom: avoid unused-variable warning
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Fri, Sep 27, 2019 at 8:26 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2019-09-26 06:07:13)
> > On Fri, Sep 20, 2019 at 11:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Arnd Bergmann (2019-09-20 12:27:50)
> > > > On Fri, Sep 20, 2019 at 6:45 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > > > @@ -54,11 +60,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
> > > > > >         void __iomem *base;
> > > > > >         unsigned long i;
> > > > > >         int ret;
> > > > > > -       const struct of_device_id apcs_clk_match_table[] = {
> > > > >
> > > > > Does marking it static here work too? It would be nice to limit the
> > > > > scope of this variable to this function instead of making it a global.
> > > > > Also, it might be slightly smaller code size if that works.
> > > >
> > > > No, I just tried and the warning returned.
> >
> > It's there for the convenience for the user, so he doesn't have to add it
> > himself explicitly.
> >
> > > ("of/device: Nullify match table in of_match_device() for CONFIG_OF=n"),
> > > but it's been 5 years! Surely we can revert this change now that commit
> > > 219a7bc577e6 ("spi: rspi: Use of_device_get_match_data() helper") is
> > > merged.
> >
> > Right, the particular error case in the RSPI driver can no longer happen.
> >
> > Calling of_device_get_match_data() is the better solution anyway, as
> > that uses the match table stored in dev->driver->of_match_table, so
> > there's no need to pass the table explicitly, and conditionally.
> >
> > Hence...
> >
> > > --- a/drivers/leds/leds-pca9532.c
> > > +++ b/drivers/leds/leds-pca9532.c
> > > @@ -472,7 +472,7 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
> > >         int i = 0;
> > >         const char *state;
> > >
> > > -       match = of_match_device(of_pca9532_leds_match, dev);
> > > +       match = of_match_device(of_match_ptr(of_pca9532_leds_match), dev);
> > >         if (!match)
> > >                 return ERR_PTR(-ENODEV);
> >
> > Please convert to of_device_get_match_data() instead of adding
> > of_match_ptr() invocations...
>
> How is this workable? I left it as of_match_device() because the value
> returned may be 0 for the enum and that looks the same as NULL.

This function is used for the DT case only, so there will always be a match.
Hence you can do devid = (int)(uintptr_t)of_device_get_match_data(dev).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
