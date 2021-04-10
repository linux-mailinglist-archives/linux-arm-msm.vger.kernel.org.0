Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C4035AF34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 19:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJRUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Apr 2021 13:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbhDJRUY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Apr 2021 13:20:24 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0619C06138A;
        Sat, 10 Apr 2021 10:20:09 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g17so9378058edm.6;
        Sat, 10 Apr 2021 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=bmbgCj2muJKg7OduUvBJWXcT8/zIja0NVvmWyA9R5dM=;
        b=J5OggRvv5r2vSHvy+8QVfSpNTo7Eq9AnbNEVpJx+k6qYl+giNt8mJS7jh8dp3FuGxg
         1kRRC90g0kLjfIFD523X/ydl5EVJqYHgQ2lxTym79tC/qtc0IUwNJ4w4cXrzzMJNqQrz
         bl0XFB+879tp89aetAtaLCmi15/OCzgIIrPPyuYjczNr3Bgo3qjanJq2gx7thSjZMBP5
         mjGEAJx4SduTgwwgqMB818jXwT0O8nqrJL4aRNxNAGqSeJQTHmD8KFEUDZ5Bh3mcOCKs
         /y1I61Nsr4P0mfzDyQW4zsaD9mwXKT7P6tLmao0t7aFlQ0geo7pN8SoD5XUVpGtLMUWd
         DgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=bmbgCj2muJKg7OduUvBJWXcT8/zIja0NVvmWyA9R5dM=;
        b=dkzvXE5jmu4zgQh0aNv+LBWkqvvvD6P5AUYM5GnvOkatOyouIzG+lZyaJ/Mmqfcbbv
         N/A0TqJVE28YaEZo+oyZHmJBpeJ99+vBDNCQwM7uG9R5gn6VMT5r0UyfZv9U+ZyHgbm6
         0N24xZD5kr6CY4FrmxXJSj3BFyumsEjvuD+5h7de9GyZg8yRW8F9DwkQVjKZlONlrxrM
         6XNIm9W6ulLB2jgetIGtbslbO/oXrTj6FRvL8gkogKmexVsWpgu3/wW6mR0bmhnHbArg
         n8lBeS+uDuxBDYXqBBdJD+vkcB3tUvE76FtkS/q38WzbdgRirBRm0egSZBWcC76QSYad
         5nWA==
X-Gm-Message-State: AOAM533M1nR1AIvg4LG9v31A/56e7Yr+TQc0Dora/+cNTMpN5Oo7gz0w
        kqtJASnViN4btBLZw22mPu8=
X-Google-Smtp-Source: ABdhPJwUut07PLJJchzC4Bq4JmjozB6Z3C1hcBMAxRRYPC1BvmlsymOMCOue6ZSljaFi171xY5drAg==
X-Received: by 2002:a05:6402:40ca:: with SMTP id z10mr18091325edb.215.1618075208390;
        Sat, 10 Apr 2021 10:20:08 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id e16sm3396836edu.94.2021.04.10.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 10:20:07 -0700 (PDT)
Date:   Sat, 10 Apr 2021 19:20:05 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YHHeRfAWrrusE/gB@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik>
 <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
 <YG/HwrzRcm7bwgFe@pevik>
 <20210409033726.GT904837@yoga>
 <YHE9Df/Ztq7VaoK2@pevik>
 <10d2cd96-3c35-2b06-82f7-98800888e244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d2cd96-3c35-2b06-82f7-98800888e244@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> > Konrad, is there any public docs about GPIOs on this secure peripherals?
> > It it somehow related to Chain of Trust? [1].  I guess it's not, because once we
> > boot Linux all bootloader stuff is over.

> No, Qualcomm pretty much does security through obscurity. It's *probably* not even that very secure considering how big in size their TZ+HYP stack is - number of bugs rises exponentially with code size. But not many people tried breaking into it considering the complexity and QCOM's legal team size.

> There is no public documentation on that, and even if there were - you are not allowed to flash the "secure" partitions on *your device that you unlocked the bootloader of by choice* (which is absurd).

> Also, while "all bootloader stuff is over", the platform is still under control of the proprietary hypervisor and the "Trust Zone". For example if you try to write to some IOMMU registers on certain platforms, the hypervisor will treat that as a security violation and shut down the entire device. 

> This is essentially the same as your issue. You're trying to poke a thing that Qualcomm *really* doesn't want you to (the fingerprint SPI pins) and since *they* are in control, they say "nonono" and your device dies. All you can do is comply with that (or find a way to replace the blobs or politely ask Google to release a set of unsecure binaries for your Nexus - which they won't do).

Again, thanks a lot for info. I looked into downstream sources to see that
really pins 85-88 (which I've sent a patch to add into gpio-reserved-ranges) are
used for fingerprint. I also wonder if downstream commit d45c35c7b586 ("angler:
fingerprint: remove all the code about spi") [1] confirms that also downstream
kernel would reset or it's a security (it would not reset, thus they removed
the access). It's probably aosp issue tracker [2], but "Access denied" for me.

I also did some testing and this is maximum range which can be disabled:
gpio-reserved-ranges = <0 4>, <6 139> and it does not help to solve second
reset (in loop_init() or later when starting initramfs).
Removing access to GPIO 4 or 5 causes reset right immediately (no message from
kernel).

I still don't understand what changed in a99163e9e708 ("Merge tag
'devicetree-for-5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux")
I checked both 882d6edfc45c cb8be8b4b27f, which it merges and they're ok.

Kind regards,
Petr

[1] https://android.googlesource.com/kernel/msm/+/d45c35c7b586711e757eb7e3239db5c88d114e0e
[2] https://issuetracker.google.com/issues/23756466

> Konrad
