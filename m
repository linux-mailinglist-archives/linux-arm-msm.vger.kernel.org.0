Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A27B1250D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 19:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfLRSjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 13:39:45 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:35117 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbfLRSjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 13:39:44 -0500
Received: by mail-io1-f68.google.com with SMTP id v18so3055262iol.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 10:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qS07QetcqHopZvL0SAF8T87/ibXNrIwvAxwHVFARh9I=;
        b=cCfmWZGu+EkTY9HHCwEPsf8m9ckAewsbfv+DdyQ2mndIWHOIm5cPWNW6KA2eDILRbS
         Yp1/dohvrHxPAl+V3lkzpybQo/+zHsShotOBU5xVZT9n5tFDQQe3LfkSfaeEXTa1iav5
         Tw1T5zvpDld+JYMpSOSO8g4Wf2BGB/9CUvAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qS07QetcqHopZvL0SAF8T87/ibXNrIwvAxwHVFARh9I=;
        b=oSHU0AQiPs4w+ItrFu80ChGcRsycrQyexvxX65ovqjl4LZqI1n6DGT0tFG+F/1mnDg
         3sQspbPHrw6Y2QhpojMSzeCjn063D7yFV2kEoaYe9rilrdVsiPYetTJYJDGbcmpeWCZw
         cMHRD3quGT121/US1w5TSadQgCCD4h5TVxsv5xsG08KSU7pkL7aKdIM2KA8GRSYNwm1Q
         TBZKRz87e3CiqsNVn+yrUHwW/BulyDizOAv2+EOsgvDIPM5fohnkg2zFCVUZUW2taAJZ
         Dei0SQh0oeusVuOgvM0wWYEDKmLVabSeU72HFeIqBOIajKMftPUf+4qNOAsRp/r6X8ua
         XNoQ==
X-Gm-Message-State: APjAAAWR+qfldSq7RsVwu00+ZBAAaVqrDhFR+WkZBNiRx3zG2XOpsU2l
        96Ch9JrXy1Zzmgj59CtyzG77Si0/1XI=
X-Google-Smtp-Source: APXvYqzH6jqz9uR0a1glcI3x+MQy2dNSJhnbocZt2ywKxLA2ApQ5RuXyRxOdMS+dnb0lI6PIMZ9E8g==
X-Received: by 2002:a5e:850e:: with SMTP id i14mr2938662ioj.226.1576694383108;
        Wed, 18 Dec 2019 10:39:43 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id p65sm906730ili.71.2019.12.18.10.39.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:39:42 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id g12so2583832ild.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 10:39:42 -0800 (PST)
X-Received: by 2002:a92:cc90:: with SMTP id x16mr3278373ilo.269.1576694382002;
 Wed, 18 Dec 2019 10:39:42 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
 <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com> <e901331b-456c-f3ed-6717-e5bf24778c57@codeaurora.org>
In-Reply-To: <e901331b-456c-f3ed-6717-e5bf24778c57@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 10:39:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xg9UTt2xjerkSKiSKSZ3tP2Drqf36Mu5eFiSxmsgj6kw@mail.gmail.com>
Message-ID: <CAD=FV=Xg9UTt2xjerkSKiSKSZ3tP2Drqf36Mu5eFiSxmsgj6kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
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

On Wed, Dec 18, 2019 at 4:48 AM Sandeep Maheswaram (Temp)
<sanm@codeaurora.org> wrote:
>
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
>
> Hm... ok. Interesting.
>
> Use of enum seems to match 'timer/arm,arch_timer_mmio.yaml'.  ...and
> sub-device probably uses DMA so IIUC it's important to pass
> #size-cells of 2 down to it if the parent had it.
>
> Should i mention this as below?
>
>  "#address-cells":
>     const: 2
>
>   "#size-cells":
>     const: 2

No, keep it like you have unless Rob disagrees.  If the parent is only
32-bits it should be fine to keep it.
