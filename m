Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FEBDCDF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 20:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505746AbfJRSaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 14:30:21 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46909 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505459AbfJRSaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 14:30:21 -0400
Received: by mail-il1-f195.google.com with SMTP id c4so6373790ilq.13;
        Fri, 18 Oct 2019 11:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9TR74HliKcGhhcpIlRpbuDwy+ebGrtVv1gRKo2YxR5I=;
        b=BxoE4ac1hUXyK3iN/dztnkpo2HRqcCiIx+R7gMLQsFGU0EjvBUCotiiVqGE32Kwc80
         syGCtHKrtf+WBBLegwEU0Grd9YcqpAe8kRMh0uf7wNibSZnTwgx6bnYwMaiJgKMkUtvo
         V6wzJzSPWdhHkHmagod2RpcgEO8azBPP/+0IgTHaGtQrNwM/ltGZ+Ho9cvXaKbOQvUaZ
         BKxaVABbtNqsSzgLhW3Wy3VnGF3jyUegAj2foSi2cau4PRpSkLJfw2hHtmLbEGoKf8TC
         wPLBhSIgxA/CWRS2pgAilLXVhAonsSDzX3Fmh8v7I4TRjutF+x9/7oXcck7rTbLqA04V
         6lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9TR74HliKcGhhcpIlRpbuDwy+ebGrtVv1gRKo2YxR5I=;
        b=okF16vaWqogOMIbnPZP+8hlpjoiK91yREB98cnvZcp1yVquMsoapqmulLXw259EFUQ
         Y3m6oWQsIqo/QWY17gF17Wkm5gGCEfS8g8P23njZdU5Ogc0xEZUgChCHJMcnlIgRayRa
         nyBYIF1NOl2n0Gbw2bhYhBb3dpfRjbeC/gZHidlCq5SEmMXoZgebE6C3mzEIk8+cBOSi
         VdWkrnwieqH9AVJBy1WOnYlXvoYkXKcTAk43bs7b/8fqO2EBEB7v0iEoZ/Ais4uamZSU
         E29pDOgQVKTfhVVp9hxWIMTXtUeAPDmUpDwM4eeFIW55YKjSv7+Og4WKpt/aRtGDc/Pp
         MR6A==
X-Gm-Message-State: APjAAAUHj5S9eJx2ZiI1iaowjQtr+6vZSr8ycWmIN8uv9EUm1bKinAAf
        Rj3YFwxvIChq2s5v/hlz+43iH+Yv70JjbWpSq4w=
X-Google-Smtp-Source: APXvYqwAI9gQqLm22/B1368wsSMuRTHJtUuE6XEUIQlrStLbW1GE1BraOtx6vAS4S4+6LNLvSHi7kwqz6Hx2Liv124k=
X-Received: by 2002:a05:6e02:783:: with SMTP id q3mr11223281ils.33.1571423420264;
 Fri, 18 Oct 2019 11:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com> <20191018180339.GQ87296@google.com>
In-Reply-To: <20191018180339.GQ87296@google.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 18 Oct 2019 12:30:09 -0600
Message-ID: <CAOCk7NrN0sjLk3onvZn7+bhs_v3A4H6CHh=XPo_NU2XzUWeEGw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org,
        linux-bluetooth@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 18, 2019 at 12:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Oct 17, 2019 at 02:29:55PM -0700, Jeffrey Hugo wrote:
> > On the msm8998 mtp, the response to the baudrate change command is never
> > received.  On the Lenovo Miix 630, the response to the baudrate change
> > command is corrupted - "Frame reassembly failed (-84)".
> >
> > Adding a 50ms delay before re-enabling flow to receive the baudrate change
> > command response from the wcn3990 addesses both issues, and allows
> > bluetooth to become functional.
>
> From my earlier debugging on sdm845 I don't think this is what happens.
> The problem is that the wcn3990 sends the response to the baudrate change
> command using the new baudrate, while the UART on the SoC still operates
> with the prior speed (for details see 2faa3f15fa2f ("Bluetooth: hci_qca:
> wcn3990: Drop baudrate change vendor event"))
>
> IIRC the 50ms delay causes the HCI core to discard the received data,
> which is why the "Frame reassembly failed" message disappears, not
> because the response was received. In theory commit 78e8fa2972e5
> ("Bluetooth: hci_qca: Deassert RTS while baudrate change command")
> should have fixed those messages, do you know if CTS/RTS are connected
> on the Bluetooth UART of the Lenovo Miix 630?

I was testing with 5.4-rc1 which contains the indicated RTS fix.

Yes, CTS/RTS are connected on the Lenovo Miix 630.

I added debug statements which indicated that data was received,
however it was corrupt, and the packet type did not match what was
expected, hence the frame reassembly errors.

In response to this patch, Balakrishna pointed me to a bug report
which indicated that some of the UART GPIO lines need to have a bias
applied to prevent errant data from floating lines -

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888

It turns out this fix was never applied to msm8998.  Applying the fix
does cause the the frame reassembly errors to go away, however then
the host SoC never receives the baud rate change response (I increased
the timeout from 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop
baudrate change vendor event") to 5 seconds).  As of now, this patch
is still required.

I have no idea why the delay is required, and was hoping that posting
this patch would result in someone else providing some missing pieces
to determine the real root cause.  I suspect that asserting RTS at the
wrong time may cause an issue for the wcn3990, but I have no data nor
documentation to support this guess.  I welcome any further insights
you may have.
