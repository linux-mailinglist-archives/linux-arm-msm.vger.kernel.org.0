Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0B511BB84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 19:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfLKSSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 13:18:02 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34773 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbfLKSSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 13:18:01 -0500
Received: by mail-il1-f193.google.com with SMTP id w13so20314413ilo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSC20v3ZZ7Kn1pHo0qwS4Ke00bNlSDQ6xPcCLk1Bks8=;
        b=DLg1Ex1x9EZ6ClCxY4Pwm79pVYYhk7uoSmXnuv6VTILCuD4AWEfjlu1UuKiQYKA4ud
         XANl0JGCsKGJ6OX+2oYHjuAEGAX91bwsI4j+e68HRuGH1F9ZiAte76EvvwgmSa4uv3oj
         PpWXe8CXxhgAJNw8dlv9IyFxA0uN4pZ20pVks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSC20v3ZZ7Kn1pHo0qwS4Ke00bNlSDQ6xPcCLk1Bks8=;
        b=pUg5EklOybxqtSQMOG2d8eEx/89CbCZsFdlxrOieQXlQG6YqZJK0q+YvUtrDanTIkr
         w5lIHVyDuqwksSRwN809CgqPu86yLH7YBXB5+HgtqHLXda8PiNEffFt58RxvzguKPeNB
         2w6LxxrRN/YpRlgRJRPXAlsWsf/ELTEpfkmXwPMgY7LvJZvfL+z4fg1/N0NoAYCARnUP
         2LSucgCCh8zaXVqbsc/U7AJOyu7y98r3k29wq/Z+6QyYubjzTPMJ8VbyGqpjZH/A0vPP
         48jaqRgIinb/5JPP4CecyOyVzq9oDN1KOvmR5GdhQpV6Iugt166O1KE9+ViPeHTwhKb1
         7Fag==
X-Gm-Message-State: APjAAAXfXz9+MTAGAHhl8b4+Y4xoTvUji0X+1sgrNgoJswM+Sfn1TDfJ
        DvgXGJXvKI+eDSbyxBPVZEt0RKgSQd4=
X-Google-Smtp-Source: APXvYqxzLEecjncaoeE+5+ZMNgPqe50gSAVsZQQdSbHxi6pmvwLJ+FFcXbBqRHifFTeUmuMrKUojAw==
X-Received: by 2002:a92:1a0a:: with SMTP id a10mr4365979ila.295.1576088281014;
        Wed, 11 Dec 2019 10:18:01 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id h23sm908720ilf.57.2019.12.11.10.18.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 10:18:00 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id z90so20276201ilc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 10:18:00 -0800 (PST)
X-Received: by 2002:a92:1547:: with SMTP id v68mr4237963ilk.58.1576088279911;
 Wed, 11 Dec 2019 10:17:59 -0800 (PST)
MIME-Version: 1.0
References: <0101016ef3cdac32-1353f7d8-b973-4881-86ec-589d50849765-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef3cdac32-1353f7d8-b973-4881-86ec-589d50849765-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 10:17:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+yM5bfHPpkwC1-DUmq4fbDCKiN-+JzVQH2VWjQJ=wYg@mail.gmail.com>
Message-ID: <CAD=FV=V+yM5bfHPpkwC1-DUmq4fbDCKiN-+JzVQH2VWjQJ=wYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Remove additional spi chip select muxes
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 11:12 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> remove the additional CS muxes that were added by default for
> spi so every board using sc7180 does not have to override it.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

In theory we could add some extra pinmux configs that boards could
reference if they want to use those chip selects (as long as we keep
them out of the "default"), but it's also fine to wait until someone
has an actual need for it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
