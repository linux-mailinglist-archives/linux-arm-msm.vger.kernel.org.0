Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E1223BC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 17:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387947AbfETPLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 11:11:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36901 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732189AbfETPLk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 11:11:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id n27so4344433pgm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kWQ/hyaLyaZYd4k9b0E1vEn2XlvquDuxKLnZf2eEVqo=;
        b=WDkH87COf0IydRv14/WVFpnoeM4Pn9ASM3B+dHDy58+l8fZqCQnryXd6AHUPacBMdr
         MgUUtpO6PN73eSDfAS1uW5beMeU7f6bLS22vRFDAWtrbf1fNTOGXki1YU3zS7oQa+pAG
         c0fzM0ei7/kjhNNY5qzxNyEWRlWpwlgPL63pK6Ea0g2uZWyZsWeAbObW7XGaRfPBwlNr
         zvDzQX0jNCz2WenEQsaReWUs7Z4JAxVShHSGlqwDlO7XV/xTqkNqHJvLlMfil3eCmHa0
         /BsDD9tIVWa6E1gTl3+80W4ftHV3dpMWIjd9CHGMhd+yTGzvGlRYM1/zzaykMqEHPOp6
         IriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kWQ/hyaLyaZYd4k9b0E1vEn2XlvquDuxKLnZf2eEVqo=;
        b=tHG3dQlpSaBTJ9GN2gZ/auHBKCFDbkK9LqyqjTHjwi5Bh/KVjm/TzoKnOM5ISEYsuH
         PYqz6gQJ+OkMK81ungIDDLJ4l79XRBnI8PNTfZuqetk1SXxhk0T2Es4/CWjV6iPXkeAF
         IDb1N/2ZQOJTkJZKgqMKkvyktfoLNZgTNd74Gp/iVVdRK364JXFIl2N19Y2QNJ1b91Cj
         KWCexEh6frQVpuuia/nQ8bBzZrm18sio0eHIMs/dcBBNhwqLFAoA7V4upW744jMNqphW
         GDwvTndxA0OnrNoZcYYX7jnuaPVsNKgeGoqEUzIcSbF57RvmSzLg4NHoxsIgmaJuco5Q
         KXTw==
X-Gm-Message-State: APjAAAWboFkAqYa8Tj7SqWtSm7jISMHz92lZ8WhyfDpwC7hWzv/Y2y7x
        XhJDWSfgyHrU/QRU8EC12wZi2A==
X-Google-Smtp-Source: APXvYqxQq5tfBkC/5mldWvHtvXtXtAKgkl+etNFisJ1TJ+MjWD6zgBWjcsUj0mxROzHo8cLADTYyjg==
X-Received: by 2002:a63:d652:: with SMTP id d18mr59754107pgj.112.1558365099497;
        Mon, 20 May 2019 08:11:39 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r14sm20466206pgm.0.2019.05.20.08.11.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 08:11:38 -0700 (PDT)
Date:   Mon, 20 May 2019 08:12:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org,
        jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        agsumit@qti.qualcomm.com
Subject: Re: [PATCH] tty: serial: msm_serial: Fix XON/XOFF
Message-ID: <20190520151206.GO2085@tuxbook-pro>
References: <20190520103435.30850-1-jorge.ramirez-ortiz@linaro.org>
 <20190520145110.7BDAE21721@mail.kernel.org>
 <254704a2-ee20-30cd-8362-6e1bd23ec090@linaro.org>
 <f0c89b84-7c3d-596d-06e1-cb5172e62970@linaro.org>
 <20190520151101.GN2085@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520151101.GN2085@tuxbook-pro>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 May 08:11 PDT 2019, Bjorn Andersson wrote:

> On Mon 20 May 07:58 PDT 2019, Jorge Ramirez wrote:
> 
> > On 5/20/19 16:56, Jorge Ramirez wrote:
> > > On 5/20/19 16:51, Stephen Boyd wrote:
> > >> Quoting Jorge Ramirez-Ortiz (2019-05-20 03:34:35)
> > >>> When the tty layer requests the uart to throttle, the current code
> > >>> executing in msm_serial will trigger "Bad mode in Error Handler" and
> > >>> generate an invalid stack frame in pstore before rebooting (that is if
> > >>> pstore is indeed configured: otherwise the user shall just notice a
> > >>> reboot with no further information dumped to the console).
> > >>>
> > >>> This patch replaces the PIO byte accessor with the word accessor
> > >>> already used in PIO mode.
> > >>
> > >> Because the hardware only accepts word based accessors and fails
> > >> otherwise? I can believe that.
> > >>
> > >> I wonder if the earlier UART hardware this driver used to support (i.e.
> > >> pre-DM) would accept byte access to the registers. It's possible, but we
> > >> don't really care because those boards aren't supported.
> > > 
> > > ok.
> > > 
> > > also the PIO path uses iowrite32_rep to write a number of bytes (from 1
> > > to 4) so I think it is also appropriate to use it for XON/XOFF.
> > > 
> > >>
> > >>>
> > >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > >>> ---
> > >>
> > >> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > >>
> > >>>  drivers/tty/serial/msm_serial.c | 5 ++++-
> > >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > >>> index 109096033bb1..23833ad952ba 100644
> > >>> --- a/drivers/tty/serial/msm_serial.c
> > >>> +++ b/drivers/tty/serial/msm_serial.c
> > >>> @@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
> > >>>                 else
> > >>>                         tf = port->membase + UART_TF;
> > >>>  
> > >>> +               buf[0] = port->x_char;
> > >>> +
> > >>>                 if (msm_port->is_uartdm)
> > >>>                         msm_reset_dm_count(port, 1);
> > >>>  
> > >>> -               iowrite8_rep(tf, &port->x_char, 1);
> > >>> +               iowrite32_rep(tf, buf, 1);
> > >>
> > >> I suppose it's OK to write some extra zeroes here?
> > >>
> > >>
> > > 
> > > yeah, semantically confusing msm_reset_dm_count is what really matters:
> > > it tells the hardware to only take n bytes (in this case only one) so
> > > the others will be ignored
> > 
> > um after I said this, maybe iowrite32_rep should only be applied to
> > uartdm ... what do you think?
> > 
> 
> If I read the history correctly this write was a writel() up until
> 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs").
> 
> So I think you should just change this back to a iowrite32_rep() and add
> a Fixes tag.
> 

I mean...

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
