Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778432662A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 17:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgIKP4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 11:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgIKPzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:55:45 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E72C061756;
        Fri, 11 Sep 2020 08:55:45 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id v54so8209686qtj.7;
        Fri, 11 Sep 2020 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aV5bpQ2krhOB+niC7lEQtlN1tkAGF/USFR0HH0F56g8=;
        b=GmV5kJx6TnLDNUqRs4lH9VY2bK80Nm2uLz+5U1MgxZzpgZ85HnOQZjpbS7SrjbzCUa
         WDt3phlxcNon8OhgUWmK0czetjiyrfTeASu0u39E4aifSd56uOQvWM0+mTGkSVqVu+4a
         v7nLtoQGbafhhmRUb9WacVm1Q7kbaNElqsCloSYeBtCj+3Do+uLWLqJep7Gopp6Yw4nr
         exb8vn/RuzFrzqIAFEys/+PlRC+scyIs6kiEJKUogjknHDXN09JgEKiXL2KRbt09IA6v
         mgixLErw0uHL8SpcRvB4p+Ch+zNBKoSWltZ2p3+m9GAz+8etLb32TtIl3jZMF/BBxle3
         Q1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aV5bpQ2krhOB+niC7lEQtlN1tkAGF/USFR0HH0F56g8=;
        b=QgQqFengJM+90VhBs6+kZT43HCANgGjGDrBGC43NriH9aJiU6onnU7sb38HdMawsaS
         boCFSf3dwSvDzaNjyUm3EbOQnFSN68RTdqIWF8sYYHXe4wR6fhg2tCGYpMNiQDK8BEaZ
         NSgEOI0t8M61YsfeBiO9edsAnI4Y/3/l1skILQSOctn8pUSU2JV5uYTuvp5DqFmNUrYT
         WDuykEwI+07HFC+Z/h6oU3iAMXOSM7009pkxSHt8On2sNesWLcwNratxVb0T8wqMHLt5
         qtdRkGc5mgyNbJnwCB5lpmAayPw29kXeij9GUiuhOXMYq9OKJhYSEzYTXLPPYDRWwpER
         m2Mw==
X-Gm-Message-State: AOAM533/hVEc6fu4ke3qnQK47SKHu2xJPntGRu2VZ1DJym3ld84erJXh
        vw1iVsiskamq/5m0qw+LlYc=
X-Google-Smtp-Source: ABdhPJzfJ7Pc2ZjSn75Qlos68p60gX+HasTYd8IiJnlbetV9wqSQzG5KIPdnxzE8SZbfXg+Jp5hXlg==
X-Received: by 2002:ac8:22da:: with SMTP id g26mr2421314qta.218.1599839744238;
        Fri, 11 Sep 2020 08:55:44 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id r34sm3365906qtr.18.2020.09.11.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:55:43 -0700 (PDT)
Date:   Fri, 11 Sep 2020 08:55:42 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        robdclark@chromium.org, Akash Asthana <akashast@codeaurora.org>,
        jwerner@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: 115.2 is a better console
 default than 9600
Message-ID: <20200911155542.GA4037107@ubuntu-n2-xlarge-x86>
References: <20200911080054.1.I4c00b921c2f17b6988688046fa7be0f729f8d591@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911080054.1.I4c00b921c2f17b6988688046fa7be0f729f8d591@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 11, 2020 at 08:00:57AM -0700, Douglas Anderson wrote:
> Commit c5cbc78acf69 ("tty: serial: qcom_geni_serial: Initialize baud
> in qcom_geni_console_setup") fixed a bug by initting a variable that
> was used in some cases without initialization.  However, the "default"
> baud rate picked by that CL was probably not the best choice.  The
> chances that anyone out there is trying to run a system with kernel
> messages piped out over a 9600 baud serial port is just about nil.
> Console messages are printed in a blocking manner.  At 9600 baud we
> print about 1 character per millisecond which means that printing a
> 40-byte message to the console will take ~40 ms.  While it would
> probably work, it's going to make boot _very_ slow and probably cause
> the occasional timeout here and there in drivers (heck, even at 115200
> console delays can wreck havoc).
> 
> This has already bit at least two people that I'm aware of that tried
> to enable serial console by just adding "console=ttyMSM0" (instead of
> "console=ttyMSM0,115200n8") to the command line, so it seems like it'd
> be nice to fix.
> 
> Let's switch the default to 115200.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index f0b1b47c3abc..e390ffc8bbbd 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1107,7 +1107,7 @@ static int qcom_geni_console_setup(struct console *co, char *options)
>  {
>  	struct uart_port *uport;
>  	struct qcom_geni_serial_port *port;
> -	int baud = 9600;
> +	int baud = 115200;
>  	int bits = 8;
>  	int parity = 'n';
>  	int flow = 'n';
> -- 
> 2.28.0.618.gf4bc123cb7-goog
> 
