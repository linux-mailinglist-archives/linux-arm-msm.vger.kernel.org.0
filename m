Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375685709B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 20:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiGKSFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 14:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiGKSFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 14:05:54 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD00B2AE32
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 11:05:53 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id v185so5627317ioe.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qXH4/XNrGfLryDKlGS3Hh9Q6Vmsw2qYnWUP0Xdamw44=;
        b=I/Fz61mG5+PpHY+mDMoS+Gd4qk/euuWYbBil9MGJ4/gmjGpdyxFcRyGhYqPJ9w3T7/
         SnC05amKHyC72En3/FpopOL8gOXsP4emHcDZD1B5x5VXAuGGfkZ60H1AFnjwqgScG/QZ
         GOHQdBPmft40GyizrGAe007AJLdSiJVFMr2Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXH4/XNrGfLryDKlGS3Hh9Q6Vmsw2qYnWUP0Xdamw44=;
        b=C4Mp5Ho+qUag3b6SbC22/QX1LYoWLZgSEHeuuQMGqoLgmkTMkf8eJCaRv7ZAjiiakX
         reGJyaZNi+O9KDLFNLieae0ulMNqGrlV6RqRabwpLMSx9CeeCbKfDAHEIPJ/vluoeUDL
         A8PGaSe7B6RUZmvw4I2NvhNQIVRlhE3KWUyzeJl1EY9upoF8gP2IPMPIRKKjQB8VI863
         2dY4CwpSyhcING2rs6/YwOWzohaXj3AnxxYA3n50MxT7S1JwTfW4J42R6UUjdE3ylDI6
         6t7Jy+71j6geTnh/TrR3P4S+J1xh12lNIEkeftp2UNVSYNI7GPO7I/VghiVeTZ3GsN1W
         AAwg==
X-Gm-Message-State: AJIora+nbFSTWvTf/Kl20AY209lhqwdtwojt85ZZU/3whc/6io2Sm/Dg
        K/+kPO53KVOh1PVd/Qb6zmZUCa8sBCCO8llC4tw=
X-Google-Smtp-Source: AGRyM1tpp/sjOagVwYwJ6w4RZTioZi5/Nb+RS/Ssp7r5Mm70jyawvuNbeCBS1vWUhuW3+kBMOzsDKQ==
X-Received: by 2002:a05:6638:25c4:b0:33e:a176:c227 with SMTP id u4-20020a05663825c400b0033ea176c227mr10319982jat.61.1657562753086;
        Mon, 11 Jul 2022 11:05:53 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id g18-20020a05663810f200b0033f43a220a6sm2858278jae.11.2022.07.11.11.05.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 11:05:52 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id z81so5714914iof.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 11:05:51 -0700 (PDT)
X-Received: by 2002:a05:6638:2203:b0:33e:b93f:5882 with SMTP id
 l3-20020a056638220300b0033eb93f5882mr10901801jas.66.1657562751130; Mon, 11
 Jul 2022 11:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <1657560808-9795-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1657560808-9795-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 11:05:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U20bzea7qzuMCgrAApFqBZ_sc9QsRdUZ_xX4ptRas-0w@mail.gmail.com>
Message-ID: <CAD=FV=U20bzea7qzuMCgrAApFqBZ_sc9QsRdUZ_xX4ptRas-0w@mail.gmail.com>
Subject: Re: [V4] tty: serial: qcom-geni-serial: Fix get_clk_div_rate() which
 otherwise could return a sub-optimal clock rate.
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Mukesh Savaliya (QUIC)" <quic_msavaliy@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 10:33 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> In the logic around call to clk_round_rate(), for some corner conditions,
> get_clk_div_rate() could return an sub-optimal clock rate. Also, if an
> exact clock rate was not found lowest clock was being returned.
>
> Search for suitable clock rate in 2 steps
> a) exact match or within 2% tolerance
> b) within 5% tolerance
> This also takes care of corner conditions.
>
> Fixes: c2194bc999d4 ("tty: serial: qcom-geni-serial: Remove uart frequency table. Instead, find suitable frequency with call to clk_round_rate")
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v4: replaced pr_dbg calls with dev_dbg
> v3: simplified algorithm further, fixed robot compile warnings
> v2: removed minor optimisations to make more readable
> v1: intial patch contained slightly complicated logic
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 89 +++++++++++++++++++++--------------
>  1 file changed, 54 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 2e23b65..f88b042 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -943,52 +943,71 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>         return 0;
>  }
>
> -static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
> -                       unsigned int sampling_rate, unsigned int *clk_div)
> +static unsigned long find_clk_rate_in_tol(struct clk *clk, unsigned int desired_clk,
> +                       unsigned int *clk_div, unsigned int percent_tol)
>  {
> -       unsigned long ser_clk;
> -       unsigned long desired_clk;
> -       unsigned long freq, prev;
> +       unsigned long freq;
>         unsigned long div, maxdiv;
> -       int64_t mult;
> -
> -       desired_clk = baud * sampling_rate;
> -       if (!desired_clk) {
> -               pr_err("%s: Invalid frequency\n", __func__);
> -               return 0;
> -       }
> +       u64 mult;
> +       unsigned long offset, abs_tol, achieved;
>
> +       abs_tol = div_u64((u64)desired_clk * percent_tol, 100);
>         maxdiv = CLK_DIV_MSK >> CLK_DIV_SHFT;
> -       prev = 0;
> -
> -       for (div = 1; div <= maxdiv; div++) {
> -               mult = div * desired_clk;
> -               if (mult > ULONG_MAX)
> +       div = 1;
> +       while (div <= maxdiv) {
> +               mult = (u64)div * desired_clk;
> +               if (mult != (unsigned long)mult)
>                         break;
>
> -               freq = clk_round_rate(clk, (unsigned long)mult);
> -               if (!(freq % desired_clk)) {
> -                       ser_clk = freq;
> -                       break;
> -               }
> +               offset = div * abs_tol;
> +               freq = clk_round_rate(clk, mult - offset);
>
> -               if (!prev)
> -                       ser_clk = freq;
> -               else if (prev == freq)
> +               /* Can only get lower if we're done */
> +               if (freq < mult - offset)
>                         break;
>
> -               prev = freq;
> +               /*
> +                * Re-calculate div in case rounding skipped rates but we
> +                * ended up at a good one, then check for a match.
> +                */
> +               div = DIV_ROUND_CLOSEST(freq, desired_clk);
> +               achieved = DIV_ROUND_CLOSEST(freq, div);
> +               if (achieved <= desired_clk + abs_tol &&
> +                   achieved >= desired_clk - abs_tol) {
> +                       *clk_div = div;
> +                       return freq;
> +               }
> +
> +               div = DIV_ROUND_UP(freq, desired_clk);
>         }
>
> -       if (!ser_clk) {
> -               pr_err("%s: Can't find matching DFS entry for baud %d\n",
> -                                                               __func__, baud);
> -               return ser_clk;
> +       return 0;
> +}
> +
> +static unsigned long get_clk_div_rate(struct clk *clk, struct device *dev,
> +               unsigned int baud, unsigned int sampling_rate, unsigned int *clk_div)
> +{
> +       unsigned long ser_clk;
> +       unsigned long desired_clk;
> +
> +       desired_clk = baud * sampling_rate;
> +       if (!desired_clk) {
> +               dev_dbg(dev, "Invalid frequency\n");
> +               return 0;
>         }
>
> -       *clk_div = ser_clk / desired_clk;
> -       if (!(*clk_div))
> -               *clk_div = 1;
> +       /*
> +        * try to find a clock rate within 2% tolerance, then within
> +        */
> +       ser_clk = find_clk_rate_in_tol(clk, desired_clk, clk_div, 2);
> +       if (!ser_clk)
> +               ser_clk = find_clk_rate_in_tol(clk, desired_clk, clk_div, 5);
> +
> +       if (!ser_clk)
> +               dev_err(dev, "Couldn't find suitable clock rate for %d\n", desired_clk);
> +       else
> +               dev_dbg(dev, "desired_clk-%d, ser_clk-%d, clk_div-%d\n",
> +                               desired_clk, ser_clk, *clk_div);

Pretty sure the robot is going to yell at you again here. Here is my
analysis in detail:

desired_clk
* type: unsigned long
* proper format code: %lu
* marginally acceptable code: %ld
* format code you used in v3: %lu
* did robot yell at you about this in v3: no
* format code you used in v4: %d
* will robot yell at you in v4: YES

ser_clk:
* type: unsigned long
* proper format code: %lu
* marginally acceptable code: %ld
* format code you used in v3: %lu
* did robot yell at you about this in v3: no
* format code you used in v4: %d
* will robot yell at you in v4: YES

*clk_div:
* type: unsigned int
* proper format code: %u
* marginally acceptable code: %d
* format code you used in v3: %lu
* did robot yell at you about this in v3: YES
* format code you used in v4: %d
* will robot yell at you in v4: no
* should you change it to %u: yes


-Doug
