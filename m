Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8226F26985E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgINVx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgINVxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:53:12 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F430C061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:53:12 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id o6so1312889ota.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M0KzjL35Ohrpi1hBTpVC8GSlPU64AFcqfskfaAZgBa8=;
        b=LLZApjOYT5LOPwoWYD3YxrbeHE/ynPWQVOd7JfPB7whFmDJqwNGuoKrvJso5gpGyaw
         LGOyVBW1IMXvVatUGckoxvVCfUw6pylZefbVuwwZ5+VkggK/oss0GOiQ/233+1f3TiCR
         xIopZ4lSiZ8pPQlbiRy2r3bR0qAZVz4r0GzortxzQdX8nm0/EJ+QLjbT+az+ari11bPG
         lYKEFI/ORlRY8PWI+8BURBUpEv5V1ynse/YiaE/C+rEotSij7tat4Yhr/B9kOFTst1wq
         QEZbiVcClXmY1QbQuyJP7lCk7vvbUGCDa5CI6OIzqBAoLAGGjv8sDt+sWXkCcvokxv4f
         ZECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M0KzjL35Ohrpi1hBTpVC8GSlPU64AFcqfskfaAZgBa8=;
        b=Y/+XjiZuZIPOLQphYM3i0EzMbB/fJisFzbq2+K1T7nN14Awb1XJW+qkCKWkFgNm8mb
         8T5l+nQSuil36Xrr328GzdROYmeoejY6hnA1pJ4D+FlfkhMhnO2HW2iWXd6xKVDNMvle
         MkjSx0+ChKIGC2KawxjaJrdPzegz6BFNXzv5OOVihbOk1cO5moyojDJpRTfGR1J89AXl
         1gpkjhpetmSI1qhi7tAwp3fL3xpVtNxMCIhoq1zNNq77/EtmV4qb25iEXCxNHTTi0Xif
         tm+jbxEZK6lv6ELS8xeynbMH4hrxqw7x1sbbV21KYqb5boT2nLKIEu/BmGfzcZ0CVqFX
         W0mQ==
X-Gm-Message-State: AOAM53078CzaY1i5qpRSnrHGuXijAW6Q1dOsIHVqmOxPpQSXPJAaAyjr
        yKj9mASFHRKSUEulS5kAEXh5KhsRcM6UaVmAuRgLOg==
X-Google-Smtp-Source: ABdhPJzZPGYpZyuCNJYmdc/Gjs6hHb8CPs+tTvqBT9j22B8LxDuy/ic/fjVVunBaIQ4zJxYyyVsKbQk75yT+SfiISAA=
X-Received: by 2002:a9d:6d8b:: with SMTP id x11mr10119632otp.221.1600120391780;
 Mon, 14 Sep 2020 14:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <1597227730-16477-1-git-send-email-rnayak@codeaurora.org>
 <CALAqxLVQ1uB5Zy1DrFP6K4FgZ0U9rwGterhvzcTws_9O9wWE2g@mail.gmail.com> <CALAqxLUr9ahtxkQSXnBG7k092bXxM7yANM0RX7jyVksYzhi-ZA@mail.gmail.com>
In-Reply-To: <CALAqxLUr9ahtxkQSXnBG7k092bXxM7yANM0RX7jyVksYzhi-ZA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 14 Sep 2020 14:53:00 -0700
Message-ID: <CALAqxLV4ZiqWZaZV5E6KJQRoqrvWrSWqvVTfkk-P_DDNpdcioA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm845: Fixup OPP table for all qup devices
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>, tdas@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 7, 2020 at 1:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Aug 31, 2020 at 9:04 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Wed, Aug 12, 2020 at 3:23 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> > > This OPP table was based on the clock VDD-FMAX tables seen in
> > > downstream code, however it turns out the downstream clock
> > > driver does update these tables based on later/production
> > > rev of the chip and whats seen in the tables belongs to an
> > > early engineering rev of the SoC.
> > > Fix up the OPP tables such that it now matches with the
> > > production rev of sdm845 SoC.
> > >
> > > Fixes: 13cadb34e593 ("arm64: dts: sdm845: Add OPP table for all qup
> > > devices")
> > > Reported-by: John Stultz <john.stultz@linaro.org>
> > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > ---
> >
> > Just wanted to follow up on this, as it's still missing from 5.9-rc3
> > and is needed to fix a bluetooth regression on db845c from 5.9-rc1.
> >
> > Amit has already validated it (on PocoF1 as well), but just in case its useful:
> > Tested-by: John Stultz <john.stultz@linaro.org>
>
> Hey Everyone,
>   Just wanted to nag folks on this again as it is still missing from
> upstream and resolves a bluetooth regression from 5.9-rc1.

Hey Everyone,
 Just your weekly nag on this patch that is still missing upstream.
This patch fixes bluetooth regressions that started w/ 5.9-rc1. It
would be great to see it land before 5.9 is finalized.

thanks
-john
