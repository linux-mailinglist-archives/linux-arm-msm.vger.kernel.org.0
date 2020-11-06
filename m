Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD5A2A960E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 13:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgKFMQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 07:16:43 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40494 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgKFMQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 07:16:43 -0500
Received: by mail-ot1-f66.google.com with SMTP id 79so1027071otc.7;
        Fri, 06 Nov 2020 04:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+xDAzLUg1c4ATFWXTeoRwJCCaKgy8LRS6wAzG60O47w=;
        b=ZxT85t7P/JQRL4PmUhadUdBofRxWfA7uLrA2PoxAHpGWsv7avbzBUV155cqrOStLDR
         KBGrII4v8l8cN3K/XMGZtdvq3GbgiYgkGzjDmA09yHVgzPNwfEosoeojzYawQE8VUsvn
         v9hIhnzUc6j7LXdXl3+tns38ZpOi9UUmjkV1J2g38VStCxRixhjRkGYSAmprfAFGymVT
         eJLMFj7Y0Jhgi4Xc2c7DYe3BxVnAzISiK8JKoqTQkO58WTvpL+ipSN2uu7WuzhmB9hdG
         jfPE3agpycp3LxOXWkcOxMysBlXjHfKr9JAW1V3am26yNgZ8NDPAThF44IAEDNy6xTby
         El1w==
X-Gm-Message-State: AOAM533MLDaHt6XIdsPMW0rM5aExal6VtqAWLTJ1YtFdZTZ32uNHhF8P
        POHm32trDJ9Z5aPhtAxUvL+DpoVIh4GpfqT/cgI=
X-Google-Smtp-Source: ABdhPJwsCD7JJXjqS83wKh2AZm22ZIVZUyx+6LkKKzYyucmo+SZ5UmKV2U6I9aLbPMfL4719sAv0kSWGYWR5vCEm8/o=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr914074otc.145.1604665002287;
 Fri, 06 Nov 2020 04:16:42 -0800 (PST)
MIME-Version: 1.0
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org>
 <1602873815-1677-5-git-send-email-tdas@codeaurora.org> <160454346831.3965362.1176963402805166784@swboyd.mtv.corp.google.com>
In-Reply-To: <160454346831.3965362.1176963402805166784@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Nov 2020 13:16:31 +0100
Message-ID: <CAMuHMdXL9ZdLQGtgZM3nqcQoBrUnjGaS5Hg3cB7zrW8WFGyOjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] clk: qcom: camcc: Add camera clock controller
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 5, 2020 at 5:52 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Taniya Das (2020-10-16 11:43:35)
> > Add support for the camera clock controller found on SC7180 based devices.
> > This would allow camera drivers to probe and control their clocks.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
>
> Applied to clk-next with some minor fixups.

On Fri, Nov 6, 2020 at 8:43 AM <noreply@ellerman.id.au> wrote:
> FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Fri Nov 06, 18:35
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/14393224/
>
> Commit:   Add linux-next specific files for 20201106
>           c34f157421f6905e6b4a79a312e9175dce2bc607
> Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30
>
> Possible errors
> ---------------
>
> drivers/clk/qcom/camcc-sc7180.c:1672:8: error: implicit declaration of function 'pm_clk_runtime_resume'; did you mean 'pm_runtime_resume'? [-Werror=implicit-function-declaration]
> drivers/clk/qcom/camcc-sc7180.c:1681:3: error: implicit declaration of function 'pm_clk_runtime_suspend'; did you mean 'pm_runtime_suspend'? [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:283: drivers/clk/qcom/camcc-sc7180.o] Error 1
> make[3]: *** [scripts/Makefile.build:500: drivers/clk/qcom] Error 2

The pm_clk_runtime_*() functions are only available if CONFIG_PM=y.
No dummies are provided for the CONFIG_PM=n case yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
