Return-Path: <linux-arm-msm+bounces-20363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DE8CDEF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5791C211DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 00:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684956FC3;
	Fri, 24 May 2024 00:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ex3GKSZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3981C36D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716511119; cv=none; b=XS02jk+bwKA4dhfDwz6pgnKQnKqRj/fknGkeIRAeOWrpXR/V/lYyPrIYI4eLfy8/NucOUJq0h+2C6o/UOsCZdapsnE75Yi5JFtJm+pVBn+FIJjlEUUkzcSigtJcC1D1EnmGWPA5o16C2BNP1vpBR99mclytrFCXRqrKNy9pxHuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716511119; c=relaxed/simple;
	bh=grp2aumzXD04JTUddCKPIYKV3Zd9gabxwz5TJKI3HGw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwOrsFz1UQLjBIAANGWOXKQGigxPouVE000mjdIwVs6UHYVrHUbraEmAVYEE9wyPcZX9aNuWAMUpiNn/2qE++iPZAX51rwZmc1Ajbm82jZZid4AYN6ktR9scp3k2G7fU2h27D7caqGYGcz+AGz/ty2H/THkDQPxF2WSFC3LrQ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ex3GKSZu; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9cc681e4fso3470749b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 17:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716511116; x=1717115916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oEGXFFhEZ3kKS8HqbZY7sKVJ85+CGR+UK70IUChd0Y=;
        b=Ex3GKSZuxcxD+i/4WPEcNOxsUhcdOmlkltvZ1BBzr8A0NFRBOQgveZg/VxQ/SrZeq+
         y/e30zgGncRfviVjrjqjUKsN1kHKXyMvp7BOkIDyT7tKch6OBqnqVfe2k2lmVzdQvhEM
         VMIu08MgAP+W4ocCPdyD9Z2cU78O9B/BlcEfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716511116; x=1717115916;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oEGXFFhEZ3kKS8HqbZY7sKVJ85+CGR+UK70IUChd0Y=;
        b=e0yorkjNJNygidWq3+0BQ26iPtldc+TpW5wIltAcxeVJfpMJoUA69IHWH5djaoK0eq
         tvMbbfrTq2lzAAYqIMVlIRdaDJS5LaYwFklSfYtw8V7T7J7u+WI5B0X0BNwIQyfw7zmh
         YfHIGNry5IfdkH8RBfv/wBPi9AXI9dOp1Uj1ZthgblhTnTs4m940nRiY5OppbAewSx1E
         JfUQZdtjwBevmg7Q/x47uZ/GX3JVFSCeM6BfNhkXRUA7L55BwXl1YNlCvRSQUD2abvGj
         oTeQQl5LegBxKaCZylxgvNkxAG3Ne8Z30o8yx9kwyZjzED8coCAcWCtMSeD1U9A9v/VG
         3poA==
X-Forwarded-Encrypted: i=1; AJvYcCV61AvYP/nz46aDkOyPko57aJ7uyHQINQUHNP9mcHiSIhrNFZgTtdXMz63QB1MwZepoGVEFH/7tugYD+5Fy4U9dpJrHpXYKGxHgS59YXA==
X-Gm-Message-State: AOJu0YwsuWsP5jRtoAGaG+zVYq3HIyb/obGs70IgEnf8wqxpB1MztSht
	yfmD20xlP41ZFdwA9iz/asDvpbQum6qp803OX07EDPFO/1N5sQnXbjA0uTknU1xGQSDFYCZ8raK
	eQuuQb0WpuBLpfG2gSmOguWW/FtECMSjTq1EJ
X-Google-Smtp-Source: AGHT+IHANTkEZOvjig5FCEm2CHI3m2gat2w85Oc8UgsCt8xQgTaCvhgmAJNa/wG52wcTxm0wOonRSfXfhADKRKsIqAk=
X-Received: by 2002:a05:6808:358:b0:3c7:4fd4:ae76 with SMTP id
 5614622812f47-3d1a4fb3c78mr1125728b6e.10.1716511116239; Thu, 23 May 2024
 17:38:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 May 2024 19:38:34 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240523162207.2.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
References: <20240523232216.3148367-1-dianders@chromium.org> <20240523162207.2.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 May 2024 19:38:34 -0500
Message-ID: <CAE-0n53F3Xg2vOdgy-Vpjw4Kirdgi6B+BnO51fd6qOtDu0iXCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: qcom-geni: Fix qcom_geni_serial_stop_tx_fifo()
 while xfer
To: Douglas Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	John Ogness <john.ogness@linutronix.de>, Tony Lindgren <tony@atomide.com>, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Yicong Yang <yangyicong@hisilicon.com>, James Clark <james.clark@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Douglas Anderson (2024-05-23 16:22:13)
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 2bd25afe0d92..9110ac4bdbbf 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -265,8 +265,8 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
>         return readl(uport->membase + SE_GENI_STATUS) & S_GENI_CMD_ACTIVE;
>  }
>
> -static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> -                               int offset, int field, bool set)
> +static bool qcom_geni_serial_poll_bitfield(struct uart_port *uport,
> +                                          int offset, int field, u32 val)

Can these be unsigned offset and field?

>  {
>         u32 reg;
>         struct qcom_geni_serial_port *port;
> @@ -295,7 +295,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>         timeout_us = DIV_ROUND_UP(timeout_us, 10) * 10;
>         while (timeout_us) {
>                 reg = readl(uport->membase + offset);
> -               if ((bool)(reg & field) == set)
> +               if ((reg & field) == val)
>                         return true;
>                 udelay(10);
>                 timeout_us -= 10;
> @@ -303,6 +303,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>         return false;
>  }
>
> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> +                                     int offset, int field, bool set)

Can these be unsigned offset and field?

> +{
> +       return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
> +}
> +
>  static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
>  {
>         u32 m_cmd;
> @@ -675,6 +681,31 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
>         if (!qcom_geni_serial_main_active(uport))
>                 return;
>
> +       /*
> +        * Wait until the FIFO has been drained. We've already taken bytes out
> +        * of the higher level queue in qcom_geni_serial_send_chunk_fifo() so
> +        * if we don't drain the FIFO but send the "cancel" below they seem to
> +        * get lost.
> +        */
> +       qcom_geni_serial_poll_bitfield(uport, SE_GENI_TX_FIFO_STATUS, TX_FIFO_WC, 0);
> +
> +       /*
> +        * If we send the cancel immediately after the FIFO reports that it's
> +        * empty then bytes still seem to get lost. From trial and error, it
> +        * appears that a small delay here keeps bytes from being lost and
> +        * there is (apparently) no bit that we can poll instead of this.
> +        * Specifically it can be noted that the sequencer is still "active"
> +        * if it's waiting for us to send it more bytes from the current
> +        * transfer.
> +        */
> +       mdelay(1);

I wonder if the FIFO is in a different 1kb chunk of device memory and so
this needs to be an instruction barrier (isb()) to prevent the cancel
from being executed before or in parallel to the FIFO polling. Hopefully
someone at qcom can confirm this. It looks like SE_GENI_TX_FIFO_STATUS
is 0x800 offset and the cancel is at 0x600 so it looks like it may be
this problem. Device memory doesn't save us even if that has ordered
accesses :(

> +
> +       /*
> +        * Cancel the current command. After this the main sequencer will
> +        * stop reporting that it's active and we'll have to start a new
> +        * transfer command. If the cancel doesn't take, we'll also send an
> +        * abort.
> +        */
>         geni_se_cancel_m_cmd(&port->se);
>         if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>                                                 M_CMD_CANCEL_EN, true)) {

