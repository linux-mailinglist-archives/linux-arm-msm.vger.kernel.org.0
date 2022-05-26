Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6154535266
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 19:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348155AbiEZRH5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 13:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344434AbiEZRH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 13:07:56 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1673F4F9F4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 10:07:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id t26so2600288edt.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmROjGleSmP0Q8SmkvRLiLJ4PJ/PkOeCsvLq+FzuZvw=;
        b=eiXItexUv6JKb5q/26VIC/dSviGcdCxMSyuZ9CBMVkMP9yD3uyHhROwvHJixyYYJQg
         sPa6KkCqD69ksfO8xCJMbMxJpsN4jR8zWfD0QNcK/ZU/wdOo/cFdfC1E7qBJocdu0GBL
         0U3ZAtZre/r6nzRECXRqobecfv/oG/XnXRwZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmROjGleSmP0Q8SmkvRLiLJ4PJ/PkOeCsvLq+FzuZvw=;
        b=qmwVARaiBVAyPvd0T2o3aRTphVi+z4+HvrbwaYPdzKKaTcFj/cOwdsCvotoK+WCaiG
         xO94a2NBx/YNpvok5QFq2nsc5rLZkmveymVboKtP4Wnqv5CP0B7SUZJ+i/Bed1myq+yh
         au5ieIQxxqKgkoFz0kfvC1vcIVCY18fcSnb6rb16cL4SR1R3nsMXKXysD6D+XEEI4dIa
         fTO5IREW+zndo4SA4fDZz3LOANz9m/GsvnbY6iqbSGuzM6rHovJRrQwZA+wJdBOkro/B
         6Ov0ZEBuke/yH5v4rcv+gWmR05ocVxyErESn/U086H8yCsbVytJ8E7yewUHWEJIRQ4h1
         YNrw==
X-Gm-Message-State: AOAM530C5auYvMfEkdd+/RDNw+FgiywosGjUtxGoI97ErzsH7yNDQqFE
        F25A470bqeHWXCDUzWeFwMuL43I7WwBD/MTEsIk=
X-Google-Smtp-Source: ABdhPJwKviLs9QzUIv07zf6EbYHZTCo7AB7917Ov7tq2fmacTETd0ZXIzl44U2PlMinGFEbY8h/CwA==
X-Received: by 2002:aa7:d412:0:b0:42a:b8bf:89f7 with SMTP id z18-20020aa7d412000000b0042ab8bf89f7mr41428077edq.410.1653584873203;
        Thu, 26 May 2022 10:07:53 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170906e94900b006fea3702e56sm683677ejb.79.2022.05.26.10.07.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 10:07:51 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id e2so2935814wrc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 10:07:50 -0700 (PDT)
X-Received: by 2002:a5d:5085:0:b0:20d:5f6:63fa with SMTP id
 a5-20020a5d5085000000b0020d05f663famr31656209wrt.679.1653584869966; Thu, 26
 May 2022 10:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <1652697510-30543-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1652697510-30543-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 May 2022 10:07:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WZQLpYAsdU4yTCGZCGp5+t+rJiadbSeppBaX0b6ZuUxg@mail.gmail.com>
Message-ID: <CAD=FV=WZQLpYAsdU4yTCGZCGp5+t+rJiadbSeppBaX0b6ZuUxg@mail.gmail.com>
Subject: Re: [V2] tty: serial: qcom-geni-serial: Remove uart frequency table.
 Instead, find suitable frequency with call to clk_round_rate.
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com, Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 16, 2022 at 3:38 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Replace the UART frequency table 'root_freq[]' with logic around
> clk_round_rate() so that SoC details like the available clk frequencies
> can change and this driver still works. This reduces tight coupling
> between this UART driver and the SoC clk driver because we no longer
> have to update the 'root_freq[]' array for new SoCs. Instead the driver
> determines the available frequencies at runtime.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v2: loops through clk dividers to zero-in quickly
> v1: intial patch looped through available clk frequencies
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 56 ++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index f496102..4733a23 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -149,12 +149,6 @@ static unsigned int qcom_geni_serial_tx_empty(struct uart_port *port);
>  static void qcom_geni_serial_stop_rx(struct uart_port *uport);
>  static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop);
>
> -static const unsigned long root_freq[] = {7372800, 14745600, 19200000, 29491200,
> -                                       32000000, 48000000, 51200000, 64000000,
> -                                       80000000, 96000000, 100000000,
> -                                       102400000, 112000000, 120000000,
> -                                       128000000};
> -
>  #define to_dev_port(ptr, member) \
>                 container_of(ptr, struct qcom_geni_serial_port, member)
>
> @@ -946,25 +940,43 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>         return 0;
>  }
>
> -static unsigned long get_clk_cfg(unsigned long clk_freq)
> -{
> -       int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(root_freq); i++) {
> -               if (!(root_freq[i] % clk_freq))
> -                       return root_freq[i];
> -       }
> -       return 0;
> -}
> -
> -static unsigned long get_clk_div_rate(unsigned int baud,
> +static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
>                         unsigned int sampling_rate, unsigned int *clk_div)
>  {
>         unsigned long ser_clk;
>         unsigned long desired_clk;
> +       unsigned long freq, prev;
> +       unsigned long div, maxdiv;
> +       int64_t mult;

Why is "mult" signed? Shouldn't it be type "u64" or something?

>
>         desired_clk = baud * sampling_rate;
> -       ser_clk = get_clk_cfg(desired_clk);
> +       if (!desired_clk) {
> +               pr_err("%s: Invalid frequency\n", __func__);

nit: IMO printing the __func__ in every printout is not a good
practice. It uglifies the kernel log buffer. If you personally truly
want the function in every printout then modify pr_err() to print it.


> +               return 0;
> +       }
> +
> +       maxdiv = CLK_DIV_MSK >> CLK_DIV_SHFT;
> +       prev = 0;
> +
> +       for (div = 1; div <= maxdiv; div++) {
> +               mult = div * desired_clk;
> +               if (mult > ULONG_MAX)
> +                       break;

I'm pretty sure your "if" test is always false because you didn't cast
properly. I even tested it for you:

{
    unsigned long a, b;
    unsigned long long c;

    printf("long size: %d, long long size: %d\n",
           (int)(sizeof(a)), (int)(sizeof(c)));

    a = 0xffffffff;
    b = 2;

    c = a * b;
    printf("c is %#llx\n", c);

    c = a * (unsigned long long)b;
    printf("c is %#llx\n", c);
}

That prints out:

long size: 4, long long size: 8
c is 0xfffffffe
c is 0x1fffffffe


> +
> +               freq = clk_round_rate(clk, (unsigned long)mult);
> +               if (!(freq % desired_clk)) {
> +                       ser_clk = freq;
> +                       break;
> +               }
> +
> +               if (!prev)
> +                       ser_clk = freq;

Instead of the above, why not just init ser_clk to "desired_clk"?
...or perhaps leave it initted to 0 so your error check after the loop
isn't dead code?


> +               else if (prev == freq)
> +                       break;

Are you sure about this exit condition? It seems wrong. I guess you're
assuming that clk_round_rate() will round up like it (almost always)
does for the Qualcomm clock driver. So I guess let's say we're trying
to make 10000 baud and your oversampling is 16. So "desired_clk" is
160000, right? Now let's imagine that the clock driver can make three
rates:

7372800, 14745600, 19200000

Your loop will run. The first time through we'll "round" 160000 and
get back 7372800. It's not a match. Prev will now be 7372800.

The second time through, we'll round (160000 * 2) and get back
7372800. It's not a match and prev will be equal to freq so we'll
break.

...but we _should_ have found 19200000

So I think this break condition is wrong.


> +
> +               prev = freq;
> +       }
> +
>         if (!ser_clk) {
>                 pr_err("%s: Can't find matching DFS entry for baud %d\n",
>                                                                 __func__, baud);

In the above, you _always_ init "ser_clk" to something, so how can
this error condition ever occur in your new code?


> @@ -972,6 +984,9 @@ static unsigned long get_clk_div_rate(unsigned int baud,
>         }
>
>         *clk_div = ser_clk / desired_clk;
> +       if (!(*clk_div))
> +               *clk_div = 1;

I _think_ this can be removed if you just don't allow inexact matches.
...if you do allow inexact matches, maybe you should put a warning in
the logs in that case?


> +
>         return ser_clk;
>  }
>
> @@ -1003,7 +1018,8 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>         if (ver >= QUP_SE_VERSION_2_5)
>                 sampling_rate /= 2;
>
> -       clk_rate = get_clk_div_rate(baud, sampling_rate, &clk_div);
> +       clk_rate = get_clk_div_rate(port->se.clk, baud,
> +               sampling_rate, &clk_div);

IMO it would look better to just let the above line be 81 columns
rather than the ugly wrapping.
