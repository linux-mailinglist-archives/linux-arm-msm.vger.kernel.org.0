Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752255396FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 21:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347276AbiEaT2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 15:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347274AbiEaT2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 15:28:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA32996A4
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 12:28:32 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id m20so28512562ejj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 12:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DT1x8TLoaq/2aEcPF9yc25Y7gGZNqIa6OPt/9Mp+d6o=;
        b=BiTqHH1d77R6l5gMjMmYdehih1O7opPVsJ7Bxq1gsyya6CNRYUxnRfdBuxqKfhTYsl
         klBq6jkA3GcAFjfn6zFUPB498xdOb+BcTXdqB16WnfohHNUgW+VWqEcwI38+iWz0NMmI
         ZHnUUOR6xk/3/RA0uAmjbBjTzDu9DxmI5j4SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DT1x8TLoaq/2aEcPF9yc25Y7gGZNqIa6OPt/9Mp+d6o=;
        b=uvtSIcBRCbwFBXpq81j6SflUEMX2SwJsHkl7F8ZLM9ItkHVmQDhyB2cG14wrxE4W20
         fzqeWUxluAb0BwSiWi+XINveOgCY4A1VKxcgwqief/hCdLnBTkPcXvhlDa5P+UGtwiiM
         cyRkVqzMhq2uqt4zFiHT/zEP3G0ObPuS90eiuzwmBj9UBa/lO0H3wQ33yjEthfaEznAT
         KKKx7JMk3KKa6w+bu4zqJnHmhiZMvzRxaux7J30oRWGgqDgv/Kt1fLevj9fBo67pDt0C
         2bx0AftJlmUphHCwTgbOu80g4Y0pMey7iJrNdbbJQSsK1CFncdVZtzIJO2SWF7ezFaTC
         BoiA==
X-Gm-Message-State: AOAM5331U7SV15LT4iZYajbX1sUNt+aYrJaThSrmJqgnvnTg+ZMRvTc6
        jI4s/MMQ+QiXPe20PCTfgzISWENOqF8Sgg==
X-Google-Smtp-Source: ABdhPJz2V3akpjp7CnLsHyJyWfl5lhO6oCJ2FcyFCKpF/jVa5rSKEl5H+eHIotezXXQRhqEX4BhoEQ==
X-Received: by 2002:a17:906:a397:b0:6fe:a1e5:de70 with SMTP id k23-20020a170906a39700b006fea1e5de70mr50735915ejz.2.1654025311194;
        Tue, 31 May 2022 12:28:31 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id mc22-20020a170906eb5600b006feb002a620sm5230564ejb.1.2022.05.31.12.28.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 12:28:29 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id x17so10915073wrg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 12:28:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr41530977wry.513.1654025308057; Tue, 31
 May 2022 12:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <1654021066-13341-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1654021066-13341-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 31 May 2022 12:28:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UF3x5RHrQH-m1X-4kQSsKiufLnkew=VuJz7W9EAi3GHQ@mail.gmail.com>
Message-ID: <CAD=FV=UF3x5RHrQH-m1X-4kQSsKiufLnkew=VuJz7W9EAi3GHQ@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: qcom-geni-serial: minor fixes to get_clk_div_rate()
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com, Matthias Kaehlcke <mka@chromium.org>,
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

On Tue, May 31, 2022 at 11:18 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Add missing initialisation and correct type casting
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 4733a23..08f3ad4 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -943,11 +943,11 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>  static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
>                         unsigned int sampling_rate, unsigned int *clk_div)
>  {
> -       unsigned long ser_clk;
> +       unsigned long ser_clk = 0;

In this patch it's not at all obvious why you'd need to init to 0. I
think the "for loop" is guaranteed to run at least once because
"max_div" is known at compile time. ...and currently each time through
the "for" loop you'll always set "ser_clk".

I think in a future patch you'll want to _remove_ this from the for loop:

if (!prev)
  ser_clk = freq;

...and _that's_ when you should init "ser_clk" to 0. Until then I'd
leave it as uninitialized...

Honestly, I'd throw all the fixes into one series, too.


>         unsigned long desired_clk;
>         unsigned long freq, prev;
>         unsigned long div, maxdiv;
> -       int64_t mult;
> +       unsigned long long mult;
>
>         desired_clk = baud * sampling_rate;
>         if (!desired_clk) {
> @@ -959,8 +959,8 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
>         prev = 0;
>
>         for (div = 1; div <= maxdiv; div++) {
> -               mult = div * desired_clk;
> -               if (mult > ULONG_MAX)
> +               mult = (unsigned long long)div * (unsigned long long)desired_clk;

I think you only need to cast one of the two. The other will be
up-cast automatically.


> +               if (mult > (unsigned long long)ULONG_MAX)

I don't think you need this cast. As far as I know the C language will
"upcast" to the larger of the two types.


-Doug
