Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5D0ED5F4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2019 22:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbfKCVv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Nov 2019 16:51:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34955 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbfKCVv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Nov 2019 16:51:29 -0500
Received: by mail-io1-f67.google.com with SMTP id x21so677527iol.2;
        Sun, 03 Nov 2019 13:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgLWVbnYsmp8GTfjtkJQ6PMmsjA0Nkny+EyycF5N+NM=;
        b=Hoy5ufyo3HMrwiKzs049mLa9IUVYs0l4COHDLR2cN8MCEGzesPfcSq/UAzytFwcSpX
         jdssTa/6NE0Vzyh4B+HRPhkFOcrF52w4Dzd4eqeOVRBcLrE3XkkmUib+6nzjCL22kyiS
         vDq/DJSzEQSNZsqIVkZM2BxCBVxEEiyL343EZsZLi3UM9Yqm57zfeCq3HN3XZRt0UrqK
         GasW+HfOgIeEMAUz1lmSOUKWonItNX/wG+ijzsT1Y+rPBeq9dRxSzn4Y/5A4irsXzJiz
         YhNuURecQGWkBNQnaEMoUw7yR3My+3PMK+VmTj9PV378/3pmv01kiDpaRtXztVKPTMaH
         bVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgLWVbnYsmp8GTfjtkJQ6PMmsjA0Nkny+EyycF5N+NM=;
        b=b+/cykFbX1WOoK13o4oECnFkOfx1BStlPqr57A2W65Ri8ZpfLqckNcmen2p4bRxDLJ
         /3ECzKDGEXV/Yo5TA6m/VNM/f3bZRxUmV7bjtDDSJGzC8B8gRVemzOPHTPq2bETuZU1b
         iDVwNLT3vvDjjbvN0SL1GL3LRSJIQQfKbn3jMZQFryoi253Di5If7q2OC1tZEYsZJgFH
         2InSlPfzw6k9uJA5xmHLbubwLQWvtqO4Gw6xShi89g2sN2Z/RB8D6UvZLE43BvxA7kRf
         +68Sl+UMG+0eS9TThbD4mFIQfpHCCzpCwR3zqqPVT0ydt+KiADDqcdzTCnnVF+jey8Mq
         m/VQ==
X-Gm-Message-State: APjAAAWSgE3LX4LUJu2JJ0qlALiYwB3edx4F04h/WDhQ+CMwEMKbXM44
        WuFns1XpQnEwgmiUp92QF1Qu/+c3X6dSSPd9QNY=
X-Google-Smtp-Source: APXvYqyji1eJd3MTZ9BmTrD9R9Rf5+0/OgRzgO+3osoTpI9uw+bnkZe69du9hFxeNIXjyWCvn5/9l1SQVAlWerAk1XY=
X-Received: by 2002:a5d:91d2:: with SMTP id k18mr20651366ior.178.1572817888371;
 Sun, 03 Nov 2019 13:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com> <20191027055528.GJ5514@hector.lan>
In-Reply-To: <20191027055528.GJ5514@hector.lan>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sun, 3 Nov 2019 14:51:17 -0700
Message-ID: <CAOCk7Nptm=Cz17FFKKvsgVxXRgJ-m9zK4RKysqhjb4cwPweSXg@mail.gmail.com>
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix flow control
To:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, jslaby@suse.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 26, 2019 at 11:55 PM Andy Gross <agross@kernel.org> wrote:
>
> On Mon, Oct 21, 2019 at 08:46:16AM -0700, Jeffrey Hugo wrote:
> > hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
> > Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
> > disables flow, configures the uart baudrate, and then reenables flow - at
> > which point an event is expected to be received over the uart from the
> > wcn3990.  It is observed that this event comes after the baudrate change
> > but before hci_qca re-enables flow. This is unexpected, and is a result of
> > msm_reset() being broken.
> >
> > According to the uart_dm hardware documentation, it is recommended that
> > automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
> > hw flow control will manage RFR based on the configured watermark.  When
> > there is space to receive data, the hw will assert RFR.  When the watermark
> > is hit, the hw will de-assert RFR.
> >
> > The hardware documentation indicates that RFR can me manually managed via
> > CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
> > de-asserts RFR.
> >
> > msm_reset() is broken because after resetting the hardware, it
> > unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
> > the current configuration, and would undo a previous flow disable
> > operation.  It should instead de-assert RFR via RESET_RFR to block flow
> > until the hardware is reconfigured.  msm_serial should rely on the client
> > to specify that flow should be enabled, either via mctrl() or the termios
> > structure, and only assert RFR in response to those triggers.
> >
> > Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
>
> Reviewed-by: Andy Gross <agross@kernel.org>
>
> Greg, can you pick this one up?
>
> Thanks,
> Andy

Greg, will this be queued for 5.5?
