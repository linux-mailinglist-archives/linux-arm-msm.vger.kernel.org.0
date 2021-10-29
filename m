Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82524402D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhJ2THn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhJ2THn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:07:43 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A999C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:05:14 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so9035365otj.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XrtEv0I4WsSSxKWDA07JfBbz3bZ9+ZB3B3Y9Ggez2Go=;
        b=c2Yo4PxZ9egNJp82XI1pGTkuAyzNXcy7wXjAsXJ86jd0NN1PX5YTtJagzG9TtSP27Q
         WFCn+oT7xajIz4IdEqmFgxlsc673cFsVZeIhs9qWO7jF7zUW8oMD6tyJnCIgXYlEGDE0
         z3WjQ9SK3GOcE/Lcsyti2+4e6VdnqaeCGCQB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XrtEv0I4WsSSxKWDA07JfBbz3bZ9+ZB3B3Y9Ggez2Go=;
        b=7U0d6AUEvLuT3eLXCt/dapIEtSUrdIsKB6uNOmrwETEfzQ+Na6YohAlXE7JEnyAlH2
         YCChdJPt+rMvASljTQAm5MlMxhXK6ZXHqXDU0smu2xD2Rbzataco7TgliwKAx0HzPUVA
         AGKimgRR9ABHXR55QXnQUd3aqOPenbtYGZpm9YOW4ViWHGLoj1WjP7mnlLpdGoOJGKsT
         YF0DM7oH+NoySonYKzojglzDclV5miEXREoiY+2jlENUXgmBNADzvcw0VrzvRJbazYab
         4mVkWRosRDfNjKgno5tOg1h915mGbAnAsFIAjOQr+mWq1P8ucXuJMnC4imleVEtq1fsI
         UFoQ==
X-Gm-Message-State: AOAM5314tTJq+RQU0OGa/tE6LUt5dxGFeqfgAOBhRF5wmJ4NvMDppWhG
        niaQ83OfmF4HsXP3Puz3IvLE/F/E3zS+OeYNIfZnbQ==
X-Google-Smtp-Source: ABdhPJw/kOHVX9Wyeio1xesDOsb6yUP5GNsssmdqQJg7eJkT1l4b7IdJw3gnhqKmDwTOSlBGS5lLQIFfmZ/w4s+TI1w=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr9907159otl.126.1635534313642;
 Fri, 29 Oct 2021 12:05:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:05:13 -0500
MIME-Version: 1.0
In-Reply-To: <40fa13cd-f24c-e3a9-9b49-23ad26507bfe@codeaurora.org>
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
 <CAE-0n50E2dmQeDaiggEgMgykrkGB3H38sbkTXDX3avR7XtSizw@mail.gmail.com> <40fa13cd-f24c-e3a9-9b49-23ad26507bfe@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:05:13 -0500
Message-ID: <CAE-0n51Ag_KK7wC4r7YFar=C5P-YLLVZHUyJrNAcMEpfwYFy2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-10-29 03:19:04)
>
>
> On 10/29/2021 12:24 PM, Stephen Boyd wrote:
> > Quoting Rajendra Nayak (2021-10-26 05:07:35)
> >> From: Prasad Sodagudi <psodagud@codeaurora.org>
> >>
> >> egpio is a scheme which allows special power Island Domain IOs
> >> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> >> TLMM functions with Island Domain functions.
> >> With this scheme, an IO can be controlled both by the cpu running
> >> linux and the Island processor. This provides great flexibility to
> >> re-purpose the Island IOs for regular TLMM usecases.
> >>
> >> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> >> which shows if egpio feature is available or not on a given gpio.
> >> egpio_enable is the read/write bit and only effective if egpio_present
> >> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> >> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
> >>
> >> To support this we add a new function 'egpio' which can be used to
> >> set the egpio_enable to 0, for any other TLMM controlled functions
> >> we set the egpio_enable to 1.
> >>
> >> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> ---
> >
> > Does this supersede adding support for lpass pinctrl in this series[1]?
>
> No, the driver in [1] actually manages the LPASS TLMM instance, while this patch
> makes it possible for the 'same' pins to be managed by the SoC TLMM instance.
> On sc7280 SoC for instance GPIO144-158 maps to LPI-GPIO-0-14, and GPIO159-174
> maps to SSC-GPIO-0-15.

How do we make sure that the LPASS pins are actually muxed out of the
SoC and not blocked by eGPIO in this driver muxing out the pin as a
gpio? Do they avoid conflicting with each other somehow?
