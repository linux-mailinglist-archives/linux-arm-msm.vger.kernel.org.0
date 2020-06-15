Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E561F9B4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 17:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730919AbgFOPCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 11:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730777AbgFOPCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 11:02:22 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD84C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 08:02:21 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id c1so9496333vsc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TrvvsAEP4GTcir2Zy4zr3JBpHk31E0joGe1xHbcm+mg=;
        b=H3A4uLXQWE02D9hYonsJYD+dAcZKqOzS19HfKOalhkBF4qwfzczgYQl1W0V8OQsYXD
         95VWw7nAcce5a/v3X1xmaJEUAxd0JQhaKynN57OA1tKKU6N1LhVNw3fYE7ZH0++G+pva
         EdI1a+96k5CQcCD5Of6MAu9qR7pjeDAfI0yPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TrvvsAEP4GTcir2Zy4zr3JBpHk31E0joGe1xHbcm+mg=;
        b=H32i4+0fhlVOuC+I/F+RaZ3PaaFRcydHxoakdSNVuMN8QDXYtvm8hG5FUTpF/DNisI
         HSyNbmQAxvHiM4IdylYg/YHPJ6XjWHXlBGmHwFwInQUwRMc+terR5Rb/j1a+QgvA/EAm
         GLBMOgiNWinCmzAl0m7vKemEXpRZ6ETJvfyox3oCdKHiBMOyFGbk3esCH5Q51hk/AFv1
         awDr+JFAMPOqYLM4Qn3LnTRJ4dYM8Gk/AhC3OFSsLQwKHDI8uFGTvzHBD/jzby2A5ngV
         U4TwnuKAwx8O+8Z8Wy2ZXTEjkuM3R5x69TGpcQe327FBqvBMgbiWclxUOuf5Jn5hd3n9
         FNnA==
X-Gm-Message-State: AOAM530GnvBrkk9MFSEUZasHbAF6hrq4ajO1eXa0ddfMvicyGDLf1Ec4
        FHRzFfxyUPIeCf7EmD1Ks7PgaicEe8A=
X-Google-Smtp-Source: ABdhPJwAuWzv4lWPMYCzOyqfhFPv9+MdHG4enaiTtYT0lpnYfiuChA56QlQXnvgH0sZ5484YPu2Z6w==
X-Received: by 2002:a67:c806:: with SMTP id u6mr19042238vsk.94.1592233340770;
        Mon, 15 Jun 2020 08:02:20 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id n7sm2320243vke.37.2020.06.15.08.02.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 08:02:20 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id y123so9516323vsb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 08:02:20 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr19565964vsd.198.1592233331996;
 Mon, 15 Jun 2020 08:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200609082015.1.Ife398994e5a0a6830e4d4a16306ef36e0144e7ba@changeid>
 <20200615143237.519F3C433C8@smtp.codeaurora.org> <CAD=FV=VaexjLaaZJSxndTEi6KCFaPWW=sUt6hjy9=0Qn68kH1g@mail.gmail.com>
 <87zh94idik.fsf@codeaurora.org>
In-Reply-To: <87zh94idik.fsf@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Jun 2020 08:02:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfUHD=vw-mvQsdHcn=zhB9-mD6ivrM93jkfHdgb+odiA@mail.gmail.com>
Message-ID: <CAD=FV=XfUHD=vw-mvQsdHcn=zhB9-mD6ivrM93jkfHdgb+odiA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Wait until copy complete is actually done before completing
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org,
        Rakesh Pillai <pillair@codeaurora.org>,
        netdev <netdev@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>, kuabhs@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 15, 2020 at 7:56 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Doug Anderson <dianders@chromium.org> writes:
>
> > On Mon, Jun 15, 2020 at 7:32 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> >>
> >> Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> > On wcn3990 we have "per_ce_irq = true".  That makes the
> >> > ath10k_ce_interrupt_summary() function always return 0xfff. The
> >> > ath10k_ce_per_engine_service_any() function will see this and think
> >> > that _all_ copy engines have an interrupt.  Without checking, the
> >> > ath10k_ce_per_engine_service() assumes that if it's called that the
> >> > "copy complete" (cc) interrupt fired.  This combination seems bad.
> >> >
> >> > Let's add a check to make sure that the "copy complete" interrupt
> >> > actually fired in ath10k_ce_per_engine_service().
> >> >
> >> > This might fix a hard-to-reproduce failure where it appears that the
> >> > copy complete handlers run before the copy is really complete.
> >> > Specifically a symptom was that we were seeing this on a Qualcomm
> >> > sc7180 board:
> >> >   arm-smmu 15000000.iommu: Unhandled context fault:
> >> >   fsr=0x402, iova=0x7fdd45780, fsynr=0x30003, cbfrsynra=0xc1, cb=10
> >> >
> >> > Even on platforms that don't have wcn3990 this still seems like it
> >> > would be a sane thing to do.  Specifically the current IRQ handler
> >> > comments indicate that there might be other misc interrupt sources
> >> > firing that need to be cleared.  If one of those sources was the one
> >> > that caused the IRQ handler to be called it would also be important to
> >> > double-check that the interrupt we cared about actually fired.
> >> >
> >> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> >>
> >> ath10k firmwares work very differently, on what hardware and firmware did you
> >> test this? I'll add that information to the commit log.
> >
> > I am running on a Qualcomm sc7180 SoC.
>
> Sorry, I was unclear, I meant the ath10k hardware :) I guess WCN3990 but
> what firmware version?

Ah, sorry!  Yes, it appears to be wcn3990 based on my device tree:

$ git grep -A2 wifi -- arch/arm64/boot/dts/qcom/sc7180.dtsi

wifi: wifi@18800000 {
        compatible = "qcom,wcn3990-wifi";
        reg = <0 0x18800000 0 0x800000>;
        reg-names = "membase";

Firmware isn't final yet, but currently my boot log shows:

qmi fw_version 0x322a01ea
fw_build_timestamp 2020-05-20 03:47
QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2-00490-QCAHLSWMTPL-1

-Doug
