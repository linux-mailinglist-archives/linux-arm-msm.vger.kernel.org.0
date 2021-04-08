Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13FD358D2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 21:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhDHTDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 15:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbhDHTDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 15:03:04 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAC3C061760;
        Thu,  8 Apr 2021 12:02:53 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j5so2264067wrn.4;
        Thu, 08 Apr 2021 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=s33L0jFBv8VsueY00mGLPeOpxkDaDH9CAygCV8ZfIso=;
        b=kRhPMWw2riZQCFqLumFOFY7jgykd9A1ROyKqR37tkrZkPZGDPuM/q7WcDdOpwldpBo
         h29XfsDoEBFxs4TkoJEL6TxafegusBaadOmWS0g8TIgQryIiP4LatD5m5THjUdZzxDCp
         +nxXptSg34E0Yndx1JuEe7CW2usRaWYLEIKB6xqsV/F8Wwejm7DIqTWkXuFuL9WHpC5J
         oPfx3w2mH5BN2iavboCw9Jik7wRq7LL0bcPCy4j7DEgyc6lw1LKRLg/YnrrUWMRv0STm
         7cIYWj1Z/dpumHux/6heDN/7eu77gUlldYYd3i3aRr9FsTktm2291Mpry/o0ZXzHjMLD
         HF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=s33L0jFBv8VsueY00mGLPeOpxkDaDH9CAygCV8ZfIso=;
        b=fnEnleknH8Sy2gPNS9SAwmQMeDCLv5KMLBIJlWJNXZwRE7PeBhTCsLW6FmOfPe0nvC
         wNKFdmnY2OVn8HzZYU1RFsIJXAkRb2HtSp3KgY1KJ+aUH4eoEmo9KP7DgSMmJ8FPXsyw
         YooVCJnEADLp7fhk9oUdKPgDR5k9f3oMTNIqv2spaPcS7NsyHvGPP+LzjtlliXYnyi1c
         XSsHI4eJ8dLEZCoJSwdrMLTScILbXQvKtvxVlrimVcqcHup9c1XaMqffkWdrtLFtyl0h
         RZvT6wxcU0mxhy2KMn1cKsNqsYam3yqzwWTJ574GtFmlkM0fAKP5Siil6QE89v1r8arS
         31TQ==
X-Gm-Message-State: AOAM5312BDmsoHTwZ9aT7lwrsJbjBJphEyA9JzShF+zVdHDYT3UtpoyA
        aFdEMGVVRrWjd0Wt0os8JBA=
X-Google-Smtp-Source: ABdhPJy/6auIZkvIwsIen69nwzDb/O+i5n3Luwarlfpd8pjW+OtDwACD8TWoyA12H8qoFIeXlcNw4w==
X-Received: by 2002:a05:6000:54d:: with SMTP id b13mr13398883wrf.417.1617908571903;
        Thu, 08 Apr 2021 12:02:51 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id d5sm392934wrx.0.2021.04.08.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 12:02:51 -0700 (PDT)
Date:   Thu, 8 Apr 2021 21:02:48 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YG9TWEJlpDmNeeit@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Tue, Apr 6, 2021 at 12:52 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 05 Apr 15:02 CDT 2021, Petr Vorel wrote:

> > > Simple testing with /sys/class/gpio/export showed that 85-88.
> > > 3 disables UART. I expect 0-2 are also reserved as on other msm8998.


> > Are you saying that once you export these gpios the uart stops working?

> That might be a Fixes: but certainly not a regression.

> Using GPIO sysfs access is dangerous and if someone enables it into
> their kernel (which requires setting CONFIG_EXPERT) they are
> certainly aware that they are taking a risk. (Same goes for using
> the character device from userspace.)

Not sure if we understand each other. You might think I export GPIO from
userspace on mainline kernel or use CONFIG_EXPERT. None of these is true.

The real problem is that mainline kernel compiled with defconfig resets really
early, thus v2 of this patch [2] is needed.

I just exported GPIO on *downstream* kernel to observe the behaviour.
It was just a simple way for me to find GPIOs which cause reset.
(having docs would be great)

And there is similar reset much later but still before reaching initramfs
in loop_init since a99163e9e708 (during loop_add() on lo->lo_number: 3). And
if I disable CONFIG_BLK_DEV_LOOP, it resets right after reaching initramfs.
I guess that's another problem with DT, but haven't got much further.
But that's a separate problem, gpio-reserved-ranges = <85 4> on tlmm [2]
is still some improvement.

Kind regards,
Petr

[2] https://lore.kernel.org/linux-arm-msm/20210406202936.22500-1-petr.vorel

> Yours,
> Linus Walleij
