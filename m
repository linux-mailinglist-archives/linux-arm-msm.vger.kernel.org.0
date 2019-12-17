Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F63712358D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 20:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfLQTXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 14:23:11 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:37657 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfLQTXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 14:23:09 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so10684898ioc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 11:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/IwEwp0WnVVccJ/nXI+m2TMK2nBYe24/J4DSiPygpI=;
        b=haUsSjX3lPpr0JU/QJDJufoNCsgPvJ6oKb7R320ALmJQ0qYqJnDkm+wDZhEf5uPMDK
         k8KmwQARjeBw4DhVp4P0yHgR+ZYucEzw8758Ld2GYfSJRl9HmcjTIGq/3EXIXIvVMYrB
         mIHgitESF8mwTupA1jsQ8p9/LpcfxsVGQAHqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/IwEwp0WnVVccJ/nXI+m2TMK2nBYe24/J4DSiPygpI=;
        b=Hr+c0PZ5OQa7aQNbOqMKtWRCSG5siWVXpiwZ8khthzWmWgbWFLhEnuz1e8jZZCcYRY
         tNru4cn8Nmiwg6R9LI4KKMagHfx8uwD20Y33M5D8eKSq7sqTkKHPXnxYlEwFJOQbL4Yt
         JRcSANJpMNsVNFk45QyWAV7Ch2eBbUXRCvjPCI17XuI6iLSuQVXWbNJ28COfS6soNUW2
         0MPO21XhpiqQDCTkUFG4s2twHYbeJK6sech2NESgvhzDKqAwhh1T8nwikPAEQXqOYiXz
         YBQFLw7u7Ol0lk/PQU8VN9rERtliuEr6QIjhQ8WkUp9OTjrYq4Qwmump/m1VwMZkjdyU
         ruHw==
X-Gm-Message-State: APjAAAUFQGappxP3XZqc5tAY+DSQMXuH4hCMd4uKvTCQVg/0UEMWA3Rj
        NT0nc8O65L1rSLXDFePUah7JYdp+pIQ=
X-Google-Smtp-Source: APXvYqzd9oiJ0zIa5xPn0OnEgY/b4V651WkNd904JW8Uldne1eu702kruvf3DupJWBVeZu6G+zZtiA==
X-Received: by 2002:a5e:8612:: with SMTP id z18mr5153845ioj.206.1576610588659;
        Tue, 17 Dec 2019 11:23:08 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id p12sm5195095ilk.66.2019.12.17.11.23.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 11:23:06 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id b10so12308292iof.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 11:23:06 -0800 (PST)
X-Received: by 2002:a02:ba93:: with SMTP id g19mr19057729jao.90.1576610586103;
 Tue, 17 Dec 2019 11:23:06 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
In-Reply-To: <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 11:22:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com>
Message-ID: <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 16, 2019 at 10:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
>
> Hm... ok. Interesting.

Use of enum seems to match 'timer/arm,arch_timer_mmio.yaml'.  ...and
sub-device probably uses DMA so IIUC it's important to pass
#size-cells of 2 down to it if the parent had it.


> > +  qcom,select-utmi-as-pipe-clk:
> > +    description:
>
> Don't these multi-line descriptions need a pipe, | ?

The pipe just means that carriage returns are important.  They aren't
here, so I think it's OK/better w/out it.  The example-schema.yaml has
many without it.


> > +        usb3_0: usb30@a6f8800 {
>
> Should node name be something like 'usb3'? Or is this usb 3.0 so it's
> 'usb30'?

Probably should be just 'usb@' as per 'usb/usb-hcd.yaml'.

-Doug
