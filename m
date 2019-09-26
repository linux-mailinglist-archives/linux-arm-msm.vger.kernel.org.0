Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0368BF3BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 15:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfIZNH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 09:07:26 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44836 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfIZNHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 09:07:25 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so1889169otj.11;
        Thu, 26 Sep 2019 06:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86m3tEw17ZZT6CjXyqouKt75t9HK9/dLvE6avVr8dZs=;
        b=IvMHiMVBN63FdbueUV0JAG6kT4kin+SVuPTFlUn5a596ZWmXdMAlfNDdXQ1j49ySrf
         aoQYwlQi+Z8D6pAfd+/sl6ubgmogsskTGqaE9rVSePiYXAFPIB3GAilS7+RIGuEVpvdl
         CxqPGP12liizDVBd2vYUZIoTnvpNohXSAnlOlbJJYlqO9N1zKTfiekgMZo1dEH2IdtAo
         oFPuAmzqg3ipv1AQR6+Bx+qFnaWU+e04iNv1nGwyY6+3QoyjwYlu/9sM/jUdyqkCGspk
         qKqXOB9FZavJhIZVlKSlpQqK/iAgaq5kzzp4FQFn8ezPkByIvdXXQ/RwMCOK2BjsKYDk
         X08w==
X-Gm-Message-State: APjAAAWEtr6oNMxpg/lGXqXOalbrk2pLBgkwvBoAenNJTaDfOxxpi3MK
        GzkYtBNXRPcfUflO1MCptdgEKB2tnyw0eLpTKRk=
X-Google-Smtp-Source: APXvYqyF+2ywzccFvxySPta2+p7JqxfW8g7zy3c181s3oawgGhiKDX3kMuzJ0IclsWTNlSfKVlQf33YA/yysIT0xMpg=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2408625ote.107.1569503244659;
 Thu, 26 Sep 2019 06:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190920145543.1732316-1-arnd@arndb.de> <20190920164545.68FFB20717@mail.kernel.org>
 <CAK8P3a2j6QG19i3YtRPh7qD4Zr5TiHmK_5=s9mSD2pHVmE99HA@mail.gmail.com> <20190920210622.51382205F4@mail.kernel.org>
In-Reply-To: <20190920210622.51382205F4@mail.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 15:07:13 +0200
Message-ID: <CAMuHMdWqCQD+3dzn8orUjDcXn123VujNgPQz20hLOF3=F2BP5w@mail.gmail.com>
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

On Fri, Sep 20, 2019 at 11:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Arnd Bergmann (2019-09-20 12:27:50)
> > On Fri, Sep 20, 2019 at 6:45 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > @@ -54,11 +60,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
> > > >         void __iomem *base;
> > > >         unsigned long i;
> > > >         int ret;
> > > > -       const struct of_device_id apcs_clk_match_table[] = {
> > >
> > > Does marking it static here work too? It would be nice to limit the
> > > scope of this variable to this function instead of making it a global.
> > > Also, it might be slightly smaller code size if that works.
> >
> > No, I just tried and the warning returned.

It's there for the convenience for the user, so he doesn't have to add it
himself explicitly.

> ("of/device: Nullify match table in of_match_device() for CONFIG_OF=n"),
> but it's been 5 years! Surely we can revert this change now that commit
> 219a7bc577e6 ("spi: rspi: Use of_device_get_match_data() helper") is
> merged.

Right, the particular error case in the RSPI driver can no longer happen.

Calling of_device_get_match_data() is the better solution anyway, as
that uses the match table stored in dev->driver->of_match_table, so
there's no need to pass the table explicitly, and conditionally.

Hence...

> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -472,7 +472,7 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>         int i = 0;
>         const char *state;
>
> -       match = of_match_device(of_pca9532_leds_match, dev);
> +       match = of_match_device(of_match_ptr(of_pca9532_leds_match), dev);
>         if (!match)
>                 return ERR_PTR(-ENODEV);

Please convert to of_device_get_match_data() instead of adding
of_match_ptr() invocations...

> @@ -525,7 +525,7 @@ static int pca9532_probe(struct i2c_client *client,
>                         dev_err(&client->dev, "no platform data\n");
>                         return -EINVAL;
>                 }
> -               of_id = of_match_device(of_pca9532_leds_match,
> +               of_id = of_match_device(of_match_ptr(of_pca9532_leds_match),

Likewise.

> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -503,7 +503,7 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
>         if (!i2s)
>                 return -ENOMEM;
>
> -       match = of_match_device(jz4740_of_matches, &pdev->dev);
> +       match = of_match_device(of_match_ptr(jz4740_of_matches), &pdev->dev);

Given of_device_get_match_data() returns NULL, not an error code, even
this one could use of_device_get_match_data().

>         if (match)
>                 i2s->version = (enum jz47xx_i2s_version)match->data;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
