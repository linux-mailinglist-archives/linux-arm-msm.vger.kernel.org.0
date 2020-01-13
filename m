Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590F5139A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 21:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAMUKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 15:10:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46521 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgAMUKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 15:10:12 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so9909102wrl.13;
        Mon, 13 Jan 2020 12:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIdPayYclkI0tefskIfCSHd/wkA33eOAU64wv5WBopo=;
        b=tJ6fB7Vmj+Fw2qsPR+VcQwEffHW4f3owuoTpLDJQhrSrmWBuMAESDIW9Zcrq5SahjB
         pRvpyr/OKYFRniu4K3C5rnkMKyhGc9CuenpbWcVCwEIRNDriNicYif+bdhpRR3kh6zS4
         rKhLPb3NzK41rrlEaLGT0KgGiElsMZmCbgZw/AqZArponIAyU6wpjMiiEyn1IF0TtV97
         44pXiraU6lhkssENcud0xVwNiWdp2S6aB0qaTt4qZI8uTxANP/+Z1HfzE1CIVUqLeutQ
         SyN+9FpSz3v/nTBRZ48iBigHKy2gEppcB2gIeZpE0/IGN4/TTT3wjEUD/xnPjmF0izj3
         K7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIdPayYclkI0tefskIfCSHd/wkA33eOAU64wv5WBopo=;
        b=YFBodIuYFUQzey5stKrvXd6O56PlgnrOApe5EvRVzbsHtWvuzu/1NmnxTrQ/v3Adta
         oREGNq2WLHcmstLqk5Vg4P2ZEdtoixp49I0HoyZM1/msAixk2qLQZlBvrYYMnoEXzl4+
         wMY3FdtFjY6z5QkXLkdbnQvMNa2L1aMXHFQvH6aOIn6MKs3uOGSpTetuqgWbCFgSsK+F
         fwkJ/K4oJ5gFtadvlE4qEvRWqJZ+LYwCTWZvnP87/y+6Aivkdz6k5jq8XWzaBuvj5Y+A
         +mpwl2JFjA6a8l7wAW+8DgSp7+le+BzbVG/agwNcuoD9j8q1MEa72naPh3n4ZmvREC0W
         V1Dg==
X-Gm-Message-State: APjAAAUfqaMM/yqUOtYIejieWYNm1ferAxS8Yg10fNSFep3aeMlmFW+Y
        P1F7fHofJ/uSbyxiF+MVedViNKCIIR8y2E7HNwM=
X-Google-Smtp-Source: APXvYqxVz9p/3ZKka7nybrRQ4JgIc2/z+ZrwndNvlUqhYK6b4Cn6RpeNEnWJAslXxCVvyrThoxPnok08lZonlcBKncw=
X-Received: by 2002:a05:6000:12c9:: with SMTP id l9mr21492688wrx.304.1578946210426;
 Mon, 13 Jan 2020 12:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20200113084005.849071-1-vkoul@kernel.org>
In-Reply-To: <20200113084005.849071-1-vkoul@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 13 Jan 2020 12:09:59 -0800
Message-ID: <CANcMJZC1w+J=cdp0OiR5XDn9fFSPht70Jaf9F5S5BryFxVXVoQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
>
> This includes two patches from Christian which supported these controllers
> w/o ROM and later my patches for ROM support and multiple firmware versions,
> debugfs hook for rom erase and export of xhci-pci functions.
>

Thanks so much for updating these! They are working ok for me in my
testing on db845c.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks again!
-john
