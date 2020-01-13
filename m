Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFFF1139AC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 21:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgAMUeE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 15:34:04 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45637 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgAMUeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 15:34:04 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so10251268otp.12;
        Mon, 13 Jan 2020 12:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g30GopAFKodLPiIyyDFCTZEx3pcDl31aRqINoG//ZNg=;
        b=VoII+4ZKA4Xn66++F/5QmiPGOrsyN8djntYUB1yeie9pYxQP6sy7qdzBGLzG53y2Iq
         d19h2V5LQBHi4Pb+RevxpPatv2XsNiAqeWO2hZ81RADaAn2jGj4V0LtRDsYPCs48P6OQ
         fA5QZ+2FGFoenjlco9s0owbGiNNKwQwL5zYO6aK8T+BJ0Nyfa22UzU+obBjo/Qh10WCe
         xJPRgg5c7S8O+Ww+577/tfvkhLHoiiVH//Zfb2ZAqxMXGHwawEpty18KYrbYQ1ZKogbd
         cDN2BW6x3pYHGJvoXwLawy6ECtkIUx1KX/hZdJIoHkoEpPBRujmJUhK9MBUkghSAgNEj
         ABuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g30GopAFKodLPiIyyDFCTZEx3pcDl31aRqINoG//ZNg=;
        b=eiIlF12epIHvq/XvAUfUYzymr4BVDKFzBA6l1EwhFw8uB/C8zRngsCjHcWt0ryOZef
         YM9B+wHWJ0bGMSwP9CGr57EtOoF9i2OtSaYNDtNdQEeR5C4t8fkGeYOT2RV4F7Fza4aR
         PkBmeFWnKg9wY7EFoOiBcC9fVIhN688Zx9qpDhn4IAhifIENnNeDq0XLUTaNrlt//99B
         72m8VN3b1WMm8aPOe4cL9/Nvn6eczy4uunWaYkrXr5aMkSGMqRtbFw+GZVRz8M3GAXk3
         LPaQGdZ93c+BwkTANZsasJMjsDY9S3cFK9dx36wCXUPHD7URDT+uoephVg+tmNy12ivZ
         xBGg==
X-Gm-Message-State: APjAAAXuNhiOEm/09W2BBw0VgZ2bj5NtkVW6NBO7/OFe5MjlEBC2/lgl
        xPjKbkLFNhO0EDd8bLM15ZdcFWKtAiNcIiTnUeVLS7Qv
X-Google-Smtp-Source: APXvYqxCW7KKr9IaEeunJazA/7rngx+d5U6LhmuYhHjQ9V/hih/yBrBCv7K+G6kWvBlCX2Nhag2WM1DDTBzdBq59DT0=
X-Received: by 2002:a9d:4e92:: with SMTP id v18mr13422810otk.47.1578947643917;
 Mon, 13 Jan 2020 12:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20200113084005.849071-1-vkoul@kernel.org> <CANcMJZC1w+J=cdp0OiR5XDn9fFSPht70Jaf9F5S5BryFxVXVoQ@mail.gmail.com>
In-Reply-To: <CANcMJZC1w+J=cdp0OiR5XDn9fFSPht70Jaf9F5S5BryFxVXVoQ@mail.gmail.com>
From:   Christian Lamparter <chunkeey@gmail.com>
Date:   Mon, 13 Jan 2020 21:33:50 +0100
Message-ID: <CAAd0S9Aaw8G+=EivfC-g4Lt3Xf_kpjFh6WwQk2E8pFxJUmteKQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
To:     John Stultz <john.stultz@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 9:10 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > These require firmware to be loaded and in case devices have ROM those can
> > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> >
> > This includes two patches from Christian which supported these controllers
> > w/o ROM and later my patches for ROM support and multiple firmware versions,
> > debugfs hook for rom erase and export of xhci-pci functions.
> >
>
> Thanks so much for updating these! They are working ok for me in my
> testing on db845c.
>
> Tested-by: John Stultz <john.stultz@linaro.org>

Nice! I'll definitely give this series another try on my WNDR4700 too
(PowerPC Arch)
this weekend.

and from me: Thanks!
